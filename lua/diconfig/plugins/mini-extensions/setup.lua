local ai_config = require("diconfig.plugins.mini-extensions.ai")
local diff_config = require("diconfig.plugins.mini-extensions.diff")

require("mini.ai").setup(ai_config)
require("mini.diff").setup(diff_config)
