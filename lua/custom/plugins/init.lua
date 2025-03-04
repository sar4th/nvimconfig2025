return {
  {
    "nvim-lua/plenary.nvim",
    config = function()
      vim.api.nvim_create_user_command("LazyGitSimple", function()
        vim.cmd("terminal lazygit")
        vim.cmd("startinsert")
        
        local bufnr = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_keymap(bufnr, 't', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', ':bd!<CR>', {noremap = true, silent = true})
      end, {})
      
      vim.keymap.set("n", "<leader>lg", ":LazyGitSimple<CR>", { remap = false, silent = true, desc = "Open lazy git" })
    end
  },
  
  {
    '0x00-ketsu/autosave.nvim',
    event = { "InsertLeave", "TextChanged" },
    config = function()
      require('autosave').setup {
        condition = function(buf)
          return vim.bo[buf].buftype ~= 'terminal'
        end
      }
    end
  },
  
  {
    "catppuccin/nvim",
    flavour="mocha",
    name = "catppuccin",
    priority = 1000,
    opts = {
      no_italic = true,
      term_colors = true,
      transparent_background = false,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      integrations = {
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },
    }
  }
  
}