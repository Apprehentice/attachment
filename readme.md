Attachment: A callback helper for LÖVE
=====================================
Attachment is a callback helper utility for the LÖVE framework. When initialized, Attachment will register all existing LÖVE callbacks with itself and then replace all of LÖVE's callbacks with its own. In addition, Attachment has its own event system so you can easily register all of your game's modules with LÖVE's callbacks.

## Usage ##
To use Attachment, require it into your project, create an event handler, and attach some functions to it.

### Creating an Event Handler ###
Creating a Attachment event handler is as simple as calling the Attachment table.
```Lua
local attachment = require("attachment")
local handler = attachment()
```
For simplicity, you may want to do this instead:
```Lua
local attachment = require("attachment")()
```

### attaching ###
The function for attaching functions is used like this
```Lua
attachment:attach("event name", function)
```
```Lua
local attachment = require("attachment")()

attachment:attach("draw", function()
  love.graphics.setFont(love.graphics.newFont(12))
  love.graphics.setColor(0, 255, 0)
  love.graphics.print("Hello, World!", 0, 0)
end)
```
The *attach* function returns the function that was added so that you may detach it later, if necessary.

With Attachment, you can also add all of an object or module's callbacks to a Attachment event handler by calling attachment:attachObject
```Lua
local attachment = require("attachment")()
local othermodule = require("othermodule")

attachment:attachObject(othermodule)
```
This will have Attachment run through the object and register anything that looks like a LÖVE callback.

### Unattaching ###
To detach a function from an event, do
```Lua
attachment:detach("event name", function)
```
This will run through the event called "event name" and remove the given function if it is found.

### Calling ###
You can register your own events with Attachment if you'd like. To do so, simply attach a function to the desired event and then call the event somewhere in your code.
For example:
```Lua
local attachment = require("attachment")()
attachment:attach("foo", function() print("bar") end)
attachment:call("foo") -- Outputs "bar"
```

### Other Environments ###
If, for some reason, your main environment is not love, you can pass your environment to Attachment as the first argument when creating your Attachment event handler.
```Lua
local environment = require("environment")
local attachment = require("attachment")(environment)
```
This can be useful if, for example, you don't want Attachment to consume LÖVE's callbacks.
```Lua
local attachment = require("attachment")({})
```
