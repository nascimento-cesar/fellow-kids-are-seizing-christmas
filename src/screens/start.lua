StartScreen = {}

function StartScreen:draw(game)
  local text_1, text_2, text_3, text_4 = "fellow kids", "are seizing", "christmas", "press ❎ or 🅾️ to start"
  cls(3)

  Draw:print_text(text_1, Draw:get_h_center(text_1), Draw:get_offset(3), 7, 0)
  Draw:print_text_bouncy(text_2, Draw:get_h_center(text_2), Draw:get_offset(5), { 14, 8 }, 0)
  Draw:print_text(text_3, Draw:get_h_center(text_3), Draw:get_offset(7), 11, 0)
  Draw:print_text(text_4, Draw:get_h_center(text_4) - 4, Draw:get_offset(12), { 7, 6 }, 0)
  GameplayScreen:draw_kids(game.start_screen.kids)
end