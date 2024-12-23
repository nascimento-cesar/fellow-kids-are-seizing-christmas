StartScreen = {}

function StartScreen:draw()
  cls(1)
  Draw:print_text_bouncy("start screen", Draw:get_offset(), Draw:get_offset(), { 7, 6 }, 0)
end