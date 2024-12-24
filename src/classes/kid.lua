Kid = Base:new()

function Kid:new()
  local obj = Base.new(self)

  obj.character = Character:new(
    128,
    Draw:get_offset(11),
    2,
    2,
    {
      before_happy = { 0, 2, 4 },
      happy = { 0, 2, 4 },
      idle = { 0, 2, 4 },
      possessed = { 74, 76, 78 }
    },
    4
  )
  obj.gift_index = ceil(rnd(4))

  return obj
end

function Kid:update()
  self.character:update()

  if self.character.action == "idle" then
    self.character.x += -1
  elseif self.character.action == "happy" then
    self.character.x += 3
  elseif self.character.action == "before_happy" then
    self.character.x += -1
  elseif self.character.action == "possessed" then
    self.character.x += -2
  end
end