require "enet"

client = {}

function client:enter(...)
	print("Entered client state")
	Loveframes.SetState("ingame")

	--2 is the second argument in Gamestate.switch(...)
	local clientconfig = ({...})[2]

	host = enet.host_create()
	server = host:connect(clientconfig.ip .. ":" .. clientconfig.port)
	done = false

end

function client:update(dt)
	local event = host:service(100)
	if event then
		if event.type == "connect" then
			print("Connected to", event.peer)
			event.peer:send("hello world")
    elseif event.type == "receive" then
      print("Got message: ", event.data, event.peer)
      done = true
    end
	end
  if done then
    server:disconnect()
    host:flush()
    Gamestate.switch(menu)
  end
end
