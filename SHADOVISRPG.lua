loadstring(game:HttpGet('https://raw.githubusercontent.com/cunning-sys/UILibs/main/JanUI.lua'))()
local MainTab = library:AddTab("Main");
local MainColunm1 = MainTab:AddColumn();
local MainColunm2 = MainTab:AddColumn();
local KillauraSection = MainColunm1:AddSection("Killaura")
local WeaponSpamSection = MainColunm2:AddSection("Weapon Spam")

local plr = game.Players.LocalPlayer

for i,v in pairs(plr.Character.Equipment:GetDescendants()) do
    if v.Name == "SwordGrip" then
        getgenv().Weapon = v.Parent.Parent.Name
        print(getgenv().Weapon)
    end
end

KillauraSection:AddToggle({text = "Killaura", flag = "KillauraEnabled", callback = function()
    local plr = game.Players.LocalPlayer

    local function kill(thing)
        if thing and thing:FindFirstChild("Humanoid") and thing.Humanoid.Health > 0 then
            plr.Character.Combat.RemoteEvent:FireServer("Input", getgenv().Weapon, 0, getgenv().Event, thing.HumanoidRootPart)
        end
    end

    while library.flags.KillauraEnabled do
        task.wait()
        for i,v in next, workspace.NPCs:GetChildren() do
            local dist = (plr.Character.PrimaryPart.Position - v.PrimaryPart.Position).Magnitude

            if dist < library.flags.KillauraRange then
                kill(v)
            end
        end
    end
end});

KillauraSection:AddList({text = "Killaura Method", flag = "KillauraEvent", value = "Swords / Axes / Daggers", values = {"Swords / Axes / Daggers", "Mallets", "Lances"}, callback = function(value)
    if library.flags.KillauraEvent == "Swords / Axes / Daggers" then
        getgenv().Event = "SlashEvent"
    elseif library.flags.KillauraEvent == "Mallets" then
        getgenv().Event = "SlamEvent"
    elseif library.flags.KillauraEvent == "Lances" then
        getgenv().Event = "JoustHurt"
    end
    print(value)
    print(getgenv().Event)
end});
KillauraSection:AddSlider{text = "Range", flag = "KillauraRange", min = 1, max = 25, value = 25, suffix = ""}
KillauraSection:AddButton({text = "Refresh Weapon", callback = function()
    for i,v in pairs(plr.Character.Equipment:GetDescendants()) do
        if v.Name == "SwordGrip" then
            getgenv().Weapon = v.Parent.Parent.Name
        end
    end
end});

WeaponSpamSection:AddToggle({text = "Weapon Spam", flag = "WeaponSpamEnabled", callback = function()
while library.flags.WeaponSpamEnabled do
    task.wait(library.flags.WeaponSpamDelay)
    if library.flags.WeaponSpamAbility == "Hallow Greatsword" then
        game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer("Input", "HallowHallow Greatsword", 4.571428571428571, "Hallows")
    elseif library.flags.WeaponSpamAbility == "Empyreus Judgement Blade" then
        game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer("Input", "EmpyreusJudgement Blade", 10, "Cast")
    elseif library.flags.WeaponSpamAbility == "Captain's Flintlock" then
        game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer("Input", "Captain's Flintlock", 0.625, "Flintlock")
    elseif library.flags.WeaponSpamAbility == "Magician's Rod" then
        game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer("Input", "Magician's Rod", 0.75, "Fireball")
    elseif library.flags.WeaponSpamAbility == "Aurelion Hood" then 
        game:GetService("Players").LocalPlayer.Character.Combat.RemoteEvent:FireServer("Input", "AureusAurelion Hood", 20, "Darkness")
    end
end
end})
WeaponSpamSection:AddBox({text = "Delay", flag = "WeaponSpamDelay"}); -- :AddSlider{text = "Delay", flag = "WeaponSpamDelay", min = 0.1, max = 10.0, value = 2, suffix = ""}
WeaponSpamSection:AddList({text = "Weapon Spam Ability", flag = "WeaponSpamAbility", value = "Hallow Greatsword", values = {"Hallow Greatsword", "Empyreus Judgement Blade", "Captain's Flintlock", "Magician's Rod", "Aurelion Hood"}});

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

ConfigSection:AddBox({text = "Config Name", skipflag = true});

ConfigSection:AddList({text = "Configs", skipflag = true, value = "", flag = "Config List", values = library:GetConfigs()});

ConfigSection:AddButton({text = "Create", callback = function()
    library:GetConfigs();
    writefile(library.foldername .. "/" .. library.flags["Config Name"] .. library.fileext, "{}");
    library.options["Config List"]:AddValue(library.flags["Config Name"]);
end});

ConfigSection:AddButton({text = "Save", callback = function()
    local r, g, b = library.round(library.flags["Menu Accent Color"]);
    Warning.text = "Are you sure you want to save the current settings to config <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. library.flags["Config List"] .. "</font>?";
    if Warning:Show() then
        library:SaveConfig(library.flags["Config List"]);
    end
end});

ConfigSection:AddButton({text = "Load", callback = function()
    local r, g, b = library.round(library.flags["Menu Accent Color"]);
    Warning.text = "Are you sure you want to load config <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. library.flags["Config List"] .. "</font>?";
    if Warning:Show() then
        library:LoadConfig(library.flags["Config List"]);
    end
end});

ConfigSection:AddButton({text = "Delete", callback = function()
    local r, g, b = library.round(library.flags["Menu Accent Color"]);
    Warning.text = "Are you sure you want to delete config <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. library.flags["Config List"] .. "</font>?";
    if Warning:Show() then
        local config = library.flags["Config List"];
        if table.find(library:GetConfigs(), config) and isfile(library.foldername .. "/" .. config .. library.fileext) then
            library.options["Config List"]:RemoveValue(config);
            delfile(library.foldername .. "/" .. config .. library.fileext);
        end
    end
end});

library:Init();
library:selectTab(library.tabs[1]);