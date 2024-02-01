require("neodev").setup()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})


  vim.keymap.set('n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<cr>', {})
  vim.keymap.set('n', '<leader>gl', ':Telescope diagnostics<CR>', {})

  -- CMake-Tools keymaps
  vim.keymap.set('n', '<leader>cmb', ':CMakeBuild<CR>', {})
  vim.keymap.set('n', '<leader>cmr', ':CMakeRun<CR>', {})
  vim.keymap.set('n', '<Leader>cmd', ':CMakeDebug<CR>', {})
  vim.keymap.set('n', '<Leader>cmg', ':CMakeGenerate<CR>', {})
end)

require('lspconfig').qmlls.setup({
    cmd = {'/home/brynn/Qt/6.6.0/gcc_64/bin/qmlls'}
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "clangd",
        "lua_ls",
        "tsserver"
    },
    handlers = {
        lsp_zero.default_setup,
        -- Lua Language seup
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        clangd = function()
            require('lspconfig').clangd.setup({
                cmd  = {
                    "clangd",
                    "--header-insertion=never"
                }
        })
        end
  },
})

local cmp_action = lsp_zero.cmp_action()
require("cmp").setup({
    mapping = {
        ['<C-l>'] = cmp_action.luasnip_jump_forward(),
        ['<C-h>'] = cmp_action.luasnip_jump_backward(),
        ['<C-Space>'] = cmp_action.toggle_completion(),
    }
})


