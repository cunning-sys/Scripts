-- variables
local players = game:GetService("Players");
local localPlayer = players.LocalPlayer;
local rotation = CFrame.Angles(0, math.pi*0.5, 0);

-- globals
local fov = fov or 180;
local hitpart = hitpart or "Head";

-- temporaries
local closest;
local origin;
local direction;
local team;
local character;
local cframe;
local angle;

-- hooks
local old;
old = hookmetamethod(workspace, "__newindex", function(self, index, value)
    if index == "CFrame" and debug.info(3, "n") == "firebullet" then
        closest = fov;
        origin, direction = value.Position, value.LookVector;
        for _, player in next, players:GetPlayers() do
            character, team = player.Character, player.Team;
            if character and (not team or team ~= localPlayer.Team) then
                cframe = CFrame.new(origin, character[hitpart].Position) * rotation;
                angle = math.deg(math.acos(direction:Dot(cframe.LookVector)));
                if angle < closest then
                    value = cframe;
                    closest = angle;
                end
            end
        end
    end
    return old(self, index, value);
end);
