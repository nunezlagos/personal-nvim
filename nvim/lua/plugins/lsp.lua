return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Python
        pyright = {},
        -- TypeScript + JavaScript (ts_ls es el nuevo nombre de tsserver)
        ts_ls = {},
        -- JSON con schemas
        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },
        -- PHP
        intelephense = {
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
        },
      },
    },
  },
  -- Schemas para jsonls
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
}
