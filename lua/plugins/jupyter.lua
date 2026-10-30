return {
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty",
      processor = "magick_cli",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
        },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      window_overlap_clear_enabled = false,
    },
  },
  {
    "abdelwahab-7/nvim-jupyter",
    lazy = false,
    priority = 1000,
    init = function()
      require("nvim_jupyter").setup({
        -- Configuration options (defaults)
        -- clean_tmp_files_on_exit = true,
        -- render_html_as_image = false,
      })
    end,
  },
}
