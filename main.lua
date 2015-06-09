Gamestate = require "libraries.hump.gamestate"
Loveframes = require "libraries.loveframes"
require "statemenu"
require "lovedebug"
local sti = require "libraries.sti"

function love.load()
	loadMap = false
	map = sti.new("map/desert")
    Gamestate.registerEvents()
    Gamestate.switch(menu)
end

function love.update(dt)
	if loadMap then 
	map:update(dt)
	end
    Loveframes.update(dt)
end

function love.draw()
	if loadMap then
	map:draw()
	end
    Loveframes.draw()
end

function love.mousepressed(x, y, button)
    Loveframes.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
    Loveframes.mousereleased(x, y, button)
end

function love.keypressed(key, unicode)
    Loveframes.keypressed(key, unicode)
end

function love.keyreleased(key)
    Loveframes.keyreleased(key)
end

function love.textinput(text)
	Loveframes.textinput(text)
end

function love.threaderror(thread, errorstr)
  print("Server error!\n" .. errorstr)
end
