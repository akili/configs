-- use 'windwp/nvim-autopairs'

-- autopairs
local npairs = require("nvim-autopairs")
npairs.setup({
  check_ts = true,  -- включает поддержку treesitter
  fast_wrap = {}
})

-- интеграция с nvim-cmp
local cmp_status, cmp = pcall(require, "cmp")
if cmp_status then
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end
