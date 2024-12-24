GameOverScreen = {}

function GameOverScreen:draw(game)
  local text_1, text_2, text_3, text_4 = "game over", "presented kids: " .. game.gameplay.score, "new high score!", "press ❎ or 🅾️ to try again"
  cls(3)
  Draw:print_text_bouncy(text_1, Draw:get_h_center(text_1), Draw:get_offset(3), 7, 0)
  Draw:print_text(text_2, Draw:get_h_center(text_2), Draw:get_offset(5), { 7, 11 }, 0)

  if game.is_new_high_score then
    Draw:print_text(text_3, Draw:get_h_center(text_3), Draw:get_offset(7), { 14, 8 }, 0)
  end

  Draw:print_text(text_4, Draw:get_h_center(text_4) - 4, Draw:get_offset(12), { 7, 6 }, 0)
end