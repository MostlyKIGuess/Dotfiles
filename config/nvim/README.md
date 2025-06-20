# MostlyK changes on top of LAzyVim


Refer to the [documentation](https://lazyvim.github.io/installation) to get started.
Mine has latex, more colors, and some other extras and jupty, some cp templates, and some other things.

# CodeCompanion Quick Tips

## Installation & Setup
- Requires Neovim 0.11.0+, curl, and Tree-sitter parsers: `:TSInstall markdown markdown_inline`
- Default adapter is GitHub Copilot (works out of the box if you have copilot.lua)

## Key Shortcuts (Same as CopilotChat)
- `<leader>aa` - Toggle CodeCompanion chat
- `<leader>ax` - Clear/Reset chat
- `<leader>aq` - Quick chat prompt
- `<leader>ap` - Open prompt actions palette
- `<C-s>` - Submit prompt in chat buffer

## Chat Buffer Features

### Variables (access with #)
- `#buffer` - Current buffer's code
- `#lsp` - LSP information for current buffer  
- `#viewport` - Visible buffers and lines

### Slash Commands (access with /)
- `/buffer` - Insert open buffers
- `/file` - Insert a file
- `/help` - Insert help content
- `/now` - Insert current date/time
- `/symbols` - Insert file symbols

### Tools/Agents (access with @)
- `@cmd_runner` - Run shell commands
- `@create_file` - Create new files
- `@insert_edit_into_file` - Edit code in buffers
- `@read_file` - Read specific files
- `@web_search` - Search the internet
- `@files` - Combined file operations

## Commands
- `:CodeCompanion <prompt>` - Inline assistant
- `:CodeCompanionChat <prompt>` - Chat with prompt
- `:CodeCompanionActions` - Open action palette
- `:CodeCompanionCmd <prompt>` - Generate command-line commands

## Tips
- Use `<C-_>` for native completion in chat buffer
- Visual selections work with all commands
- Supports telescope, mini_pick, or snacks for action palette
- Compatible with render-markdown.nvim and img-clip.nvim