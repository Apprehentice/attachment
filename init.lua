local attachment = {}

local callbacks = {
	"draw", "errhand", "focus", "keypressed", "keyreleased",
	"load", "mousefocus", "mousemoved", "mousepressed", "mousereleased",
	"quit", "resize", "run", "textinput", "threaderror", "update",
	"visible", "gamepadaxis", "gamepadpressed", "gamepadreleased",
	"joystickadded", "joystickaxis", "joystickhat", "joystickpressed",
	"joystickreleased", "joystickremoved",
}

function attachment.new(env)
	assert(env ~= attachment, "Cannot call 'new' with colon operator")
  env = env or require("love")

  local a = setmetatable({}, { __index = attachment })
  a.attachments = {}

  for i, callback in ipairs(callbacks) do
    if env[callback] then a:attach(callback, env[callback]) end
    env[callback] = function(...) a:call(callback, ...) end
  end

  return a
end

function attachment:attach(ev,func)
  assert(ev ~= nil, "bad argument #1 to 'attach' (got nil)")
  assert(type(func) == "function", "bad argument #2 to 'attach' (function expected, got " .. type(func) .. ")")
  if not self.attachments[ev] then self.attachments[ev] = {} end
  table.insert(self.attachments[ev], func)
  return func
end

function attachment:detach(ev, func)
  assert(ev ~= nil, "bad argument #1 to 'unattach' (got nil)")
	assert(type(func) == "function", "bad argument #2 to 'detach' (function expected, got " .. type(func) .. ")")
  if self.attachments[ev] then
    for i, f in ipairs(self.attachments[ev]) do
      if f == func then
        table.remove(self.attachments[ev], i)
        break
      end
    end
  end
end

function attachment:attachObject(obj)
  for i, callback in ipairs(callbacks) do
    if obj[callback] then self:attach(callback, obj[callback]) end
  end
end

function attachment:call(ev, ...)
  if self.attachments[ev] then
    for id, f in ipairs(self.attachments[ev]) do
      f(...)
    end
  end
end

return setmetatable(attachment, { __call = attachment.new })
