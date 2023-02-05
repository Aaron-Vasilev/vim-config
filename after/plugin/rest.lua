local restNvim = require("rest-nvim")

restNvim.setup({
  result_split_horizontal = false,
  result_split_in_place = false,
  skip_ssl_verification = false,
  -- Encode URL before making request
  encode_url = true,
  highlight = {
    enabled = true,
    timeout = 150,
  },
  result = {
    show_url = true,
    show_http_info = true,
    show_headers = true,
    -- executables or functions for formatting response body [optional]
    -- set them to nil if you want to disable them
    formatters = {
      json = "jq",
      html = function(body)
        return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
      end
    },
  },
  -- Jump to request line on run
  jump_to_request = false,
  env_file = '.env',
  custom_dynamic_variables = {},
  yank_dry_run = true,
})

function rest()
  restNvim.run()
end
