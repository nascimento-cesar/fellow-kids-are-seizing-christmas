function _draw()
  cls()

  if game.current_mode == "start" then
    StartScreen:draw()
  elseif game.current_mode == "gameplay" then
    GameplayScreen:draw(game.gameplay)
  elseif game.current_mode == "game_over" then
    GameOverScreen:draw(game)
  end

  Draw:print_text(debug, 0, 0, 7, 0)
end