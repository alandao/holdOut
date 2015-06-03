
listenserver = {}

function listenserver:enter(...)
	--magic number. 2 is the second argument in Gamestate.Switch(...)
	--indexes do not start at 0 in this language
	local serverconfig = ({...})[2]
	
end
