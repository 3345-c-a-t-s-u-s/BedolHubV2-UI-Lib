--[[
DD

Dsa Clomax


฿฿฿฿฿฿฿฿		฿฿฿฿฿฿฿฿฿	฿฿฿฿	฿฿		฿฿฿฿฿	  ฿
฿	   ฿ 	฿			฿	  ฿ 		฿	฿	  ฿
฿	   ฿    ฿          	฿	  ฿		฿	฿	  ฿
฿฿฿฿฿฿฿		฿฿฿฿฿฿฿฿฿	฿	  ฿		฿	฿	  ฿
฿	   ฿		฿			฿	  ฿		฿	฿	  ฿
฿	   ฿    ฿			฿	  ฿		฿	฿	  ฿
฿฿฿฿฿฿฿		฿฿฿฿฿฿฿฿฿	฿฿฿฿	฿฿	 	 ฿฿฿		  ฿฿฿฿฿฿฿

- [You Can't Obf this is Code] -

   -- [UI Make By Bedol Hub] --
   - Who Copy code and send msg "CAT SUS is not onwer of ui" = YOU DIED
   - the spectre music
]]

local SubObf : string = [[
Lost in your mind, I wanna know
Am I losin' my mind?
Never let me go
If this night is not forever
At least we are together
I know I'm not alone
I know I'm not alone
Anywhere, whenever
Apart but still together
I know I'm not alone
I know I'm not alone
I know I'm not alone
I know I'm not alone
Unconscious mind
I'm wide awake
Wanna feel one last time
Take my pain away
If this night is not forever
At least we are together
I know I'm not alone
I know I'm not alone
Anywhere, whenever
Apart but still together
I know I'm not alone
I know I'm not alone
I know I'm not alone
I know I'm not alone
I'm not alone
I'm not alone
I'm not alone (I know I'm not alone)
I'm not alone
I'm not alone
I'm not alone (I know I'm not alone)
]]

_G[SubObf] = "Bedol Hub UI Are Running"

local BEDOL_HUB_HUI = {};
local Services = {};

function Services:CreateTween(target:Instance|unknown,info:TweenInfo,values:{string:string,ValueBase:ValueBase})
	info = info or TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In);
	if not target[tostring(values[1])] then
		values[1] = typeof(values[1]);
	end

	return game:GetService('TweenService'):Create(target,info,{[tostring(values[1])] = values[2]});
end

function Services:TweenCheck(Object:Instance,Name:string,Target:ValueBase)
	if Object then
		if Object[Name] == Target then
			return true
		else
			return false,tostring(Object[Name])
		end
	end
	return false
end

function Services:InputFrame(Frame : GuiObject,callback:func,Type:string)
	Type = (Type or "Click"):lower()
	if Type == tostring("click") then
		return Frame.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				callback()
				return
			end
		end)
	end
	if Type == tostring("toggle") then
		Frame.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				callback(true)
			end
		end)
		Frame.InputEnded:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				callback(false)
			end
		end)
		return
	end
end

Services.User = game:GetService('Players').LocalPlayer;
Services.UserInput = game:GetService('UserInputService');
Services.Tween = game:GetService('TweenService');
Services.Run = game:GetService('RunService');
Services.Mouse = Services.User:GetMouse();
Services.CoreGui = game:FindFirstChild('CoreGui') or Services.User.PlayerGui

local function CreateButtonUI()
	local TextButton = Instance.new("TextButton")

	TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.BackgroundTransparency = 1.000
	TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.BorderSizePixel = 0
	TextButton.ClipsDescendants = true
	TextButton.Size = UDim2.new(1, 0, 1, 0)
	TextButton.ZIndex = 100
	TextButton.Font = Enum.Font.SourceSans
	TextButton.Text = ""
	TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.TextScaled = true
	TextButton.TextSize = 14.000
	TextButton.TextTransparency = 1.000
	TextButton.TextWrapped = true

	return TextButton
end

local function CalculateDistance(pointA, pointB)
	return math.sqrt(((pointB.X - pointA.X) ^ 2) + ((pointB.Y - pointA.Y) ^ 2))
end

function Create_Ripple(Parent : Frame)
	Parent.ClipsDescendants = true
	local ripple = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")

	ripple.Active = false
	ripple.Name = "ripple"
	ripple.Parent = Parent
	ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ripple.ZIndex = Parent.ZIndex or 7
	ripple.AnchorPoint = Vector2.new(0.5, 0.5)
	ripple.Size = UDim2.new(0,0,0,0)
	ripple.SizeConstraint = Enum.SizeConstraint.RelativeYY

	UICorner.CornerRadius = UDim.new(0.25, 0)
	UICorner.Parent = ripple

	local buttonAbsoluteSize = Parent.AbsoluteSize
	local buttonAbsolutePosition = Parent.AbsolutePosition

	local mouseAbsolutePosition = Vector2.new(Services.Mouse.X, Services.Mouse.Y)
	local mouseRelativePosition = (mouseAbsolutePosition - buttonAbsolutePosition)

	ripple.BackgroundTransparency = 0.84
	ripple.Position = UDim2.new(0, mouseRelativePosition.X, 0, mouseRelativePosition.Y)
	ripple.Parent = Parent

	local topLeft = CalculateDistance(mouseRelativePosition, Vector2.new(0, 0))
	local topRight = CalculateDistance(mouseRelativePosition, Vector2.new(buttonAbsoluteSize.X, 0))
	local bottomRight = CalculateDistance(mouseRelativePosition, buttonAbsoluteSize)
	local bottomLeft = CalculateDistance(mouseRelativePosition, Vector2.new(0, buttonAbsoluteSize.Y))

	local Size_UP = UDim2.new(50,0,50,0)
	Services.Tween:Create(ripple,TweenInfo.new(2),{Size = Size_UP,BackgroundTransparency = 1}):Play()
	game:GetService('Debris'):AddItem(ripple,2.2)
end

local function GShaodw(Parent : GuiObject)
	local ImageLabel = Instance.new("ImageLabel")

	ImageLabel.Parent = Parent
	ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel.Size = UDim2.new(1.04999995, 0, 1.14999998, 0)
	ImageLabel.Image = "rbxassetid://7912134082"
	ImageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
	
	ImageLabel.ZIndex = 7
	
	return ImageLabel
end

function BEDOL_HUB_HUI:CreateWindow(WindowName:string)
	if not WindowName then
		warn(_G[SubObf])
		WindowName = "Unknow Window [Name]"
	end
	local GWindow = {}
	local TabCollections = {}
	local ToggleKey = Enum.KeyCode.X
	local OnUserMove = true
	local RestoreBoole = true
	local BedolHubV2 = Instance.new("ScreenGui")
	local Header = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local HeadButtons = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local Restore = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")
	local Close = Instance.new("TextButton")
	local UICorner_4 = Instance.new("UICorner")
	local Clip = Instance.new("Frame")
	local UIStroke_2 = Instance.new("UIStroke")
	local UICorner_5 = Instance.new("UICorner")
	local Main = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local ImageLabel = Instance.new("ImageLabel")
	local TabList = Instance.new("Frame")
	local ImageLabel_2 = Instance.new("ImageLabel")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local UICorner_7 = Instance.new("UICorner")
	
	
	GWindow.UIAspect = 6

	UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		Services:CreateTween(ScrollingFrame,nil,{"CanvasSize",UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)}):Play()
	end)

	BedolHubV2.Name = "{"..tostring(math.random(-100,100))..tostring(math.random(-100,100))..tostring(math.random(-100,100))..tostring(math.random(-100,100)).."}"
	BedolHubV2.Parent = Services.CoreGui
	BedolHubV2.IgnoreGuiInset = true
	BedolHubV2.ZIndexBehavior = Enum.ZIndexBehavior.Global
	BedolHubV2.ResetOnSpawn = false

	Header.Name = "Header"
	Header.Parent = BedolHubV2
	Header.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Header.BorderSizePixel = 0
	Header.Position = UDim2.new(0.294830412, 0, 0.268342406, 0)
	Header.Size = UDim2.new(0.409999967, 0, 0.0388043858, 0)
	Header.ZIndex = 5

	UICorner.CornerRadius = UDim.new(0, 6)
	UICorner.Parent = Header

	Title.Name = "Title"
	Title.Parent = Header
	Title.AnchorPoint = Vector2.new(0.100000001, 0.5)
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.0900000036, 0, 0.5, 0)
	Title.Size = UDim2.new(0.699999988, 0, 0.800000012, 0)
	Title.ZIndex = 20
	Title.Font = Enum.Font.GothamMedium
	Title.Text = WindowName or "Bedol Hub V2"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextWrapped = true
	Title.TextXAlignment = Enum.TextXAlignment.Left

	HeadButtons.Name = "HeadButtons"
	HeadButtons.Parent = Header
	HeadButtons.AnchorPoint = Vector2.new(0, 0.5)
	HeadButtons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HeadButtons.BackgroundTransparency = 1.000
	HeadButtons.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HeadButtons.BorderSizePixel = 0
	HeadButtons.ClipsDescendants = true
	HeadButtons.Position = UDim2.new(0.882224023, 0, 0.5, 0)
	HeadButtons.Size = UDim2.new(1.79999995, 0, 0.699999988, 0)
	HeadButtons.SizeConstraint = Enum.SizeConstraint.RelativeYY
	HeadButtons.ZIndex = 5

	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = HeadButtons

	UIStroke.Thickness = 1.600
	UIStroke.Transparency = 0.650
	UIStroke.Color = Color3.fromRGB(255, 255, 255)
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Parent = HeadButtons

	Restore.Name = "Restore"
	Restore.Parent = HeadButtons
	Restore.AnchorPoint = Vector2.new(0, 0.5)
	Restore.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Restore.BackgroundTransparency = 1.000
	Restore.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Restore.BorderSizePixel = 0
	Restore.Position = UDim2.new(0.0500000007, 0, 0.5, 0)
	Restore.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
	Restore.SizeConstraint = Enum.SizeConstraint.RelativeYY
	Restore.ZIndex = 15
	Restore.Font = Enum.Font.GothamBold
	Restore.Text = "-"
	Restore.TextColor3 = Color3.fromRGB(255, 255, 255)
	Restore.TextScaled = true
	Restore.TextSize = 14.000
	Restore.TextWrapped = true

	UICorner_3.CornerRadius = UDim.new(0, 5)
	UICorner_3.Parent = Restore

	Close.Name = "Close"
	Close.Parent = HeadButtons
	Close.AnchorPoint = Vector2.new(0, 0.5)
	Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Close.BackgroundTransparency = 1.000
	Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Close.BorderSizePixel = 0
	Close.Position = UDim2.new(0.600000024, 0, 0.5, 0)
	Close.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
	Close.SizeConstraint = Enum.SizeConstraint.RelativeYY
	Close.ZIndex = 15
	Close.Font = Enum.Font.GothamBold
	Close.Text = "X"
	Close.TextColor3 = Color3.fromRGB(255, 255, 255)
	Close.TextScaled = true
	Close.TextSize = 14.000
	Close.TextWrapped = true

	UICorner_4.CornerRadius = UDim.new(0, 5)
	UICorner_4.Parent = Close

	Clip.Name = "Clip"
	Clip.Parent = HeadButtons
	Clip.AnchorPoint = Vector2.new(0, 0.5)
	Clip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Clip.BackgroundTransparency = 1.000
	Clip.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Clip.BorderSizePixel = 0
	Clip.Position = UDim2.new(0.479999989, 0, 0.5, 0)
	Clip.Size = UDim2.new(9.99999975e-05, 0, 1.10000002, 0)
	Clip.ZIndex = 15

	UIStroke_2.Thickness = 1.600
	UIStroke_2.Transparency = 0.650
	UIStroke_2.Color = Color3.fromRGB(255, 255, 255)
	UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke_2.Parent = Clip

	UICorner_5.CornerRadius = UDim.new(0, 5)
	UICorner_5.Parent = Clip

	Main.Name = "Main"
	Main.Parent = Header
	Main.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0, 0, 0.0875349268, 0)
	Main.Size = UDim2.new(1, 0, 11, 0)
	Main.ZIndex = 2

	UICorner_6.CornerRadius = UDim.new(0, 6)
	UICorner_6.Parent = Main

	ImageLabel.Parent = Main
	ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel.Size = UDim2.new(1.10000002, 0, 1.10000002, 0)
	ImageLabel.ZIndex = -5
	ImageLabel.Image = "rbxassetid://7912134082"
	ImageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)

	TabList.Name = "TabList"
	TabList.Parent = Main
	TabList.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
	TabList.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabList.BorderSizePixel = 0
	TabList.Position = UDim2.new(0.01970133, 0, 0.119365811, 0)
	TabList.Size = UDim2.new(0.200000018, 0, 0.843767583, 0)
	TabList.ZIndex = 3

	ImageLabel_2.Parent = TabList
	ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel_2.BackgroundTransparency = 1.000
	ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel_2.BorderSizePixel = 0
	ImageLabel_2.Position = UDim2.new(0.549738169, 0, 0.5, 0)
	ImageLabel_2.Size = UDim2.new(1.09947634, 0, 1.10000002, 0)
	ImageLabel_2.ZIndex = 2
	ImageLabel_2.Image = "rbxassetid://7912134082"
	ImageLabel_2.ImageColor3 = Color3.fromRGB(0, 0, 0)

	ScrollingFrame.Parent = TabList
	ScrollingFrame.Active = true
	ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	ScrollingFrame.Size = UDim2.new(0.949999988, 0, 0.949999988, 0)
	ScrollingFrame.ZIndex = 4
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollingFrame.ScrollBarThickness = 1

	UIListLayout.Parent = ScrollingFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	UICorner_7.CornerRadius = UDim.new(0, 6)
	UICorner_7.Parent = TabList

	function GWindow:NewTab(TabName:string)
		local GTab = {}
		local TabButton = Instance.new("Frame")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local MoveMent = Instance.new("UIScale")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local Button = Instance.new("TextButton")

		TabButton.Name = "TabButton"
		TabButton.Parent = ScrollingFrame
		TabButton.BackgroundColor3 = Color3.fromRGB(71, 71, 71)
		TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabButton.BorderSizePixel = 0
		TabButton.Size = UDim2.new(0.949999988, 0, 0.100000001, 0)
		TabButton.ZIndex = 5

		UIAspectRatioConstraint.Parent = TabButton
		UIAspectRatioConstraint.AspectRatio = 3.000
		UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

		MoveMent.Name = "MoveMent"
		MoveMent.Parent = TabButton
		MoveMent.Scale = 0.950

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = TabButton

		UIStroke.Thickness = 2.000
		UIStroke.Transparency = 0.900
		UIStroke.Color = Color3.fromRGB(255, 255, 255)
		UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		UIStroke.Parent = TabButton

		Button.Name = "Button"
		Button.Parent = TabButton
		Button.AnchorPoint = Vector2.new(0.5, 0.5)
		Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button.BackgroundTransparency = 1.000
		Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button.BorderSizePixel = 0
		Button.Position = UDim2.new(0.5, 0, 0.5, 0)
		Button.Size = UDim2.new(0.949999988, 0, 0.800000012, 0)
		Button.ZIndex = 6
		Button.Font = Enum.Font.SourceSansSemibold
		Button.Text = tostring(TabName) or "Tab"
		Button.TextColor3 = Color3.fromRGB(255, 255, 255)
		Button.TextScaled = true
		Button.TextSize = 14.000
		Button.TextTransparency = 0.200
		Button.TextWrapped = true
		Button.TextXAlignment = Enum.TextXAlignment.Left

		local TabFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local ImageLabel = Instance.new("ImageLabel")
		local TabCollectAsset = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")

		UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			Services:CreateTween(TabCollectAsset,nil,{"CanvasSize",UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)}):Play()
		end)

		TabFrame.Name = "TabFrame"
		TabFrame.Parent = Main
		TabFrame.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
		TabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabFrame.BorderSizePixel = 0
		TabFrame.Position = UDim2.new(0.268000007, 0, 0.119000003, 0)
		TabFrame.Size = UDim2.new(0.708999991, 0, 0.843999982, 0)
		TabFrame.ZIndex = 5

		UICorner.CornerRadius = UDim.new(0, 6)
		UICorner.Parent = TabFrame

		ImageLabel.Parent = TabFrame
		ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageLabel.BackgroundTransparency = 1.000
		ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel.BorderSizePixel = 0
		ImageLabel.Position = UDim2.new(0.479999989, 0, 0.5, 0)
		ImageLabel.Size = UDim2.new(1.10000002, 0, 1.125, 0)
		ImageLabel.ZIndex = 2
		ImageLabel.Image = "rbxassetid://7912134082"
		ImageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)

		TabCollectAsset.Name = "TabCollectAsset"
		TabCollectAsset.Parent = TabFrame
		TabCollectAsset.Active = true
		TabCollectAsset.AnchorPoint = Vector2.new(0.5, 0.5)
		TabCollectAsset.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabCollectAsset.BackgroundTransparency = 1.000
		TabCollectAsset.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabCollectAsset.BorderSizePixel = 0
		TabCollectAsset.Position = UDim2.new(0.5, 0, 0.5, 0)
		TabCollectAsset.Size = UDim2.new(0.949999988, 0, 0.949999988, 0)
		TabCollectAsset.ZIndex = 7
		TabCollectAsset.CanvasSize = UDim2.new(0, 0, 5, 0)
		TabCollectAsset.ScrollBarThickness = 1

		UIListLayout.Parent = TabCollectAsset
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)

		if #TabCollections == 0 then
			Services:CreateTween(Button,TweenInfo.new(0.5),{"TextTransparency",0}):Play()
			Services:CreateTween(MoveMent,TweenInfo.new(0.6,Enum.EasingStyle.Back),{"Scale",1}):Play()
			Services:CreateTween(UIStroke,TweenInfo.new(0.6,Enum.EasingStyle.Back),{"Transparency",0.5}):Play()
			TabFrame.Visible = true
		else
			TabFrame.Visible = false
		end

		table.insert(TabCollections,{
			TabFrame,
			TabButton,
		})

		Button.MouseEnter:Connect(function()
			Services:CreateTween(Button,TweenInfo.new(0.5),{"TextTransparency",0}):Play()
			Services:CreateTween(MoveMent,TweenInfo.new(0.6,Enum.EasingStyle.Back),{"Scale",1}):Play()
			Services:CreateTween(UIStroke,TweenInfo.new(0.6,Enum.EasingStyle.Back),{"Transparency",0.5}):Play()
		end)

		Button.MouseLeave:Connect(function()
			if not TabFrame.Visible then
				Services:CreateTween(UIStroke,TweenInfo.new(0.6,Enum.EasingStyle.Back),{"Transparency",0.9}):Play()
				Services:CreateTween(Button,TweenInfo.new(0.5),{"TextTransparency",0.2}):Play()
				Services:CreateTween(MoveMent,TweenInfo.new(0.6,Enum.EasingStyle.Back),{"Scale",0.95}):Play()
			end
		end)

		Button.MouseButton1Click:Connect(function()
			Create_Ripple(TabButton)
			for i,v in ipairs(TabCollections) do
				if v[1] == TabFrame then
					v[1].Visible = true
				else
					v[1].Visible = false
					pcall(function()
						local TargetUIStroke = v[2]:FindFirstChild('UIStroke')
						local TargetButton = v[2]:FindFirstChild('Button')
						local TargetMovement = v[2]:FindFirstChild('MoveMent')

						Services:CreateTween(TargetUIStroke,TweenInfo.new(0.6,Enum.EasingStyle.Back),{"Transparency",0.9}):Play()
						Services:CreateTween(TargetButton,TweenInfo.new(0.5),{"TextTransparency",0.2}):Play()
						Services:CreateTween(TargetMovement,TweenInfo.new(0.6,Enum.EasingStyle.Back),{"Scale",0.95}):Play()
					end)
				end
			end
		end)

		function GTab:NewTitle(TitleName:string)
			local Title = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local TitleLabel = Instance.new("TextLabel")

			Title.Name = "Title"
			Title.Parent = TabCollectAsset
			Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Title.BackgroundTransparency = 0.750
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Size = UDim2.new(0.980000019, 0, 0.5, 0)
			Title.ZIndex = 8

			UIAspectRatioConstraint.Parent = Title
			UIAspectRatioConstraint.AspectRatio = 10.000
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Title

			TitleLabel.Name = "TitleLabel"
			TitleLabel.Parent = Title
			TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.BackgroundTransparency = 1.000
			TitleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TitleLabel.BorderSizePixel = 0
			TitleLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			TitleLabel.Size = UDim2.new(0.949999988, 0, 0.649999976, 0)
			TitleLabel.ZIndex = 8
			TitleLabel.Font = Enum.Font.Arial
			TitleLabel.Text = TitleName or "Title"
			TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.TextScaled = true
			TitleLabel.TextSize = 14.000
			TitleLabel.TextWrapped = true
			TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

			local GTitle = {}
			function GTitle:Set(...)
				TitleLabel.Text = tostring(...)
				return true
			end

			return GTitle
		end

		function GTab:NewButton(ButtonName:string,callback:func)
			callback = callback or function() end
			local Button = Instance.new("Frame") GShaodw(Button)
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local TitleLabel = Instance.new("TextLabel")
			local Img = Instance.new("ImageLabel")
			local UICorner_2 = Instance.new("UICorner")
			local ButtonInput = CreateButtonUI()

			ButtonInput.Parent = Button

			Button.Name = "Button"
			Button.Parent = TabCollectAsset
			Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0.980000019, 0, 0.5, 0)
			Button.ZIndex = 8

			UIAspectRatioConstraint.Parent = Button
			UIAspectRatioConstraint.AspectRatio = GWindow.UIAspect
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Button

			TitleLabel.Name = "TitleLabel"
			TitleLabel.Parent = Button
			TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.BackgroundTransparency = 1.000
			TitleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TitleLabel.BorderSizePixel = 0
			TitleLabel.Position = UDim2.new(0.438430399, 0, 0.50000006, 0)
			TitleLabel.Size = UDim2.new(0.826860785, 0, 0.649999976, 0)
			TitleLabel.ZIndex = 8
			TitleLabel.Font = Enum.Font.GothamMedium
			TitleLabel.Text = ButtonName or "Button"
			TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.TextScaled = true
			TitleLabel.TextSize = 14.000
			TitleLabel.TextWrapped = true
			TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

			Img.Name = "Img"
			Img.Parent = Button
			Img.AnchorPoint = Vector2.new(0, 0.5)
			Img.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Img.BackgroundTransparency = 1.000
			Img.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Img.BorderSizePixel = 0
			Img.Position = UDim2.new(0.872898281, 0, 0.5, 0)
			Img.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
			Img.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Img.ZIndex = 8
			Img.Image = "rbxassetid://7734010405"
			Img.ScaleType = Enum.ScaleType.Crop

			UICorner_2.CornerRadius = UDim.new(0, 3)
			UICorner_2.Parent = Img

			ButtonInput.MouseButton1Click:Connect(function()
				Create_Ripple(Button)
				callback()
			end)

			local GButton = {}

			function GButton:Set(...)
				TitleLabel.Text = tostring(...)
			end

			return GButton;
		end

		function GTab:NewToggle(ToggleName:string,Default:boolean,callback:func)
			Default = Default or false
			callback = callback or function() end

			local Imgs = {
				['Toggle_On'] = "rbxassetid://3944680095",
				['Toggle_Off'] = "rbxassetid://10002398990"
			}

			local Toggle = Instance.new("Frame") GShaodw(Toggle)
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local TitleLabel = Instance.new("TextLabel")
			local ImgTogg = Instance.new("ImageLabel")
			local UICorner_2 = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")
			local BUTTON_INPUT = CreateButtonUI()

			BUTTON_INPUT.Parent = Toggle
			Toggle.Name = "Toggle"
			Toggle.Parent = TabCollectAsset
			Toggle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0.980000019, 0, 0.5, 0)
			Toggle.ZIndex = 8

			UIAspectRatioConstraint.Parent = Toggle
			UIAspectRatioConstraint.AspectRatio = GWindow.UIAspect
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Toggle

			TitleLabel.Name = "TitleLabel"
			TitleLabel.Parent = Toggle
			TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.BackgroundTransparency = 1.000
			TitleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TitleLabel.BorderSizePixel = 0
			TitleLabel.Position = UDim2.new(0.438430399, 0, 0.50000006, 0)
			TitleLabel.Size = UDim2.new(0.826860785, 0, 0.649999976, 0)
			TitleLabel.ZIndex = 8
			TitleLabel.Font = Enum.Font.GothamMedium
			TitleLabel.Text = ToggleName or "Toggle"
			TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.TextScaled = true
			TitleLabel.TextSize = 14.000
			TitleLabel.TextWrapped = true
			TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

			ImgTogg.Name = "ImgTogg"
			ImgTogg.Parent = Toggle
			ImgTogg.AnchorPoint = Vector2.new(0.5, 0.5)
			ImgTogg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImgTogg.BackgroundTransparency = 1.000
			ImgTogg.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImgTogg.BorderSizePixel = 0
			ImgTogg.Position = UDim2.new(0.921399534, 0, 0.5, 0)
			ImgTogg.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
			ImgTogg.SizeConstraint = Enum.SizeConstraint.RelativeYY
			ImgTogg.ZIndex = 8
			ImgTogg.Image = "rbxassetid://10002398990"
			ImgTogg.ScaleType = Enum.ScaleType.Crop

			UICorner_2.CornerRadius = UDim.new(0, 6)
			UICorner_2.Parent = ImgTogg

			UIStroke.Thickness = 2.600
			UIStroke.Transparency = 0.750
			UIStroke.Color = Color3.fromRGB(255, 255, 255)
			UIStroke.Parent = ImgTogg

			local function ToggleTo(Value)
				if Value then
					ImgTogg.Size = UDim2.new(0.1,0,0.1,0)
					ImgTogg.ImageTransparency = 0.9
					ImgTogg.Image = Imgs.Toggle_On

					Services:CreateTween(ImgTogg,TweenInfo.new(0.5,Enum.EasingStyle.Back),{"Size", UDim2.new(0.6,0,0.6,0)}):Play()
					Services:CreateTween(ImgTogg,TweenInfo.new(0.5,Enum.EasingStyle.Back),{"ImageTransparency", 0}):Play()

				else

					ImgTogg.Size = UDim2.new(0.1,0,0.1,0)
					ImgTogg.ImageTransparency = 0.9
					ImgTogg.Image = Imgs.Toggle_Off

					Services:CreateTween(ImgTogg,TweenInfo.new(0.5,Enum.EasingStyle.Back),{"Size", UDim2.new(0.6,0,0.6,0)}):Play()
					Services:CreateTween(ImgTogg,TweenInfo.new(0.5,Enum.EasingStyle.Back),{"ImageTransparency", 0}):Play()


				end
			end

			ToggleTo(Default)

			BUTTON_INPUT.MouseButton1Click:Connect(function()
				Create_Ripple(Toggle)
				Default = not Default
				ToggleTo(Default)
				callback(Default)
			end)
			local GToggle = {}

			function GToggle:Set(...)
				Default = (...) 
				ToggleTo(Default)
				callback(Default)
			end

			return GToggle;
		end

		function GTab:NewTextBox(TextBoxName:string,Desction:string,callback:func)
			callback = callback or function() end

			local TextBox = Instance.new("Frame") GShaodw(TextBox)
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local TitleLabel = Instance.new("TextLabel")
			local Input = Instance.new("TextBox")
			local UIStroke = Instance.new("UIStroke")
			local UICorner_2 = Instance.new("UICorner")

			TextBox.Name = "TextBox"
			TextBox.Parent = TabCollectAsset
			TextBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextBox.BorderSizePixel = 0
			TextBox.Size = UDim2.new(0.980000019, 0, 0.5, 0)
			TextBox.ZIndex = 8

			UIAspectRatioConstraint.Parent = TextBox
			UIAspectRatioConstraint.AspectRatio = GWindow.UIAspect
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = TextBox

			TitleLabel.Name = "TitleLabel"
			TitleLabel.Parent = TextBox
			TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.BackgroundTransparency = 1.000
			TitleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TitleLabel.BorderSizePixel = 0
			TitleLabel.Position = UDim2.new(0.336354733, 0, 0.499999791, 0)
			TitleLabel.Size = UDim2.new(0.622709394, 0, 0.649999976, 0)
			TitleLabel.ZIndex = 8
			TitleLabel.Font = Enum.Font.GothamMedium
			TitleLabel.Text = TextBoxName or "TextBox"
			TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.TextScaled = true
			TitleLabel.TextSize = 14.000
			TitleLabel.TextWrapped = true
			TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

			Input.Name = "Input"
			Input.Parent = TextBox
			Input.AnchorPoint = Vector2.new(0.5, 0.5)
			Input.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
			Input.BackgroundTransparency = 0.900
			Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Input.BorderSizePixel = 0
			Input.ClipsDescendants = true
			Input.Position = UDim2.new(0.832461715, 0, 0.5, 0)
			Input.Size = UDim2.new(0.300000012, 0, 0.5, 0)
			Input.ZIndex = 9
			Input.ClearTextOnFocus = false
			Input.Font = Enum.Font.SourceSansBold
			Input.PlaceholderText = Desction or "Input"
			Input.Text = ""
			Input.TextColor3 = Color3.fromRGB(255, 255, 255)
			Input.TextScaled = true
			Input.TextSize = 14.000
			Input.TextWrapped = true

			UIStroke.Thickness = 2.000
			UIStroke.Transparency = 0.900
			UIStroke.Color = Color3.fromRGB(255, 255, 255)
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Parent = Input

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = Input

			Services:InputFrame(Input,function()
				Create_Ripple(TextBox)
			end)

			Input.FocusLost:Connect(function()
				Create_Ripple(TextBox)
				callback(Input.Text)
			end)

			local GTBox = {}
			function GTBox:SetTitle(...)
				TitleLabel.Text = tostring(...)
			end
			function GTBox:SetDes(...)
				Input.PlaceholderText = tostring(...)
			end
			function GTBox:SetInput(...)
				Input.Text = ...
				callback(Input.Text)
			end

			return GTBox;
		end

		function GTab:NewSlider(SliderName:string,Min:number,Max:number,callback:func)
			callback = callback or function() end
			Min = Min or 1
			Max = Max or 100

			local Slider = Instance.new("Frame") GShaodw(Slider)
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local TitleLabel = Instance.new("TextLabel")
			local Front = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local Move = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local ToNumber = Instance.new("TextLabel")

			Slider.Name = "Slider"
			Slider.Parent = TabCollectAsset
			Slider.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider.BorderSizePixel = 0
			Slider.Size = UDim2.new(0.980000019, 0, 0.5, 0)
			Slider.ZIndex = 8

			UIAspectRatioConstraint.Parent = Slider
			UIAspectRatioConstraint.AspectRatio = (GWindow.UIAspect - 1.55) or 4.500
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Slider

			TitleLabel.Name = "TitleLabel"
			TitleLabel.Parent = Slider
			TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.BackgroundTransparency = 1.000
			TitleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TitleLabel.BorderSizePixel = 0
			TitleLabel.Position = UDim2.new(0.381166548, 0, 0.375948787, 0)
			TitleLabel.Size = UDim2.new(0.712333262, 0, 0.461591274, 0)
			TitleLabel.ZIndex = 8
			TitleLabel.Font = Enum.Font.GothamMedium
			TitleLabel.Text = SliderName or "Slider"
			TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.TextScaled = true
			TitleLabel.TextSize = 14.000
			TitleLabel.TextWrapped = true
			TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

			Front.Name = "Front"
			Front.Parent = Slider
			Front.AnchorPoint = Vector2.new(0.5, 0)
			Front.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
			Front.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Front.BorderSizePixel = 0
			Front.ClipsDescendants = true
			Front.Position = UDim2.new(0.5, 0, 0.699999988, 0)
			Front.Size = UDim2.new(0.949999988, 0, 0.200000003, 0)
			Front.ZIndex = 8

			UICorner_2.CornerRadius = UDim.new(0, 3)
			UICorner_2.Parent = Front

			Move.Name = "Move"
			Move.Parent = Front
			Move.AnchorPoint = Vector2.new(0, 0.5)
			Move.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
			Move.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Move.BorderSizePixel = 0
			Move.Position = UDim2.new(0, 0, 0.5, 0)
			Move.Size = UDim2.new(0, 0, 1, 0)
			Move.ZIndex = 8

			UICorner_3.CornerRadius = UDim.new(0, 3)
			UICorner_3.Parent = Move

			ToNumber.Name = "ToNumber"
			ToNumber.Parent = Slider
			ToNumber.AnchorPoint = Vector2.new(0.5, 0.5)
			ToNumber.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToNumber.BackgroundTransparency = 1.000
			ToNumber.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToNumber.BorderSizePixel = 0
			ToNumber.Position = UDim2.new(0.864182532, 0, 0.37501511, 0)
			ToNumber.Size = UDim2.new(0.216390267, 0, 0.228413954, 0)
			ToNumber.ZIndex = 8
			ToNumber.Font = Enum.Font.GothamMedium
			ToNumber.Text = tostring(Min) or "100"
			ToNumber.TextColor3 = Color3.fromRGB(255, 255, 255)
			ToNumber.TextScaled = true
			ToNumber.TextSize = 14.000
			ToNumber.TextWrapped = true
			ToNumber.TextXAlignment = Enum.TextXAlignment.Right
			local Dange = false

			Services:InputFrame(Front,function(value)
				Dange = value
				if Dange then
					Services:CreateTween(Move,nil,{"BackgroundColor3",Color3.fromRGB(110,110,110)}):Play()
				else
					Services:CreateTween(Move,nil,{"BackgroundColor3",Color3.fromRGB(77, 77, 77)}):Play()
				end
			end,"toggle")

			Services.UserInput.InputChanged:Connect(function(input)
				if Dange  and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then 
					local SizeScale = math.clamp(((input.Position.X - Front.AbsolutePosition.X) / Front.AbsoluteSize.X), 0, 1)
					local Value = math.floor(((Max - Min) * SizeScale) + Min)
					local Size = UDim2.fromScale(SizeScale, 1)
					ToNumber.Text = Value
					Services.Tween:Create(Move,TweenInfo.new(0.1),{Size = Size}):Play()
					callback(Value)
				end
			end)
			local GSlider = {}

			function GSlider:Set(Value)
				if not (typeof(Value) == "number") then
					return
				end
				local UDSIze = math.clamp((Value / Max),0,1)
				local Size = UDim2.fromScale(UDSIze, 1)
				Services.Tween:Create(Move,TweenInfo.new(0.1),{Size = Size}):Play()
				ToNumber.Text = tostring(Value)
				callback(tonumber(Value))
				return
			end

			return GSlider
		end

		function GTab:NewKeybind(KeybindName:string,Default:Enum.KeyCode,callback:func)
			callback = callback or function() end
			Default = Default or Enum.KeyCode.E
			local Binding = false

			local function GetKeyName(Key:Enum.KeyCode)
				if Key ~= Enum.KeyCode.Unknown then
					local KeyStrin = Services.UserInput:GetStringForKeyCode(Key)
					if #tostring(KeyStrin) <= 0 then
						KeyStrin = Key.Name
					end
					return tostring(KeyStrin)
				else
					return tostring(Key.Name)
				end
			end

			local Keybinds = Instance.new("Frame") GShaodw(Keybinds)
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local TitleLabel = Instance.new("TextLabel")
			local Bind = Instance.new("TextLabel")
			local UICorner_2 = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")
			local TOUCJNJ = CreateButtonUI()

			TOUCJNJ.Parent = Keybinds
			Keybinds.Name = "Keybinds"
			Keybinds.Parent = TabCollectAsset
			Keybinds.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Keybinds.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Keybinds.BorderSizePixel = 0
			Keybinds.Size = UDim2.new(0.980000019, 0, 0.5, 0)
			Keybinds.ZIndex = 8

			UIAspectRatioConstraint.Parent = Keybinds
			UIAspectRatioConstraint.AspectRatio = GWindow.UIAspect
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Keybinds

			TitleLabel.Name = "TitleLabel"
			TitleLabel.Parent = Keybinds
			TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.BackgroundTransparency = 1.000
			TitleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TitleLabel.BorderSizePixel = 0
			TitleLabel.Position = UDim2.new(0.365, 0, 0.50000006, 0)
			TitleLabel.Size = UDim2.new(0.699, 0,0.65, 0)
			TitleLabel.ZIndex = 8
			TitleLabel.Font = Enum.Font.GothamMedium
			TitleLabel.Text = KeybindName or "Keybinds"
			TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.TextScaled = true
			TitleLabel.TextSize = 14.000
			TitleLabel.TextWrapped = true
			TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

			Bind.Name = "Bind"
			Bind.Parent = Keybinds
			Bind.AnchorPoint = Vector2.new(0.5, 0.5)
			Bind.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
			Bind.BackgroundTransparency = 0.500
			Bind.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Bind.BorderSizePixel = 0
			Bind.Position = UDim2.new(0.853999972, 0, 0.5, 0)
			Bind.Size = UDim2.new(1.39999998, 0, 0.600000024, 0)
			Bind.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Bind.ZIndex = 8
			Bind.Font = Enum.Font.SourceSansBold
			Bind.Text = GetKeyName(Default)
			Bind.TextColor3 = Color3.fromRGB(255, 255, 255)
			Bind.TextScaled = true
			Bind.TextSize = 14.000
			Bind.TextWrapped = true

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = Bind

			UIStroke.Thickness = 2.600
			UIStroke.Transparency = 0.900
			UIStroke.Color = Color3.fromRGB(255, 255, 255)
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Parent = Bind
			TOUCJNJ.MouseButton1Click:Connect(function()
				if Binding or Services.UserInput.TouchEnabled then
					return
				end
				Binding = true
				Create_Ripple(Keybinds)
				local TargetKey = nil

				local Toggle = Services.UserInput.InputBegan:Connect(function(Input)
					if Input.KeyCode ~= Enum.KeyCode.Unknown then
						TargetKey = Input.KeyCode
					end
				end)

				repeat task.wait() Bind.Text = "..." until TargetKey 
				if Toggle then
					Toggle:Disconnect()
				end
				Binding = false
				if TargetKey then
					Bind.Text = GetKeyName(TargetKey)
					callback(TargetKey)
				end
			end)

			local GBind = {}
			function GBind:Set(...)
				local TargetKey = ...
				Bind.Text = GetKeyName(TargetKey)
				callback(TargetKey)
			end
			return GBind;
		end

		function GTab:NewDropdown(DropdownName:string,Data:{string},callback:func)
			callback = callback or function() end
			Data = Data or {}
			local TogleValue = false
			local Dropdown = Instance.new("Frame") GShaodw(Dropdown)
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local Frame = Instance.new("Frame")
			local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
			local Img = Instance.new("ImageLabel")
			local UICorner_2 = Instance.new("UICorner")
			local TitleLabel = Instance.new("TextLabel")
			local ScrollingFrame = Instance.new("ScrollingFrame")
			local UIStroke = Instance.new("UIStroke")
			local UICorner_3 = Instance.new("UICorner")
			local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
			local UIListLayout = Instance.new("UIListLayout")
			local ButtonmUI = CreateButtonUI()

			UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				Services:CreateTween(ScrollingFrame,nil,{"CanvasSize",UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)}):Play()
			end)

			ButtonmUI.Parent = Frame
			Dropdown.Name = "Dropdown"
			Dropdown.Parent = TabCollectAsset
			Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Dropdown.BorderSizePixel = 0
			Dropdown.ClipsDescendants = true
			Dropdown.Position = UDim2.new(0, 0, 0.0546857566, 0)
			Dropdown.Size = UDim2.new(0.980000019, 0, 0.5, 0)
			Dropdown.ZIndex = 8

			UIAspectRatioConstraint.Parent = Dropdown
			UIAspectRatioConstraint.AspectRatio = GWindow.UIAspect
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Dropdown

			Frame.Parent = Dropdown
			Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame.BackgroundTransparency = 1.000
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(1, 0, 1, 0)
			Frame.ZIndex = 8
			Frame.AnchorPoint = Vector2.new(0.5,0)
			Frame.Position = UDim2.new(0.5,0,0,0)

			UIAspectRatioConstraint_2.Parent = Frame
			UIAspectRatioConstraint_2.AspectRatio = 6.000
			UIAspectRatioConstraint_2.AspectType = Enum.AspectType.ScaleWithParentSize

			Img.Name = "Img"
			Img.Parent = Frame
			Img.AnchorPoint = Vector2.new(0, 0.5)
			Img.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Img.BackgroundTransparency = 1.000
			Img.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Img.BorderSizePixel = 0
			Img.Position = UDim2.new(0.887821734, 0, 0.5, 0)
			Img.Size = UDim2.new(0.400000006, 0, 0.400000006, 0)
			Img.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Img.ZIndex = 8
			Img.Image = "rbxassetid://4509267080"
			Img.ScaleType = Enum.ScaleType.Crop

			UICorner_2.CornerRadius = UDim.new(0, 3)
			UICorner_2.Parent = Img

			TitleLabel.Name = "TitleLabel"
			TitleLabel.Parent = Frame
			TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.BackgroundTransparency = 1.000
			TitleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TitleLabel.BorderSizePixel = 0
			TitleLabel.Position = UDim2.new(0.438430399, 0, 0.50000006, 0)
			TitleLabel.Size = UDim2.new(0.826860785, 0, 0.649999976, 0)
			TitleLabel.ZIndex = 8
			TitleLabel.Font = Enum.Font.GothamMedium
			TitleLabel.Text = DropdownName or "Dropdown"
			TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TitleLabel.TextScaled = true
			TitleLabel.TextSize = 14.000
			TitleLabel.TextWrapped = true
			TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

			ScrollingFrame.Parent = Dropdown
			ScrollingFrame.Active = true
			ScrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			ScrollingFrame.BackgroundTransparency = 0.900
			ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ScrollingFrame.BorderSizePixel = 0
			ScrollingFrame.Position = UDim2.new(0.0634246022, 0, 0.27981478, 0)
			ScrollingFrame.Size = UDim2.new(0.89106369, 0, 0.656696439, 0)
			ScrollingFrame.Visible = false
			ScrollingFrame.ZIndex = 8
			ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame.ScrollBarThickness = 1

			UIStroke.Thickness = 2.600
			UIStroke.Transparency = 0.750
			UIStroke.Color = Color3.fromRGB(255, 255, 255)
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Parent = ScrollingFrame

			UICorner_3.Parent = ScrollingFrame

			UIAspectRatioConstraint_3.Parent = ScrollingFrame
			UIAspectRatioConstraint_3.AspectRatio = 2.000
			UIAspectRatioConstraint_3.AspectType = Enum.AspectType.ScaleWithParentSize

			UIListLayout.Parent = ScrollingFrame
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 3)

			local function CreateButton()
				local Button = Instance.new("TextButton")
				local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				local UICorner = Instance.new("UICorner")
				local UIGradient = Instance.new("UIGradient")

				Button.Name = "Button"
				Button.Parent = ScrollingFrame
				Button.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Size = UDim2.new(0.980000019, 0, 0.5, 0)
				Button.ZIndex = 9
				Button.Font = Enum.Font.GothamMedium
				Button.Text = "List"
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.TextScaled = true
				Button.TextSize = 14.000
				Button.TextWrapped = true
				Button.TextXAlignment = Enum.TextXAlignment.Left

				UIAspectRatioConstraint.Parent = Button
				UIAspectRatioConstraint.AspectRatio = GWindow.UIAspect
				UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = Button

				UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.86, 0.69), NumberSequenceKeypoint.new(1.00, 1.00)}
				UIGradient.Parent = Button
				return Button
			end

			local function Refresh()
				for i,v : TextButton in ipairs(ScrollingFrame:GetChildren()) do
					if v:isA('TextButton') then
						v:Destroy()
					end
				end

				for i,v in ipairs(Data) do
					local ButonUI = CreateButton()
					ButonUI.Text = tostring(v)
					ButonUI.MouseButton1Click:Connect(function()
						Create_Ripple(ButonUI)
						pcall(function()
							for i,vre : TextButton in ipairs(ScrollingFrame:GetChildren()) do
								if vre:isA('TextButton') then
									if vre == ButonUI then
										Services:CreateTween(vre,nil,{"BackgroundColor3",Color3.fromRGB(191, 191, 191)}):Play()
									else
										Services:CreateTween(vre,nil,{"BackgroundColor3",Color3.fromRGB(81, 81, 81)}):Play()
									end
								end
							end
						end)
						callback(v)
					end)
				end
			end

			local function ToggleDb(Value)
				if Value then
					ScrollingFrame.Visible = true
					Services:CreateTween(UIAspectRatioConstraint,TweenInfo.new(0.14,Enum.EasingStyle.Quint),{"AspectRatio",1.5}):Play()
				else
					ScrollingFrame.Visible = false
					Services:CreateTween(UIAspectRatioConstraint,TweenInfo.new(0.14,Enum.EasingStyle.Quint),{"AspectRatio",GWindow.UIAspect or 6}):Play()
				end
			end

			ToggleDb(false)
			Refresh()

			ButtonmUI.MouseButton1Click:Connect(function()
				Create_Ripple(Dropdown)
				TogleValue = not TogleValue
				ToggleDb(TogleValue)
			end)
			local GDDB = {}

			function GDDB:Refresh(...)
				Data = ... or Data
				Refresh()
			end
			return GDDB;
		end

		function GTab:CreateLayer()
			local Layer = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UIGradient = Instance.new("UIGradient")

			Layer.Name = "Layer"
			Layer.Parent = TabCollectAsset
			Layer.BackgroundColor3 = Color3.fromRGB(152, 152, 152)
			Layer.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Layer.BorderSizePixel = 0
			Layer.Size = UDim2.new(0.99000001, 0, 0.5, 0)
			Layer.ZIndex = 15

			UIAspectRatioConstraint.Parent = Layer
			UIAspectRatioConstraint.AspectRatio = 100.000
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
			UIGradient.Parent = Layer
		end
		return GTab;
	end

	function GWindow:ChangeToggle(ewToggle)
		ToggleKey = ewToggle or ToggleKey
	end

	function GWindow:Destroy()
		BedolHubV2:Destroy()
	end

	local dragToggle = nil
	local dragSpeed = 0.05
	local dragStart = nil
	local startPos = nil

	local function updateInput(input)
		if not OnUserMove then
			return
		end
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(Header, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	Header.InputBegan:Connect(function(input)
		if not OnUserMove then
			return
		end
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = Header.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End and OnUserMove then
					dragToggle = false
				end
			end)
		end
	end)

	Services.UserInput.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle and OnUserMove then
				updateInput(input)
			end
		end
	end)

	local function RestoreUITo(vaue)
		if vaue then
			Main.Visible = true
			Services:CreateTween(Main,TweenInfo.new(0.15,Enum.EasingStyle.Back),{"Size",UDim2.new(1, 0,11, 0)}):Play()
			Services:CreateTween(Main,TweenInfo.new(0.16),{"Position",UDim2.new(0,0,0.088,0)}):Play()
		else
			Services:CreateTween(Main,TweenInfo.new(0.16),{"Position",UDim2.new(1,0,0.088,0)}):Play()
			local TweenStart = Services:CreateTween(Main,TweenInfo.new(0.15,Enum.EasingStyle.Back,Enum.EasingDirection.In),{"Size",UDim2.new(0.100000024, 0,1, 0)})
			TweenStart:Play()
			TweenStart.Completed:Connect(function()
				task.wait()
				local ServiceData,Error = Services:TweenCheck(Main,"Size",UDim2.new(0.100000024, 0,1, 0))

				if ServiceData then
					Main.Visible = false
				end
			end)
		end
	end

	Restore.MouseButton1Click:Connect(function()
		Create_Ripple(HeadButtons)
		RestoreBoole = not RestoreBoole
		RestoreUITo(RestoreBoole)
	end)

	Close.MouseButton1Click:Connect(function()
		Create_Ripple(HeadButtons)
		if BedolHubV2.Enabled then
			BedolHubV2.Enabled = false
		else
			BedolHubV2.Enabled = true
		end
	end)

	Services.UserInput.InputBegan:Connect(function(Key)
		if Key.KeyCode == ToggleKey then
			if BedolHubV2.Enabled then
				BedolHubV2.Enabled = false
			else
				BedolHubV2.Enabled = true
			end
		end
	end)

	return GWindow
end

return BEDOL_HUB_HUI;
