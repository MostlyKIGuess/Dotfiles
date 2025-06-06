return {
  "dccsillag/magma-nvim",
  build = ":UpdateRemotePlugins",
  config = function()
    -- Magma settings
    vim.g.magma_automatically_open_output = false
    vim.g.magma_image_provider = "ueberzug" -- Change to "kitty" if using Kitty terminal
    vim.g.magma_wrap_output = true
    vim.g.magma_output_window_borders = true
    vim.g.magma_cell_highlight_group = "CursorLine"
    vim.g.magma_copy_output = false

    -- Magma keybindings with <leader>m prefix
    local opts = { noremap = true, silent = true }

    -- Core evaluation commands
    vim.keymap.set("n", "<leader>mr", ":MagmaEvaluateOperator<CR>", opts)
    vim.keymap.set("n", "<leader>mm", ":MagmaEvaluateLine<CR>", opts)
    vim.keymap.set("x", "<leader>mr", ":<C-u>MagmaEvaluateVisual<CR>", opts)
    vim.keymap.set("n", "<leader>mc", ":MagmaReevaluateCell<CR>", opts)

    -- Cell management
    vim.keymap.set("n", "<leader>md", ":MagmaDelete<CR>", opts)
    vim.keymap.set("n", "<leader>mo", ":MagmaShowOutput<CR>", opts)
    vim.keymap.set("n", "<leader>mq", ":noautocmd MagmaEnterOutput<CR>", opts)

    -- Kernel management
    vim.keymap.set("n", "<leader>mi", ":MagmaInit<CR>", opts)
    vim.keymap.set("n", "<leader>mD", ":MagmaDeinit<CR>", opts)
    vim.keymap.set("n", "<leader>mI", ":MagmaInterrupt<CR>", opts)
    vim.keymap.set("n", "<leader>mR", ":MagmaRestart<CR>", opts)
    vim.keymap.set("n", "<leader>mX", ":MagmaRestart!<CR>", opts)

    -- Save/Load
    vim.keymap.set("n", "<leader>ms", ":MagmaSave<CR>", opts)
    vim.keymap.set("n", "<leader>ml", ":MagmaLoad<CR>", opts)

    -- Quick initialization functions
    local function magma_init_python()
      vim.cmd([[
      :MagmaInit python3
      :MagmaEvaluateArgument a=5
      ]])
    end

    local function magma_init_csharp()
      vim.cmd([[
      :MagmaInit .net-csharp
      :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof(System.Object),"text/plain");
      ]])
    end

    local function magma_init_fsharp()
      vim.cmd([[
      :MagmaInit .net-fsharp
      :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof<System.Object>,"text/plain")
      ]])
    end

    -- Commands for quick initialization
    vim.api.nvim_create_user_command("MagmaInitPython", magma_init_python, {})
    vim.api.nvim_create_user_command("MagmaInitCSharp", magma_init_csharp, {})
    vim.api.nvim_create_user_command("MagmaInitFSharp", magma_init_fsharp, {})

    -- Quick init keybindings
    vim.keymap.set("n", "<leader>mp", ":MagmaInitPython<CR>", opts)
    vim.keymap.set("n", "<leader>mn", ":MagmaInitCSharp<CR>", opts)
    vim.keymap.set("n", "<leader>mf", ":MagmaInitFSharp<CR>", opts)
  end,
}
