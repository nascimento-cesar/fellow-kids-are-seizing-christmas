Gameplay = Base:new()

function Gameplay:new(on_game_over)
  local obj = Base.new(self)

  obj.frames = 0
  obj.gifts = {}
  obj.kids = {}
  obj.happy_kids = {}
  obj.score = 0
  obj.on_game_over = on_game_over
  obj.santa = Santa:new()

  return obj
end

function Gameplay:update()
  self.frames += 1
  self.santa:update()
  self:spawn_kids()
  self:update_kids()
  self:update_gifts()
  self:check_collision()
  self:process_inputs()
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

function Gameplay:process_inputs()
  local next_kid, is_correct_key = self.kids[1]

  if not next_kid then
    return
  end

  if btnp(⬅️) then
    is_correct_key = next_kid.gift_index == 1
  elseif btnp(➡️) then
    is_correct_key = next_kid.gift_index == 2
  elseif btnp(⬆️) then
    is_correct_key = next_kid.gift_index == 3
  elseif btnp(⬇️) then
    is_correct_key = next_kid.gift_index == 4
  end

  if is_correct_key ~= nil then
    if is_correct_key then
      next_kid.character:set_action("happy")
      add(self.gifts, { gift_index = next_kid.gift_index, x = self.santa.character.x, y = self.santa.character.y })
      add(self.happy_kids, next_kid)
      del(self.kids, next_kid)
    else
      next_kid.character:set_action("possessed")
      -- self.santa.character:set_action("frightened")
    end
  end
end

function Gameplay:spawn_kids()
  if self.frames % 30 == 0 then
    add(self.kids, Kid:new())
  end
end

function Gameplay:update_gifts()
  for gift in all(self.gifts) do
    gift.x += 3
  end
end

function Gameplay:update_kids()
  for kid in all(self.kids) do
    kid:update()
  end

  for kid in all(self.happy_kids) do
    kid:update()
  end
end