Draw = {}

function Draw:draw_map(offset)
  offset = offset or 1
  palt(0, false)
  map((offset - 1) * 16, 0, 0, 0, 16, 16)
  palt()
end

function Draw:draw_sprite(n, x, y, w, h, flip_x, flip_y)
  palt(0, false)
  palt(14, true)
  spr(n, x, y, w or 1, h or 1, flip_x, flip_y)
  palt()
end

function Draw:get_blinking_color(color_1, color_2)
  return flr(sin(time() / 0.25)) == 0 and (color_1 or 7) or (color_2 or 5)
end

function Draw:get_h_center(text)
  return 64 - (text and #tostr(text) or 0) * 2
end

function Draw:get_offset(offset)
  return (offset or 1) * 8
end

function Draw:print_text(text, x, y, color, outline_color)
  if outline_color then
    for i = -1, 1 do
      for j = -1, 2 do
        print(text, x + i, y + j, outline_color)
      end
    end
  end

  color = color or 7

  print(text, x, y, type(color) == "table" and Draw:get_blinking_color(unpack(color)) or color)
end

function Draw:print_text_block(text, x, y, max_length, color, outline_color)
  local words, line_number, line_text = split(text, " ", false), 0, ""
  max_length = max_length or 27

  for word in all(words) do
    if #line_text + 1 + #word > max_length then
      Draw:print_text(line_text, x, y + (line_number * 10), color, outline_color)
      line_number += 1
      line_text = ""
    end

    if #line_text > 0 then
      line_text = line_text .. " " .. word
    else
      line_text = word
    end
  end

  if #line_text > 0 then
    Draw:print_text(line_text, x, y + (line_number * 10), color, outline_color)
  end
end

function Draw:print_text_bouncy(text, x, y, color, outline_color)
  for i = 1, #text do
    local char, offset = sub(text, i, i), sin((time() * 2) + (i * 0.4)) * 1
    offset = flr(offset + 0.5)
    Draw:print_text(char, x + (i - 1) * 4, y + offset, color, outline_color)
  end
end