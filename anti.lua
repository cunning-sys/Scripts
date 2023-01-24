getgenv().AntiEnabled = true

local classes = {'Part', 'BasePart', 'MeshPart'}

game:GetService('RunService').Heartbeat:Connect(function()
    if getgenv().AntiEnabled then
        for i,v in pairs (game.Players:GetPlayers()) then
            local char = v.Character
            if table.find(classes, char) then
                v.Velocity = Vector3.new(1, 1, 1) * (216^3)
            end
        end
    end
end)