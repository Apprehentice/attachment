BootyCall: A callback helper for LÖVE
=====================================
BootyCall is a callback helper utility for the LÖVE framework. When initialized, BootyCall will register all existing LÖVE callbacks with itself and then replace all of LÖVE's callbacks with its own. In addition, BootyCall has its own event system so you can easily register all of your game's modules with LÖVE's callbacks.

## Usage ##
To use BootyCall, require it into your project, create an event handler, and hook some functions to it.

### Creating an Event Handler ###
Creating a BootyCall event handler is as simple as calling the BootyCall table.
```Lua
local bootycall = require("bootycall")
local handler = bootycall()
```
For simplicity, you may want to do this instead:
```Lua
local bootycall = require("bootycall")()
```

### Hooking ###
The function for hooking functions is used like this
```Lua
bootycall:hook("event name", function)
```
```Lua
local bootycall = require("bootycall")()

bootycall:hook("draw", function()
  love.graphics.setFont(love.graphics.newFont(12))
  love.graphics.setColor(0, 255, 0)
  love.graphics.print("Hello, World!", 0, 0)
end)
```
The *hook* function returns the function that was added so that you may unhook it later, if necessary.

With BootyCall, you can also add all of an object or module's callbacks to a BootyCall event handler by calling bootycall:hookObject
```Lua
local bootycall = require("bootycall")()
local othermodule = require("othermodule")

bootycall:hookObject(othermodule)
```
This will have BootyCall run through the object and register anything that looks like a LÖVE callback.

### Unhooking ###
To unhook a function from an event, do
```Lua
bootycall:unhook("event name", function)
```
This will run through the event called "event name" and remove the given function if it is found.

### Calling ###
You can register your own events with BootyCall if you'd like. To do so, simply hook a function to the desired event and then call the event somewhere in your code.
For example:
```Lua
local bootycall = require("bootycall")()
bootycall:hook("foo", function() print("bar") end)
bootycall:call("foo") -- Outputs "bar"
```

### Other Environments ###
If, for some reason, your main environment is not love, you can pass your environment to BootyCall as the first argument when creating your BootyCall event handler.
```Lua
local environment = require("environment")
local bootycall = require("bootycall")(environment)
```
