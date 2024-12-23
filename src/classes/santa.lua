Santa = Base:new()

function Santa:new(character)
  local obj = Base.new(self)

  obj.character = character
  obj.health = 5

  return obj
end

function Santa:update(x)
  self.character:update()
end