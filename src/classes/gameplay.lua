Gameplay = Base:new()

function Gameplay:new(on_game_over)
  local obj = Base.new(self)

  obj.frames = 0
  obj.kids = {}
  obj.score = 0
  obj.on_game_over = on_game_over
  obj.santa = Santa:new(Character:new(
    Draw:get_offset(),
    Draw:get_offset(9),
    4,
    4,
    { idle = { 192, 196 }, throwing = { 200, 204 } },
    10
  ))

  return obj
end

function Gameplay:update()
  self.frames += 1
  self.santa:update()
  self:spawn_kids()
  self:update_kids()
  self:check_collision()
end

function Gameplay:check_collision()
  for kid in all(self.kids) do
    if self.santa.character.x + 16 > kid.character.x then
      del(self.kids, kid)
      self.santa.health -= 1

      if self.santa.health == 0 then
        self.on_game_over()
      end
    end
  end
end

function Gameplay:spawn_kids()
  if self.frames % 30 == 0 then
    add(self.kids, Kid:new())
  end
end

function Gameplay:update_kids()
  for kid in all(self.kids) do
    kid:update()
  end
end