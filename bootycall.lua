local attachment = {}

function attachment:new(env)
  env = env or love

  local a = setmetatable({}, { __index = attachment })
  a.attachs = {}

  if env.draw then a:attach("draw", env.draw) end
  if env.errhand then a:attach("errhand", env.errhand) end
  if env.focus then a:attach("focus", env.focus) end
  if env.keypressed then a:attach("keypressed", env.keypressed) end
  if env.keyreleased then a:attach("keyreleased", env.keyreleased) end
  if env.load then a:attach("load", env.load) end
  if env.mousefocus then a:attach("mousefocus", env.mousefocus) end
  if env.mousemoved then a:attach("mousemoved", env.mousemoved) end
  if env.mousepressed then a:attach("mousepressed", env.mousepressed) end
  if env.mousereleased then a:attach("mousereleased", env.mousereleased) end
  if env.quit then a:attach("quit", env.quit) end
  if env.resize then a:attach("resize", env.resize) end
  if env.run then a:attach("run", env.run) end
  if env.textinput then a:attach("textinput", env.textinput) end
  if env.threaderror then a:attach("threaderror", env.threaderror) end
  if env.update then a:attach("update", env.update) end
  if env.visible then a:attach("visible", env.visible) end
  if env.gamepadaxis then a:attach("gamepadaxis", env.gamepadaxis) end
  if env.gamepadpressed then a:attach("gamepadpressed", env.gamepadpressed) end
  if env.gamepadreleased then a:attach("gamepadreleased", env.gamepadreleased) end
  if env.joystickadded then a:attach("joystickadded", env.joystickadded) end
  if env.joystickaxis then a:attach("joystickaxis", env.joystickaxis) end
  if env.joystickhat then a:attach("joystickhat", env.joystickhat) end
  if env.joystickpressed then a:attach("joystickpressed", env.joystickpressed) end
  if env.joystickreleased then a:attach("joystickreleased", env.joystickreleased) end
  if env.joystickremoved then a:attach("joystickremoved", env.joystickremoved) end

  env.draw = function(...) a:call("draw", ...) end
  env.errhand = function(...) a:call("errhand", ...) end
  env.focus = function(...) a:call("focus", ...) end
  env.keypressed = function(...) a:call("keypressed", ...) end
  env.keyreleased = function(...) a:call("keyreleased", ...) end
  env.load = function(...) a:call("load", ...) end
  env.mousefocus = function(...) a:call("mousefocus", ...) end
  env.mousemoved = function(...) a:call("mousemoved", ...) end
  env.mousepressed = function(...) a:call("mousepressed", ...) end
  env.mousereleased = function(...) a:call("mousereleased", ...) end
  env.quit = function(...) a:call("quit", ...) end
  env.resize = function(...) a:call("resize", ...) end
  env.run = function(...) a:call("run", ...) end
  env.textinput = function(...) a:call("textinput", ...) end
  env.threaderror = function(...) a:call("threaderror", ...) end
  env.update = function(...) a:call("update", ...) end
  env.visible = function(...) a:call("visible", ...) end
  env.gamepadaxis = function(...) a:call("gamepadaxis", ...) end
  env.gamepadpressed = function(...) a:call("gamepadpressed", ...) end
  env.gamepadreleased = function(...) a:call("gamepadreleased", ...) end
  env.joystickadded = function(...) a:call("joystickadded", ...) end
  env.joystickaxis = function(...) a:call("joystickaxis", ...) end
  env.joystickhat = function(...) a:call("joystickhat", ...) end
  env.joystickpressed = function(...) a:call("joystickpressed", ...) end
  env.joystickreleased = function(...) a:call("joystickreleased", ...) end
  env.joystickremoved = function(...) a:call("joystickremoved", ...) end

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
  assert(id ~= nil, "bad argument #2 to 'unattach' (got nil)")
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

  if obj.draw then a:attach("draw", obj.draw) end
  if obj.errhand then a:attach("errhand", obj.errhand) end
  if obj.focus then a:attach("focus", obj.focus) end
  if obj.keypressed then a:attach("keypressed", obj.keypressed) end
  if obj.keyreleased then a:attach("keyreleased", obj.keyreleased) end
  if obj.load then a:attach("load", obj.load) end
  if obj.mousefocus then a:attach("mousefocus", obj.mousefocus) end
  if obj.mousemoved then a:attach("mousemoved", obj.mousemoved) end
  if obj.mousepressed then a:attach("mousepressed", obj.mousepressed) end
  if obj.mousereleased then a:attach("mousereleased", obj.mousereleased) end
  if obj.quit then a:attach("quit", obj.quit) end
  if obj.resize then a:attach("resize", obj.resize) end
  if obj.run then a:attach("run", obj.run) end
  if obj.textinput then a:attach("textinput", obj.textinput) end
  if obj.threaderror then a:attach("threaderror", obj.threaderror) end
  if obj.update then a:attach("update", obj.update) end
  if obj.visible then a:attach("visible", obj.visible) end
  if obj.gamepadaxis then a:attach("gamepadaxis", obj.gamepadaxis) end
  if obj.gamepadpressed then a:attach("gamepadpressed", obj.gamepadpressed) end
  if obj.gamepadreleased then a:attach("gamepadreleased", obj.gamepadreleased) end
  if obj.joystickadded then a:attach("joystickadded", obj.joystickadded) end
  if obj.joystickaxis then a:attach("joystickaxis", obj.joystickaxis) end
  if obj.joystickhat then a:attach("joystickhat", obj.joystickhat) end
  if obj.joystickpressed then a:attach("joystickpressed", obj.joystickpressed) end
  if obj.joystickreleased then a:attach("joystickreleased", obj.joystickreleased) end
  if obj.joystickremoved then a:attach("joystickremoved", obj.joystickremoved) end
end

function attachment:call(ev, ...)
  if self.attachs[ev] then
    for id, f in ipairs(self.attachs[ev]) do
      f(...)
    end
  end
end

return setmetatable(attachment, { __call = attachment.new })
