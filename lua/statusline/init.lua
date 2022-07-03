require('lualine').setup {
  options = {
    theme = "auto",
    icons_enabled = false,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },

  sections = {
    lualine_a = {"mode"},
    lualine_b = {{
        "filename",
        path = 1, 
        shorting_target = 0  -- Show entire directories name
    }},
    lualine_c = {},
    lualine_x = {"filetype", "filesize"},
    lualine_y = {"branch", "diff", "diagnostics"},
    lualine_z = {"progress"},
  },

}
