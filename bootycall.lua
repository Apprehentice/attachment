local bootycall = {}

function bootycall:new(env)
  env = env or love

  local b = setmetatable({}, { __index = bootycall })
  b.hooks = {}

  if env.draw then b:hook("draw", "draw", env.draw) end
  if env.errhand then b:hook("errhand", "errhand", env.errhand) end
  if env.focus then b:hook("focus", "focus", env.focus) end
  if env.keypressed then b:hook("keypressed", "keypressed", env.keypressed) end
  if env.keyreleased then b:hook("keyreleased", "keyreleased", env.keyreleased) end
  if env.load then b:hook("load", "load", env.load) end
  if env.mousefocus then b:hook("mousefocus", "mousefocus", env.mousefocus) end
  if env.mousemoved then b:hook("mousemoved", "mousemoved", env.mousemoved) end
  if env.mousepressed then b:hook("mousepressed", "mousepressed", env.mousepressed) end
  if env.mousereleased then b:hook("mousereleased", "mousereleased", env.mousereleased) end
  if env.quit then b:hook("quit", "quit", env.quit) end
  if env.resize then b:hook("resize", "resize", env.resize) end
  if env.run then b:hook("run", "run", env.run) end
  if env.textinput then b:hook("textinput", "textinput", env.textinput) end
  if env.threaderror then b:hook("threaderror", "threaderror", env.threaderror) end
  if env.update then b:hook("update", "update", env.update) end
  if env.visible then b:hook("visible", "visible", env.visible) end
  if env.gamepadaxis then b:hook("gamepadaxis", "gamepadaxis", env.gamepadaxis) end
  if env.gamepadpressed then b:hook("gamepadpressed", "gamepadpressed", env.gamepadpressed) end
  if env.gamepadreleased then b:hook("gamepadreleased", "gamepadreleased", env.gamepadreleased) end
  if env.joystickadded then b:hook("joystickadded", "joystickadded", env.joystickadded) end
  if env.joystickaxis then b:hook("joystickaxis", "joystickaxis", env.joystickaxis) end
  if env.joystickhat then b:hook("joystickhat", "joystickhat", env.joystickhat) end
  if env.joystickpressed then b:hook("joystickpressed", "joystickpressed", env.joystickpressed) end
  if env.joystickreleased then b:hook("joystickreleased", "joystickreleased", env.joystickreleased) end
  if env.joystickremoved then b:hook("joystickremoved", "joystickremoved", env.joystickremoved) end

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

function bootycall:hook(ev, id, func)
  assert(ev, "bad argument #1 to 'hook' (got nil)")
  assert(id, "bad argument #2 to 'hook' (got nil)")
  assert(type(func) == "function", "bad argument #3 to 'hook' (function expected, got " .. type(func) .. ")")
  if not self.hooks[ev] then self.hooks[ev] = {} end
  self.hooks[ev][id] = func
end

function bootycall:unhook(ev, id)
  assert(ev, "bad argument #1 to 'unhook' (got nil)")
  assert(id, "bad argument #2 to 'unhook' (got nil)")
  if self.hooks[ev] then
    self.hooks[ev][id] = nil
  end
end

function bootycall:hookObject(obj, prefix)
  assert(type(prefix) == "string", "bad argument #2 to hookObject (string expected, got " .. type(prefix) .. ")")

  if obj.draw then b:hook("draw", prefix .. "draw", obj.draw) end
  if obj.errhand then b:hook("errhand", prefix .. "errhand", obj.errhand) end
  if obj.focus then b:hook("focus", prefix .. "focus", obj.focus) end
  if obj.keypressed then b:hook("keypressed", prefix .. "keypressed", obj.keypressed) end
  if obj.keyreleased then b:hook("keyreleased", prefix .. "keyreleased", obj.keyreleased) end
  if obj.load then b:hook("load", prefix .. "load", obj.load) end
  if obj.mousefocus then b:hook("mousefocus", prefix .. "mousefocus", obj.mousefocus) end
  if obj.mousemoved then b:hook("mousemoved", prefix .. "mousemoved", obj.mousemoved) end
  if obj.mousepressed then b:hook("mousepressed", prefix .. "mousepressed", obj.mousepressed) end
  if obj.mousereleased then b:hook("mousereleased", prefix .. "mousereleased", obj.mousereleased) end
  if obj.quit then b:hook("quit", prefix .. "quit", obj.quit) end
  if obj.resize then b:hook("resize", prefix .. "resize", obj.resize) end
  if obj.run then b:hook("run", prefix .. "run", obj.run) end
  if obj.textinput then b:hook("textinput", prefix .. "textinput", obj.textinput) end
  if obj.threaderror then b:hook("threaderror", prefix .. "threaderror", obj.threaderror) end
  if obj.update then b:hook("update", prefix .. "update", obj.update) end
  if obj.visible then b:hook("visible", prefix .. "visible", obj.visible) end
  if obj.gamepadaxis then b:hook("gamepadaxis", prefix .. "gamepadaxis", obj.gamepadaxis) end
  if obj.gamepadpressed then b:hook("gamepadpressed", prefix .. "gamepadpressed", obj.gamepadpressed) end
  if obj.gamepadreleased then b:hook("gamepadreleased", prefix .. "gamepadreleased", obj.gamepadreleased) end
  if obj.joystickadded then b:hook("joystickadded", prefix .. "joystickadded", obj.joystickadded) end
  if obj.joystickaxis then b:hook("joystickaxis", prefix .. "joystickaxis", obj.joystickaxis) end
  if obj.joystickhat then b:hook("joystickhat", prefix .. "joystickhat", obj.joystickhat) end
  if obj.joystickpressed then b:hook("joystickpressed", prefix .. "joystickpressed", obj.joystickpressed) end
  if obj.joystickreleased then b:hook("joystickreleased", prefix .. "joystickreleased", obj.joystickreleased) end
  if obj.joystickremoved then b:hook("joystickremoved", prefix .. "joystickremoved", obj.joystickremoved) end
end

function bootycall:call(ev, ...)
  if self.hooks[ev] then
    for id, f in pairs(self.hooks[ev]) do
      f(...)
    end
  end
end

return setmetatable(bootycall, { __call = bootycall.new })
