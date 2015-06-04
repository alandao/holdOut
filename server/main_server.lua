require "enet"

--server is meant to be run as a thread, doesn't need any Love2d.

local port = ...

c = love.thread.getChannel("debug")
c:push("Starting server on port " .. port)

local host = enet.host_create("localhost:" .. port)

while true do
	local event = host:service(0.03)
	if event then
    if event.type == "connect" then
    end
    if event.type == "receive" then
        --c.push("Got message: " .. event.data .. event.peer)
        event.peer:send(event.data)
    end
    if event.type == "disconnect" then

    end
  end

  --do gameloop after this.
end
