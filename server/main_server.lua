require "enet"

--server is meant to be run as a thread, doesn't need any Love2d.

local host = enet.host_create"localhost:27015"

while true do
	local event = host:service(100)
	if event and event.type == "receive" then
		print("Got message: ", event.data, event.peer)
		event.peer:send(event.data)
	end
end
