require('code_runner').setup({
  filetype = {
    go = "go run ."
  },
})


vim.keymap.set("n", "<leader>r", ":RunCode<CR>")
