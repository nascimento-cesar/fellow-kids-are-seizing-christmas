Gameplay = Base:new()

function Gameplay:new(on_game_over)
  local obj = Base.new(self)

  obj.frames = 0
  obj.kids = {}
  obj.on_game_over = on_game_over
  obj.santa = Character:new(
    0,
    Draw:get_offset(10),
    4,
    4,
    { idle = { 192, 196 }, throwing = { 200, 204 } },
    10
  )

  return obj
end

function Gameplay:update()
  self.frames += 1
  self.santa:update()
  self:spawn_kids()
  self:update_kids()
end

function Gameplay:update_kids()
  for kid in all(self.kids) do
    kid:move(-1)
    kid:update()
  end
end

function Gameplay:spawn_kids()
  if self.frames % 30 == 0 then
    add(
      self.kids, Character:new(
        128,
        Draw:get_offset(12),
        2,
        2,
        { idle = { 0, 2, 4 } },
        4
      )
    )
  end
end