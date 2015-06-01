menu = {}

function menu:enter()
	menu:CreateToolbar()
end

function menu:CreateToolbar()

	local width = love.graphics.getWidth()
	local version = 0.1
	
	local toolbar = Loveframes.Create("panel")
	toolbar:SetSize(width, 35)
	toolbar:SetPos(0, 0)
	
	local info = Loveframes.Create("text", toolbar)
	info:SetPos(5, 3)
	info:SetText({
		{color = {0, 0, 0, 255}}, 
		"HoldOut",
		{color = {129, 87, 255, 255}}, " version " ..version, 
	})
	
	menu.examplesbutton = Loveframes.Create("button", toolbar)
	menu.examplesbutton:SetPos(toolbar:GetWidth() - 105, 5)
	menu.examplesbutton:SetSize(100, 25)
	menu.examplesbutton:SetText("Connect")
	menu.examplesbutton.OnClick = function()
		-- do nothing for now
	end
	

end