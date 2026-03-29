local env_path = vim.fn.stdpath("config") .. "/.env"

-- ==================== MENU HELPER ====================
-- Reemplaza vim.ui.select con un float propio: flechas ↑↓, números, Enter
local function menu(items, opts, callback)
  local title  = opts.prompt or "Menu"
  local fmt    = opts.format_item or function(x) return tostring(x) end
  local labels = {}
  for i, item in ipairs(items) do
    table.insert(labels, string.format(" %d  %s", i, fmt(item)))
  end

  local width = 40
  for _, l in ipairs(labels) do
    width = math.max(width, #l + 4)
  end
  local height = #labels + 2

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, labels)
  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden  = "wipe"

  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width    = width,
    height   = height,
    row      = row,
    col      = col,
    style    = "minimal",
    border   = "rounded",
    title    = " " .. title .. " ",
    title_pos = "center",
  })

  vim.wo[win].cursorline = true
  vim.api.nvim_win_set_cursor(win, { 1, 0 })

  local function select_item(idx)
    if idx < 1 or idx > #items then return end
    vim.api.nvim_win_close(win, true)
    vim.schedule(function() callback(items[idx]) end)
  end

  local function close()
    vim.api.nvim_win_close(win, true)
    vim.schedule(function() callback(nil) end)
  end

  local kopts = { buffer = buf, nowait = true, silent = true }

  -- Navegación
  vim.keymap.set("n", "j",      function() local r = vim.api.nvim_win_get_cursor(win)[1]; if r < #labels then vim.api.nvim_win_set_cursor(win, {r+1, 0}) end end, kopts)
  vim.keymap.set("n", "k",      function() local r = vim.api.nvim_win_get_cursor(win)[1]; if r > 1 then vim.api.nvim_win_set_cursor(win, {r-1, 0}) end end, kopts)
  vim.keymap.set("n", "<Down>", function() local r = vim.api.nvim_win_get_cursor(win)[1]; if r < #labels then vim.api.nvim_win_set_cursor(win, {r+1, 0}) end end, kopts)
  vim.keymap.set("n", "<Up>",   function() local r = vim.api.nvim_win_get_cursor(win)[1]; if r > 1 then vim.api.nvim_win_set_cursor(win, {r-1, 0}) end end, kopts)

  -- Selección
  vim.keymap.set("n", "<CR>",   function() select_item(vim.api.nvim_win_get_cursor(win)[1]) end, kopts)
  vim.keymap.set("n", "q",      close, kopts)
  vim.keymap.set("n", "<Esc>",  close, kopts)

  -- Números 1-9
  for i = 1, 9 do
    vim.keymap.set("n", tostring(i), function() select_item(i) end, kopts)
  end
end

-- ==================== SSH TERMINALS ====================
local function load_env()
  local env = {}
  local f = io.open(env_path, "r")
  if not f then
    return env
  end
  for line in f:lines() do
    -- Skip comments and empty lines
    if line:sub(1, 1) ~= "#" and line:match("%S") then
      local key, val = line:match("^([%w_]+)%s*=%s*(.+)")
      if key and val then
        env[key] = val
      end
    end
  end
  f:close()
  return env
end

local function load_terminals_config()
  local env = load_env()

  -- Find all connection numbers by looking for connection_{N}_name keys
  local numbers = {}
  for k, _ in pairs(env) do
    local num = k:match("^connection_(%d+)_name$")
    if num then
      table.insert(numbers, tonumber(num))
    end
  end
  table.sort(numbers)

  -- Build terminal config for each connection
  local config = {}
  for _, num in ipairs(numbers) do
    local p = "connection_" .. num .. "_"
    local t = {
      name = env[p .. "name"],
      host = env[p .. "host"],
      user = env[p .. "user"],
      key = env[p .. "key"],
      password = env[p .. "password"],
      port = env[p .. "port"],
      path = env[p .. "path"],
    }

    -- Collect env vars: connection_{N}_env_{VAR}=value
    local env_prefix = p .. "env_"
    t.env_vars = {}
    for k, v in pairs(env) do
      if k:sub(1, #env_prefix) == env_prefix then
        local var_name = k:sub(#env_prefix + 1)
        table.insert(t.env_vars, var_name .. "=" .. v)
      end
    end

    table.insert(config, t)
  end

  return config
end

local function build_ssh_cmd(t)
  local parts = { "ssh" }

  if t.key then
    local expanded = vim.fn.expand(t.key)
    table.insert(parts, "-i " .. vim.fn.shellescape(expanded))
  end

  if t.port then
    table.insert(parts, "-p " .. t.port)
  end

  local target = t.user and (t.user .. "@" .. t.host) or t.host

  -- Build remote command with env vars and optional path
  local remote_parts = {}

  if t.env_vars and #t.env_vars > 0 then
    for _, v in ipairs(t.env_vars) do
      table.insert(remote_parts, "export " .. vim.fn.shellescape(v))
    end
  end

  if t.path then
    table.insert(remote_parts, "cd " .. vim.fn.shellescape(t.path))
  end

  local remote_cmd = ""
  if #remote_parts > 0 then
    remote_cmd = ' -t "' .. table.concat(remote_parts, " && ") .. ' && exec bash -l"'
  end

  local ssh_cmd = table.concat(parts, " ") .. " " .. target .. remote_cmd

  if t.password then
    local has_sshpass = vim.fn.executable("sshpass") == 1
    if has_sshpass then
      return "sshpass -p " .. vim.fn.shellescape(t.password) .. " " .. ssh_cmd
    else
      local extra = " -o PasswordAuthentication=yes -o PubkeyAuthentication=no"
      return ssh_cmd:gsub("^ssh ", "ssh" .. extra .. " ")
    end
  end

  return ssh_cmd
end

-- Float terminal
local function open_float_terminal(cmd, title)
  local width = math.floor(vim.o.columns * 0.85)
  local height = math.floor(vim.o.lines * 0.85)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = " " .. (title or "Terminal") .. " ",
    title_pos = "center",
  })

  vim.fn.termopen(cmd)
  vim.cmd("startinsert")

  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, { buffer = buf, nowait = true })

  vim.keymap.set("n", "<Esc>", function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, { buffer = buf, nowait = true })
end

-- Abrir terminal SSH flotante
_G.ssh_terminal_open = function(t)
  local cmd = build_ssh_cmd(t)
  open_float_terminal(cmd, t.name .. " (" .. t.host .. ")")
end

-- Ingresar a SSH (lista de terminales)
_G.ssh_ingresar = function()
  vim.schedule(function()
    local config = load_terminals_config()
    if #config == 0 then
      vim.notify("No hay terminales configuradas")
      return
    end

    local options = { { name = "← Back", data = { action = "back" } } }
    for _, t in ipairs(config) do
      table.insert(options, { name = t.name, data = t })
    end

    menu(options, {
      prompt = "Servers >",
      format_item = function(e)
        return e.name
      end,
    }, function(choice)
      if not choice then
        return
      end
      if choice.data.action == "back" then
        _G.menu_terminales()
      else
        _G.ssh_terminal_open(choice.data)
      end
    end)
  end)
end

-- Menu Terminales SSH
_G.menu_terminales = function()
  vim.schedule(function()
    menu({
      { desc = "Ingresar a SSH", action = "ingresar" },
      { desc = "Configurar conexiones", action = "conexiones" },
    }, {
      prompt = "Terminales SSH >",
      format_item = function(x)
        return x.desc
      end,
    }, function(choice)
      if not choice then
        return
      end
      if choice.action == "ingresar" then
        _G.ssh_ingresar()
      elseif choice.action == "conexiones" then
        vim.cmd("edit " .. env_path)
      end
    end)
  end)
end

-- ==================== KEYMAPS ====================
vim.keymap.set("n", "<leader>dh", function()
  require("snacks").dashboard()
end, { desc = "Dashboard" })

vim.keymap.set("n", "<leader>tt", function()
  _G.menu_terminales()
end, { desc = "Terminales SSH" })

vim.keymap.set({ "n", "t" }, "<leader>t.", function()
  vim.cmd("ToggleTerm")
end, { desc = "Terminal Depuración" })

vim.keymap.set("n", "<leader>t,", function()
  vim.cmd("ToggleTerm direction=float")
end, { desc = "Terminal Flotante" })

vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Izq" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Arr" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Aba" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Der" })

-- Desactivar keymaps conflictivos de LazyVim
vim.schedule(function()
  pcall(vim.keymap.del, "n", "<leader>ft")
  pcall(vim.keymap.del, "n", "<leader>fT")
  pcall(vim.keymap.del, "n", "<c-/>")
  pcall(vim.keymap.del, "t", "<c-/>")
  pcall(vim.keymap.del, "n", "<c-_>")
  pcall(vim.keymap.del, "t", "<c-_>")
end)

-- ==================== DASHBOARD ====================
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        ui_select = false,
        layout = {
          hidden = { "preview" },
          layout = {
            box = "horizontal",
            width = 0.6,
            height = 0.5,
          },
        },
      },
      dashboard = {
        preset = {
          header = [[N V I M]],
          keys = {
            { key = "t", desc = "Conexiones SSH",  action = _G.menu_terminales },
            {
              key = "e",
              desc = "Explorar Archivos",
              action = function()
                require("oil").open(vim.fn.getcwd())
              end,
            },
            {
              key = "f",
              desc = "Buscar Archivos",
              action = function()
                vim.cmd("Telescope find_files")
              end,
            },
            {
              key = "c",
              desc = "Lazy",
              action = function()
                vim.cmd("Lazy")
              end,
            },
            {
              key = "q",
              desc = "Salir",
              action = function()
                vim.cmd("qa")
              end,
            },
          },
        },
      },
    },
  },
  -- Terminal de depuración: abajo, horizontal, toggle
  {
    "akinsho/toggleterm.nvim",
    opts = {
      direction = "horizontal",
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        end
      end,
      shade_terminals = false,
      on_open = function(term)
        vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { buffer = term.bufnr, silent = true })
        vim.keymap.set("n", "q", function()
          vim.cmd("ToggleTerm")
        end, { buffer = term.bufnr, silent = true })
      end,
    },
  },
}
