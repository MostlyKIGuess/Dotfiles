return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    -- keymap goes here!
    vim.api.nvim_set_keymap("n", "<leader>cp", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })
  end,
}
