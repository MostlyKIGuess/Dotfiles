return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("competitest").setup({
      local_config_file_name = ".competitest.lua",
      evaluate_template_modifiers = true,
      template_file = {
        cpp = "~/.config/nvim/lua/plugins/template.cpp",
        rust = "~/.config/nvim/lua/plugins/template.rs",
      },
    })

    -- Add key mappings
    local map = vim.api.nvim_set_keymap
    local options = { noremap = true, silent = true }

    -- Map <leader>ct to run all test cases
    map("n", "<leader>cot", ":CompetiTest run<CR>", options)
    map("n", "<leader>cia", ":CompetiTest add_testcase<CR>", options)
    map("n", "<leader>cee", ":CompetiTest edit_testcase<CR>", options)
    map("n", "<leader>crp", ":CompetiTest receive problem<CR>", options)
    -- Map <leader>cui to open the UI
    map("n", "<leader>cui", ":CompetiTest show_ui<CR>", options)
  end,
}
