require "libraries.hump.class" -- required for LUBE
require "libraries.LUBE"

client = {}

function client:enter(...)
	Loveframes.SetState("ingame")
	--magic number. 2 is the second argument in Gamestate.Switch(...)
	--indexes do not start at 0 in this language
	local clientconfig = ({...})[2]
end
