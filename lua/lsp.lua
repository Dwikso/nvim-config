local lsp = {}

function lsp.init()
  local servers = {
    "astro",
    "clangd",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "html",
    "jsonls",
    "lua_ls",
    "pyright",
    "svelte",
    "yamlls",
    "vtsls",
    "vue_ls",
  }

  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = servers,
  })

  require("blink.cmp").setup({
    keymap = {
      preset = "enter",
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' }
    },
    signature = { enabled = true },
  })

  vim.diagnostic.config({
    float = { source = true, border = 'rounded' },
  })

  -- Configuration vtsls
  vim.lsp.config("vtsls", {
    on_attach = function(client, _)
      client.server_capabilities.documentFormattingProvider = false
    end,
  })

  -- Configuration volar (Vue)
  vim.lsp.config("volar", {
    on_attach = function(client, _)
      client.server_capabilities.documentFormattingProvider = false
    end,
  })

  -- Configuration astro
  vim.lsp.config("astro", {
    init_options = {
      typescript = {
        tsdk = vim.fn.stdpath("data") .. "/mason/packages/typescript-language-server/node_modules/typescript/lib",
      },
    },
    on_attach = function(client, _)
      client.server_capabilities.documentFormattingProvider = false
    end,
  })

  -- Démarre les serveurs
  vim.lsp.enable(servers)

  -- Mapping pour hover
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
end

return lsp
