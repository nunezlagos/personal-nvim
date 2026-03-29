return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "b0o/schemastore.nvim" },
    opts = function(_, opts)
      -- Preservar defaults de LazyVim (inlay_hints, etc.) y agregar servers
      opts.servers = opts.servers or {}

      -- Python
      opts.servers.pyright = {}

      -- TypeScript + JavaScript
      opts.servers.ts_ls = {}

      -- JSON con schemas
      opts.servers.jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      }

      -- PHP
      opts.servers.intelephense = {
        settings = {
          intelephense = {
            stubs = {
              "bcmath", "bz2", "calendar", "Core", "curl", "date",
              "dba", "dom", "enchant", "fileinfo", "filter", "ftp",
              "gd", "gettext", "hash", "iconv", "imap", "intl",
              "json", "ldap", "libxml", "mbstring", "mcrypt",
              "mysql", "mysqli", "password", "pcntl", "pcre",
              "PDO", "pdo_mysql", "Phar", "readline", "recode",
              "Reflection", "regex", "session", "SimpleXML", "soap",
              "sockets", "sodium", "SPL", "sqlite3", "standard",
              "superglobals", "tokenizer", "xml", "xdebug", "xmlreader",
              "xmlrpc", "xmlwriter", "yaml", "zip", "zlib",
              "wordpress", "woocommerce",
            },
            environment = { phpVersion = "8.2" },
          },
        },
      }

      return opts
    end,
  },
  -- Schemas para jsonls
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
}
