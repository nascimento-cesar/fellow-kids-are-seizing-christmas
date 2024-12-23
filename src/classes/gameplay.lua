Gameplay = Base:new()

function Gameplay:new(on_game_over)
  local obj = Base.new(self)

  obj.frames = 0
  obj.gifted_kids = {}
  obj.gifts = {}
  obj.kids = {}
  obj.on_game_over = on_game_over
  obj.santa = Santa:new()
  obj.score = 0

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

function Gameplay:increase_score()
  self.score += 1
end

function Gameplay:process_inputs()
  local next_kid, is_correct_key = self.kids[1]

  if not next_kid or self.santa.character.action == "frightened" then
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
      self.santa.character:set_action("throwing")
      next_kid.character:set_action(next_kid.character.action == "possessed" and "before_happy_possessed" or "before_happy")
      add(
        self.gifts, {
          frames = 0,
          kid = next_kid,
          x = self.santa.character.x + 4,
          y = self.santa.character.y - 4
        }
      )
      add(self.gifted_kids, next_kid)
      del(self.kids, next_kid)
      self:increase_score()
    else
      next_kid.character:set_action("possessed")
      self.santa.character:set_action("frightened")
    end
  end
end

function Gameplay:spawn_kids()
  local difficulty_mod = min(ceil(self.score / 5), 15)

  if self.frames % (30 - difficulty_mod) == 0 then
    add(self.kids, Kid:new())
  end
end

function Gameplay:update_gifts()
  for gift in all(self.gifts) do
    gift.frames += 1

    if gift.frames >= 5 then
      gift.x += 3

      if gift.kid.character.x < gift.x and gift.kid.character.action ~= "happy" then
        gift.kid.character:set_action("happy")
      end
    end
  end
end

function Gameplay:update_kids()
  for kid in all(self.kids) do
    kid:update()
  end

  for kid in all(self.gifted_kids) do
    kid:update()
  end
end