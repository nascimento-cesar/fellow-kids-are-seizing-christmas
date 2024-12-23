Kid = Base:new()

function Kid:new()
  local obj = Base.new(self)

  obj.character = Character:new(
    128,
    Draw:get_offset(11),
    2,
    2,
    { idle = { 0, 2, 4 } },
    4
  )

  return obj
end

function Kid:update(x)
  self.character:update()
  self.character.x += -1
end