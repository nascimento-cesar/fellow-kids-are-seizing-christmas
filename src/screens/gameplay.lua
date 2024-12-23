GameplayScreen = {}

function GameplayScreen:draw(gameplay)
  Draw:draw_map()
  self:draw_health(gameplay)
  self:draw_santa(gameplay)
  self:draw_kids(gameplay)
end

function GameplayScreen:draw_health(gameplay)
  for i = 1, gameplay.santa.health do
    Draw:draw_sprite(104, Draw:get_offset() + (i - 1) * 10, Draw:get_offset())
  end
end

function GameplayScreen:draw_kids(gameplay)
  for kid in all(gameplay.kids) do
    Draw:draw_sprite(kid:get_current_sprite(), kid.x, kid.y, kid.w, kid.h, true)
  end
end

function GameplayScreen:draw_santa(gameplay)
  Draw:draw_sprite(gameplay.santa:get_current_sprite(), gameplay.santa.x, gameplay.santa.y, gameplay.santa.w, gameplay.santa.h)
end