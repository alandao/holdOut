server = require "server"
client = require "client"

listenserver = {}

function listenserver:enter(...)
	Loveframes.SetState("ingame")
	--magic number. 2 is the second argument in Gamestate.Switch(...)
	--indexes do not start at 0 in this language
	local serverconfig = ({...})[2]
	
end
