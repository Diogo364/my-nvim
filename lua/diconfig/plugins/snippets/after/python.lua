local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

-- snippets are added via ls.add_snippets(filetype, snippets[, opts]), where
-- opts may specify the `type` of the snippets ("snippets" or "autosnippets",
-- for snippets that should expand directly after the trigger is typed).
--
-- opts can also specify a key. By passing an unique key to each add_snippets, it's possible to reload snippets by
-- re-`:luafile`ing the file in which they are defined (eg. this one).

local ft = "python"

require("luasnip.session.snippet_collection").clear_snippets(ft)
ls.add_snippets(ft, {
    s("fia", fmt("from {} import {} as {}", { i(1), i(2), i(0) })),
    s("ia", fmt("import {} as {}", { i(1), i(0) })),
    s("sdict", fmt('{{\n\t"{}": {}\n}}', { i(1), i(0) })),
    s("list", fmt("[\n\t{},\n]", i(0))),
    s("impds", {
        t({
            "import pandas as pd",
            "import numpy as np",
            "import matplotlib",
            "import matplotlib.pyplot as plt",
            "import seaborn as sns",
        }),
    }),
    s("impos", {
        t({
            "import os",
            "import os.path as osp",
            "from glob import glob",
        }),
    }),
})
