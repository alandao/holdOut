Gamestate = require "libraries.hump.gamestate"
Loveframes = require("libraries.loveframes")
require("stateMenu")



function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(menu)
end

function love.update(dt)

    -- your code

    Loveframes.update(dt)

end

function love.draw()

    -- your code

    Loveframes.draw()

end

function love.mousepressed(x, y, button)

    -- your code

    Loveframes.mousepressed(x, y, button)

end

function love.mousereleased(x, y, button)

    -- your code

    Loveframes.mousereleased(x, y, button)

end

function love.keypressed(key, unicode)

    -- your code

    Loveframes.keypressed(key, unicode)

end

function love.keyreleased(key)

    -- your code

    Loveframes.keyreleased(key)

end

function love.textinput(text)
	Loveframes.textinput(text)
end