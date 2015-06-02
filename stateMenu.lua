menu = {}

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
end

function menu:CreateConnectFrame()
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
	
	local textInputIP = Loveframes.Create("textinput", connectFrame)
	textInputIP:SetPos(100, 30)
	textInputIP:SetWidth(190)
	
	local textPort = Loveframes.Create("text", connectFrame)
	textPort:SetText("Port: ")
	textPort:SetPos(10, 80)
	
	local textInputPort = Loveframes.Create("textinput", connectFrame)
	textInputPort:SetPos(220, 74)
	textInputPort:SetWidth(70)
	
	--this button on click will host a server.
	local buttonConnect = Loveframes.Create("button", connectFrame)
	buttonConnect:SetPos(10, 110)
	buttonConnect:SetSize(280, 80)
	buttonConnect:SetText("Connect")
	
end

function menu:CreateHostFrame()
	local hostFrame = Loveframes.Create("frame")
	hostFrame:SetName("Host a server")
	hostFrame:SetSize(300, 140)
	hostFrame:SetDraggable(false)
	hostFrame:SetModal(true)
	hostFrame:Center()
	hostFrame:SetState("mainmenu")
	
	local textInput = Loveframes.Create("textinput", hostFrame)
	textInput:SetPos(220, 34)
	textInput:SetWidth(70)
	
	local textPort = Loveframes.Create("text", hostFrame)
	textPort:SetText("Port: ")
	textPort:SetPos(10, 40)
	
	--this button on click will host a server.
	local buttonCreateServer = Loveframes.Create("button", hostFrame)
	buttonCreateServer:SetPos(10, 70)
	buttonCreateServer:SetSize(280, 60)
	buttonCreateServer:SetText("Create Server")
	
end