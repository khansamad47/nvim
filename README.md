# NVIM Configuraion
Nvim configuration and notes

## Links
[Official Docs]
[lazy.nvim setup](https://www.youtube.com/watch?v=6mxWayq-s9I&t)

## Features
1. [`:terminal`](https://neovim.io/doc/user/nvim_terminal_emulator.html#terminal) nvim offers terminal integration from with-in nvim
2. Support for languages such as [Python](https://neovim.io/doc/user/provider.html#provider-python).
3. [Lua](https://neovim.io/doc/user/lua.html#lua) as scripting language instead of vimscript.
4. Clipboard integration 
5. LSP

## Lua VIM API
Setting vim options in lua
* `set number` `vim.opt["number"] = true`
* `set tabstop = 4` `vim.opt["tabstop"] = 4`

## Keys
* Jump to tags `<C-]>` go back `<C-o>` or `<C-t>`
* `:help` to launch docs or `:help <topic>`
* `:terminal`

## LAZY.NVIM
* `:Lazy` to bring up the console
* To install plugins create a file in `lua/plugins/plugin-name.lua` and return a lua table

## Lua Language 
* None/NULL value is `nil`
* include `filename.lua` file use `require('filename')`

### Table
Data structure in lua, something like a list
```
-- table -------------------------
-- table is like a list/vector in lua
local color = { "red", 1, "blue" } 

-- starting index is 1
print(color[1])
print(color[2])

-- length
local size = #color

-- iterate
for i=1, #color do
    print(color[i])
end

-- insert at end
table.insert(color, "mycolor")

-- remove at index 2
table.remove(color, 2)

-- nested tables
local nestedTable = { {"samad", 667} , { "wardah", 123 } }
```

### Key Tables
Something like a map
```
-- define
local number = {
    ["samad"] = 15,
    ["wardah"] = 7
}

-- access elements
print(number["samad"])

-- iterate
for key, value in pairs(number) do
    print(key .. ":" .. value)
end

-- insert
number["x"] = 5

-- delete
number["samad"] = nil
```
