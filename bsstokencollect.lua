local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local noclipE = false
local antifall = false

local function noclip()
    for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") and v.CanCollide == true then
            v.CanCollide = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        end
    end
end

local function moveto(obj, speed)
    local info =
        TweenInfo.new(
        ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - obj.Position).Magnitude) / speed,
        Enum.EasingStyle.Linear
    )
    local tween = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = obj})

    if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
        antifall = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
        antifall.Velocity = Vector3.new(0, 0, 0)
        noclipE = game:GetService("RunService").Stepped:Connect(noclip)
        tween:Play()
    end

    tween.Completed:Connect(
        function()
            antifall:Destroy()
            noclipE:Disconnect()
        end
    )

    tween.Completed:Wait() task.wait()
end
if not TokenLoop then
    getgenv().TokenLoop = RunService.RenderStepped:Connect(function()
        if getgenv().Enabled then
            for i,v in pairs(game:GetService("Workspace").Collectibles:GetChildren()) do
                if v.Name == "C" and v.Transparency ~= 0.699999988079071 then
                    if table.find(getgenv().Tokens, v.FrontDecal.Texture) then
                        moveto(v.CFrame + Vector3.new(0, 0, 0), tonumber(getgenv().Speed))
                    end
                end
            end
        end
    end)
else
    return
end
