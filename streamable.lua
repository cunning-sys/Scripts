hookfunction(game.Players.LocalPlayer.IsInGroup, function() return true end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nosssa/NossLock/main/AntiAimViewer"))()
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



task.spawn(function()
    while task.wait() do
        if DaHoodSettings.Resolver and Aiming.Selected ~= nil and (Aiming.Selected.Character)  then
            local oldVel = game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Velocity
            
            game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Velocity = Vector3.new(oldVel.X, -0, oldVel.Z)
        end 
    end
end)

local __index
__index = hookmetamethod(game, "__index", function(t, k)
    if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and Aiming.Check()) then
        local SelectedPart = Aiming.SelectedPart
        if (DaHoodSettings.SilentAim and (k == "Hit" or k == "Target")) then
            local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)
            
            return (k == "Hit" and Hit or SelectedPart)
        end
    end
    return __index(t, k)
end)
