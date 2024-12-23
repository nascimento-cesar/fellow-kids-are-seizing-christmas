GameOverScreen = {}

function GameOverScreen:draw()
  cls(3)
  Draw:print_text_bouncy("game over screen", Draw:get_offset(), Draw:get_offset(), { 7, 6 }, 0)
end