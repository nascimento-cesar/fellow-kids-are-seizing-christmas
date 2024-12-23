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
  obj.gift_index = ceil(rnd(4))

  return obj
end

function Kid:update(x)
  self.character:update()
  self.character.x += -1
end

function Kid:get_gift_sprite()
  return ({ 96, 98, 100, 102 })[self.gift_index]
end