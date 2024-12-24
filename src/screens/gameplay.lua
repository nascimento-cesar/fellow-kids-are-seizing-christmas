GameplayScreen = {}

function GameplayScreen:draw(gameplay)
  Draw:draw_map()
  self:draw_health(gameplay)
  self:draw_score(gameplay)
  self:draw_gifts(gameplay)
  self:draw_santa(gameplay)
  self:draw_kids(gameplay.kids)
  self:draw_kids(gameplay.gifted_kids, true)
  self:draw_next_gift(gameplay)
end

function GameplayScreen:draw_gifts(gameplay)
  for gift in all(gameplay.gifts) do
    Draw:draw_sprite(Draw:get_gift_sprite(gift.kid.gift_index), gift.x, gift.y, 2, 2)
  end
end

function GameplayScreen:draw_health(gameplay)
  for i = 1, gameplay.santa.health do
    Draw:draw_sprite(104, Draw:get_offset(9) + (i - 1) * 10, Draw:get_offset(1))
  end
end

function GameplayScreen:draw_kids(kids, draw_hearts)
  for kid in all(kids) do
    pal(4, kid.appearance.hair_color)
    pal(11, kid.appearance.shirt_color)
    pal(12, kid.appearance.pants_color)
    pal(15, kid.appearance.skin_color)
    Draw:draw_sprite(kid.character:get_current_sprite(), kid.character.x, kid.character.y, kid.character.w, kid.character.h, kid.character.action ~= "happy")
    pal()

    if draw_hearts and kid.character.action == "happy" then
      Draw:draw_sprite(105, kid.character.x + 2, kid.character.y - 6)
    end
  end
end

function GameplayScreen:draw_next_gift(gameplay)
  local next_kid = gameplay.kids[1]

  if next_kid then
    local gift_params = ({
      { "⬅️", 4 },
      { "➡️", 8 },
      { "⬆️", 10 },
      { "⬇️", 3 }
    })[next_kid.gift_index]

    Draw:draw_sprite(Draw:get_gift_sprite(next_kid.gift_index), next_kid.character.x - 6, gameplay.santa.character.y - 4, 2, 2)
    Draw:print_text(gift_params[1], next_kid.character.x + 12, gameplay.santa.character.y + 4, gift_params[2], 0)
  end
end

function GameplayScreen:draw_santa(gameplay)
  local is_frightened = gameplay.santa.character.action == "frightened"
  Draw:draw_sprite(gameplay.santa.character:get_current_sprite(), gameplay.santa.character.x - (is_frightened and 6 or 0), gameplay.santa.character.y, gameplay.santa.character.w, gameplay.santa.character.h)
end

function GameplayScreen:draw_score(gameplay)
  local text = "score: " .. gameplay.score
  Draw:print_text(text, Draw:get_offset(1), Draw:get_offset(), 7, true)
end