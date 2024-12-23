Gameplay = Base:new()

function Gameplay:new(on_game_over)
  local obj = Base.new(self)

  obj.on_game_over = on_game_over

  return obj
end

function Gameplay:update()
  if btnp(❎) or btnp(🅾️) then
    self.on_game_over()
  end
end