# Ambutakam!!!!
![FB_IMG_1687961102009](https://github.com/3345-c-a-t-s-u-s/BedolHubV2-UI-Lib/assets/117000269/b741279e-fc86-4449-b30f-4fa640895caa)
# HEY GET OUT
## This is My UI
```lua
local UI = loadstring(game:HttpGet(("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/BedolHubV2-UI-Lib/main/main.lua")))()

local Window = UI:CreateWindow("-Window Name-")

Window.UIAspect = 8
local Tab = Window:NewTab("Tab - 1")
local Tab2 = Window:NewTab("Tab - 2")
local Tab3 = Window:NewTab("Tab - 3")

Tab2:NewTitle("This is Tab 2")
Tab3:NewTitle("This is Tab 3")
Tab:NewTitle("All Assets in here")

Tab:NewButton("button",function()
    print("vas Click")
end)

Tab:NewToggle("toggle",false,function(boolen)
    print(boolen)
end)

Tab:NewTextBox("textbox","send",function(msg)
    print(msg)
end)

Tab:NewSlider("slider",1,500,function(number)
    print(number)
end)

Tab:NewKeybind("keybinds",Enum.KeyCode.E,function(key)
    print(key)
end)

Tab:NewDropdown("dropdown",{"1","2","3"},function(name)
    print(name)
end)
```
