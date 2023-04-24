local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer

local get_closest_player = function()
    local dist = math.huge
    local cplayer = nil

    for i, player in ipairs(Players:GetPlayers()) do
        if player.Character and player ~= LocalPlayer then
            local pos = player.Character:GetBoundingBox().Position
            if pos then
                local mag = (pos - LocalPlayer.Character:GetBoundingBox().Position).Magnitude
                if mag < dist then
                    cplayer = player
                    dist = mag
                end
            end
        end
    end
    return cplayer
end

game:GetService('RunService').Heartbeat:Connect(function()
    local closest_player = get_closest_player()

    LocalPlayer.Character.HumanoidRootPart.Velocity = closest_player.Character.HumanoidRootPart.Position + closest_player.Character.HumanoidRootPart.Velocity - LocalPlayer.Character.HumanoidRootPart.Position
end)