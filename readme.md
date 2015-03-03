BootyCall: A callback helper for LÖVE
=====================================
BootyCall is a callback helper utility for the LÖVE framework. When initialized, BootyCall will register all existing LÖVE callbacks with itself and then replace all of LÖVE's callbacks with its own. In addition, BootyCall has its own event system so you can easily register all of your game's modules with LÖVE's callbacks.

## Usage ##
To use BootyCall, require it into your project and hook some functions to it.

The function for hooking functions is used like this
```Lua
bootycall:hook("event name", "unique id", function)
```
```Lua
local bootycall = require("bootycall")()

bootycall:hook("draw", "draw", function()
  love.graphics.setFont(love.graphics.newFont(12))
  love.graphics.setColor(0, 255, 0)
  love.graphics.print("Hello, World!", 0, 0)
end)
```

With this module, you can also add all of an object or module's callbacks to a BootyCall event handler by calling bootycall:hookObject
```Lua
local bootycall = require("bootycall")()
local othermodule = require("othermodule")

bootycall:hookObject(othermodule, "othermodule")
```
This will have BootyCall run through the object and register anything that looks like a LÖVE callback using the second argument as the prefix for the callback's ID.

## Other Environments ##
If, for some reason, your main environment is not love, you can also pass your environment to bootycall as the first argument when creating your bootycall event handler.
```Lua
local environment = require("environment")
local bootycall = require("bootycall")(environment)
```
