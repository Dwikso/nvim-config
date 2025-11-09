return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "oxlint",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        javascript = { "oxlint" },
        typescript = { "oxlint" },
        javascriptreact = { "oxlint" },
        typescriptreact = { "oxlint" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        javascript = { "oxlint" },
        typescript = { "oxlint" },
        javascriptreact = { "oxlint" },
        typescriptreact = { "oxlint" },
      },
      formatters = {
        oxlint = {
          command = "oxlint",
          args = { "--fix", "$FILENAME" },
          stdin = false,
        },
      },
    },
  },
}
