loadstring(game:HttpGet('https://raw.githubusercontent.com/cunning-sys/UILibs/main/JanUI.lua'))()
local MainTab = library:AddTab("Main");
local MainColunm1 = MainTab:AddColumn();
local HBESection = MainColunm1:AddSection("Hitbox Expander")

getgenv().hbsize = 25

HBESection:AddToggle({text = "Hitbox Expander", flag = "HitboxExpanderEnabled", callback = function()
    if library.flags.HitboxExpanderEnabled then
        for i,v in next, game:GetService('Workspace'):GetDescendants() do 
            if v.Name == "Head" then
                    pcall(function()
                    v.Size = Vector3.new(hbsize, hbsize, hbsize, hbsize) --Any size it's bypassed now
                    v.Transparency=0.65
                    v.Massless = true
                    v.CanCollide = false
                end)
            end
        end
    end
end})

HBESection:AddSlider({text = "Hitbox Size", flag = "HBESize", min = 1, max = 25, value = 10, suffix = "", callback = function()
    hbsize = library.flags.HBESize
    
    if library.flags.HitboxExpanderEnabled then
        for i,v in next, game:GetService('Workspace'):GetDescendants() do 
            if v.Name == "Head" then
                pcall(function()
                    v.Size = Vector3.new(hbsize, hbsize, hbsize, hbsize) --Any size it's bypassed now
                    v.Transparency=0.65
                    v.Massless = true
                    v.CanCollide = false
                end)
            end
        end
    end
end})

local SettingsTab = library:AddTab("Settings"); 
local SettingsColumn = SettingsTab:AddColumn(); 
local SettingsColumn2 = SettingsTab:AddColumn(); 
local SettingSection = SettingsColumn:AddSection("Menu"); 
local ConfigSection = SettingsColumn2:AddSection("Configs");
local Warning = library:AddWarning({type = "confirm"});

SettingSection:AddBind({text = "Open / Close", flag = "UI Toggle", nomouse = true, key = "End", callback = function()
    library:Close();
end});

SettingSection:AddColor({text = "Accent Color", flag = "Menu Accent Color", color = Color3.new(0.599623620510101318359375, 0.447115242481231689453125, 0.97174417972564697265625), callback = function(color)
    if library.currentTab then
        library.currentTab.button.TextColor3 = color;
    end
    for i,v in pairs(library.theme) do
        v[(v.ClassName == "TextLabel" and "TextColor3") or (v.ClassName == "ImageLabel" and "ImageColor3") or "BackgroundColor3"] = color;
    end
end});

local backgroundlist = {
    Floral = "rbxassetid://5553946656",
    Flowers = "rbxassetid://6071575925",
    Circles = "rbxassetid://6071579801",
    Hearts = "rbxassetid://6073763717"
};

local back = SettingSection:AddList({text = "Background", max = 4, flag = "background", values = {"Floral", "Flowers", "Circles", "Hearts"}, value = "Floral", callback = function(v)
    if library.main then
        library.main.Image = backgroundlist[v];
    end
end});

back:AddColor({flag = "backgroundcolor", color = Color3.new(), callback = function(color)
    if library.main then
        library.main.ImageColor3 = color;
    end
end, trans = 1, calltrans = function(trans)
    if library.main then
        library.main.ImageTransparency = 1 - trans;
    end
end});

library:Init();
library:selectTab(library.tabs[1]);
