function getClosestBuyPart()
  local character = game.Players.LocalPlayer.Character
  local hrp = character:FindFirstChild("HumanoidRootPart") or character:WaitForChild("HumanoidRootPart")
  if not (character or hrp) then return end
  
  local distance = math.huge
  local part
  
  for i,v in pairs(game.Workspace.Ignored.Shops:GetChildren()) do
    if v:IsA("Part") and table.find(v.Name, table) then
      local targetPart = v
      local mag = (hrp.Position - targetPart.Position).magnitude
      if mag < distance then
        distance = mag
        part = v
      end
    end
  end
end

RS.Heartbeat:Connect(function()
    
end)
