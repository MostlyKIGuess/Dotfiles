return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "Davidyz/VectorCode",
    -- Markdown rendering in chat buffer
    { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
    -- CodeCompanion chat history extension
    { "ravitemer/codecompanion-history.nvim" },
    {
      "OXY2DEV/markview.nvim",
      lazy = false,
      opts = {
        preview = {
          filetypes = { "markdown", "codecompanion" },
          ignore_buftypes = {},
        },
      },
    },
    -- Cleaner diffs for inline assistant
    {
      "echasnovski/mini.diff",
      config = function()
        local diff = require("mini.diff")
        diff.setup({
          source = diff.gen_source.none(),
        })
      end,
    },
    -- Image clipboard support
    {
      "HakonHarnes/img-clip.nvim",
      opts = {
        filetypes = {
          codecompanion = {
            prompt_for_file_name = false,
            template = "[Image]($FILE_PATH)",
            use_absolute_path = true,
          },
        },
      },
    },
  },
  opts = {
    strategies = {
      chat = {
        adapter = {
          name = "copilot",
          model = "gpt-4.1",
        },
      },
      inline = {
        adapter = "copilot",
      },
    },
    display = {
      action_palette = {
        provider = "telescope", -- Using telescope since you have it configured
      },
    },
    -- Enable markdown rendering and image support in chat buffer
    extensions = {
      history = {
        enabled = true,
        opts = {
          keymap = "gh", -- Open history browser
          save_chat_keymap = "sc", -- Save current chat manually
          auto_save = true,
          expiration_days = 0,
          picker = "telescope",
          auto_generate_title = true,
          continue_last_chat = false,
          delete_on_clearing_chat = false,
          dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
          enable_logging = false,
          picker_keymaps = {
            rename = { n = "r", i = "<M-r>" },
            delete = { n = "d", i = "<M-d>" },
            duplicate = { n = "<C-y>", i = "<C-y>" },
          },
          title_generation_opts = {
            refresh_every_n_prompts = 3,
            max_refreshes = 10,
          },
          chat_filter = nil,
        },
      },
      vectorcode = {
        ---@type VectorCode.CodeCompanion.ExtensionOpts
        opts = {
          tool_group = {
            enabled = true,
            collapse = true,
            -- tools in this array will be included to the `vectorcode_toolbox` tool group
            extras = {},
          },
          tool_opts = {
            ---@type VectorCode.CodeCompanion.LsToolOpts
            ls = {},
            ---@type VectorCode.CodeCompanion.QueryToolOpts
            query = {},
            ---@type VectorCode.CodeCompanion.VectoriseToolOpts
            vectorise = {},
          },
        },
      },
    },
    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            api_key = "LILBROTHOUGHTIWOULDPUSHMYAPILMFAOLOSER",
          },
          schema = {
            model = {
              default = "gemini-2.5-flash-preview-05-20",
            },
          },
        })
      end,
    },
  },
  keys = {
    { "<c-s>", "<CR>", ft = "codecompanion", desc = "Submit Prompt", remap = true },
    { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
    {
      "<leader>aa",
      function()
        return require("codecompanion").toggle()
      end,
      desc = "Toggle (CodeCompanion)",
      mode = { "n", "v" },
    },
    {
      "<leader>ax",
      function()
        vim.cmd("CodeCompanionChat Toggle")
        vim.cmd("CodeCompanionChat")
      end,
      desc = "Clear (CodeCompanion)",
      mode = { "n", "v" },
    },
    {
      "<leader>aq",
      function()
        vim.ui.input({
          prompt = "Quick Chat: ",
        }, function(input)
          if input ~= "" then
            vim.cmd("CodeCompanionChat " .. input)
          end
        end)
      end,
      desc = "Quick Chat (CodeCompanion)",
      mode = { "n", "v" },
    },
    {
      "<leader>ap",
      function()
        vim.cmd("CodeCompanionActions")
      end,
      desc = "Prompt Actions (CodeCompanion)",
      mode = { "n", "v" },
    },
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)

    -- Set up autocmds for codecompanion buffers
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "codecompanion",
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
      end,
    })
  end,
}
