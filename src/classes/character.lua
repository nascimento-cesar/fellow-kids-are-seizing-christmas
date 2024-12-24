Character = Base:new()

function Character:new(x, y, w, h, sprites, animation_speed)
  local obj = Base.new(self)

  obj.action = "idle"
  obj.action_cycles = 0
  obj.animation_speed = animation_speed
  obj.current_sprite_index = 1
  obj.frames = 0
  obj.h = h
  obj.sprites = sprites
  obj.w = w
  obj.x = x
  obj.y = y

  return obj
end

function Character:update()
  self.frames += 1

  if self.frames % self.animation_speed == 0 then
    self.current_sprite_index += 1

    if self.current_sprite_index > #self.sprites[self.action] then
      self.current_sprite_index = 1
      self.action_cycles += 1
    end
  end
end

function Character:get_current_sprite()
  return self.sprites[self.action][self.current_sprite_index]
end

function Character:set_action(action)
  self.action = action
  self.action_cycles = 0
  self.current_sprite_index = 1
  self.frames = 0
end