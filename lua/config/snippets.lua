local luasnip = require "luasnip"
local snippet = luasnip.snippet
local text = luasnip.text_node
local input = luasnip.insert_node


luasnip.add_snippets("c", {
    snippet("print", {
        text('printf("'),
        input(1),
        text('\\n");'),
    })
})

luasnip.add_snippets("typescript", {
    snippet("func", {
            text("const "), input(1, "name"), text(" = ("), input(2, "param"), text(": "), input(3, "type"), text(") => {"),
            text({ "", "\t" }), input(4, "// CODE HERE"),
            text({ "", "}" }),
    })
})
