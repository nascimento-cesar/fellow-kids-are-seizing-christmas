StartScreen = {}

function StartScreen:draw()
  local text_1, text_2, text_3, text_4 = "fellow kids", "are seizing", "christmas", "press ❎ or 🅾️ to start"
  cls(3)

  Draw:print_text(text_1, Draw:get_h_center(text_1), Draw:get_offset(4), 7, 0)
  Draw:print_text_bouncy(text_2, Draw:get_h_center(text_2), Draw:get_offset(6), { 14, 8 }, 0)
  Draw:print_text(text_3, Draw:get_h_center(text_3), Draw:get_offset(8), 11, 0)
  Draw:print_text(text_4, Draw:get_h_center(text_4), Draw:get_offset(12), { 7, 5 }, 0)
end