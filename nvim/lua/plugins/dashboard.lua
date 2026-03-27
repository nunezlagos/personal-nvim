local env_path = vim.fn.stdpath("config") .. "/.env"

-- ==================== DEBUG LOG ====================
local DEBUG = false
local log_file = vim.fn.stdpath("state") .. "/dashboard-debug.log"
local function dlog(msg)
  if not DEBUG then
    return
  end
  local f = io.open(log_file, "a")
  if f then
    f:write(os.date("%H:%M:%S") .. " | " .. msg .. "\n")
    f:close()
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

  -- Build remote command with env vars
  local remote_cmd = ""
  if t.env_vars and #t.env_vars > 0 then
    local exports = {}
    for _, v in ipairs(t.env_vars) do
      table.insert(exports, "export " .. vim.fn.shellescape(v))
    end
    remote_cmd = " " .. table.concat(exports, " ") .. " && exec bash -l"
  end

  local ssh_cmd = table.concat(parts, " ") .. " " .. target .. remote_cmd

  if t.password then
    -- Use sshpass if available, otherwise connect interactively (user types password)
    local has_sshpass = vim.fn.executable("sshpass") == 1
    if has_sshpass then
      return "sshpass -p " .. vim.fn.shellescape(t.password) .. " " .. ssh_cmd
    else
      -- Add SSH options to allow password auth without sshpass
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

  -- Cerrar con Esc o q en modo normal
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
  dlog("SSH cmd: " .. cmd)
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

    vim.ui.select(options, {
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
    vim.ui.select({
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

-- ==================== PROYECTOS ====================
_G.menu_proyectos = function()
  vim.schedule(function()
    vim.ui.select({
      { desc = "Abrir proyecto", action = "open" },
      { desc = "Recientes", action = "recent" },
    }, {
      prompt = "Proyectos >",
      format_item = function(x)
        return x.desc
      end,
    }, function(choice)
      if choice then
        if choice.action == "open" then
          _G.open_project()
        elseif choice.action == "recent" then
          _G.recent_projects()
        end
      end
    end)
  end)
end

_G.open_project = function()
  vim.schedule(function()
    local base = vim.fn.expand("~/Proyectos")
    if vim.fn.isdirectory(base) == 0 then
      vim.fn.mkdir(base, "p")
      vim.notify("Creado ~/Proyectos (vacío)")
      return
    end

    local projects = { { name = "← Back", data = { action = "back" } } }
    local handle = vim.loop.fs_scandir(base)
    while handle do
      local name = vim.loop.fs_scandir_next(handle)
      if not name then
        break
      end
      local stat = vim.loop.fs_stat(base .. "/" .. name)
      if stat and stat.type == "directory" then
        table.insert(projects, { name = name, path = base .. "/" .. name })
      end
    end

    if #projects == 1 then
      vim.notify("No hay proyectos en ~/Proyectos")
      return
    end

    vim.ui.select(projects, {
      prompt = "Proyecto >",
      format_item = function(p)
        return p.name
      end,
    }, function(choice)
      if not choice then return end
      if choice.data and choice.data.action == "back" then
        _G.menu_proyectos()
      else
        vim.cmd("tcd " .. choice.path)
        vim.cmd("edit " .. choice.path)
        vim.notify("✓ " .. choice.name)
      end
    end)
  end)
end

_G.recent_projects = function()
  vim.schedule(function()
    local recent, seen = { { name = "← Back", data = { action = "back" } } }, {}
    for _, path in ipairs(vim.v.oldfiles) do
      if #recent >= 11 then
        break
      end
      local dir = vim.fn.fnamemodify(path, ":p:h")
      if vim.fn.isdirectory(dir) == 1 and not seen[dir] then
        seen[dir] = true
        table.insert(recent, { name = vim.fn.fnamemodify(dir, ":t"), path = dir })
      end
    end

    if #recent == 1 then
      vim.notify("No hay recientes")
      return
    end

    vim.ui.select(recent, {
      prompt = "Recientes >",
      format_item = function(p)
        return p.name
      end,
    }, function(choice)
      if not choice then return end
      if choice.data and choice.data.action == "back" then
        _G.menu_proyectos()
      else
        vim.cmd("tcd " .. choice.path)
        vim.cmd("edit " .. choice.path)
        vim.notify("✓ " .. choice.name)
      end
    end)
  end)
end

-- ==================== DOCKER ====================

-- Detectar compose file (legacy o modern)
local function find_compose_file(project_path)
  if vim.loop.fs_stat(project_path .. "/docker-compose.yml") then
    return "docker-compose.yml", "docker-compose"
  elseif vim.loop.fs_stat(project_path .. "/compose.yml") then
    return "compose.yml", "docker compose"
  end
  return nil, nil
end

-- Ejecutar compose command en float terminal
local function run_compose(project_name, project_path, action)
  local file, cmd_prefix = find_compose_file(project_path)
  if not file then
    vim.notify("Sin compose file en " .. project_name)
    return
  end

  local full = project_path .. "/" .. file
  local cmds = {
    up         = cmd_prefix .. " -f " .. full .. " up -d",
    down       = cmd_prefix .. " -f " .. full .. " down",
    build      = cmd_prefix .. " -f " .. full .. " build",
    build_nc   = cmd_prefix .. " -f " .. full .. " build --no-cache",
    logs       = cmd_prefix .. " -f " .. full .. " logs -f --tail=50",
    restart    = cmd_prefix .. " -f " .. full .. " restart",
    ps         = cmd_prefix .. " -f " .. full .. " ps",
  }

  local action_name = action:gsub("_nc", "--no-cache")
  open_float_terminal(cmds[action], "Compose: " .. project_name .. " " .. action_name)
end

-- Acciones de un proyecto compose
_G.docker_compose_actions = function(project)
  vim.schedule(function()
    local file, cmd_prefix = find_compose_file(project.path)
    if not file then
      vim.notify("Sin compose file")
      return
    end

    vim.ui.select({
      { desc = "← Back", action = "back" },
      { desc = "Up (start)", action = "up" },
      { desc = "Down (stop)", action = "down" },
      { desc = "Build", action = "build" },
      { desc = "Build --no-cache", action = "build_nc" },
      { desc = "Logs", action = "logs" },
      { desc = "Restart", action = "restart" },
      { desc = "PS (status)", action = "ps" },
      { desc = "Terminal vacía", action = "terminal" },
    }, {
      prompt = project.name .. " (" .. cmd_prefix .. ") >",
      format_item = function(x) return x.desc end,
    }, function(choice)
      if not choice or choice.action == "back" then
        _G.docker_compose_projects()
        return
      end
      if choice.action == "terminal" then
        vim.cmd("ToggleTerm direction=float")
        return
      end
      run_compose(project.name, project.path, choice.action)
    end)
  end)
end

-- Lista de proyectos compose
_G.docker_compose_projects = function()
  vim.schedule(function()
    local base = vim.fn.expand("~/Proyectos")
    local composes = { { name = "← Back", data = { action = "back" } } }

    local handle = vim.loop.fs_scandir(base)
    if handle then
      while true do
        local name = vim.loop.fs_scandir_next(handle)
        if not name then break end
        local full = base .. "/" .. name
        local stat = vim.loop.fs_stat(full)
        if stat and stat.type == "directory" then
          local file, cmd = find_compose_file(full)
          if file then
            local label = cmd == "docker-compose" and "legacy" or "modern"
            table.insert(composes, { name = name .. "  [" .. label .. "]", path = full, project = name })
          end
        end
      end
    end

    if #composes == 1 then
      vim.notify("No hay proyectos con compose file")
      return
    end

    vim.ui.select(composes, {
      prompt = "Compose >",
      format_item = function(e) return e.name end,
    }, function(choice)
      if not choice then return end
      if choice.data and choice.data.action == "back" then
        _G.menu_docker()
      else
        _G.docker_compose_actions({ name = choice.project, path = choice.path })
      end
    end)
  end)
end

-- Exec en container
_G.docker_exec = function()
  vim.schedule(function()
    local r = vim.fn.system("docker ps --format '{{.Names}}'")
    if vim.v.shell_error ~= 0 then
      vim.notify("Docker no disponible")
      return
    end

    local items = { { name = "← Back", data = { action = "back" } } }
    for name in vim.gsplit(r, "\n", { trimempty = true }) do
      if name ~= "" then
        table.insert(items, { name = name })
      end
    end

    if #items == 1 then
      vim.notify("No hay containers corriendo")
      return
    end

    vim.ui.select(items, {
      prompt = "Exec >",
      format_item = function(e) return e.name end,
    }, function(choice)
      if not choice then return end
      if choice.data and choice.data.action == "back" then
        _G.docker_containers()
      else
        open_float_terminal("docker exec -it " .. choice.name .. " sh", "Exec: " .. choice.name)
      end
    end)
  end)
end

-- Ver containers
_G.docker_ps = function()
  vim.schedule(function()
    vim.ui.select({
      { desc = "← Back", action = "back" },
      { desc = "Corriendo", action = "running" },
      { desc = "Todos", action = "all" },
    }, {
      prompt = "Ver containers >",
      format_item = function(x) return x.desc end,
    }, function(choice)
      if not choice or choice.action == "back" then
        _G.docker_containers()
        return
      end
      local flag = choice.action == "all" and "-a" or ""
      open_float_terminal("docker ps " .. flag .. " --format 'table {{.Names}}\t{{.Status}}\t{{.Image}}\t{{.Ports}}'", "Docker PS " .. choice.desc)
    end)
  end)
end

-- Submenu Containers
_G.docker_containers = function()
  vim.schedule(function()
    vim.ui.select({
      { desc = "← Back", action = "back" },
      { desc = "Exec container", action = "exec" },
      { desc = "Ver containers", action = "ps" },
      { desc = "Terminal vacía", action = "terminal" },
    }, {
      prompt = "Containers >",
      format_item = function(x) return x.desc end,
    }, function(choice)
      if not choice then return end
      if choice.action == "exec" then _G.docker_exec()
      elseif choice.action == "ps" then _G.docker_ps()
      elseif choice.action == "terminal" then vim.cmd("ToggleTerm direction=float")
      elseif choice.action == "back" then _G.menu_docker()
      end
    end)
  end)
end

-- Menu principal Docker
_G.menu_docker = function()
  vim.schedule(function()
    vim.ui.select({
      { desc = "← Back", action = "back" },
      { desc = "Containers", action = "containers" },
      { desc = "Compose", action = "compose" },
      { desc = "Terminal vacía", action = "terminal" },
    }, {
      prompt = "Docker >",
      format_item = function(x) return x.desc end,
    }, function(choice)
      if not choice then return end
      if choice.action == "containers" then _G.docker_containers()
      elseif choice.action == "compose" then _G.docker_compose_projects()
      elseif choice.action == "terminal" then vim.cmd("ToggleTerm direction=float")
      elseif choice.action == "back" then require("snacks").dashboard()
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
vim.keymap.set("n", "<leader>td", function()
  _G.menu_docker()
end, { desc = "Terminales Docker" })
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

-- Desactivar keymaps de terminal de LazyVim (ft, fT, c-/) para que no choquen
vim.schedule(function()
  pcall(vim.keymap.del, "n", "<leader>ft")
  pcall(vim.keymap.del, "n", "<leader>fT")
  pcall(vim.keymap.del, "n", "<c-/>")
  pcall(vim.keymap.del, "t", "<c-/>")
  pcall(vim.keymap.del, "n", "<c-_>")
  pcall(vim.keymap.del, "t", "<c-_>")
end)

-- ==================== DEBUG COMMANDS ====================
vim.api.nvim_create_user_command("DashLog", function()
  vim.cmd("edit " .. log_file)
end, { desc = "Show dashboard debug log" })

vim.api.nvim_create_user_command("DashLogClear", function()
  local f = io.open(log_file, "w")
  if f then
    f:close()
  end
  vim.notify("Dashboard log cleared")
end, { desc = "Clear dashboard debug log" })

vim.api.nvim_create_user_command("DashDebug", function()
  DEBUG = not DEBUG
  vim.notify("Dashboard debug: " .. (DEBUG and "ON" or "OFF"))
end, { desc = "Toggle dashboard debug logging" })

-- ==================== DASHBOARD ====================
return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[N V I M]],
          keys = {
            { key = "p", desc = "Proyectos", action = _G.menu_proyectos },
            { key = "t", desc = "Conexiones SSH", action = _G.menu_terminales },
            { key = "d", desc = "Centro Docker", action = _G.menu_docker },
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
