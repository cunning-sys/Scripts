repeat task.wait() until game:IsLoaded()

getgenv().Avatar = {
	Rank = {
		Enabled = true,
		Emoji = '❤️'
	},
	
	Headless = false,
	SSHF = true,
	BIKOTN = true,
	BH = true,
    FIERY = false,
    FROZEN = false,
    POISON = false,
    BQOTN = false,
    SKOTN = false,
    PQOTN = false,
    RVS = false,
    VS = false
}

local Players = game:GetService('Players')
local EventFolder = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents

function Headless(character)
	local L_393_ = character
    local L_394_ = L_393_:WaitForChild("Head")
	if game.Players.LocalPlayer.Character:WaitForChild('Head'):FindFirstChild('face') then
		local L_395_ = L_394_:WaitForChild("face")
		L_395_.Transparency = 1
	end
    L_394_.Transparency = 1
end

function ApplyFace(id, character)
    local _ = character
    local _ = _:WaitForChild("Head")
    local _ = _:FindFirstChild("face") or _:FindFirstChild("Face")
    _.Texture = "http://www.roblox.com/asset?id="..id
end

function ApplyHat(id, character)
    function l(a, _)
        local b = Instance.new("Weld")
        b.Part0 = a.Parent
        b.Part1 = _.Parent
        b.C0 = a.CFrame
        b.C1 = _.CFrame
        b.Parent = a.Parent
        return b
    end
    local function _(c, e, _, b, d, a)
        local f = Instance.new("Weld")
        f.Name = c
        f.Part0 = _
        f.Part1 = b
        f.C0 = d
        f.C1 = a
        f.Parent = e
        return f
    end
    local function a(_, b)
        for _, _ in pairs(_:GetChildren()) do
            if _:IsA("Attachment") and _.Name == b then
                return _
            elseif not _:IsA("Accoutrement") and not _:IsA("Tool") then
                local _ = a(_, b)
                if _ then
                    return _
                end
            end
        end
    end
    function k(b, c)
        c.Parent = b
        local d = c:FindFirstChild("Handle")
        if d then
            d.CanCollide = false
            local e = d:FindFirstChildOfClass("Attachment")
            if e then
                local _ = a(b, e.Name)
                if _ then
                    l(_, e)
                end
            else
                local e = b:FindFirstChild("Head")
                if e then
                    local a = CFrame.new(0, 0.5, 0)
                    local b = c.AttachmentPoint
                 _("HeadWeld", e, e, d, a, b)
                end
            end
        end
    end
    local _ = id
    local _ = game:GetObjects("rbxassetid://" .. tostring(_))[1]
    k(character, _)
end

function onCharacterAdded(character)
	if Avatar.Rank.Enabled then
		local humanoid = character:WaitForChild('Humanoid')
		
		humanoid.DisplayName = '[' .. Avatar.Rank.Emoji .. '] ' .. humanoid.DisplayName
	end
	if Avatar.Headless then
		Headless(character)
	end
	if Avatar.SSHF then
        ApplyFace(494290547, character)
    end
    if Avatar.BIKOTN then
        ApplyHat(439946249, character)
    end
    if Avatar.BH then
        ApplyHat(628771505, character)
    end
    if Avatar.FIERY then
        ApplyHat(215718515, character)
    end
    if Avatar.FROZEN then
        ApplyHat(74891470, character)
    end
    if Avatar.POISON then
        ApplyHat(1744060292, character)
    end
    if Avatar.BQOTN then
        ApplyHat(553970606, character)
    end
    if Avatar.SKOTN then
        ApplyHat(439945661, character)
    end
    if Avatar.PQOTN then
        ApplyHat(553971858, character)
    end
    if Avatar.RVS then
        ApplyHat(1191135761, character)
    end
    if Avatar.VS then
        ApplyHat(1125510, character)
    end
end

function onPlayerAdded(player)
	if player.UserId == 1747702139 then
		if player.Character then
			onCharacterAdded(player.Character)
		end
		player.CharacterAdded:Connect(onCharacterAdded)
	end
end

EventFolder.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageObj)
    local Player = Players[messageObj.FromSpeaker]
    if Player.UserId == 1747702139 then
        if messageObj.Message == 'SSHF' then
            if not Avatar.SSHF then
                Avatar.SSHF = true
            elseif Avatar.SSHF then
                Avatar.SSHF = false
            end
        elseif messageObj.Message == 'BIKOTN' then
            if not Avatar.BIKOTN then
                Avatar.BIKOTN = true
            elseif Avatar.BIKOTN then
                Avatar.BIKOTN = false
            end
        elseif messageObj.Message == 'BH' then
            if not Avatar.BH then
                Avatar.BH = true
            elseif Avatar.BH then
                Avatar.BH = false
            end
        elseif messageObj.Message == 'Headless' then
            if not Avatar.Headless then
                Avatar.Headless = true
            elseif Avatar.Headless then
                Avatar.Headless = false
            end
        elseif messageObj.Message == 'BIKOTN' then
            if not Avatar.BIKOTN then
                Avatar.BIKOTN = true
            elseif Avatar.BIKOTN then
                Avatar.BIKOTN = false
            end
        elseif messageObj.Message == 'FIERY' then
            if not Avatar.FIERY then
                Avatar.FIERY = true
            elseif Avatar.FIERY then
                Avatar.FIERY = false
            end
        elseif messageObj.Message == 'FROZEN' then
            if not Avatar.FROZEN then
                Avatar.FROZEN = true
            elseif Avatar.FROZEN then
                Avatar.FROZEN = false
            end
        elseif messageObj.Message == 'POISON' then
            if not Avatar.POISON then
                Avatar.POISON = true
            elseif Avatar.POISON then
                Avatar.POISON = false
            end
        elseif messageObj.Message == 'BQOTN' then
            if not Avatar.BQOTN then
                Avatar.BQOTN = true
            elseif Avatar.BQOTN then
                Avatar.BQOTN = false
            end
        elseif messageObj.Message == 'SKOTN' then
            if not Avatar.SKOTN then
                Avatar.SKOTN = true
            elseif Avatar.SKOTN then
                Avatar.SKOTN = false
            end
        elseif messageObj.Message == 'PQOTN' then
            if not Avatar.PQOTN then
                Avatar.PQOTN = true
            elseif Avatar.PQOTN then
                Avatar.PQOTN = false
            end
        elseif messageObj.Message == 'RVS' then
            if not Avatar.RVS then
                Avatar.RVS = true
            elseif Avatar.RVS then
                Avatar.RVS = false
            end
        elseif messageObj.Message == 'VS' then
            if not Avatar.VS then
                Avatar.VS = true
            elseif Avatar.VS then
                Avatar.VS = false
            end
        end
    end
end)

for i,v in pairs(Players:GetPlayers()) do
	if v.UserId == 1747702139 then
        if v.Character then
            onCharacterAdded(v.Character)
        end
        v.CharacterAdded:Connect(onCharacterAdded)
    end
end
