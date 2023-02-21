local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/cunning-sys/Scripts/main/aimingmodule.lua"))()

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CurrentCamera = Workspace.CurrentCamera

function Aiming.Check()
    if not (Aiming.Enabled == true and Aiming.Selected ~= LocalPlayer and Aiming.SelectedPart ~= nil) then
        return false
    end

    local Character = Aiming.Character(Aiming.Selected)
    local KOd = Character:WaitForChild("BodyEffects")["K.O"].Value
    local Grabbed = Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
    
    if (KOd or Grabbed) then
        return false
    end
    return true
end

    local __index
    __index = hookmetamethod(game, "__index", function(t, k)
        if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and Aiming.Check()) then
            local SelectedPart = Aiming.SelectedPart
            if (Aiming.SilentAim and (k == "Hit" or k == "Target")) then
                local Hit = CFrame.new(SelectedPart.Position + (Vector3.new(SelectedPart.Velocity.X, 0, SelectedPart.Velocity.Z) * Aiming.Prediction))
            
                return (k == "Hit" and Hit or SelectedPart)
            end
        end
        return __index(t, k)
    end)

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"))()

local main = library:Load{
    Name = "cunnings silent",
    SizeX = 600,
    SizeY = 350,
    Theme = "Midnight",
    Extension = "json",
    Folder = "silent"
}

local tab = main:Tab("Main")

local section = tab:Section{
    Name = "Silent",
    Side = "Left"
}

local silenttoggle = section:Toggle{
    Name = "Enabled",
    Flag = "Toggle 1",
    --Default = true,
    Callback  = function(bool)
        Aiming.SilentAim = bool
    end
}

local togglesilentkeybind = silenttoggle:Keybind{
    Name = "Toggle Silent",
    --Default = Enum.KeyCode.A,
    --Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2},
    Flag = "Keybind 1",
    Callback = function(key, fromsetting)
    	if key then
			if not Aiming.SilentAim then
				silenttoggle:Toggle(true)
			elseif Aiming.SilentAim then
				silenttoggle:Toggle(false)
			end
		end
    end
}

local resolvertoggle = section:Toggle{
    Name = "Resolver",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)
        Aiming.Resolver = bool
    end
}

local predictionbox = section:Box{
    Name = "Prediction",
    --Default = "hi",
    Placeholder = "Example - 0.155",
    Flag = "Box 1",
    Callback = function(text)
        Aiming.Prediction = tonumber(text)
    end
}

local hitpartsdropdown = section:Dropdown{
	Name = 'Hit Parts',
    --Default = "Option 1",
    Content = {
        "Head",
        "UpperTorso",
        "HumanoidRootPart",
        'LowerTorso',
        'LeftHand',
        'RightHand',
        'LeftLowerArm',
        'RightLowerArm',
        'LeftUpperArm',
        'RightUpperArm',
        'LeftFoot',
        'LeftLowerLeg',
        'LeftUpperLeg',
        'RightFoot',
        'RightLowerLeg',
        'RightUpperLeg'
    },
    Max = 16, -- turns into multidropdown
    Scrollable = true, -- makes it scrollable
    --ScrollingMax = 5, -- caps the amount it contains before scrolling
    Flag = "Dropdown 1",
    Callback = function(option)
        Aiming.TargetPart = option
    end
}

local hitchanceslider = section:Slider{
    Name = "Hit Chance",
    Text = "[value]/100",
    Default = 100,
    Min = 0,
    Max = 100,
    Float = 1,
    Flag = "Slider 1",
    Callback = function(value)
        Aiming.HitChance = value
    end
}

local seperator = section:Separator("FOV")

local fovtoggle = section:Toggle{
    Name = "Enabled",
    Flag = "Toggle 3",
    --Default = true,
    Callback  = function(bool)
        Aiming.ShowFOV = bool
    end
}

local fovpicker = fovtoggle:ColorPicker{
    Default = Color3.fromRGB(184, 226, 242), 
    Flag = "Toggle 1 Picker 1", 
    Callback = function(color)
        Aiming.FOVCircle.Color = color
    end
}

local hitchanceslider = section:Slider{
    Name = "Radius",
    Text = "[value]/50",
    Default = 13,
    Min = 0,
    Max = 50,
    Float = 1,
    Flag = "Slider 2",
    Callback = function(value)
        Aiming.FOV = value
    end
}

local fovfilledtoggle = section:Toggle{
    Name = "Filled",
    Flag = "Toggle 4",
    --Default = true,
    Callback  = function(bool)
        Aiming.FOVCircle.Filled = bool
    end
}

local configs = main:Tab("Configuration")

local themes = configs:Section{Name = "Theme", Side = "Left"}

local themepickers = {}

local themelist = themes:Dropdown{
    Name = "Theme",
    Default = library.currenttheme,
    Content = library:GetThemes(),
    Flag = "Theme Dropdown",
    Callback = function(option)
        if option then
            library:SetTheme(option)

            for option, picker in next, themepickers do
                picker:Set(library.theme[option])
            end
        end
    end
}

library:ConfigIgnore("Theme Dropdown")

local namebox = themes:Box{
    Name = "Custom Theme Name",
    Placeholder = "Custom Theme",
    Flag = "Custom Theme"
}

library:ConfigIgnore("Custom Theme")

themes:Button{
    Name = "Save Custom Theme",
    Callback = function()
        if library:SaveCustomTheme(library.flags["Custom Theme"]) then
            themelist:Refresh(library:GetThemes())
            themelist:Set(library.flags["Custom Theme"])
            namebox:Set("")
        end
    end
}

local customtheme = configs:Section{Name = "Custom Theme", Side = "Right"}

themepickers["Accent"] = customtheme:ColorPicker{
    Name = "Accent",
    Default = library.theme["Accent"],
    Flag = "Accent",
    Callback = function(color)
        library:ChangeThemeOption("Accent", color)
    end
}

library:ConfigIgnore("Accent")

themepickers["Window Background"] = customtheme:ColorPicker{
    Name = "Window Background",
    Default = library.theme["Window Background"],
    Flag = "Window Background",
    Callback = function(color)
        library:ChangeThemeOption("Window Background", color)
    end
}

library:ConfigIgnore("Window Background")

themepickers["Window Border"] = customtheme:ColorPicker{
    Name = "Window Border",
    Default = library.theme["Window Border"],
    Flag = "Window Border",
    Callback = function(color)
        library:ChangeThemeOption("Window Border", color)
    end
}

library:ConfigIgnore("Window Border")

themepickers["Tab Background"] = customtheme:ColorPicker{
    Name = "Tab Background",
    Default = library.theme["Tab Background"],
    Flag = "Tab Background",
    Callback = function(color)
        library:ChangeThemeOption("Tab Background", color)
    end
}

library:ConfigIgnore("Tab Background")

themepickers["Tab Border"] = customtheme:ColorPicker{
    Name = "Tab Border",
    Default = library.theme["Tab Border"],
    Flag = "Tab Border",
    Callback = function(color)
        library:ChangeThemeOption("Tab Border", color)
    end
}

library:ConfigIgnore("Tab Border")

themepickers["Tab Toggle Background"] = customtheme:ColorPicker{
    Name = "Tab Toggle Background",
    Default = library.theme["Tab Toggle Background"],
    Flag = "Tab Toggle Background",
    Callback = function(color)
        library:ChangeThemeOption("Tab Toggle Background", color)
    end
}

library:ConfigIgnore("Tab Toggle Background")

themepickers["Section Background"] = customtheme:ColorPicker{
    Name = "Section Background",
    Default = library.theme["Section Background"],
    Flag = "Section Background",
    Callback = function(color)
        library:ChangeThemeOption("Section Background", color)
    end
}

library:ConfigIgnore("Section Background")

themepickers["Section Border"] = customtheme:ColorPicker{
    Name = "Section Border",
    Default = library.theme["Section Border"],
    Flag = "Section Border",
    Callback = function(color)
        library:ChangeThemeOption("Section Border", color)
    end
}

library:ConfigIgnore("Section Border")

themepickers["Text"] = customtheme:ColorPicker{
    Name = "Text",
    Default = library.theme["Text"],
    Flag = "Text",
    Callback = function(color)
        library:ChangeThemeOption("Text", color)
    end
}

library:ConfigIgnore("Text")

themepickers["Disabled Text"] = customtheme:ColorPicker{
    Name = "Disabled Text",
    Default = library.theme["Disabled Text"],
    Flag = "Disabled Text",
    Callback = function(color)
        library:ChangeThemeOption("Disabled Text", color)
    end
}

library:ConfigIgnore("Disabled Text")

themepickers["Object Background"] = customtheme:ColorPicker{
    Name = "Object Background",
    Default = library.theme["Object Background"],
    Flag = "Object Background",
    Callback = function(color)
        library:ChangeThemeOption("Object Background", color)
    end
}

library:ConfigIgnore("Object Background")

themepickers["Object Border"] = customtheme:ColorPicker{
    Name = "Object Border",
    Default = library.theme["Object Border"],
    Flag = "Object Border",
    Callback = function(color)
        library:ChangeThemeOption("Object Border", color)
    end
}

library:ConfigIgnore("Object Border")

themepickers["Dropdown Option Background"] = customtheme:ColorPicker{
    Name = "Dropdown Option Background",
    Default = library.theme["Dropdown Option Background"],
    Flag = "Dropdown Option Background",
    Callback = function(color)
        library:ChangeThemeOption("Dropdown Option Background", color)
    end
}

library:ConfigIgnore("Dropdown Option Background")

local configsection = configs:Section{Name = "Configs", Side = "Left"}

local configlist = configsection:Dropdown{
    Name = "Configs",
    Content = library:GetConfigs(), -- GetConfigs(true) if you want universal configs
    Flag = "Config Dropdown"
}

library:ConfigIgnore("Config Dropdown")

local loadconfig = configsection:Button{
    Name = "Load Config",
    Callback = function()
        library:LoadConfig(library.flags["Config Dropdown"]) -- LoadConfig(library.flags["Config Dropdown"], true)  if you want universal configs
    end
}

local delconfig = configsection:Button{
    Name = "Delete Config",
    Callback = function()
        library:DeleteConfig(library.flags["Config Dropdown"]) -- DeleteConfig(library.flags["Config Dropdown"], true)  if you want universal configs
        configlist:Refresh(library:GetConfigs())
    end
}


local configbox = configsection:Box{
    Name = "Config Name",
    Placeholder = "Config Name",
    Flag = "Config Name"
}

library:ConfigIgnore("Config Name")

local save = configsection:Button{
    Name = "Save Config",
    Callback = function()
        library:SaveConfig(library.flags["Config Dropdown"] or library.flags["Config Name"]) -- SaveConfig(library.flags["Config Name"], true) if you want universal configs
        configlist:Refresh(library:GetConfigs())
    end
}

local keybindsection = configs:Section{Name = "UI Toggle Keybind", Side = "Left"}

keybindsection:Keybind{
    Name = "UI Toggle",
    Flag = "UI Toggle",
    Default = Enum.KeyCode.RightShift,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
    Callback = function(_, fromsetting)
        if not fromsetting then
            library:Close()
        end
    end
}
