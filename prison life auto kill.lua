if getgenv().executed then return end getgenv().executed = true

for i,v in pairs(game:GetService('Workspace'):GetDescendants()) do
	if v:IsA('Seat') then
		v:Destroy()
	end
end

game:GetService('RunService').Heartbeat:Connect(function()
	if Settings.Enabled then
		local target = game:GetService("Players")[Settings.Victim]
	
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
	
		game:GetService("ReplicatedStorage").meleeEvent:FireServer(target)
		
		if Settings.KillSay.Enabled and target.Character and target.Character:FindFirstChild('Humanoid').Health == 0 then
			task.wait(Settings.KillSay.Cooldown)
			if not Settings.KillSay.Public then
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer('/w '..Settings.Victim..' '..Settings.KillSay.Message, 'All')
			else
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Settings.KillSay.Message, 'All')
			end
		end
	end
end)
