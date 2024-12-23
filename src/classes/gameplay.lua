Gameplay = Base:new()

function Gameplay:new(on_game_over)
  local obj = Base.new(self)

  obj.on_game_over = on_game_over
  obj.santa = Character:new(
    Draw:get_offset(),
    Draw:get_offset(10),
    4,
    4,
    { idle = { 192, 196 }, throwing = { 200, 204 } },
    10
  )

  return obj
end

function Gameplay:update()
  self.santa:update()
end