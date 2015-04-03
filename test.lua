---
-- This is a test script for the Attachment module.
-- Expected behavior:
--   Green text should appear on screen reading "Counter: " followed by
--   the value of the counter variable. The counter variable should
--   rise until it reaches 100 and stop.
--   In addition, Cyan text should appear on screen reading "Hello, World!"
--   and the text "bar    20" should be output to the console.

local attachment = require("attachment")()

local counter = 0
local font = love.graphics.newFont(12)

attachment:attach("draw", function()
  love.graphics.setFont(font)
  love.graphics.setColor(0, 255, 0)
  love.graphics.print(string.format("Counter: %d", counter), 0, 0)
end)

local updateFunc = attachment:attach("update", function()
  counter = counter + 1
end)

attachment:attach("update", function()
  if counter >= 100 then
    attachment:detach("update", updateFunc)
  end
end)

local obj = {
  draw = function()
    love.graphics.setFont(font)
    love.graphics.setColor(0, 255, 255)
    love.graphics.print("Hello, World!", 100, 100)
  end
}

attachment:attachObject(obj)

attachment:attach("foo", function(num)
  print("bar", num)
end)
attachment:call("foo", 20)
