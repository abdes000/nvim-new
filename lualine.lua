return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local trouble = require("trouble")
    local symbols = trouble.statusline({
      mode = "lsp_document_symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{kind_icon}{symbol.name:Normal}",
      -- The following line is needed to fix the background color
      -- Set it to the lualine section you want to use
      hl_group = "lualine_c_normal",
    })
    table.insert(opts.sections.lualine_c, {
      symbols.get,
      cond = symbols.has,
    })
    require('lualine').setup {
      sections = {
        lualine_c = {
          'filename',
          { function() return require('bookmarks').status() end }
        },
        -- ... other sections ...
      }
    }
    require('lualine').setup {
      lualine_x = {
        {
          require("interestingwords").lualine_get,
          cond = require("interestingwords").lualine_has,
          color = { fg = "#ff9e64" },
        },
      }
    }
  end,
}
