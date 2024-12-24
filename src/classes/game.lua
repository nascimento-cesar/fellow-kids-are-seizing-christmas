Game = Base:new()

function Game:new()
  local obj = Base.new(self)

  obj.current_mode = "start"
  obj.frames = 0
  obj.gameplay = nil
  obj.gameplay_history = {}
  obj.start_screen = {
    kids = {}
  }

  return obj
end

function Game:update()
  self.frames += 1

  if self.current_mode == "start" then
    self:on_start()
  elseif self.current_mode == "gameplay" then
    self:on_gameplay()
  elseif self.current_mode == "game_over" then
    self:on_game_over()
  end
end

function Game:on_start()
  if btnp(❎) or btnp(🅾️) then
    self.gameplay = Gameplay:new(function()
      self.current_mode = "game_over"
    end)
    add(self.gameplay_history, self.gameplay)
    self.start_screen.kids = {}
    self.current_mode = "gameplay"
  end

  if self.frames == 1 or self.frames % 30 == 0 then
    add(self.start_screen.kids, Kid:new())
  end

  for kid in all(self.start_screen.kids) do
    kid.character.y = Draw:get_offset(9)
    kid:update()

    if kid.character.x < -16 then
      del(self.start_screen.kids, kid)
    end
  end
end

function Game:on_gameplay()
  self.gameplay:update()
end

function Game:on_game_over()
  if btnp(❎) or btnp(🅾️) then
    self.current_mode = "start"
  end
end