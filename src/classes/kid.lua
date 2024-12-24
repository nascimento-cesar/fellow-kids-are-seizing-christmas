Kid = Base:new()

function Kid:new()
  local obj = Base.new(self)

  obj.appearance = Kid:randomize_character()
  obj.character = Character:new(
    128,
    Draw:get_offset(11),
    2,
    2,
    {
      before_happy = { speed = 4, sprites = obj.appearance.sprites },
      before_happy_possessed = { speed = 4, sprites = { 74, 76, 78 } },
      happy = { speed = 2, sprites = obj.appearance.sprites },
      idle = { speed = 4, sprites = obj.appearance.sprites },
      possessed = { speed = 2, sprites = { 74, 76, 78 } }
    },
    4
  )
  obj.gift_index = ceil(rnd(4))

  return obj
end

function Kid:randomize_character()
  local hair_color = ({ 0, 2, 3, 4, 9, 13 })[ceil(rnd(6))]
  local clothes_color_options = { 0, 1, 2, 3, 5, 6, 7, 9, 10, 11, 12, 13, 14 }
  local sprites = ({
    [1] = { 0, 2, 4 },
    [2] = { 6, 8, 10 },
    [3] = { 12, 14, 32 },
    [4] = { 34, 36, 38 },
    [5] = { 40, 42, 44 },
    [6] = { 46, 64, 66 },
    [7] = { 68, 70, 72 }
  })[ceil(rnd(7))]

  return {
    hair_color = hair_color,
    pants_color = clothes_color_options[ceil(rnd(#clothes_color_options))],
    skin_color = ceil(rnd(2)) == 1 and 15 or (hair_color == 4 and 15 or 4),
    sprites = sprites,
    shirt_color = clothes_color_options[ceil(rnd(#clothes_color_options))]
  }
end

function Kid:update()
  self.character:update()

  if self.character.action == "idle" then
    self.character.x += -1
  elseif self.character.action == "happy" then
    self.character.x += 3
  elseif self.character.action == "before_happy" or self.character.action == "before_happy_possessed" then
    self.character.x += -1
  elseif self.character.action == "possessed" then
    self.character.x += -2.5
  end
end