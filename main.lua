Gamestate = require "libraries.hump.gamestate"
Loveframes = require "libraries.loveframes"
require "statemenu"
require "lovedebug"

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(menu)
end

function love.update(dt)
    Loveframes.update(dt)
end

function love.draw()
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
