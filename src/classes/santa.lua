Santa = Base:new()

function Santa:new()
  local obj = Base.new(self)

  obj.character = Character:new(
    Draw:get_offset(),
    Draw:get_offset(9),
    4,
    4,
    { frightened = { 200, 204 }, idle = { 192, 196 }, throwing = { 200, 204 } },
    10
  )
  obj.health = 5

  return obj
end

function Santa:update(x)
  self.character:update()
end