require "client"
require "listenserver"

menu = {}
--[[
	BIG TODO: ADD ERROR CHECKING FOR ALL TEXTFIELDS.
	REASON: listenServer and client will assume they
	have proper input.
--]]
function menu:enter()
	menu:CreateToolbar()
	Loveframes.SetState("mainmenu")
end

function menu:CreateToolbar()

	local width = love.graphics.getWidth()
	local version = 0.1
	
	local toolbar = Loveframes.Create("panel")
	toolbar:SetSize(width, 35)
	toolbar:SetPos(0, 0)
	toolbar:SetState("mainmenu")
	
	local info = Loveframes.Create("text", toolbar)
	info:SetPos(5, 3)
	info:SetState("mainmenu")
	info:SetText({
		{color = {0, 0, 0, 255}}, 
		"HoldOut",
		{color = {129, 87, 255, 255}}, " version " ..version, 
	})
	
	menu.buttonConnect = Loveframes.Create("button", toolbar)
	menu.buttonConnect:SetPos(toolbar:GetWidth() - 105, 5)
	menu.buttonConnect:SetSize(100, 25)
	menu.buttonConnect:SetState("mainmenu")
	menu.buttonConnect:SetText("Connect")
	menu.buttonConnect.OnClick = function()
		menu:CreateConnectFrame()
	end
	
	menu.buttonHost = Loveframes.Create("button", toolbar)
	menu.buttonHost:SetPos(toolbar:GetWidth() - 210, 5)
	menu.buttonHost:SetSize(100, 25)
	menu.buttonHost:SetState("mainmenu")
	menu.buttonHost:SetText("Host")
	menu.buttonHost.OnClick = function()
		menu:CreateHostFrame()

	end

	menu.buttonOptions = Loveframes.Create("button", toolbar)
	menu.buttonOptions:SetPos(toolbar:GetWidth()-315, 5)
	menu.buttonOptions:SetSize(100,25)
	menu.buttonOptions:SetState("mainmenu")
	menu.buttonOptions:SetText("Options")
	menu.buttonOptions.OnClick = function() menu:CreateOptionsFrame()

	end

end

function menu:CreateConnectFrame()
	local clientconfig = {}
	
	local connectFrame = Loveframes.Create("frame")
	connectFrame:SetName("Connect to server")
	connectFrame:SetSize(300, 200)
	connectFrame:SetDraggable(false)
	connectFrame:SetModal(true)
	connectFrame:Center()
	connectFrame:SetState("mainmenu")
	
	local textIP = Loveframes.Create("text", connectFrame)
	textIP:SetText("IP: ")
	textIP:SetPos(10, 36)
	
	clientconfig.ip = "localhost"
	local textInputIP = Loveframes.Create("textinput", connectFrame)
	textInputIP:SetPos(100, 30)
	textInputIP:SetWidth(190)
	textInputIP:SetText("localhost")
	textInputIP.OnFocusLost = function(object)
		clientconfig.ip = object:GetText()
	end
	
	local textPort = Loveframes.Create("text", connectFrame)
	textPort:SetText("Port: ")
	textPort:SetPos(10, 80)
	
	clientconfig.port = "27015"
	local textInputPort = Loveframes.Create("textinput", connectFrame)
	textInputPort:SetPos(220, 74)
	textInputPort:SetWidth(70)
	textInputPort:SetText("27015")
	textInputPort.OnFocusLost = function(object)
		clientconfig.port = object:GetText()
	end
  
	local buttonConnect = Loveframes.Create("button", connectFrame)
	buttonConnect:SetPos(10, 110)
	buttonConnect:SetSize(280, 80)
	buttonConnect:SetText("Connect")
	buttonConnect.OnClick = function(object)
		connectFrame:SetModal(false)
		Gamestate.switch(client, clientconfig)
	end
	
end

function menu:CreateHostFrame()
	local serverconfig = {}
	
	local hostFrame = Loveframes.Create("frame")
	hostFrame:SetName("Host a server")
	hostFrame:SetSize(300, 140)
	hostFrame:SetDraggable(false)
	hostFrame:SetModal(true)
	hostFrame:Center()
	hostFrame:SetState("mainmenu")
	
	serverconfig.port = "27015"
	local textInput = Loveframes.Create("textinput", hostFrame)
	textInput:SetPos(220, 34)
	textInput:SetWidth(70)
	textInput:SetText("27015")
	textInput.OnFocusLost = function(object)
		serverconfig.port = object:GetText()
	end
	
	local textPort = Loveframes.Create("text", hostFrame)
	textPort:SetText("Port: ")
	textPort:SetPos(10, 40)
	
	--this button on click will host a server.
	local buttonCreateServer = Loveframes.Create("button", hostFrame)
	buttonCreateServer:SetPos(10, 70)
	buttonCreateServer:SetSize(280, 60)
	buttonCreateServer:SetText("Create Server")
	buttonCreateServer.OnClick = function(object)
		hostFrame:SetModal(false)
		Gamestate.switch(listenserver, serverconfig)
	end
	
end

function menu:CreateOptionsFrame()
	local optionsFrame = Loveframes.Create("frame")
	optionsFrame:SetName("Options")
	optionsFrame:SetSize(220,140)
	optionsFrame:SetDraggable(false)
	optionsFrame:SetModal(true)
	optionsFrame:Center()
	optionsFrame:SetState("mainmenu")

	local buttonControls = Loveframes.Create("button", optionsFrame)
	buttonControls:SetPos(20,70)
	buttonControls:SetSize(80,50)
	buttonControls:SetText("Controls")
	buttonControls.OnClick = function() print("testing some control clicks")
	end

	local buttonHelp = Loveframes.Create("button", optionsFrame)
	buttonHelp:SetPos(120,70)
	buttonHelp:SetSize(80,50)
	buttonHelp:SetText("Help")

	buttonHelp.OnClick = function() print("testing help clicks")

	end

end
