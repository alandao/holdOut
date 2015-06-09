require "enet"
local sti = require "libraries.sti"

client = {}

function client:enter(...)
	clientPrint("Entered client state")
	Loveframes.SetState("ingame")

	map = sti.new("map/desert")
	channel = love.thread.getChannel("debug") --will contain a queue of debug messages

	--2 is the second argument in Gamestate.switch(...)
	local clientconfig = ({...})[2]
	host = enet.host_create()
	server = host:connect(clientconfig.ip .. ":" .. clientconfig.port)
end

function client:update(dt)
  --get messages from server
  if channel:peek() ~= nil then
    print(channel:pop())
  end

	local event = host:service(0.03)
	if event then
		if event.type == "connect" then
			clientPrint("Connected to " .. host:get_socket_address())
			event.peer:send("hello world")
		elseif event.type == "receive" then
			print("Client: Got message: ", event.data, event.peer)
			event.peer:send("hello world always")
		end
	end
end

function client:draw()
	map:draw()
end

function clientPrint(message)
  print("Client: " .. message)
end

