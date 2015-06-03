require "enet"

client = {}

function client:enter(...)
	print("Entered client state")
	Loveframes.SetState("ingame")
	
	--2 is the second argument in Gamestate.switch(...)
	local clientconfig = ({...})[2]
	
	host = enet.host_create()
	server = host:connect(clientconfig.ip .. ":" .. clientconfig.port)
	
end

function client:update(dt)
	local event = host:service(0)
	while event do
		if event.type == "receive" then
			print("Got message: ", event.data, event.peer)
			event.peer:send( "ping" )
		elseif event.type == "connect" then
			print(event.peer " connected.")
			event.peer:send( "ping" )
		elseif event.type == "disconnect" then
			print(event.peer .. " disconnected.")
		end
		event = host:service()
	end
end
