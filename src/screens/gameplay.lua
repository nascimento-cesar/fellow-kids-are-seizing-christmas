GameplayScreen = {}

function GameplayScreen:draw(gameplay)
  Draw:draw_map()
  self:draw_health(gameplay)
  self:draw_score(gameplay)
  self:draw_santa(gameplay)
  self:draw_kids(gameplay)
end

function GameplayScreen:draw_health(gameplay)
  for i = 1, gameplay.santa.health do
    Draw:draw_sprite(104, Draw:get_offset(5) + (i - 1) * 12, Draw:get_offset(14))
  end
end

function GameplayScreen:draw_kids(gameplay)
  for kid in all(gameplay.kids) do
    Draw:draw_sprite(kid.character:get_current_sprite(), kid.character.x, kid.character.y, kid.character.w, kid.character.h, true)
    Draw:draw_sprite(kid:get_gift_sprite(), kid.character.x + 4, kid.character.y - Draw:get_offset(3), 2, 2, true)
  end
end

function GameplayScreen:draw_santa(gameplay)
  Draw:draw_sprite(gameplay.santa.character:get_current_sprite(), gameplay.santa.character.x, gameplay.santa.character.y, gameplay.santa.character.w, gameplay.santa.character.h)
end

function GameplayScreen:draw_score(gameplay)
  local text = "score: " .. gameplay.score
  Draw:print_text(text, Draw:get_offset(6), Draw:get_offset(), 7, true)
end