getgenv().AsuiSettings = {
    Aimbot = {
        Enabled = false,
        VisibilityCheck = {
            Enabled = false
        },
        Smoothing = {
            Enabled = false,
            SmoothingValue = 0.25
        },
        FOV = {
            Enabled = false,
            Size = 150,
            Color = Color3.new(1, 1, 1)
        }
    },
    Chams = {
        Enabled = false,
        FillColor = Color3.new(1, 1, 1),
        OutlineColor = Color3.new(1, 1, 1),
        FillTransparency = 0.7,
        OutlineTransparency = 0.7
    },
    CFrameSpeed = {
		Enabled = false,
		Speed = 1
    }
}

local notifications = loadstring(game:HttpGet(("https://raw.githubusercontent.com/cunning-sys/UILibs/main/notificationlib.lua"),true))()
local repo = 'https://raw.githubusercontent.com/cunning-sys/UILibs/main/LinoriaLib/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local RunService = game:GetService("RunService")
function CheckWhitelistType(param)
    if param == "alexislove8293" or "this" then
        return "dev build"
    end
    return ""
end

local Window = Library:CreateWindow({
    Title = 'Asui v1a '..CheckWhitelistType(game.Players.LocalPlayer.Name)..' | '..gameName,
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    Aiming = Window:AddTab('Aiming'),
    Visuals = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),
    ['Settings'] = Window:AddTab('Settings'),
}

local FOV = Drawing.new("Circle")
FOV.Visible = AsuiSettings.Aimbot.FOV.Enabled
FOV.Thickness = 1.5
FOV.Radius = AsuiSettings.Aimbot.FOV.Size
FOV.Transparency = 1
FOV.Color = AsuiSettings.Aimbot.FOV.Color
FOV.Position = workspace.CurrentCamera.ViewportSize/2

local AimbotBox = Tabs.Aiming:AddLeftGroupbox('Aimbot')

AimbotBox:AddToggle('AimbotEnabledFlag', {
    Text = 'Enabled',
    Default = false,
}):AddKeyPicker('AimbotBindFlag', {
    Default = 'MB2', -- String as the name of the keybind (MB1, MB2 for mouse buttons)  
    Mode = 'Hold', -- Modes: Always, Toggle, Hold
    Text = 'Aimbot Bind',
    NoUI = true, -- Set to true if you want to hide from the Keybind menu,
})

Toggles.AimbotEnabledFlag:OnChanged(function()
    AsuiSettings.Aimbot.Enabled = Toggles.AimbotEnabledFlag.Value
end)

AimbotBox:AddToggle('SmoothingEnabledFlag', {
    Text = 'Smoothing',
    Default = false,
})

Toggles.SmoothingEnabledFlag:OnChanged(function()
    AsuiSettings.Aimbot.Smoothing.Enabled = Toggles.SmoothingEnabledFlag.Value
end)

AimbotBox:AddSlider('SmoothingValueFlag', {
    Text = 'Smoothing Value',
    Default = 0.25,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Compact = false,
})

Options.SmoothingValueFlag:OnChanged(function()
    AsuiSettings.Aimbot.Smoothing.SmoothingValue = Options.SmoothingValueFlag.Value
end)

AimbotBox:AddToggle('AimbotShowFOVFlag', {
    Text = 'Show FOV',
    Default = false,
}):AddColorPicker('AimbotFOVColorFlag', {
    Default = Color3.new(1, 1, 1),
})

Toggles.AimbotShowFOVFlag:OnChanged(function()
    AsuiSettings.Aimbot.FOV.Enabled = Toggles.AimbotShowFOVFlag.Value
    FOV.Visible = AsuiSettings.Aimbot.FOV.Enabled
end)

Options.AimbotFOVColorFlag:OnChanged(function()
    AsuiSettings.Aimbot.FOV.Color = Options.AimbotFOVColorFlag.Value
    FOV.Color = AsuiSettings.Aimbot.FOV.Color
end)

AimbotBox:AddSlider('AimbotFOVSizeFlag', {
    Text = 'FOV Size',
    Default = 150,
    Min = 1,
    Max = 500,
    Rounding = 0,
    Compact = false,
})

Options.AimbotFOVSizeFlag:OnChanged(function()
    AsuiSettings.Aimbot.FOV.Size = Options.AimbotFOVSizeFlag.Value
    FOV.Radius = AsuiSettings.Aimbot.FOV.Size
end)

local ChamsBox = Tabs.Visuals:AddLeftGroupbox('Chams')

ChamsBox:AddToggle('ChamsEnabledFlag', {
    Text = 'Enabled',
    Default = false,
})

ChamsBox:AddLabel('Fill Color'):AddColorPicker('FillColorFlag', {
    Default = Color3.new(0, 1, 0)
})

ChamsBox:AddSlider('FillTransparencyFlag', {
    Text = 'Fill Transparency',
    Default = 0.7,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Compact = false,
})

ChamsBox:AddLabel('Outline Color'):AddColorPicker('OutlineColorFlag', {
    Default = Color3.new(0, 1, 0)
})

ChamsBox:AddSlider('OutlineTransparencyFlag', {
    Text = 'Outline Transparency',
    Default = 0.7,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Compact = false,
})

local CFrameSpeedBox = Tabs.Misc:AddLeftGroupbox('CFrame Speed')

CFrameSpeedBox:AddToggle('CFrameSpeedEnabledFlag', {
    Text = 'Enabled',
    Default = false,
}):AddKeyPicker('CFrameSpeedBindFlag', {
    Default = 'V', -- String as the name of the keybind (MB1, MB2 for mouse buttons)  
    Mode = 'Toggle', -- Modes: Always, Toggle, Hold
    Text = 'CFrame Speed Bind',
    NoUI = true, -- Set to true if you want to hide from the Keybind menu,
})

Toggles.CFrameSpeedEnabledFlag:OnChanged(function()
    AsuiSettings.CFrameSpeed.Enabled = Toggles.CFrameSpeedEnabledFlag.Value
end)

Options.CFrameSpeedBindFlag:OnClick(function()
    if not AsuiSettings.CFrameSpeed.Enabled then
        AsuiSettings.CFrameSpeed.Enabled = Toggles.CFrameSpeedEnabledFlag.Value
        Toggles.CFrameSpeedEnabledFlag:SetValue(true)
    elseif AsuiSettings.CFrameSpeed.Enabled then
        AsuiSettings.CFrameSpeed.Enabled = Toggles.CFrameSpeedEnabledFlag.Value
        Toggles.CFrameSpeedEnabledFlag:SetValue(false)
    end
end)

CFrameSpeedBox:AddSlider('CFrameSpeedFlag', {
    Text = 'Speed Value',
    Default = 1,
    Min = 1,
    Max = 3,
    Rounding = 0,
    Compact = false,
})

Options.CFrameSpeedFlag:OnChanged(function()
    AsuiSettings.CFrameSpeed.Speed = Options.CFrameSpeedFlag.Value
end)

local MenuGroup = Tabs['Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')
SaveManager:BuildConfigSection(Tabs['Settings']) 
ThemeManager:ApplyToTab(Tabs['Settings'])

local function getClosest(cframe)
    local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
    
    local target = nil
    local mag = math.huge
    
    for i,v in pairs(game.Players:GetPlayers()) do
        if v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v ~= game.Players.LocalPlayer and (v.Team ~= game.Players.LocalPlayer.Team or (not teamCheck)) then
            local magBuf = (v.Character.Head.Position - ray:ClosestPoint(v.Character.Head.Position)).Magnitude
            if magBuf < mag then
                mag = magBuf
                target = v
            end
        end
    end
    
    return target
end
 
AimbotLoop = RunService.RenderStepped:Connect(function()
    local UserInputService = game:GetService("UserInputService")
    local pressed = Options.AimbotBindFlag:GetState() --[[UserInputService:IsKeyDown(Enum.KeyCode.E) UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)]]
    local localPlay = game.Players.localPlayer.Character
    local cam = workspace.CurrentCamera
    local zz = workspace.CurrentCamera.ViewportSize/2
    
    if pressed and AsuiSettings.Aimbot.Enabled then
        getgenv().curTar = getClosest(cam.CFrame)
        local ssHeadPoint = cam:WorldToScreenPoint(curTar.Character.Head.Position)
        ssHeadPoint = Vector2.new(ssHeadPoint.X, ssHeadPoint.Y)
        if (ssHeadPoint - zz).Magnitude < AsuiSettings.Aimbot.FOV.Size then
                if AsuiSettings.Aimbot.Smoothing.Enabled then
                    workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(cam.CFrame.Position, curTar.Character.Head.Position), AsuiSettings.Aimbot.Smoothing.SmoothingValue)
                elseif not AsuiSettings.Aimbot.Smoothing.Enabled and OnScreen then
                    workspace.CurrentCamera.CFrame = CFrame.new(cam.CFrame.Position, curTar.Character.Head.Position)
                end
            end
        end
    end
 end)
 	
CFrameSpeedLoop = RunService.RenderStepped:Connect(function()
    if AsuiSettings.CFrameSpeed.Enabled then
 	    if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
		    for i = 1, AsuiSettings.CFrameSpeed.Speed do
			    game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection)
		    end
	    end
    end
end)
