repeat task.wait() until game:IsLoaded()

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

function ApplyFace(id)
    local _ = game:GetService("Players").LocalPlayer
    local _ = _.Character
    local _ = _:WaitForChild("Head")
    local _ = _:FindFirstChild("face") or _:FindFirstChild("Face")
    _.Texture = "rbxassetid://"..id
end

function Headless()
    local L_393_ = game.Players.LocalPlayer.Character
    local L_394_ = L_393_:WaitForChild("Head")
    local L_395_ = L_394_:WaitForChild("face")
    L_395_.Transparency = 1
    L_394_.Transparency = 1 
end

function Korblox()
    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").RigType == Enum.HumanoidRigType.R15 then
        local L_396_ = game.Players.LocalPlayer.Character
        local L_397_ = game.Players.LocalPlayer.Character
        local L_398_ = L_396_:WaitForChild("Head")
        local L_399_ = L_398_:WaitForChild("face")
        local L_400_ = L_397_:WaitForChild("RightFoot")
        local L_401_ = L_397_:WaitForChild("RightLowerLeg")
        local L_402_ = L_397_:WaitForChild("RightUpperLeg")
        local L_403_ = L_397_:WaitForChild("LeftFoot")
        local L_404_ = L_397_:WaitForChild("LeftLowerLeg")
        local L_405_ = L_397_:WaitForChild("LeftUpperLeg")
        L_400_.MeshId = "http://www.roblox.com/asset/?id=902942093"
        L_401_.MeshId = "http://www.roblox.com/asset/?id=902942093"
        L_402_.MeshId = "http://www.roblox.com/asset/?id=902942096"
        L_402_.TextureID = "http://roblox.com/asset/?id=902843398"
        L_400_.Transparency = 1
        L_401_.Transparency = 1
    elseif game.Players.LocalPlayer.Character:WaitForChild("Humanoid").RigType == Enum.HumanoidRigType.R6 then
        local CharMesh = Instance.new("CharacterMesh")
        CharMesh.Parent = game.Players.LocalPlayer.Character
        CharMesh.Name = "CharacterMesh"
        CharMesh.BodyPart = "RightLeg"
        CharMesh.MeshId = "101851696"
        CharMesh.OverlayTextureId = "101851254"
    end
end

function ApplyShirt(id)
    game.Players.LocalPlayer.Character:WaitForChild("Shirt").ShirtTemplate = "http://www.roblox.com/asset/?id="..id
end

function ApplyPants(id)
    game.Players.LocalPlayer.Character:WaitForChild("Pants").PantsTemplate = "http://www.roblox.com/asset/?id="..id
end

function DestroyAccessorys()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Accessory") then
            v:Destroy()
        end
    end
end

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    if Outfit == "Poisoned Purple Sparkle Time" then
        Headless()
        DestroyAccessorys()

        ApplyHat(9122019198, game.Players.LocalPlayer.Character)
        ApplyHat(5164293213, game.Players.LocalPlayer.Character)
        ApplyHat(63043890, game.Players.LocalPlayer.Character)
    
        ApplyShirt(7220961358)
        ApplyPants(7555209872)
    elseif Outfit == "Golden Rex" then
        Headless()
        DestroyAccessorys()
        
        ApplyHat(250395631, game.Players.LocalPlayer.Character)
        ApplyHat(193659065, game.Players.LocalPlayer.Character)
        
        ApplyShirt(2777321092)
        ApplyPants(2777333984)
    elseif Outfit == "Black Iron Emp" then
        Headless()
        DestroyAccessorys()
        
        ApplyHat(21070012, game.Players.LocalPlayer.Character)
        ApplyHat(398674411, game.Players.LocalPlayer.Character)
        ApplyHat(264611665, game.Players.LocalPlayer.Character)
        
        ApplyShirt(2251028059)
        ApplyPants(937485929)
    elseif Outfit == "Da Hoodian Purple Sparkle Time" then
        Headless()
        DestroyAccessorys()
        
        ApplyHat(63043890, game.Players.LocalPlayer.Character)
        ApplyHat(1125510, game.Players.LocalPlayer.Character)
        ApplyHat(878908562, game.Players.LocalPlayer.Character)
        ApplyHat(16630147, game.Players.LocalPlayer.Character)
        
        ApplyShirt(8322586067)
        ApplyPants(7189083559)
    elseif Outfit == "Black Iron Emo" then
        Headless()
        DestroyAccessorys()
        
        ApplyHat(10932896949, game.Players.LocalPlayer.Character)
        ApplyHat(10396849033, game.Players.LocalPlayer.Character)
        ApplyHat(439946249, game.Players.LocalPlayer.Character)
        ApplyHat(628771505, game.Players.LocalPlayer.Character)

        ApplyShirt(11240069098)
        ApplyPants(9985862332)
    elseif Outfit == "hello" then
        Headless()
        Korblox()
        DestroyAccessorys()
        
        ApplyHat(1029025, game.Players.LocalPlayer.Character)
        ApplyHat(1235488, game.Players.LocalPlayer.Character)
        ApplyHat(1125510, game.Players.LocalPlayer.Character)
        ApplyHat(71499623, game.Players.LocalPlayer.Character)

        ApplyShirt(12645147426)
        ApplyPants(12645168025)
    end
end)

if game:GetService('Players').LocalPlayer.Character then
    if Outfit == "Poisoned Purple Sparkle Time" then
        Headless()
        DestroyAccessorys()

        ApplyHat(9122019198, game.Players.LocalPlayer.Character)
        ApplyHat(5164293213, game.Players.LocalPlayer.Character)
        ApplyHat(63043890, game.Players.LocalPlayer.Character)
    
        ApplyShirt(7220961358)
        ApplyPants(7555209872)
    elseif Outfit == "Golden Rex" then
        Headless()
        DestroyAccessorys()
        
        ApplyHat(250395631, game.Players.LocalPlayer.Character)
        ApplyHat(193659065, game.Players.LocalPlayer.Character)
        
        ApplyShirt(2777321092)
        ApplyPants(2777333984)
    elseif Outfit == "Black Iron Emp" then
        Headless()
        DestroyAccessorys()
        
        ApplyHat(21070012, game.Players.LocalPlayer.Character)
        ApplyHat(398674411, game.Players.LocalPlayer.Character)
        ApplyHat(264611665, game.Players.LocalPlayer.Character)
        
        ApplyShirt(2251028059)
        ApplyPants(937485929)
    elseif Outfit == "Da Hoodian Purple Sparkle Time" then
        Headless()
        DestroyAccessorys()
        
        ApplyHat(63043890, game.Players.LocalPlayer.Character)
        ApplyHat(1125510, game.Players.LocalPlayer.Character)
        ApplyHat(878908562, game.Players.LocalPlayer.Character)
        ApplyHat(16630147, game.Players.LocalPlayer.Character)
        
        ApplyShirt(8322586067)
        ApplyPants(7189083559)
    elseif Outfit == "Black Iron Emo" then
        Headless()
        DestroyAccessorys()
        
        ApplyHat(10932896949, game.Players.LocalPlayer.Character)
        ApplyHat(10396849033, game.Players.LocalPlayer.Character)
        ApplyHat(439946249, game.Players.LocalPlayer.Character)
        ApplyHat(628771505, game.Players.LocalPlayer.Character)

        ApplyShirt(11240069098)
        ApplyPants(9985862332)
    elseif Outfit == "hello" then
        Headless()
        Korblox()
        DestroyAccessorys()
        
        ApplyHat(1029025, game.Players.LocalPlayer.Character)
        ApplyHat(1235488, game.Players.LocalPlayer.Character)
        ApplyHat(1125510, game.Players.LocalPlayer.Character)
        ApplyHat(71499623, game.Players.LocalPlayer.Character)
        ApplyHat(12577529187, game.Players.LocalPlayer.Character)
        ApplyHat(10789914680, game.Players.LocalPlayer.Character)
        ApplyHat(11853659267, game.Players.LocalPlayer.Character)
        ApplyHat(12499519674, game.Players.LocalPlayer.Character)

        ApplyShirt(12645147394)
        ApplyPants(12645168010)
    end
end
