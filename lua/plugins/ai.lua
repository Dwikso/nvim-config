return {
  "supermaven-inc/supermaven-nvim",
  opts = {
    keymaps = {
      accept_suggestion = "<leader>w", -- handled by nvim-cmp / blink.cmp
    },
    ignore_filetypes = {
      TelescopePrompt = true,
      FTerm = true,
      ["neo-tree"] = true,
    },
  },
}
