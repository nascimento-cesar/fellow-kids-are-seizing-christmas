GameplayScreen = {}

function GameplayScreen:draw(gameplay)
  Draw:draw_map()
  self:draw_santa(gameplay)
end

function GameplayScreen:draw_santa(gameplay)
  Draw:draw_sprite(gameplay.santa:get_current_sprite(), gameplay.santa.x, gameplay.santa.y, gameplay.santa.w, gameplay.santa.h)
end