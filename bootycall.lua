local bootycall = {}

function bootycall:new(env)
  env = env or love

  local b = setmetatable({}, { __index = bootycall })
  b.hooks = {}

  if env.draw then b:hook("draw", env.draw) end
  if env.errhand then b:hook("errhand", env.errhand) end
  if env.focus then b:hook("focus", env.focus) end
  if env.keypressed then b:hook("keypressed", env.keypressed) end
  if env.keyreleased then b:hook("keyreleased", env.keyreleased) end
  if env.load then b:hook("load", env.load) end
  if env.mousefocus then b:hook("mousefocus", env.mousefocus) end
  if env.mousemoved then b:hook("mousemoved", env.mousemoved) end
  if env.mousepressed then b:hook("mousepressed", env.mousepressed) end
  if env.mousereleased then b:hook("mousereleased", env.mousereleased) end
  if env.quit then b:hook("quit", env.quit) end
  if env.resize then b:hook("resize", env.resize) end
  if env.run then b:hook("run", env.run) end
  if env.textinput then b:hook("textinput", env.textinput) end
  if env.threaderror then b:hook("threaderror", env.threaderror) end
  if env.update then b:hook("update", env.update) end
  if env.visible then b:hook("visible", env.visible) end
  if env.gamepadaxis then b:hook("gamepadaxis", env.gamepadaxis) end
  if env.gamepadpressed then b:hook("gamepadpressed", env.gamepadpressed) end
  if env.gamepadreleased then b:hook("gamepadreleased", env.gamepadreleased) end
  if env.joystickadded then b:hook("joystickadded", env.joystickadded) end
  if env.joystickaxis then b:hook("joystickaxis", env.joystickaxis) end
  if env.joystickhat then b:hook("joystickhat", env.joystickhat) end
  if env.joystickpressed then b:hook("joystickpressed", env.joystickpressed) end
  if env.joystickreleased then b:hook("joystickreleased", env.joystickreleased) end
  if env.joystickremoved then b:hook("joystickremoved", env.joystickremoved) end

  env.draw = function(...) b:call("draw", ...) end
  env.errhand = function(...) b:call("errhand", ...) end
  env.focus = function(...) b:call("focus", ...) end
  env.keypressed = function(...) b:call("keypressed", ...) end
  env.keyreleased = function(...) b:call("keyreleased", ...) end
  env.load = function(...) b:call("load", ...) end
  env.mousefocus = function(...) b:call("mousefocus", ...) end
  env.mousemoved = function(...) b:call("mousemoved", ...) end
  env.mousepressed = function(...) b:call("mousepressed", ...) end
  env.mousereleased = function(...) b:call("mousereleased", ...) end
  env.quit = function(...) b:call("quit", ...) end
  env.resize = function(...) b:call("resize", ...) end
  env.run = function(...) b:call("run", ...) end
  env.textinput = function(...) b:call("textinput", ...) end
  env.threaderror = function(...) b:call("threaderror", ...) end
  env.update = function(...) b:call("update", ...) end
  env.visible = function(...) b:call("visible", ...) end
  env.gamepadaxis = function(...) b:call("gamepadaxis", ...) end
  env.gamepadpressed = function(...) b:call("gamepadpressed", ...) end
  env.gamepadreleased = function(...) b:call("gamepadreleased", ...) end
  env.joystickadded = function(...) b:call("joystickadded", ...) end
  env.joystickaxis = function(...) b:call("joystickaxis", ...) end
  env.joystickhat = function(...) b:call("joystickhat", ...) end
  env.joystickpressed = function(...) b:call("joystickpressed", ...) end
  env.joystickreleased = function(...) b:call("joystickreleased", ...) end
  env.joystickremoved = function(...) b:call("joystickremoved", ...) end

  return b
end

function bootycall:hook(ev,func)
  assert(ev ~= nil, "bad argument #1 to 'hook' (got nil)")
  assert(type(func) == "function", "bad argument #2 to 'hook' (function expected, got " .. type(func) .. ")")
  if not self.hooks[ev] then self.hooks[ev] = {} end
  table.insert(self.hooks[ev], func)
  return func
end

function bootycall:unhook(ev, func)
  assert(ev ~= nil, "bad argument #1 to 'unhook' (got nil)")
  assert(id ~= nil, "bad argument #2 to 'unhook' (got nil)")
  if self.hooks[ev] then
    for i, f in ipairs(self.hooks[ev]) do
      if f == func then
        table.remove(self.hooks[ev], i)
        break
      end
    end
  end
end

function bootycall:hookObject(obj, prefix)
  assert(type(prefix) == "string", "bad argument #2 to hookObject (string expected, got " .. type(prefix) .. ")")

  if obj.draw then b:hook("draw", obj.draw) end
  if obj.errhand then b:hook("errhand", obj.errhand) end
  if obj.focus then b:hook("focus", obj.focus) end
  if obj.keypressed then b:hook("keypressed", obj.keypressed) end
  if obj.keyreleased then b:hook("keyreleased", obj.keyreleased) end
  if obj.load then b:hook("load", obj.load) end
  if obj.mousefocus then b:hook("mousefocus", obj.mousefocus) end
  if obj.mousemoved then b:hook("mousemoved", obj.mousemoved) end
  if obj.mousepressed then b:hook("mousepressed", obj.mousepressed) end
  if obj.mousereleased then b:hook("mousereleased", obj.mousereleased) end
  if obj.quit then b:hook("quit", obj.quit) end
  if obj.resize then b:hook("resize", obj.resize) end
  if obj.run then b:hook("run", obj.run) end
  if obj.textinput then b:hook("textinput", obj.textinput) end
  if obj.threaderror then b:hook("threaderror", obj.threaderror) end
  if obj.update then b:hook("update", obj.update) end
  if obj.visible then b:hook("visible", obj.visible) end
  if obj.gamepadaxis then b:hook("gamepadaxis", obj.gamepadaxis) end
  if obj.gamepadpressed then b:hook("gamepadpressed", obj.gamepadpressed) end
  if obj.gamepadreleased then b:hook("gamepadreleased", obj.gamepadreleased) end
  if obj.joystickadded then b:hook("joystickadded", obj.joystickadded) end
  if obj.joystickaxis then b:hook("joystickaxis", obj.joystickaxis) end
  if obj.joystickhat then b:hook("joystickhat", obj.joystickhat) end
  if obj.joystickpressed then b:hook("joystickpressed", obj.joystickpressed) end
  if obj.joystickreleased then b:hook("joystickreleased", obj.joystickreleased) end
  if obj.joystickremoved then b:hook("joystickremoved", obj.joystickremoved) end
end

function bootycall:call(ev, ...)
  if self.hooks[ev] then
    for id, f in ipairs(self.hooks[ev]) do
      f(...)
    end
  end
end

return setmetatable(bootycall, { __call = bootycall.new })
