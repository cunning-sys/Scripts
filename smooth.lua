getgenv().Ordium = {
    SilentAim = {
        Key = "C",
        Enabled = true,
        Prediction = 0.119,
        AimingType = "Closest Part", -- Closest Part, Default
        AimPart = "HumanoidRootPart",
        
        ChanceData = {UseChance = false, Chance = 100},
        FOVData = {Radius = 80, Visibility = true, Filled = false},

        AimingData = {CheckKnocked = true, CheckGrabbed = true, CheckWalls = true},

    },
    Tracing = {
        Key = 'Q',
        Enabled = true,
        Prediction = 8,
        AimPart = "HumanoidRootPart",
        TracingOptions = {AimingType = "Closest Part",  Smoothness = 0.11}
    }
}

local Ordium = {functions = {}}

local Vector2New, Cam, Mouse, client, find, Draw, Inset, players, RunService =
    Vector2.new,
    workspace.CurrentCamera,
    game.Players.LocalPlayer:GetMouse(),
    game.Players.LocalPlayer,
    table.find,
    Drawing.new,
    game:GetService("GuiService"):GetGuiInset().Y,
    game.Players, 
    game.RunService


local mf, rnew = math.floor, Random.new

local Targetting
local lockedCamTo

local Circle = Draw("Circle")
Circle.Thickness = 1
Circle.Transparency = 0.7
Circle.Color = Color3.new(1,1,1)

Ordium.functions.update_FOVs = function ()
    if not (Circle) then
        return Circle
    end
    Circle.Radius =  getgenv().Ordium.SilentAim.FOVData.Radius * 3
    Circle.Visible = getgenv().Ordium.SilentAim.FOVData.Visibility
    Circle.Filled = getgenv().Ordium.SilentAim.FOVData.Filled
    Circle.Position = Vector2New(Mouse.X, Mouse.Y + (Inset))
    return Circle
end

Ordium.functions.onKeyPress = function(inputObject)
    if inputObject.KeyCode == Enum.KeyCode[getgenv().Ordium.SilentAim.Key:upper()] then
        getgenv().Ordium.SilentAim.Enabled = not getgenv().Ordium.SilentAim.Enabled
    end

    if inputObject.KeyCode == Enum.KeyCode[getgenv().Ordium.Tracing.Key:upper()] then
        if not lockedCamTo then
            lockedCamTo = true
            lockedCamTo = Ordium.functions.returnClosestPlayer()
        else
            lockedCamTo = false
            lockedCamTo = nil
        end
    end
end

game:GetService("UserInputService").InputBegan:Connect(Ordium.functions.onKeyPress)

Ordium.functions.wallCheck = function(part, parent)
    if not getgenv().Ordium.SilentAim.AimingData.CheckWalls then
        return true
    end

    local char = game.Players.LocalPlayer.Character
    local campos = cam.CFrame.Position
    local _, onscreen = cam:WorldToViewportPoint(part.Position)

    if onscreen then
        local raycastparams = RaycastParams.new()
        raycastparams.FilterType = Enum.RaycastFilterType.Blacklist
        raycastparams.FilterDescendantsInstances = {char, cam}

        local ending = game:GetService('Workspace'):Raycast(campos, part.Position - campos, raycastparams)

        if ending then
            local hit = ending.Instance
            local visible = not hit or hit:IsDescendantOf(parent)

            return visible
        end
    end
    return false
end

Ordium.functions.pointDistance = function(part)
    local OnScreen = Cam.WorldToScreenPoint(Cam, part.Position)
    if OnScreen then
        return (Vector2New(OnScreen.X, OnScreen.Y) - Vector2New(Mouse.X, Mouse.Y)).Magnitude
    end
end

Ordium.functions.returnClosestPart = function(Character)
    local data = {
        dist = math.huge,
        part = nil,
        classes = {"Part", "BasePart", "MeshPart"}
    }
    if not (Character and Character:IsA("Model")) then
        return data.part
    end
    local children = Character:GetChildren()
    for _, child in pairs(children) do
        if table.find(data.classes, child.ClassName) then
            local dist = Ordium.functions.pointDistance(child)
            if dist < data.dist then
                data.part = child
                data.dist = dist
            end
        end
    end
    if Ordium.functions.wallCheck(data.part, data.part.Parent) then
        return data.part
    end
end



Ordium.functions.returnClosestPlayer = function (amount)
    local closestDistance = 1/0
    local closestPlayer = nil
    amount = amount or nil

    for _, player in pairs(players:GetPlayers()) do
        if (player.Character and player ~= client) then
            local charPosition = player.Character:GetBoundingBox().Position
            if charPosition then
                local viewPoint = Cam.WorldToViewportPoint(Cam, charPosition)
        
                if viewPoint then

                    local Magnitude = (Vector2New(Mouse.X, Mouse.Y) - Vector2New(viewPoint.X, viewPoint.Y)).Magnitude

                    if Circle.Radius > Magnitude and Magnitude < closestDistance and
                    Ordium.functions.wallCheck(player.Character.Head, player.Character) 
                    then
                        closestDistance = Magnitude
                        closestPlayer = player
                    end
                end
            end
        end
    end

    local Calc = mf(rnew().NextNumber(rnew(), 0, 1) * 100) / 100
    local Use = getgenv().Ordium.SilentAim.ChanceData.UseChance
    if Use and Calc <= mf(amount) / 100 then
        return Calc and closestPlayer
    else
        return closestPlayer
    end
end

Ordium.functions.returnClosestPoint = function (player)

end

Ordium.functions.setAimingType = function (player, type)
    local previousSilentAimPart = getgenv().Ordium.SilentAim.AimPart
    local previousTracingPart = getgenv().Ordium.Tracing.AimPart
    if type == "Closest Part" then
        getgenv().Ordium.SilentAim.AimPart = tostring(Ordium.functions.returnClosestPart(player.Character))
        getgenv().Ordium.Tracing.AimPart = tostring(Ordium.functions.returnClosestPart(player.Character))
    elseif type == "Closest Point" then
        Ordium.functions.returnClosestPoint(player.Character)
    elseif type == "Default" then
        getgenv().Ordium.SilentAim.AimPart = previousSilentAimPart
        getgenv().Ordium.Tracing.AimPart = previousTracingPart
    else
        getgenv().Ordium.SilentAim.AimPart = previousSilentAimPart
        getgenv().Ordium.Tracing.AimPart = previousTracingPart
    end
end

Ordium.functions.aimingCheck = function (player)
    if getgenv().Ordium.SilentAim.AimingData.CheckKnocked == true and player and player.Character then
        if player.Character.BodyEffects["K.O"].Value then
            return true
        end
    end
    if getgenv().Ordium.SilentAim.AimingData.CheckGrabbed == true and player and player.Character then
        if player.Character:FindFirstChild("GRABBING_CONSTRAINT") then
            return true
        end
    end
    return false
end

local lastRender = 0
local interpolation = 0.01

RunService.RenderStepped:Connect(function(delta)
    lastRender = lastRender + delta
    while lastRender > interpolation do
        lastRender = lastRender - interpolation
    end
    if getgenv().Ordium.Tracing.Enabled and lockedCamTo then
        local Vel =  lockedCamTo.Character[getgenv().Ordium.Tracing.AimPart].Velocity / getgenv().Ordium.Tracing.Prediction
        local Main = CFrame.new(Cam.CFrame.p, lockedCamTo.Character[getgenv().Ordium.Tracing.AimPart].Position + (Vel))
        Cam.CFrame = Cam.CFrame:Lerp(Main ,getgenv().Ordium.Tracing.TracingOptions.Smoothness , Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        Ordium.functions.setAimingType(lockedCamTo, getgenv().Ordium.Tracing.TracingOptions.AimingType) 
    end
end)

task.spawn(function ()
    while task.wait() do
        if Targetting then
            Ordium.functions.setAimingType(Targetting, getgenv().Ordium.SilentAim.AimingType)
        end
        Ordium.functions.update_FOVs()
    end
end)

local __index
__index = hookmetamethod(game,"__index", function(Obj, Property)
    if Obj:IsA("Mouse") and Property == "Hit" then
        Targetting = Ordium.functions.returnClosestPlayer(getgenv().Ordium.SilentAim.ChanceData.Chance)
        if Targetting and getgenv().Ordium.SilentAim.Enabled and not Ordium.functions.aimingCheck(Targetting) then
            local currentVelocity = Targetting.Character[getgenv().Ordium.SilentAim.AimPart].Velocity * getgenv().Ordium.SilentAim.Prediction
            local predictedPosition = Targetting.Character[getgenv().Ordium.SilentAim.AimPart].CFrame + (currentVelocity)
            return predictedPosition
        end
    end
    return __index(Obj, Property)
end)
