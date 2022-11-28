local distanceCheck = true
local dist = 10
local check = true


function getClosestBuyPart()
  local character = game.Players.LocalPlayer.Character
  local hrp = character:FindFirstChild("HumanoidRootPart") or character:WaitForChild("HumanoidRootPart")
  if not (character or hrp) then return end
  
  local distance = if distanceCheck then return dist else return math.huge end
  local part
  
  for i,v in pairs(game.Workspace.Ignored.Shop:GetChildren()) do
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
    local target = getClosestBuyPart()
    if check and game.Players.LocalPlayer.Character:FindFirstChild("") or game.Players.LocalPlayer.Backpack:FindFirstChild("") then
      
end)
