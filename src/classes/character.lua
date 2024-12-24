Character = Base:new()

function Character:new(x, y, w, h, actions)
  local obj = Base.new(self)

  obj.action = "idle"
  obj.action_cycles = 0
  obj.actions = actions
  obj.current_sprite_index = 1
  obj.frames = 0
  obj.h = h
  obj.w = w
  obj.x = x
  obj.y = y

  return obj
end

function Character:update()
  self.frames += 1

  if self.frames % self.actions[self.action].speed == 0 then
    self.current_sprite_index += 1

    if self.current_sprite_index > #self.actions[self.action].sprites then
      self.current_sprite_index = 1
      self.action_cycles += 1
    end
  end
end

function Character:get_current_sprite()
  return self.actions[self.action].sprites[self.current_sprite_index]
end

function Character:set_action(action)
  self.action = action
  self.action_cycles = 0
  self.current_sprite_index = 1
  self.frames = 0
end