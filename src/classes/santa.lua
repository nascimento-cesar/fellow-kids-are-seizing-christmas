Santa = Base:new()

function Santa:new()
  local obj = Base.new(self)

  obj.character = Character:new(
    Draw:get_offset(),
    Draw:get_offset(9),
    4,
    4,
    {
      frightened = { speed = 3, sprites = { 128, 132 } },
      idle = { speed = 10, sprites = { 192, 196 } },
      throwing = { speed = 10, sprites = { 200, 204 } }
    },
    10
  )
  obj.health = 5

  return obj
end

function Santa:update(x)
  self.character:update()

  if self.character.action == "throwing" and self.character.action_cycles >= 1 then
    self.character:set_action("idle")
  end

  if self.character.action == "frightened" and self.character.action_cycles >= 4 then
    self.character:set_action("idle")
  end
end