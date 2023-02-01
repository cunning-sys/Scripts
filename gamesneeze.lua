repeat wait() until game:IsLoaded()

game:GetService("CorePackages").Packages:Destroy()

assert(getrawmetatable)
grm = getrawmetatable(game)
setreadonly(grm, false)
old = grm.__namecall
grm.__namecall = newcclosure(function(self, ...)
    local args = {...}
    if tostring(args[1]) == "TeleportDetect" then
        return
    elseif tostring(args[1]) == "CHECKER_1" then
        return
    elseif tostring(args[1]) == "CHECKER" then
        return
    elseif tostring(args[1]) == "GUI_CHECK" then
        return
    elseif tostring(args[1]) == "OneMoreTime" then
        return
    elseif tostring(args[1]) == "checkingSPEED" then
        return
    elseif tostring(args[1]) == "BANREMOTE" then
        return
    elseif tostring(args[1]) == "PERMAIDBAN" then
        return
    elseif tostring(args[1]) == "KICKREMOTE" then
        return
    elseif tostring(args[1]) == "BR_KICKPC" then
        return
    elseif tostring(args[1]) == "BR_KICKMOBILE" then
        return
    end
    return old(self, ...)
end)

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local Workspace = game:GetService("Workspace")

local m_thread = task do setreadonly(m_thread, false)
    function m_thread.spawn_loop(p_time, p_callback)
        m_thread.spawn(function()
            while true do
                p_callback()
                m_thread.wait(p_time)
            end
        end)
    end
    setreadonly(m_thread, true)
end

local library, pointers = loadstring(game:HttpGet("https://pastebin.com/raw/XBK56zyt"))() do

local window = library:New({name = "Shambles" ..   " - "..game.Players.LocalPlayer.DisplayName.." - " .. "("..game.Players.LocalPlayer.UserId..")", size = Vector2.new(542, 642), Accent = Color3.fromRGB(255,135,255)})

local legitbot = window:Page({name = "Aiming", size = 72}) 

local rage = window:Page({name = "Rage", size = 72}) 

local players = window:Page({name = "Players", size = 72})

local visuals = window:Page({name = "Visuals", size = 72})

local misc = window:Page({name = "Misc", size = 72})

local exploits = window:Page({name = "Settings", size = 72})

local legitbot_main = legitbot:Section({name = "Aim Assist"})

local legitbot_toggle = legitbot_main:Toggle({name = "Enabled", Default = false, pointer = "aimbot_toggle"}):Keybind({callback = function(input, active) print(active) end})
legitbot_main:Keybind({name = "", mode = "Always", Default_Keybind = 'L', pointer ="legitbot_mainkeybind"})

legitbot_main:Slider({name = "Field Of View", min = 0, max = 100.5, Default = 50, suffix = "%"})

legitbot_main:Dropdown({name = " Smoothing Type", options = {"Dynamic", "Quint", "Soft", "Flow", "Linear"}, Default = "Dynamic"})

legitbot_main:Slider({name = "Horizontal Smoothing", min = 0, max = 100, Default = 50, suffix = "%"})

legitbot_main:Slider({name = "Vertical Smoothing", min = 0, max = 100, Default = 50, suffix = "%"})

legitbot_main:Multibox({name = "Aim Assist Checks", min = 0, options = {"Team Check", "Wall Check", "Visible", "Alive"}, Default = {"Team Check", "Wall Check", "Alive"}})
    
legitbot_main:Multibox({name = "Hit Boxes", min = 0, options = {"Head", "UpperTorso", "Torso", "Penis", "Arms", "Legs"}, Default = {"Head", "Torso", "Arms", "Legs"}})
    
legitbot_main:Dropdown({name = "Hitscan Type", options = {"Mouse","Target", "Soft", "Camera"}, Default = "Mouse"})
    
legitbot_main:Dropdown({name = "Wall Check Origin", options = {"Target","Camera", "Mouse", "Silent"}, Default = "Sine"})
    
local legitbot_toggle = legitbot_main:Toggle({name = "Readjustment", Default = true, pointer = "Readjustment_toggle"}):Keybind({callback = function(input, active) print(active) end})
    
    legitbot_main:Slider({name = "Deadzone", min = 0, max = 100.5, Default = 50, suffix = "%"})
        legitbot_main:Slider({name = "Stutter", min = 0, max = 100.5, Default = 25, suffix = "t"})
        local legitbot_toggle = legitbot_main:Toggle({name = "Humaniser", Default = false, pointer = "humaniserscale_toggle"})
        legitbot_main:Slider({name = "Humaniser Scale", min = 0, max = 100.5, Default = 25, suffix = "t"})

local legitbot_main = legitbot:Section({ side = "left"})

        local legitbot_toggle = legitbot_main:Toggle({name = "Weapon RCS", Default = false, pointer = "humaniserscale_toggle"})

        legitbot_main:Slider({name = "Recoil Control X", min = 0, max = 100, Default = 25, suffix = "°"})





    
        local players_enemies, players_friendlies, players_local = players:MultiSection({sections = {"Enemies", "Friendlies", "Local" }, side = "left", size = 470})
        
        local legitbot_main = legitbot:Section({name = "Trigger Bot", side = "right"})

            local legitbot_toggle = legitbot_main:Toggle({name = "Enabled", Default = false, pointer = "Enabled_toggle"}):Keybind({callback = function(input, active) print(active) end})
            
                legitbot_main:Slider({name = "Delay", min = 0, max = 500.5, Default = 250.5, suffix = "ms"})

               legitbot_main:Slider({name = "Interval", min = 0, max = 1000, Default = 460, suffix = "ms"})

    legitbot_main:Multibox({name = "Aim Assist Checks", min = 0, options = {"Team Check", "Wall Check", "Visible", "Alive"}, Default = {"Team Check", "Wall Check", "Visible"}})

    legitbot_main:Multibox({name = "Hit Boxes", min = 0, options = {"Head", "UpperTorso", "Torso", "Penis", "Arms", "Legs"}, Default = {"Head", "Torso", "Arms", "Legs"}})

            legitbot_main:Dropdown({name = "Wall Check Origin", options = {"Target","Camera", "Soft", "Sine"}, Default = "Camera"})

                local legitbot_main = legitbot:Section({name = "Misc", side = "right"})

                    local legitbot_toggle = legitbot_main:Toggle({name = "Cursor Offset", Default = false, pointer = "cursoroffset_toggle"})

                       legitbot_main:Slider({name = "", min = 0, max = 100, Default = 50, suffix = "px"})
               legitbot_main:Slider({name = "", min = 0, max = 100, Default = 50, suffix = "px"})

        
        
        players_enemies:Toggle({name = "Enabled", Default = false}) --visuals_enemies:Toggle({name = "Name", Default = false})

players_enemies:Toggle({name = "Name", Default = false}):Colorpicker({Default = Color3.fromRGB(255,0,0), transparency = 0.2})
        
players_enemies:Toggle({name = "Bounding Box", Default = false}):Colorpicker({Default = Color3.fromRGB(169, 83, 245), transparency = 0.2})
       
       players_enemies:Toggle({name = "Health Number", Default = false}):Colorpicker({Default = Color3.fromRGB(0,255,0), transparency = 0.2})
       
        players_enemies:Toggle({name = "Health Number", Default = false}):Colorpicker({Default = Color3.fromRGB(70,130,180), transparency = 0.2})
        
        players_enemies:Toggle({name = "Head Dot", Default = false}):Colorpicker({Default = Color3.fromRGB(149, 83, 245), transparency = 0.2})
                players_enemies:Toggle({name = "Skeleton", Default = false}):Colorpicker({Default = Color3.fromRGB(189, 182, 240), transparency = 0.2})

        players_enemies:Toggle({name = "Offscreen Arrows", Default = false}):Colorpicker({Default = Color3.fromRGB(189, 182, 240), transparency = 0.2})
        
            players_enemies:Slider({name = "Arrow Size", min = 0, max = 100, Default = 10, Decimals = 0.1, suffix = "°"})
                        
            players_enemies:Slider({name = "Arrow Position", min = 0, max = 100, Default = 25, Decimals = 0.1, suffix = "°"})
            
                players_enemies:Multibox({name = "Arrow Types", min = 0, options = {"Name","Health Bar", "Outline", "Filled","Blinking"}, Default = {"Name","Health Bar"}})
                
                        players_enemies:Toggle({name = "Tool", Default = false}):Colorpicker({Default = Color3.fromRGB(255,255,255), transparency = 0.3})
                        
                                players_enemies:Toggle({name = "Distance", Default = false}):Colorpicker({Default = Color3.fromRGB(255,255,255), transparency = 0.3})
                                
                                        players_enemies:Toggle({name = "Flags", Default = false}):Colorpicker({Default = Color3.fromRGB(255,255,255), transparency = 0.3})
                                        
            players_enemies:Multibox({name = "Flag Types", min = 0, options = {"Display Name","Desynced", "Name", "Synced","Velocity"}, Default = {"Display Name","Desynced"}})
            
                                        players_enemies:Toggle({name = "Chams", Default = false}):Colorpicker({Default = Color3.fromRGB(0,191,255), transparency = 0.3})

            players_enemies:Multibox({name = "Cham Types", min = 0, options = {"Inline","Outline", "Body", "Hologram"}, Default = {"Inline","Outline"}})
            
            
            
            
            
            
            
            
            
            players_friendlies:Toggle({name = "Enabled", Default = false}) --visuals_enemies:Toggle({name = "Name", Default = false})

players_friendlies:Toggle({name = "Name", Default = false}):Colorpicker({Default = Color3.fromRGB(0,255,0), transparency = 0.2})
        
players_friendlies:Toggle({name = "Bounding Box", Default = false}):Colorpicker({Default = Color3.fromRGB(169, 83, 245), transparency = 0.2})
       
       players_friendlies:Toggle({name = "Health Number", Default = false}):Colorpicker({Default = Color3.fromRGB(0,255,0), transparency = 0.2})
       
        players_friendlies:Toggle({name = "Health Number", Default = false}):Colorpicker({Default = Color3.fromRGB(70,130,180), transparency = 0.2})
        
        players_friendlies:Toggle({name = "Head Dot", Default = false, Decimals = 0.1, suffix = "°"}):Colorpicker({Default = Color3.fromRGB(149, 83, 245), transparency = 0.2}) 
                players_friendlies:Toggle({name = "Skeleton", Default = false, Decimals = 0.1, suffix = "°"}):Colorpicker({Default = Color3.fromRGB(22, 83, 245), transparency = 0.2}) 

        players_friendlies:Toggle({name = "Offscreen Arrows", Default = false, Decimals = 0.1, suffix = "°"}):Colorpicker({Default = Color3.fromRGB(149, 83, 245), transparency = 0.2}) 
        
            players_friendlies:Slider({name = "Arrow Size", min = 0, max = 100, Default = 10, suffix ="*"})
                        
            players_friendlies:Slider({name = "Arrow Position", min = 0, max = 100, Default = 25,suffix = "*"})
            
                players_friendlies:Multibox({name = "Arrow Types", min = 0, options = {"Name","Health Bar", "Outline", "Filled","Blinking"}, Default = {"Name","Health Bar"}})
                
                        players_friendlies:Toggle({name = "Tool", Default = false}):Colorpicker({Default = Color3.fromRGB(255,255,255), transparency = 0.3})
                        
                                players_friendlies:Toggle({name = "Distance", Default = false}):Colorpicker({Default = Color3.fromRGB(255,255,255), transparency = 0.3})
                                
                                        players_friendlies:Toggle({name = "Flags", Default = false}):Colorpicker({Default = Color3.fromRGB(255,255,255), transparency = 0.3})
                                        
            players_friendlies:Multibox({name = "Flag Types", min = 0, options = {"Display Name","Desynced", "Name", "Synced","Velocity"}, Default = {"Display Name","Desynced"}})
            
                                                    players_friendlies:Toggle({name = "Chams", Default = false}):Colorpicker({Default = Color3.fromRGB(0,191,255), transparency = 0.3})


            players_friendlies:Multibox({name = "Cham Types", min = 0, options = {"Inline","Outline", "Body", "Hologram"}, Default = {"Inline","Outline"}})
            
            
            
            
            
            
            
            players_local:Toggle({name = "Enabled", Default = false}) --visuals_enemies:Toggle({name = "Name", Default = false})

players_local:Toggle({name = "Name", Default = false}):Colorpicker({Default = Color3.fromRGB(0,191,255), transparency = 0.2})
        
players_local:Toggle({name = "Bounding Box", Default = false}):Colorpicker({Default = Color3.fromRGB(169, 83, 245), transparency = 0.2})
       
       players_local:Toggle({name = "Health Number", Default = false}):Colorpicker({Default = Color3.fromRGB(0,255,0), transparency = 0.2})
       
        players_local:Toggle({name = "Health Number", Default = false}):Colorpicker({Default = Color3.fromRGB(70,130,180), transparency = 0.2})
        
        players_local:Toggle({name = "Head Dot", Default = false}):Colorpicker({Default = Color3.fromRGB(149, 83, 245), transparency = 0.2})
               
                               players_local:Toggle({name = "Skeleton", Default = false}):Colorpicker({Default = Color3.fromRGB(189, 182, 23), transparency = 0.2})

                players_local:Toggle({name = "Offscreen Arrows", Default = false}):Colorpicker({Default = Color3.fromRGB(189, 182, 240), transparency = 0.2})


            players_local:Slider({name = "Arrow Size", min = 0, max = 100, Default = 10, Decimals = 0.1, suffix = "°"})
                        
            players_local:Slider({name = "Arrow Position", min = 0, max = 100, Default = 25, Decimals = 0.1, suffix = "°"})
            
                players_local:Multibox({name = "Arrow Types", min = 0, options = {"Name","Health Bar", "Outline", "Filled","Blinking"}, Default = {"Name","Health Bar"}})
                
                        players_local:Toggle({name = "Tool", Default = false}):Colorpicker({Default = Color3.fromRGB(255,255,255), transparency = 0.3})
                        
                                players_local:Toggle({name = "Distance", Default = false}):Colorpicker({Default = Color3.fromRGB(255,255,255), transparency = 0.3})
                                
                                        players_local:Toggle({name = "Flags", Default = false}):Colorpicker({Default = Color3.fromRGB(255,255,255), transparency = 0.3})
                                        
            players_local:Multibox({name = "Flag Types", min = 0, options = {"Display Name","Desynced", "Name", "Synced","Velocity"}, Default = {"Display Name","Desynced"}})
            
                                                    players_local:Toggle({name = "Chams", Default = false}):Colorpicker({Default = Color3.fromRGB(0,191,255), transparency = 0.3})


            players_local:Multibox({name = "Cham Types", min = 0, options = {"Inline","Outline", "Body", "Hologram"}, Default = {"Inline","Outline"}})
            
            
            
            
            
            
            
            
        
            
            local players_main = players:Section({name = "Colors", side = "right"})
            
               players_main:Toggle({name = "Highlight Friendlies", Default = false}):Colorpicker({Default = Color3.fromRGB(0,255,0), transparency = 0.1})
                
                               players_main:Toggle({name = "Highlight Priorities", Default = false}):Colorpicker({Default = Color3.fromRGB(0,191,255), transparency = 0.1})


                players_main:Toggle({name = "Highlight Victim", Default = false}):Colorpicker({Default = Color3.fromRGB(255,0,0), transparency = 0.1})
                
local players_one = players:Section({name = "Extra", side = "right"})                    
  players_one:Toggle({name = "Disable Layered Clothing", Default = false})
                players_one:Toggle({name = "Disable Player Accessory", Default = false})
                players_one:Toggle({name = "Disable Player Momentum", Default = false})
                players_one:Toggle({name = "Player Transparency", Default = false})
               players_one:Slider({name = "Transparency Amount", min = 0, max = 100, Default = 25, suffix = "%"})

                --playersone_toggle = players_one:Toggle({name = "Skeleton Only", Default = false})

                           local  players_two, players_misc = players:MultiSection({sections = {"Camera Visuals","Misc" }, side = "right"})                 
               players_two:Toggle({name = "No Camera Bob", Default = false})
                players_two:Toggle({name = "No Sway", Default = false})
                 players_two:Toggle({name = "Reduce Weapon Recoil", Default = false})
                players_two:Slider({name = "Camera Recoil Reduction", min = 0, max = 100, Default = 20, suffix = "%"})
local players_toggle = players_misc:Toggle({name = "Crosshair color", Default = false}):Colorpicker({Default = Color3.fromRGB(0,0,20), transparency = 0.1})
                    local players_toggle = players_misc:Toggle({name = "Laser Pointer", Default = false}):Colorpicker({Default = Color3.fromRGB(255,255,255), transparency = 0})
                    local players_toggle = players_misc:Toggle({name = "Ragdoll Chams", Default = false}):Colorpicker({Default = Color3.fromRGB(255,255,255), transparency = 0})
        local players_toggle = players_misc:Dropdown({name = "Ragdoll Material", options = {"Plastic","Ghost","Neon","Foil","Glass"}, Default = "Neon"})
                    local players_toggle = players_misc:Toggle({name = "Bullet Tracers", Default = false}):Colorpicker({Default = Color3.fromRGB(255,0,0), transparency = 0})

                    
                  local players_three = players:Section({name = "Dropped ESP", side = "right"})                    
                players_three:Toggle({name = "Weapon Name", Default = false}):Colorpicker({Default = Color3.fromRGB(0,191,255), transparency = 0.1})
                 players_three:Toggle({name = "Dropped Weapon Chams", Default = false}):Colorpicker({Default = Color3.fromRGB(191,0,255), transparency = 0.1})
                 players_three:Toggle({name = "Gernade Warning", Default = false}):Colorpicker({Default = Color3.fromRGB(0,255,0), transparency = 0.1})
                 players_three:Toggle({name = "Gernade ESP", Default = false}):Colorpicker({Default = Color3.fromRGB(255,23,255), transparency = 0.1})
                 players_three:Toggle({name = "Flashbang Warning", Default = false}):Colorpicker({Default = Color3.fromRGB(255,0,0), transparency = 0.1})
                 players_three:Toggle({name = "Flashbang ESP", Default = false}):Colorpicker({Default = Color3.fromRGB(255,255,255), transparency = 0.1})
                  local players_more = players:Section({name = "More", side = "left"})                    
        players_more:Dropdown({name = " ESP Text Case", options = {"MonoSpace","Plex","SourceSans","Normal"}, Default = "Plex"})
                                      
                


                               
                             
                             
                             
                             
                                local visuals_lighting, visuals_darkness = visuals:MultiSection({sections = {"Lighting                         ", }, side = "left", size = 555})

                    local visuals_toggle = visuals_lighting:Toggle({name = "Ambient", Default = false, pointer = "ambient_toggle"}):Colorpicker({Default = Color3.fromRGB(189, 182, 240), transparency = 0.1})

                              local visuals_toggle = visuals_lighting:Toggle({name = "Brightness", Default = false,pointer = "brightness_toggle"}):Colorpicker({Default = Color3.fromRGB(189, 182, 240), transparency = 0.1})

                    visuals_lighting:Slider({name = "", min = 0, max = 25, Default = 10, suffix = "%"})
                    
               local visuals_toggle = visuals_lighting:Toggle({name = "Clock Time", Default = false, pointer = "clocktime_toggle"})

                        visuals_lighting:Slider({name = "", min = 0, max = 24, Default = 12, suffix = "hr"})
                        
                        local visuals_toggle = visuals_lighting:Toggle({name = "Color Shift", Default = false, pointer = "colorshift_toggle"}):Colorpicker({Default = Color3.fromRGB(66,44,144), transparency = 0.1})
                        
                 local visuals_toggle = visuals_lighting:Toggle({name = "Exposure", Default = false, pointer = "exposure_toggle"})
                 
                        visuals_lighting:Slider({name = "", min = 0, max = 10, Default = 3, suffix = "°"})

                 local visuals_toggle = visuals_lighting:Toggle({name = "Fog", Default = false, pointer = "fog_toggle"})

              visuals_lighting:Slider({name = "Fog End", min = 0, max = 5000, Default = 3500})

visuals_lighting:Slider({name = "Fog Start", min = 0, max = 5000, Default = 3500})

local visuals_main = visuals:Section({name = "Camera", side = "right"})

local visuals_toggle = visuals_main:Toggle({name = "Field Of View", Default = false, pointer = "camera_toggle"}):Colorpicker({Default = Color3.fromRGB(244,244,244), transparency = 0.1})

visuals_main:Slider({name = "", min = 0, max = 120, Default = 40, suffix = "°"})
        local visuals_maincursor, visuals_main1 = visuals:MultiSection({sections = {"Cursor                           " }, side = "right", size = 480.2})

--local visuals_main = visuals:Section({name = "Cursor", side = "right", size = 555})

local visuals_toggle = visuals_maincursor:Toggle({name = "Cursor", Default = false, pointer = "cursor_toggle"}):Colorpicker({Default = Color3.fromRGB(204,156,76), transparency = 0.1})

visuals_maincursor:Slider({name = "Size", min = 0, max = 30, Default = 15, suffix = "°"})

local visuals_toggle = visuals_maincursor:Toggle({name = "Dynamic Size", Default = false, pointer = "dynamic_toggle"})

visuals_maincursor:Slider({name = "Gap", min = 0, max = 15, Default = 5, suffix = "°"})

local visuals_toggle = visuals_maincursor:Toggle({name = "Spinning", Default = false, pointer = "spinning_toggle"})

visuals_maincursor:Slider({name = "", min = 0, max = 50, Default = 30, suffix = "°"})

local visuals_toggle = visuals_maincursor:Toggle({name = "Follow Mouse", Default = false, pointer = "followmouse_toggle"})

visuals_maincursor:Dropdown({name = "Easing Style",options = {"Off","Linear", "Cubic", "Quad","Quart","Quint","Sine","Exponential","Back","Bounce","Elastic","Circular"}, Default = "Soft"})











        local rage_prioritize, rage_cdesync, rage_ivdesync = rage:MultiSection({sections = {"Target", "C-Desync","Iv-Desync" }, side = "left", size = 555})
        
        rage_prioritize:Toggle({name = "Target-Bot", Default = false}):Keybind({callback = function(input, active) print(active) end})
        
        rage_prioritize:Dropdown({name = "Type",options = {"Silent","Target","Camera"}, Default = "None"})

            rage_prioritize:Multibox({name = "Hit Boxes", min = 0, options = {"None","Head", "UpperTorso", "Torso", "Penis", "Arms", "Legs"}, Default = {"None"}})

            rage_prioritize:Slider({name = "Field Of View Range", min = 0, max = 100.0, Default = 20.0, suffix = "°"})

            rage_prioritize:Slider({name = "DeadZone", min = 0, max = 100.0, Default = 20.0, suffix = "%"})

            rage_prioritize:Toggle({name = "Humanize", Default = false})

            rage_prioritize:Slider({name = "Humanization", min = 0, max = 100.0, Default = 20.0, suffix = "°"})

            rage_prioritize:Toggle({name = "Visible Check", Default = false})

            rage_prioritize:Toggle({name = "On Key", Default = false})


            rage_prioritize:Toggle({name = "Visualize Field Of View", Default = false})

            rage_prioritize:Toggle({name = "Fill Field Of View", Default = false})

            rage_prioritize:Slider({name = "Field Of View Sides", min = 0, max = 100.0, Default = 20.0, suffix = "°"})

            rage_prioritize:Toggle({name = "Field Of View Color", Default = false}):Colorpicker({Default = Color3.fromRGB(66,44,144), transparency = 0.1})

            rage_prioritize:Toggle({name = "FOV Mini Stats", Default = false})

            rage_prioritize:Toggle({name = "Victim Tracer Prioritize", Default = false})
            rage_prioritize:Slider({name = "Tracer Transparency", min = 0, max = 100.0, Default = 70.0, suffix = "°"})



                    rage_prioritize:Toggle({name = "Tracer Color", Default = false}):Colorpicker({Default = Color3.fromRGB(60,44,140), transparency = 0.1})

            rage_prioritize:Toggle({name = "Victim Dot", Default = false})
            
                        rage_prioritize:Slider({name = "Dot Transparency", min = 0, max = 100.0, Default = 70.0, suffix = "°"})

            
            rage_prioritize:Toggle({name = "Dot Color", Default = false}):Colorpicker({Default = Color3.fromRGB(0,191,255), transparency = 0.1})
        
        
        
        
        
        
        
        
        
            rage_cdesync:Toggle({name = "Enable", Default = false}):Keybind({callback = function(input, active) print(active) end})
              
            rage_cdesync:Dropdown({name = "Method",options = {"None","Eclipse","Octel", "Azure", "Solix"}, Default = "None"})
              
            rage_cdesync:Toggle({name = "Lag Character", Default = false}):Keybind({callback = function(input, active) print(active) end})
            
            rage_cdesync:Dropdown({name = "Method",options = {"None","Network","Anchor Character", "Client Freeze", "Server Freeze","Force Teleport"}, Default = "None"})
            
            rage_cdesync:Slider({name = "Anchor Interval", min = 0, max = 100.5, Default = 30.5, suffix = "%"})

            rage_cdesync:Slider({name = "Networking Interval", min = 0, max = 100.5, Default = 60.5, suffix = "%"})
            
            rage_cdesync:Toggle({name = "Freeze Server Delay", Default = false}):Keybind({callback = function(input, active) print(active) end})

            rage_cdesync:Slider({name = "", min = 0, max = 50, Default = 25, suffix = "ms"})
            rage_cdesync:Slider({name = "", min = 0, max = 50, Default = 20, suffix = "ms"})
            
            rage_cdesync:Toggle({name = "Auto Switch Visualize", Default = false}):Colorpicker({Default = Color3.fromRGB(1,191,255), transparency = 0.1})

            rage_cdesync:Toggle({name = "Axis Redirection", Default = false})
            rage_cdesync:Slider({name = "", min = 0, max = 500, Default = 200, suffix = "x"})
            rage_cdesync:Slider({name = "", min = 0, max = 500, Default = 300, suffix = "y"})
            rage_cdesync:Slider({name = "", min = 0, max = 500, Default = 400, suffix = "z"})

            rage_cdesync:Toggle({name = "Cap Desync", Default = false})

            rage_cdesync:Slider({name = "Desync Capped", min = 0, max = 100.5, Default = 20.5, suffix = "%"})
            
            
            rage_cdesync:Toggle({name = "Visualize Velocity", Default = false})
            
                        rage_cdesync:Slider({name = "Desync Capped", min = 0, max = 100.5, Default = 80.5, suffix = "%"})
                        rage_cdesync:Slider({name = "", min = 0, max = 100.5, Default = 60.5, Decimals = 0.001})
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        rage_ivdesync:Toggle({name = "Enable", Default = false}):Keybind({callback = function(input, active) print(active) end})
              
                                      rage_ivdesync:Toggle({name = "Visualize Position", Default = false}):Colorpicker({Default = Color3.fromRGB(255,156,76), transparency = 0.1})

            rage_ivdesync:Dropdown({name = "Method",options = {"None","Toggle","Hold Toggle", "When Moving"}, Default = "None"})
              
            rage_ivdesync:Toggle({name = "Fake Velocity Packets", Default = false, side =left})
            rage_ivdesync:Toggle({name = "Visualize Position", Default = false}):Colorpicker({Default = Color3.fromRGB(255,255,244), transparency = 0.1})

            rage_ivdesync:Dropdown({name = "Type",options = {"None","Max Velocity","Zero Velocity","Velocity Multiplier","Custom Velocity"}, Default = "None"})
                        
                        
            rage_ivdesync:Slider({name = "Power", min = 0, max = 200, Default = 60, Decimals = 0.001})
                        rage_ivdesync:Slider({name = "Velocity_X ", min = 0, max = 100, Default = 60, Decimals = 0.001})
            rage_ivdesync:Slider({name = "Velocity_Y", min = 0, max = 100, Default = 60, Decimals = 0.001})
            rage_ivdesync:Slider({name = "Velocity_Z", min = 0, max = 100, Default = 60, Decimals = 0.001})
            
                        rage_ivdesync:Slider({name = "Multiplier", min = 0, max = 10, Default = 5})

            rage_ivdesync:Toggle({name = "Fake Lag", Default = false})
            
                        rage_ivdesync:Slider({name = "Power", min = 0, max = 5, Default = 1})
                        
                        rage_ivdesync:Toggle({name = "Real Lag", Default = false})
            
                        rage_ivdesync:Slider({name = "Power", min = 0, max = 5, Default = 1})
                        
                        rage_ivdesync:Toggle({name = "Break Lock", Default = false})
            
                        rage_ivdesync:Slider({name = "Power", min = 0, max = 10, Default = 5})
                        
                        rage_ivdesync:Toggle({name = "Walkable Desync", Default = false})
                        
                        rage_ivdesync:Slider({name = "Power", min = 0, max = 16384, Default = 8100, Decimals = 0.1})












local rage_main = rage:Section({name = "Fake CFrame Packets", side = "right"})
rage_main:Toggle({name = "Enable", Default = false})

rage_main:Toggle({name = "Visualize", Default = false}):Colorpicker({Default = Color3.fromRGB(255,156,76), transparency = 0.1})

            rage_main:Dropdown({name = "Type",options = {"None","Random","Custom","SwipeX","MsQQ", "Up And Down","Custom Velocity"}, Default = "None"})
                            
                            rage_main:Slider({name = "Custom_X", min = 0, max = 50, Default = 20})
                            
                             rage_main:Slider({name = "Custom_Y", min = 0, max = 50, Default = 20})

                            rage_main:Slider({name = "Custom_Z", min = 0, max = 50, Default = 20})

                            rage_main:Slider({name = "Random Range", min = 0, max = 100, Default = 30})

                            rage_main:Slider({name = "MsQQ", min = 0, max = 50, Default = 30})

                            rage_main:Slider({name = "Up And Down Range", min = 0, max = 50, Default = 10})

                            rage_main:Slider({name = "SwipeX Range", min = 0, max = 50, Default = 20})
                            
                            rage_main:Dropdown({name = "Angle Type",options = {"Nothing","Random","Custom"}, Default = "Nothing"})

                            rage_main:Slider({name = "Angle_X", min = 0, max = 10, Default = 1})

                            rage_main:Slider({name = "Angle_Y", min = 0, max = 10, Default = 1})

                            rage_main:Slider({name = "Angle_Z", min = 0, max = 10, Default = 1})

local rage_main = rage:Section({name = "Slow Data Requests", side = "right"})

rage_main:Toggle({name = "Enable", Default = false})

        rage_main:Dropdown({name = "Method",options = {"None","Input","Retrieve","Output","Render..."}, Default = "Render..."})
        
                                    rage_main:Slider({name = "Power", min = 0, max = 5, Default = 3})











local misc_main = misc:Section({name = "Client Desync"})
local misc_toggle = misc_main:Toggle({name = "Enabled", Default = false, pointer = "clientdesync_toggle"}):Keybind({callback = function(input, active) print(active) end}) --pointer name

misc_main:Slider({name = "Speed", min = 0, max = 10, Default = 3, Decimals = 0.001, suffix = "°"})

misc_main:Dropdown({name = "Position Method", options = {"Off","On","Regular","Custom", "Arbitrarily","Facing","Server Side"}, Default = "Off"})

misc_main:Dropdown({name = "Turn Method", options = {"Off","On","Slow","Fast","Slower", "Faster","Slowest", "Fastest","No Turn"}, Default = "Off"})

misc_main:Dropdown({name = "Turn Smoothing", options = {"Off","On","Constant", "Inconstant", "Opposite"}, Default = "Off"})

misc_main:Dropdown({name = "Easing Style", options = {"Off","On","Back","Front","Auto", "Facing"}, Default = "Off"})

misc_main:Dropdown({name = "Easing Direction", options = {"Off","Inwards","Outwards", "Bounce"}, Default = "Off"})

misc_main:Dropdown({name = "Velocity Method", options = {"Off","Amplification","Mouse","Custom", "arbitrarily", "Up","Down","0,0,0"}, Default = "Off"})

misc_main:Slider({name = "Velocity capability", min = 0, max = 100, Default = 25})

misc_main:Label({name = " Turn on Visualisation in Players,\n  Local Player to see the Desync."}) --aimbot_main:Label({name = "Some of the features\nhere, May be unsafe.\nUse with caution."})

local misc_main = misc:Section({name = "Chat"})

local misc_toggle = misc_main:Toggle({name = "Chat Spam", Default = false, pointer = "chatspam_toggle"}):Keybind({callback = function(input, active) print(active) end})

misc_main:Slider({name = "Delay", min = 0, max = 10, Default = 2, suffix = "s"})

misc_main:Dropdown({name = "Chat Spam Type", options = {"Atlanta","Troll","Toxic","Custom"}, Default = "Atlanta"})
local misc_toggle = misc_main:Toggle({name = "Multiple", Default = false, pointer = "chatspams_toggle"}):Keybind({callback = function(input, active) print(active) end}) 
local misc_toggle = misc_main:Toggle({name = "Emojis", Default = false, pointer = "chatspams_toggle"}):Keybind({callback = function(input, active) print(active) end}) 
local misc_toggle = misc_main:Toggle({name = "Symbols", Default = false, pointer = "chatspams_toggle"}):Keybind({callback = function(input, active) print(active) end}) 

    local misc_main = misc:Section({name = "Movement",side = "right"})
    
    local misc_toggle = misc_main:Toggle({name = "Speed", Default = false, pointer = "movement_toggle"}):Keybind({callback = function(input, active) print(active) end}) 
    
    misc_main:Slider({name = "", min = 0, max = 1000, Default = 25, suffix = "s"})
    
    local misc_toggle = misc_main:Toggle({name = "Fly", Default = false, pointer = "movement_toggle"}):Keybind({callback = function(input, active) print(active) end}) 
    
    misc_main:Slider({name = "", min = 0, max = 200, Default = 50, suffix = "s"})
    
        local misc_toggle = misc_main:Toggle({name = "Bunnyhop", Default = false, pointer = "movement_toggle"}):Keybind({callback = function(input, active) print(active) end}) 
        
        misc_main:Dropdown({name = "Bunnyhop Type", options = {"Gradual","Sudden","Gentle"}, Default = "Gradual"})
        
            misc_main:Slider({name = "Bunnyhop Velocity", min = 0, max = 100, Default = 35, suffix = "s"})
            
                misc_main:Slider({name = "Bunnyhop Gains", min = 0, max = 10, Default = 1.5, Decimals = 0.001, suffix = "v"})
                
                    local misc_toggle = misc_main:Toggle({name = "Jumpbug", Default = false, pointer = "jumpbug_toggle"}):Keybind({callback = function(input, active) print(active) end}) 
                    
             misc_main:Slider({name = "Jumpbug Delay", min = 0, max = 10, Default = 5, suffix = "ms"})
             
             local misc_mainz = misc:Section({name = "Extra", side = "right"})
             
                                 local misc_toggle = misc_mainz:Toggle({name = "Click Teleport", Default = false, pointer = "clickteleport_toggle"}):Keybind({callback = function(input, active) print(active) end}) 

                    local misc_toggle = misc_mainz:Toggle({name = "Noclip", Default = false, pointer = "noclip_toggle"}):Keybind({callback = function(input, active) print(active) end}) 

                    local misc_toggle = misc_mainz:Toggle({name = "Disable Networking", Default = false, pointer = "disablenetworking_toggle"}):Keybind({callback = function(input, active) print(active) end}) 

                    local misc_toggle = misc_mainz:Toggle({name = "Fake lag", Default = false, pointer = "fakelag_toggle"}):Keybind({callback = function(input, active) print(active) end}) 
                    
                    misc_mainz:Slider({name = "Fake Lag Amount", min = 0, max = 1000, Default = 50, suffix = "t"})
                                 
                    misc_mainz:Slider({name = "Fake Lag Multiplier", min = 0, max = 20, Default = 10, suffix = "t"})
                    
                    local misc_toggle = misc_mainz:Toggle({name = "Return Desync", Default = false, pointer = "returndesync_toggle"}):Keybind({callback = function(input, active) print(active) end}) 

                  misc_mainz:Dropdown({name = "Return Type", options = {"Flip","Switch","Revert","Preverse","Sustain"}, Default = "Flip"})
                  
                local misc_toggle = misc_mainz:Toggle({name = "Fake Angles", Default = false, pointer = "fakeangles_toggle"}):Keybind({callback = function(input, active) print(active) end}) 

                    local misc_toggle = misc_mainz:Toggle({name = "Freeze Server", Default = false, pointer = "freezeserver_toggle"}):Keybind({callback = function(input, active) print(active) end}) 





















local settings_page = window:Page({name = "Config", side = "Right", size = 73.2})
local config_section = settings_page:Section({name = "Configuration", side = "Right"})
local current_list = {}
local function update_config_list()
    local list = {}
    for idx, file in ipairs(listfiles("Linux/configs")) do
        local file_name = file:gsub("Linux/configs\\",""):gsub(".txt","") list[#list + 1] = file_name end
        local is_new = #list ~= #current_list
        if not is_new then
            for idx, file in ipairs(list) do
                if file ~= current_list[idx] then 
                    is_new = true
                    if is_new then current_list = list pointers["settings/configuration/list"]:UpdateList(list, false, true) end end
                        config_section:Listbox({pointer = "settings/configuration/list"})
                        config_section:Textbox({
                            pointer = "settings/configuration/name",
                            placeholder = "Config Name",
                            text = "",
                            middle = true,
                            reset_on_focus = false
                        })
                        config_section:ButtonHolder({
                            Buttons = {{"Create",  function()
                                local config_name = pointers["settings/configuration/name"]:get()
                                if config_name == "" or isfile("Linux/configs/" .. config_name .. ".txt") then
                                    return 
                                end
                                writefile("Linux/configs/" .. config_name .. ".txt","")
                                update_config_list()
                            end}, {"Delete", function()
                                local selected_config = pointers["settings/configuration/list"]:get()[1][1]
                                if selected_config then
                                    delfile("Linux/configs/" .. selected_config .. ".txt")
                                    update_config_list()
                                end
                            end
                        }}})
                        config_section:ButtonHolder({
                            Buttons = {{"Load", function()
                                local selected_config = pointers["settings/configuration/list"]:get()[1][1]
                                if selected_config then
                                    window:LoadConfig(readfile("Linux/configs/" .. selected_config .. ".txt"))
                                end
                            end}, {"Save", function()
                                local selected_config = pointers["settings/configuration/list"]:get()[1][1]
                                if selected_config then
                                    writefile("Linux/configs/" .. selected_config .. ".txt", window:GetConfig())
                                end
                            end
                        }}})
                        m_thread.spawn_loop(3, update_config_list)
                    end

                local menu_section = settings_page:Section({name = "Menu"}) do
                local function gs(a)
                    return game:GetService(a)
                end
                local actionservice = gs("ContextActionService")
                menu_section:Keybind({
                    pointer = "settings/menu/bind",
                    name = "Bind",
                    default = Enum.KeyCode.V,
                    callback = function(p_state)
                        window.uibind = p_state
                    end
                })
                menu_section:Toggle({
                    pointer = "sabcd_aa",
                    name = "Cursor",
                    default = true,
                    callback = function(p_state)
                        local userInputService = game:GetService("UserInputService")
                        if p_state == true then
                            userInputService.MouseIconEnabled = true
                        else
                            userInputService.MouseIconEnabled = false
                        end
                    end
                })

                menu_section:Toggle({
                    pointer = "settings/menu/watermark",
                    name = "Watermark",
                    default = false,
                    callback = function(p_state)
                        window.watermark:Update("Visible", p_state)
                    end
                })
                menu_section:Toggle({
                    pointer = "settings/menu/keybind_list",
                    name = "Keybind List",
                    callback = function(p_state)
                        window.keybindslist:Update("Visible", p_state)
                    end
                })

                menu_section:Toggle({
                    pointer = "freezemovement",
                    name = "Disable Movement if UI Open",
                    callback = function(bool)
                        if bool and window.isVisible then
                            actionservice:BindAction("FreezeMovement", function()
                                return Enum.ContextActionResult.Sink
                            end,
                            false,
                            unpack(Enum.PlayerActions:GetEnumItems()))
                        else
                            actionservice:UnbindAction("FreezeMovement")
                        end
                    end
                })

                menu_section:Button({
                    name = "Unload",
                    confirmation = true,
                    callback = function()
                        window:Unload()
                    end
                })

                menu_section:Button({
                    name = "force close",
                    confirmation = true,
                    callback = function()
                        window:Fade()
                    end
                })
            end

            local other_section = settings_page:Section({name = "Other", side = "Right"})
            other_section:Button({
                name = "Copy JobId",
                callback = function()
                    setclipboard(game.JobId)
                end
            })
            other_section:Button({
                name = "Copy GameID",
                callback = function()
                    setclipboard(game.GameId)
                end
            })
            other_section:Button({
                name = "Copy Game Invite",
                callback = function()
                    setclipboard("Roblox.GameLauncher.joinGameInstance(" .. game.PlaceId .. ',"' .. game.JobId .. '")')
                end
            })
            other_section:Button({
                name = "Rejoin",
                confirmation = true,
                callback = function()
                    m_game:teleport(game.PlaceId, game.JobId)
                end
            })

            other_section:Button({
                name = "test",
                confirmation = true,
                callback = function()
                    Window.notificationlist:AddNotification({text = "no.regrets loaded. have fun"})
                end
            })
        end
        local load_section = settings_page:Section({name = "Load Menu", side = "Right"})

        load_section:Toggle({name = "Show Menu"})

        load_section:Toggle({name = "Auto Load Config"})

        local themes_section = settings_page:Section({name = "Themes", side = "Left"})

        local extra_section = settings_page:Section({name = "Extra", side = "Left"})

        extra_section:Toggle({name = "Custom Menu Name"})

        extra_section:Textbox({name = "Custom Name"})

        themes_section:Dropdown({
            Name = "Theme",
            Options = {"Default", "ZeeBot", "Abyss", "Spotify", "Zeebot v2", "Solix", "nomercy.rip", "Abyss V2", "Anorix", "Octel", "LegitSneeze", "AimWare", "x15","Gamesense", "Mint", "Ubuntu", "BitchBot", "BubbleGum", "Slime"},
            Default = "Abyss",
            Pointer = "themes/xd/",
            callback = function(callback)
                if callback == "Default" then
                    library:UpdateColor("Accent", Color3.fromRGB(189, 182, 240))
                    library:UpdateColor("lightcontrast", Color3.fromRGB(30, 30, 30))
                    library:UpdateColor("darkcontrast", Color3.fromRGB(25, 25, 25))
                    library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                    library:UpdateColor("inline", Color3.fromRGB(50, 50, 50))
                elseif callback == "Spotify" then
                    library:UpdateColor("Accent", Color3.fromRGB(103, 212, 91))
                    library:UpdateColor("lightcontrast", Color3.fromRGB(30, 30, 30))
                    library:UpdateColor("darkcontrast", Color3.fromRGB(25, 25, 25))
                    library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                    library:UpdateColor("inline", Color3.fromRGB(46, 46, 46))
                elseif callback == "AimWare" then
                    library:UpdateColor("Accent", Color3.fromRGB(250, 47, 47))
                    library:UpdateColor("lightcontrast", Color3.fromRGB(41, 40, 40))
                    library:UpdateColor("darkcontrast", Color3.fromRGB(38, 38, 38))
                    library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                    library:UpdateColor("inline", Color3.fromRGB(46, 46, 46))
                elseif callback == "nomercy.rip" then
                    library:UpdateColor("Accent", Color3.fromRGB(242, 150, 92))
                    library:UpdateColor("lightcontrast", Color3.fromRGB(22, 12, 46))
                    library:UpdateColor("darkcontrast", Color3.fromRGB(17, 8, 31))
                    library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                    library:UpdateColor("inline", Color3.fromRGB(46, 46, 46))
                elseif callback == "Abyss" then
                    library:UpdateColor("Accent", Color3.fromRGB(81, 72, 115))
                    library:UpdateColor("lightcontrast", Color3.fromRGB(41, 41, 41))
                    library:UpdateColor("darkcontrast", Color3.fromRGB(31, 30, 30))
                    library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                    library:UpdateColor("inline", Color3.fromRGB(50, 50, 50)) 
                elseif callback == "Abyss V2" then
                    library:UpdateColor("Accent", Color3.fromRGB(161, 144, 219))
                    library:UpdateColor("lightcontrast", Color3.fromRGB(27, 27, 27))
                    library:UpdateColor("darkcontrast", Color3.fromRGB(18, 18, 18))
                    library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                    library:UpdateColor("inline", Color3.fromRGB(50, 50, 50))
                elseif callback == "Gamesense" then
                    library:UpdateColor("Accent", Color3.fromRGB(163, 248, 105))
                    library:UpdateColor("lightcontrast", Color3.fromRGB(25, 25, 25))
                    library:UpdateColor("darkcontrast", Color3.fromRGB(16, 16, 16))
                    library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                    library:UpdateColor("inline", Color3.fromRGB(50, 50, 50))
                elseif callback == "Mint" then
                    library:UpdateColor("Accent", Color3.fromRGB(0, 255, 139))
                    library:UpdateColor("lightcontrast", Color3.fromRGB(20, 20, 20))
                    library:UpdateColor("darkcontrast", Color3.fromRGB(20, 20, 20))
                    library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                    library:UpdateColor("inline", Color3.fromRGB(50, 50, 50))
                elseif callback == "Ubuntu" then
                    library:UpdateColor("Accent", Color3.fromRGB(226, 88, 30))
                    library:UpdateColor("lightcontrast", Color3.fromRGB(62,62,62))
                    library:UpdateColor("darkcontrast", Color3.fromRGB(50, 50, 50))
                    library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                    library:UpdateColor("inline", Color3.fromRGB(50, 50, 50))            
                elseif callback == "BitchBot" then
                    library:UpdateColor("Accent", Color3.fromRGB(126,72,163))
                    library:UpdateColor("lightcontrast", Color3.fromRGB(62,62,62))
                    library:UpdateColor("darkcontrast", Color3.fromRGB(50, 50, 50))
                    library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                    library:UpdateColor("inline", Color3.fromRGB(50, 50, 50))
                elseif callback == "Anorix" then
                    library:UpdateColor("Accent", Color3.fromRGB(105,156,164))
                    library:UpdateColor("lightcontrast", Color3.fromRGB(51,51,51))
                    library:UpdateColor("darkcontrast", Color3.fromRGB(41,41,41))
                    library:UpdateColor("outline", Color3.fromRGB(37, 37, 37))
                    library:UpdateColor("inline", Color3.fromRGB(39, 39, 39))
            elseif callback == "Zeebot v2" then
                library:UpdateColor("Accent", Color3.fromRGB(117,96,175))
                library:UpdateColor("lightcontrast", Color3.fromRGB(51,51,51))
                library:UpdateColor("darkcontrast", Color3.fromRGB(41,41,41))
                library:UpdateColor("outline", Color3.fromRGB(37, 37, 37))
                library:UpdateColor("inline", Color3.fromRGB(39, 39, 39))
            elseif callback == "BubbleGum" then
                library:UpdateColor("Accent", Color3.fromRGB(169, 83, 245))
                library:UpdateColor("lightcontrast", Color3.fromRGB(22, 12, 46))
                library:UpdateColor("darkcontrast", Color3.fromRGB(17, 8, 31))
                library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                library:UpdateColor("inline", Color3.fromRGB(46, 46, 46))
            elseif callback == "Slime" then
                library:UpdateColor("Accent", Color3.fromRGB(64, 247, 141))
                library:UpdateColor("lightcontrast", Color3.fromRGB(22, 12, 46))
                library:UpdateColor("darkcontrast", Color3.fromRGB(17, 8, 31))
                library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                library:UpdateColor("inline", Color3.fromRGB(46, 46, 46))
            elseif callback == "Octel" then
                library:UpdateColor("Accent", Color3.fromRGB(255, 201, 254))
                library:UpdateColor("lightcontrast", Color3.fromRGB(32, 32, 32))
                library:UpdateColor("darkcontrast", Color3.fromRGB(25, 25, 25))
                library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                library:UpdateColor("inline", Color3.fromRGB(30, 28, 30))
            elseif callback == "LegitSneeze" then
                library:UpdateColor("Accent", Color3.fromRGB(135,206,250))
                library:UpdateColor("lightcontrast", Color3.fromRGB(43,41,48))
                library:UpdateColor("darkcontrast", Color3.fromRGB(44,41,48))
                library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                library:UpdateColor("inline", Color3.fromRGB(50,50,50))
            elseif callback == "x15" then
                library:UpdateColor("Accent", Color3.fromRGB(92,57,152))
                library:UpdateColor("lightcontrast", Color3.fromRGB(32, 32, 32))
                library:UpdateColor("darkcontrast", Color3.fromRGB(25, 25, 25))
                library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                library:UpdateColor("inline", Color3.fromRGB(30, 28, 30))
            elseif callback == "ZeeBot" then
                library:UpdateColor("Accent", Color3.fromRGB(59,84,154))
                library:UpdateColor("lightcontrast", Color3.fromRGB(32, 33, 32))
                library:UpdateColor("darkcontrast", Color3.fromRGB(25, 26, 25))
                library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                library:UpdateColor("inline", Color3.fromRGB(30, 31, 30))
            elseif callback == "Solix" then
                library:UpdateColor("Accent", Color3.fromRGB(120, 93, 166))
                library:UpdateColor("lightcontrast", Color3.fromRGB(33,33,33))
                library:UpdateColor("darkcontrast", Color3.fromRGB(24,24,24))
                library:UpdateColor("outline", Color3.fromRGB(0, 0, 0))
                library:UpdateColor("inline", Color3.fromRGB(30, 29, 30))
            end
        end
    })
    themes_section:Dropdown({
        Name = "Accent Effects",
        Options = {"Rainbow", "Fade", "Disguard Fade", "Disguard Rainbow"},
        Default = "None",
        Pointer = "themes/xd/",
        callback = function(callback)
            if callback == "Rainbow" then
                if callback then
                    ching = game:GetService("RunService").Heartbeat:Connect(function()
                        chings:Disconnect()
                        library:UpdateColor("Accent", Color3.fromHSV(tick() % 5 / 5, 1, 1))
                    end)
                else
                    if ching then
                        ching:Disconnect()
                    end
                end
            elseif callback == "Disguard Rainbow" then
                ching:Disconnect()
            elseif callback == "Disguard Fade" then
                chings:Disconnect()
            elseif callback == "Fade" then
                if callback then
                    chings = game:GetService("RunService").Heartbeat:Connect(function()
                        ching:Disconnect()
                        local r = (math.sin(workspace.DistributedGameTime/2)/2)+0.5
                        local g = (math.sin(workspace.DistributedGameTime)/2)+0.5
                        local b = (math.sin(workspace.DistributedGameTime*1.5)/2)+0.5
                        local color = Color3.new(r, g, b)
                        library:UpdateColor("Accent", color)
                    end)
                else
                    if chings then
                        chings:Disconnect()
                    end
                end
            end
        end
    })

    themes_section:Slider({
        Name = "Switch Speed",
        Minimum = 0,
        Maximum = 10,
        Default = 1,
        Decimals = .1,
        suffix = "",
        Pointer = "reload delay",
        callback = function(a)
            --hello
        end
    })

    themes_section:Colorpicker({
        pointer = "themes/menu/accent",
        name = "Accent",
        default = Color3.fromRGB(100, 61, 200),
        callback = function(p_state)
            library:UpdateColor("Accent", p_state)
        end
    })

    themes_section:Colorpicker({
        pointer = "settings/menu/accent",
        name = "Light Contrast",
        default = Color3.fromRGB(30, 30, 30),
        callback = function(p_state)
            library:UpdateColor("lightcontrast", p_state)
        end
    })

    themes_section:Colorpicker({
        pointer = "settings/menu/accent",
        name = "Dark Constrast",
        default = Color3.fromRGB(25, 25, 25),
        callback = function(p_state)
            library:UpdateColor("darkcontrast", p_state)
        end
    })

    themes_section:Colorpicker({
        pointer = "settings/menu/accent",
        name = "Outline",
        default = Color3.fromRGB(0, 0, 0),
        callback = function(p_state)
            library:UpdateColor("outline", p_state)
        end
    })

    themes_section:Colorpicker({
        pointer = "settings/menu/accent",
        name = "Inline",
        default = Color3.fromRGB(50, 50, 50),
        callback = function(p_state)
            library:UpdateColor("inline", p_state)
        end
    })

    themes_section:Colorpicker({
        pointer = "settings/menu/accent",
        name = "Text Color",
        default = Color3.fromRGB(255, 255, 255),
        callback = function(p_state)
            library:UpdateColor("textcolor", p_state)
        end
    })

    themes_section:Colorpicker({
        pointer = "settings/menu/accent",
        name = "Text Border",
        default = Color3.fromRGB(0, 0, 0),
        callback = function(p_state)
            library:UpdateColor("textborder", p_state)
        end
    })

    themes_section:Colorpicker({
        pointer = "settings/menu/accent",
        name = "Cursor Outline",
        default = Color3.fromRGB(255, 255, 255),
        callback = function(p_state)
            library:UpdateColor("cursoroutline", p_state)
        end
    })

end
end
window.uibind = Enum.KeyCode.V
window:Initialize()
end
                
