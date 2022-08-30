loadstring(game:HttpGet('https://raw.githubusercontent.com/cunning-sys/UILibs/main/JanUI.lua'))()
local MainTab = library:AddTab("Main");
local MainColunm1 = MainTab:AddColumn();
local MainColunm2 = MainTab:AddColumn();
local KillauraSection = MainColunm1:AddSection("Killaura")
local WeaponSpamSection = MainColunm2:AddSection("Weapon Spam")
local AutoCollectSection = MainColunm1:AddSection("Auto Collect Items")
local CollectCubitsSection = MainColunm2:AddSection("Collect Cubits")
local MiscTab = library:AddTab("Misc")
local MiscColunm1 = MiscTab:AddColumn();
local MiscColunm2 = MiscTab:AddColumn();
local MiscSection1 = MiscColunm1:AddSection("Player")

local plr = game.Players.LocalPlayer

local function sword()
for i,v in pairs(plr.Character.Equipment:GetDescendants()) do
    if v.Name == "SwordGrip" then
        getgenv().Weapon = v.Parent.Parent.Name
        print(Weapon)
    end
end
end

KillauraSection:AddToggle({text = "Killaura", flag = "KillauraEnabled", callback = function()
    local plr = game.Players.LocalPlayer

    local function kill(thing)
        if thing and thing:FindFirstChild("Humanoid") and thing.Humanoid.Health > 0 then
            plr.Character.Combat.RemoteEvent:FireServer("Input", Weapon, 0, Event, thing.HumanoidRootPart)
        end
    end

    while library.flags.KillauraEnabled do
        task.wait()
        for i,v in next, game:GetService("Workspace").NPCs:GetChildren() do
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
    print(Event)
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

AutoCollectSection:AddToggle({text = "Auto Collect", flag = "AutoCollectEnabled", callback = function()
    while library.flags.AutoCollectEnabled do
        task.wait()
        for i,v in pairs(game:GetService("Workspace").Projectiles:GetChildren()) do
            local Prox = v:FindFirstChildOfClass("ProximityPrompt");
            if Prox then
                fireproximityprompt(Prox, 1)
            end
        end
    end
end});
AutoCollectSection:AddToggle({text = "Auto Dice", flag = "AutoDiceEnabled", callback = function()
    local plr = game.Players.LocalPlayer

    while library.flags.AutoDiceEnabled do
        task.wait()
        for i,v in pairs (game:GetService("Workspace").Projectiles:GetDescendants()) do
            if v.Name == "BillboardGui" then
                plr.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
            end
        end
    end
end});

CollectCubitsSection:AddButton({text = "Collet Cubits", callback = function()
    for i,v in pairs(game:GetService("Workspace")["Client Cubits"]:GetChildren()) do
        local Prox = v:FindFirstChildOfClass("ProximityPrompt");
        if Prox then
            fireproximityprompt(Prox, 1)
        end
    end
end});

MiscSection1:AddToggle({text = "Walk Speed", flag = "WalkSpeedEnabled", callback = function()
    while library.flags.WalkSpeedEnabled do
        task.wait()
        if library.flags.WalkSpeedEnabled == false then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        else
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = library.flags.WalkSpeed
        end
    end
end});
MiscSection1:AddSlider{text = "Walk Speed", flag = "WalkSpeed", min = 16, max = 250, value = 16, suffix = ""}
MiscSection1:AddToggle({text = "Jump Power", flag = "JumpPowerEnabled", callback = function()
    while library.flags.JumpPowerEnabled do
        task.wait()
        if library.flags.JumpPowerEnabled == false then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 16
        else
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = library.flags.JumpPower
        end
    end
end});
MiscSection1:AddSlider{text = "Jump Power", flag = "Jump Power", min = 50, max = 500, value = 16, suffix = ""}
MiscSection1:AddToggle({text = "Freeze", flag = "FreezeEnabled", callback = function()
    if library.flags.FreezeEnabled == true then
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    elseif library.flags.FreezeEnabled == false then
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end
end});

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

for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end
