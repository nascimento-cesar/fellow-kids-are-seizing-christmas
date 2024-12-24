GameplayScreen = {}

function GameplayScreen:draw(gameplay)
  Draw:draw_map()
  self:draw_health(gameplay)
  self:draw_score(gameplay)
  self:draw_gifts(gameplay)
  self:draw_santa(gameplay)
  self:draw_kids(gameplay.kids)
  self:draw_kids(gameplay.gifted_kids)
end

function GameplayScreen:draw_health(gameplay)
  for i = 1, gameplay.santa.health do
    Draw:draw_sprite(104, Draw:get_offset(5) + (i - 1) * 12, Draw:get_offset(14))
  end
end

function GameplayScreen:draw_gifts(gameplay)
  for gift in all(gameplay.gifts) do
    Draw:draw_sprite(Draw:get_gift_sprite(gift.kid.gift_index), gift.x, gift.y, 2, 2)
  end
end

function GameplayScreen:draw_kids(kids, hide_gift_requests)
  for kid in all(kids) do
    pal(4, kid.appearance.hair_color)
    pal(11, kid.appearance.shirt_color)
    pal(12, kid.appearance.pants_color)
    pal(15, kid.appearance.skin_color)

    Draw:draw_sprite(kid.character:get_current_sprite(), kid.character.x, kid.character.y, kid.character.w, kid.character.h, kid.character.action ~= "happy")

    pal()

    if not hide_gift_requests and kid.character.action ~= "happy" and kid.character.action ~= "before_happy" then
      Draw:draw_sprite(Draw:get_gift_sprite(kid.gift_index), kid.character.x + 4, kid.character.y - Draw:get_offset(4), 2, 2, true)
    end
  end
end

function GameplayScreen:draw_santa(gameplay)
  Draw:draw_sprite(gameplay.santa.character:get_current_sprite(), gameplay.santa.character.x, gameplay.santa.character.y, gameplay.santa.character.w, gameplay.santa.character.h)
end

function GameplayScreen:draw_score(gameplay)
  local text = "score: " .. gameplay.score
  Draw:print_text(text, Draw:get_offset(6), Draw:get_offset(), 7, true)
end