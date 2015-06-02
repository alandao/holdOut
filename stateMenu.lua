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
	connectFrame:SetSize(500, 180)
	connectFrame:SetDraggable(false)
	connectFrame:SetModal(true)
	connectFrame:Center()
	connectFrame:SetState("mainmenu")
	--TODO, write GUI for the rest of the frame.
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
	textInput:SetPos(190, 30)
	textInput:SetWidth(100)
	textInput.onEnter = function(object)
		--object is the string thing inside the textInput box.
		--TODO: host a server when this function is called.
	end
	textInput:SetFont(love.graphics.newFont(12))
	
	local textPort = Loveframes.Create("text", hostFrame)
	textPort:SetText("Port: ")
	textPort:SetPos(10, 36)
	
	local buttonCreateServer = Loveframes.Create("button", hostFrame)
	buttonCreateServer:SetPos(10, 70)
	buttonCreateServer:SetSize(280, 60)
	buttonCreateServer:SetText("Create Server")
	
end