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
        if (Aiming.BulletRedirection and (k == "Hit" or k == "Target")) then
            local Offset = Aiming.Selected.Character.Humanoid.MoveDirection * (Aiming.Selected.Character.Humanoid.WalkSpeed * Aiming.Prediction)
            local Position = SelectedPart.CFrame.Position + Offset
            local lookVector = SelectedPart.CFrame.lookVector
            local Hit = CFrame.new(Position, Position + lookVector)
            
            return (k == "Hit" and Hit or SelectedPart)
        end
    end
    return __index(t, k)
end)
