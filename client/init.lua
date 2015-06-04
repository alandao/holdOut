require "enet"

client = {}

function client:enter(...)
	print("Entered client state")
	Loveframes.SetState("ingame")

  channel = love.thread.getChannel("debug") --will contain a queue of debug messages

	--2 is the second argument in Gamestate.switch(...)
	local clientconfig = ({...})[2]
	host = enet.host_create()
	server = host:connect(clientconfig.ip .. ":" .. clientconfig.port)

end

function client:update(dt)
	local event = host:service(0.03)
  print(channel:pop())
	if event then
		if event.type == "connect" then
      print("Connected to", event.peer)
			event.peer:send("hello world")
    elseif event.type == "receive" then
      print("Got message: ", event.data, event.peer)
      event.peer:send("hello world always")
    end
	end
end
