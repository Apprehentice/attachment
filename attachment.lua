local attachment = {}

local callbacks = {
	"draw", "errhand", "focus", "keypressed", "keyreleased",
	"load", "mousefocus", "mousemoved", "mousepressed", "mousereleased",
	"quit", "resize", "run", "textinput", "threaderror", "update",
	"visible", "gamepadaxis", "gamepadpressed", "gamepadreleased",
	"joystickadded", "joystickaxis", "joystickhat", "joystickpressed",
	"joystickreleased", "joystickremoved",
}

function attachment:new(env)
  env = env or require("love")

  local a = setmetatable({}, { __index = attachment })
  a.attachs = {}

  for i, callback in ipairs(callbacks) do
    if env[callback] then a:attach(callback, env[callback]) end
    env[callback] = function(...) a:call(callback, ...) end
  end

  return a
end

function attachment:attach(ev,func)
  assert(ev ~= nil, "bad argument #1 to 'attach' (got nil)")
  assert(type(func) == "function", "bad argument #2 to 'attach' (function expected, got " .. type(func) .. ")")
  if not self.attachs[ev] then self.hooks[ev] = {} end
  table.insert(self.attachs[ev], func)
  return func
end

function attachment:unattach(ev, func)
  assert(ev ~= nil, "bad argument #1 to 'unattach' (got nil)")
--assert(id ~= nil, "bad argument #2 to 'unattach' (got nil)") -- FIXME: there is no id here?!
  if self.attachs[ev] then
    for i, f in ipairs(self.attachs[ev]) do
      if f == func then
        table.remove(self.attachs[ev], i)
        break
      end
    end
  end
end

function attachment:attachObject(obj, prefix)
  assert(type(prefix) == "string", "bad argument #2 to attachObject (string expected, got " .. type(prefix) .. ")")

  for i, callback in ipairs(callbacks) do
    if obj[callback] then a:attach(callback, obj[callback]) end
  end
end

function attachment:call(ev, ...)
  if self.attachs[ev] then
    for id, f in ipairs(self.attachs[ev]) do
      f(...)
    end
  end
end

return setmetatable(attachment, { __call = attachment.new })
