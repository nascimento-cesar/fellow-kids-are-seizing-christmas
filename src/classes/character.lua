Character = Base:new()

function Character:new(x, y, w, h, sprites, animation_speed)
  local obj = Base.new(self)

  obj.animation_speed = animation_speed
  obj.current_action = "idle"
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

    if self.current_sprite_index > #self.sprites[self.current_action] then
      self.current_sprite_index = 1
    end
  end
end

function Character:get_current_sprite()
  return self.sprites[self.current_action][self.current_sprite_index]
end

function Character:move(x)
  self.x += x
end