Game = Base:new()

function Game:new()
  local obj = Base.new(self)

  obj.current_mode = "start"
  obj.gameplay = nil
  obj.gameplay_history = {}

  return obj
end

function Game:update()
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
    self.current_mode = "gameplay"
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