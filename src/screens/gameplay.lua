GameplayScreen = {}

function GameplayScreen:draw(gameplay)
  cls(2)
  Draw:print_text_bouncy("gameplay screen", Draw:get_offset(), Draw:get_offset(), { 7, 6 }, 0)
end