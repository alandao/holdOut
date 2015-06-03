require "libraries.hump.class" -- required for LUBE
require "libraries.LUBE"
require "libraries.Binary"

client = {}

function client:enter(...)
	print("Entered client state")
--[[
	Loveframes.SetState("ingame")
	--magic number. 2 is the second argument in Gamestate.Switch(...)
	--indexes do not start at 0 in this language
	local clientconfig = ({...})[2]
	
	clientSocket = lube.udpClient()
	clientSocket:createSocket()
	clientSocket.host = clientconfig.ip
	clientSocket.port = clientconfig.port
	clientSocket.connected = true
	
	client_blob = {}
--]]

end
--[[
function client:update(dt)
	client_blob.x, client_blob.y = love.mouse.getPosition()
	
	data = client:receive() -- we're getting incoming server data.
	
	if data then
		server_blob = bin:unpack(data) -- unpack received data from string to array
	end
	
	client:send(bin:pack(client_blob)) -- pack client_blob into string and send to server

end

function client:draw()
	love.graphics.circle('line', client_blob.x, client_blob.y, 5, 10)
	if server_blob then
		love.graphics.circle('line', server_blob.x, server_blob.y, 5, 10)
	end
	
end
--]]