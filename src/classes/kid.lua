Kid = Base:new()

function Kid:new()
  local obj = Base.new(self)

  obj.character = Character:new(
    128,
    Draw:get_offset(11),
    2,
    2,
    { happy = { 74, 76, 78 }, idle = { 0, 2, 4 }, possessed = { 74, 76, 78 } },
    4
  )
  obj.gift_index = ceil(rnd(4))

  return obj
end

function Kid:update()
  self.character:update()

  if self.character.current_action == "happy" then
    self.character.x += 1
  elseif self.character.current_action == "idle" then
    self.character.x += -1
  elseif self.character.current_action == "possessed" then
    self.character.x += -2
  end
end