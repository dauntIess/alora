--[[
       _
  __ _| | ___  _ __ __ _
 / _` | |/ _ \| '__/ _` |
| (_| | | (_) | | | (_| |
 \__,_|_|\___/|_|  \__,_|

      alora, a free and open source Counter Blox script created by sjors, ruined by me

                          alora  @ https://discord.gg/m3aMvdynrf -- https://github.com/sj0rs1/alora
                    buy cuteware @ https://discord.gg/nyZaeASbsk -- https://www.cuteware.xyz

--]]
repeat wait() until game:IsLoaded()
--if game:GetService("CoreGui"):FindFirstChild("sjorlib") then return end
getgenv().error = function() end
local ver = "1.4.1"
--files
if not isfolder("alora") then
    makefolder("alora")
end
if not isfolder("alora/"..tostring(game.GameId)) then
    makefolder("alora/"..tostring(game.GameId))
end
--vars
local library,menu,tabholder = loadstring(game:HttpGet("https://raw.githubusercontent.com/dauntIess/alora/main/sjors"))()
local userInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local teleportService = game:GetService("TeleportService")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local lighting = game:GetService("Lighting")
local localPlayer = players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse = localPlayer:GetMouse()
local debris = game:GetService("Debris")
local rayIgnore = workspace.Ray_Ignore
local client = getsenv(localPlayer.PlayerGui.Client)
getgenv().collision = {camera, workspace.Ray_Ignore, workspace.Debris}

local aloraWatermark = Drawing.new("Text");aloraWatermark.Font = 2;aloraWatermark.Position = Vector2.new(995,285);aloraWatermark.Visible = false;aloraWatermark.Size = 13;aloraWatermark.Color = Color3.new(1,1,1);aloraWatermark.Outline = true
local speclistText = Drawing.new("Text");speclistText.Font = 2;speclistText.Position = Vector2.new(1037,300);speclistText.Visible = false;speclistText.Size = 13;speclistText.Color = Color3.new(1,1,1);speclistText.Outline = true

local bombStats = Drawing.new("Text");bombStats.Font = 2;bombStats.Position = Vector2.new(565,167);bombStats.Visible = false;bombStats.Size = 13;bombStats.Color = Color3.new(1,1,1);bombStats.Outline = true

local bvitalsText = Drawing.new("Text");bvitalsText.Font = 2;bvitalsText.Position = Vector2.new(605,145);bvitalsText.Visible = false;bvitalsText.Text="Bomb Vitals";bvitalsText.Size = 13;bvitalsText.Color = Color3.new(1,1,1);bvitalsText.Outline = true
local bvitalsOutline = Drawing.new("Square");bvitalsOutline.Color = Color3.new(0,0,0);bvitalsOutline.Position = Vector2.new(387,160);bvitalsOutline.Visible = false;bvitalsOutline.Size = (Vector2.new(502,5));bvitalsOutline.Filled = true
local bvitals = Drawing.new("Square");bvitals.Color = Color3.new(1,0.498039216,0);bvitals.Position = Vector2.new(388,161);bvitals.Visible = false;bvitals.Size = (Vector2.new(500,3));bvitals.Filled = true

local skyboxes = {
    ["Purple Nebula"] = {
        ["SkyboxBk"] = "rbxassetid://159454299",
        ["SkyboxDn"] = "rbxassetid://159454296",
        ["SkyboxFt"] = "rbxassetid://159454293",
        ["SkyboxLf"] = "rbxassetid://159454286",
        ["SkyboxRt"] = "rbxassetid://159454300",
        ["SkyboxUp"] = "rbxassetid://159454288"
    },
    ["Night Sky"] = {
        ["SkyboxBk"] = "rbxassetid://12064107",
        ["SkyboxDn"] = "rbxassetid://12064152",
        ["SkyboxFt"] = "rbxassetid://12064121",
        ["SkyboxLf"] = "rbxassetid://12063984",
        ["SkyboxRt"] = "rbxassetid://12064115",
        ["SkyboxUp"] = "rbxassetid://12064131"
    },
    ["Pink Daylight"] = {
        ["SkyboxBk"] = "rbxassetid://271042516",
        ["SkyboxDn"] = "rbxassetid://271077243",
        ["SkyboxFt"] = "rbxassetid://271042556",
        ["SkyboxLf"] = "rbxassetid://271042310",
        ["SkyboxRt"] = "rbxassetid://271042467",
        ["SkyboxUp"] = "rbxassetid://271077958"
    },
    ["Morning Glow"] = {
        ["SkyboxBk"] = "rbxassetid://1417494030",
        ["SkyboxDn"] = "rbxassetid://1417494146",
        ["SkyboxFt"] = "rbxassetid://1417494253",
        ["SkyboxLf"] = "rbxassetid://1417494402",
        ["SkyboxRt"] = "rbxassetid://1417494499",
        ["SkyboxUp"] = "rbxassetid://1417494643"
    },
    ["Setting Sun"] = {
        ["SkyboxBk"] = "rbxassetid://626460377",
        ["SkyboxDn"] = "rbxassetid://626460216",
        ["SkyboxFt"] = "rbxassetid://626460513",
        ["SkyboxLf"] = "rbxassetid://626473032",
        ["SkyboxRt"] = "rbxassetid://626458639",
        ["SkyboxUp"] = "rbxassetid://626460625"
    },
    ["Fade Blue"] = {
        ["SkyboxBk"] = "rbxassetid://153695414",
        ["SkyboxDn"] = "rbxassetid://153695352",
        ["SkyboxFt"] = "rbxassetid://153695452",
        ["SkyboxLf"] = "rbxassetid://153695320",
        ["SkyboxRt"] = "rbxassetid://153695383",
        ["SkyboxUp"] = "rbxassetid://153695471"
    },
    ["Elegant Morning"] = {
        ["SkyboxBk"] = "rbxassetid://153767241",
        ["SkyboxDn"] = "rbxassetid://153767216",
        ["SkyboxFt"] = "rbxassetid://153767266",
        ["SkyboxLf"] = "rbxassetid://153767200",
        ["SkyboxRt"] = "rbxassetid://153767231",
        ["SkyboxUp"] = "rbxassetid://153767288"
    },
    ["Neptune"] = {
        ["SkyboxBk"] = "rbxassetid://218955819",
        ["SkyboxDn"] = "rbxassetid://218953419",
        ["SkyboxFt"] = "rbxassetid://218954524",
        ["SkyboxLf"] = "rbxassetid://218958493",
        ["SkyboxRt"] = "rbxassetid://218957134",
        ["SkyboxUp"] = "rbxassetid://218950090"
    },
    ["Redshift"] = {
        ["SkyboxBk"] = "rbxassetid://401664839",
        ["SkyboxDn"] = "rbxassetid://401664862",
        ["SkyboxFt"] = "rbxassetid://401664960",
        ["SkyboxLf"] = "rbxassetid://401664881",
        ["SkyboxRt"] = "rbxassetid://401664901",
        ["SkyboxUp"] = "rbxassetid://401664936"
    },
    ["Aesthetic Night"] = {
        ["SkyboxBk"] = "rbxassetid://1045964490",
        ["SkyboxDn"] = "rbxassetid://1045964368",
        ["SkyboxFt"] = "rbxassetid://1045964655",
        ["SkyboxLf"] = "rbxassetid://1045964655",
        ["SkyboxRt"] = "rbxassetid://1045964655",
        ["SkyboxUp"] = "rbxassetid://1045962969"
    },
    ["Midnight"] = {
        ["SkyboxBk"] = "rbxassetid://154185004",
        ["SkyboxDn"] = "rbxassetid://154184960",
        ["SkyboxFt"] = "rbxassetid://154185021",
        ["SkyboxLf"] = "rbxassetid://154184943",
        ["SkyboxRt"] = "rbxassetid://154184972",
        ["SkyboxUp"] = "rbxassetid://154185031"
    }
}

local hitsounds = {
    Pick = "rbxassetid://1347140027",
    Rust = "rbxassetid://1255040462",
    Skeet = "rbxassetid://5633695679",
    Neverlose = "rbxassetid://6534948092",
    Minecraft = "rbxassetid://4018616850",
    jewelxx = "rbxassetid://9717701840",
    hexx = "rbxassetid://9717702712",
    krxxxk = "rbxassetid://9717762690",
    slots = "rbxassetid://9717785933",
    sonic = "rbxassetid://9717784691"
}

local hitboxList = {
    Head = {"Head"},
    Torso = {"UpperTorso","LowerTorso"},
    Arms = {"LeftLowerArm","RightLowerArm","LeftHand","RightHand"},
    Legs = {"LeftLowerLeg","RightLowerLeg"}
}

--functions
function isAlive(plr)
    if not plr then plr = localPlayer end
    return plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("Head") and plr.Character.Humanoid.Health > 0 and true or false
end



function hasProperty(ins,pro)
    return pcall(function() _=ins[pro] end)
end

function getWeaponInfo()
    local information = {
        alive = isAlive()
    }
    if not information.alive then return information end
    if replicatedStorage.Weapons:FindFirstChild(localPlayer.Character.EquippedTool.Value) then
        local weapType = "other"
        local hitboxes = {}
        local weapon = replicatedStorage.Weapons[localPlayer.Character.EquippedTool.Value]
        if weapon:FindFirstChild("RifleThing") then
            weapType = "rifle"
        elseif weapon:FindFirstChild("Secondary") and weapon.Name ~= "R8" and weapon.Name ~= "DesertEagle" then
            weapType = "pistol"
        elseif weapon.Name == "R8" or weapon.Name == "DesertEagle" then
            weapType = "heavyp"
        elseif weapon.Name == "AWP" then
            weapType = "awp"
        elseif weapon.Name == "Scout" then
            weapType = "scout"
        end

        for i,v in next, library.flags[weapType.."_hitboxes"] do
            for _i,_v in next, hitboxList[v] do
                table.insert(hitboxes,_v)
            end
        end

        information["name"] = weapon.Name
        information["melee"] = false
        information["aim_assist"] = library.flags[weapType.."_assist"]
        information["silent_aim"] = library.flags[weapType.."_silent"]
        information["triggerbot"] = library.flags[weapType.."_triggerbot"]
        information["assist_fov"] = library.flags[weapType.."_assist_fov"]
        information["silent_fov"] = library.flags[weapType.."_silent_fov"]
        information["smoothness"] = library.flags[weapType.."_assist_smoothness"]
        information["trigger_delay"] = library.flags[weapType.."_triggerdelay"]
        information["hitboxes"] = hitboxes
    end
    return information
end

function teamCheck(plr,team)
    return plr ~= localPlayer and team or plr.Team ~= localPlayer.Team
end

function getNearest(visOnly,team)
    local player,nearest = nil,9e9
    for i,v in next, players:GetPlayers() do
        if teamCheck(v,team) and isAlive(v) then
            if visOnly then
                local ray = Ray.new(camera.CFrame.p,(v.Character.Head.Position - camera.CFrame.p).unit * 500)
                local hit,_ = workspace:FindPartOnRayWithIgnoreList(ray, {camera,localPlayer.Character,workspace.Ray_Ignore,workspace.Map.Clips,workspace.Map.SpawnPoints})
                if hit and hit:IsDescendantOf(v.Character) then else continue end
            end
            local screenPos,onScreen = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
            local magnitude = (Vector2.new(screenPos.X,screenPos.Y)-Vector2.new(mouse.X,mouse.Y)).magnitude
            if onScreen and magnitude < nearest then
                player = v
                nearest = magnitude
            end
        end
    end
    return player,nearest
end

function isButtonDown(key)
    if string.find(tostring(key),"KeyCode") then
        return userInputService:IsKeyDown(key)
    else
        for _,v in pairs(userInputService:GetMouseButtonsPressed()) do
            if v.UserInputType == key then
                return true
            end
        end
    end
	return false
end



function updateSkybox()
    if lighting:FindFirstChild("customsky") then
        lighting.customsky:Destroy()
    end
    if lighting:FindFirstChild("SunRays") then
        lighting.SunRays.Enabled = false
    end
    local customsky = Instance.new("Sky",lighting)
    customsky.Name = "customsky"
    customsky.SunTextureId = "rbxassetid://"
    customsky.CelestialBodiesShown = "rbxassetid://"
    if library.flags["skybox_changer"] and skyboxes[library.flags["selected_skybox"]] then
        for i,v in next, skyboxes[library.flags["selected_skybox"]] do
            customsky[i] = v
        end
    end
end

local tracerDebounce = false
function createTracer(to,from)
    if not tracerDebounce then
        tracerDebounce = true
        spawn(function()
            wait()
            tracerDebounce = false
        end)
        to -= (from.Position - to).unit*100
        local part1 = Instance.new("Part")
        local part2 = Instance.new("Part")
        local beam = Instance.new("Beam",part1)
        local beam2 = Instance.new("Beam",part1)
        local attachment1 = Instance.new("Attachment")
        local attachment2 = Instance.new("Attachment")

        part1.Transparency = 1;part1.Position = to;part1.CanCollide = false;part1.Anchored = true;part1.Parent = workspace.Debris;attachment1.Parent = part1
        part2.Transparency = 1;part2.Position = from.Position;part2.CanCollide = false;part2.Anchored = true;part2.Parent = workspace.Debris;attachment2.Parent = part2
        beam.FaceCamera = true;beam.Color = ColorSequence.new(library.flags["tracer_color"]);beam.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,1-0.5),NumberSequenceKeypoint.new(1,1-0.5)};beam.Width0 = 0.055;beam.Width1 = 0.055;beam.LightEmission = 1;beam.LightInfluence = 0;beam.Attachment0 = attachment1;beam.Attachment1 = attachment2;beam.Parent = part1
        beam2.FaceCamera = true;beam2.Color = ColorSequence.new(Color3.new(1,1,1));beam2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,1-0.75),NumberSequenceKeypoint.new(1,1-0.75)};beam2.Width0 = 0.025;beam2.Width1 = 0.025;beam2.LightEmission = 1;beam2.LightInfluence = 0;beam2.Attachment0 = attachment1;beam2.Attachment1 = attachment2;beam2.Parent = part1

        spawn(function()
            wait(2)
            for i=0.5,0,-0.025 do wait()
                beam.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,1-i),NumberSequenceKeypoint.new(1,1-i)}
                beam2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,(0.75)-i),NumberSequenceKeypoint.new(1,(0.75)-i)}
            end
            for i=0.25,0,-0.025 do wait()
                beam2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,1-i),NumberSequenceKeypoint.new(1,1-i)}
            end
            beam:Destroy()
            beam2:Destroy()
        end)
    end
end


oldSounds = {}
for i,v in next, localPlayer.PlayerGui.Music:GetDescendants() do
	if v:IsA("Sound") then
		if v.Name == "Lose" then
			oldSounds["Lose"] = v.SoundId
		elseif v.Name == "Win" then
			oldSounds["Win"] = v.SoundId
		elseif v.Name == "Bomb" then
			oldSounds["Bomb"]= v.SoundId
		elseif v.Name == "1" then
			if v.Parent.Name == "StartRound" then
				oldSounds["StartRound"] = v.SoundId
			end
		end
	end
end

local espObjects = {}
function createEsp(plr)
    if plr == localPlayer then return end
    local textDropShadowESP = Drawing.new("Text")
    local textESP = Drawing.new("Text")
    local boxESP = Drawing.new("Square")
    local boxoutlineESP = Drawing.new("Square")
    local boxinlineESP = Drawing.new("Square")
    local healthbarESPoutline = Drawing.new("Square")
    local healthbarESP = Drawing.new("Square")

    textESP.Font = 2
    textESP.Size = 13
    textESP.Color = Color3.new(1,1,1)
    textESP.OutlineColor = Color3.new(0,0,0)
    textESP.Transparency = 1

    textDropShadowESP.Font = 2
    textDropShadowESP.Size = 13
    textDropShadowESP.Color = Color3.new(0,0,0)
    textDropShadowESP.OutlineColor = Color3.new(0,0,0)
    textDropShadowESP.Transparency = 1

    boxESP.Thickness = 1
    boxESP.Color = Color3.new(1,1,1)
    boxESP.Transparency = 1

    boxoutlineESP.Thickness = 1
    boxoutlineESP.Color = Color3.new(0,0,0)
    boxoutlineESP.Transparency = 1

    boxinlineESP.Thickness = 1
    boxinlineESP.Color = Color3.new(0,0,0)
    boxinlineESP.Transparency = 1

    healthbarESP.Thickness = 1
    healthbarESP.Color = Color3.fromRGB(50,220,50)
    healthbarESP.Transparency = 1

    healthbarESPoutline.Thickness = 1
    healthbarESPoutline.Color = Color3.new(0,0,0)
    healthbarESPoutline.Transparency = 1
    healthbarESPoutline.Filled = true

    function invis()
        textESP.Visible = false
        textDropShadowESP.Visible = false
        boxESP.Visible = false
        boxoutlineESP.Visible = false
        boxinlineESP.Visible = false
        healthbarESPoutline.Visible = false
        healthbarESP.Visible = false
    end

    function remove()
        textESP:Remove()
        textDropShadowESP:Remove()
        boxESP:Remove()
        boxoutlineESP:Remove()
        healthbarESP:Remove()
        boxinlineESP:Remove()
        healthbarESPoutline:Remove()
        healthbarESP:Remove()
        espObjects[plr.Name] = nil
    end

    local espList = {
        text = textESP,
        textshadow = textDropShadowESP,
        box = boxESP,
        boxol = boxoutlineESP,
        boxil = boxinlineESP,
        healthb = healthbarESP,
        healthbo = healthbarESPoutline,

        invis = invis,
        remove = remove,
    }
    espObjects[plr.Name] = espList
end

function getOffsets(x,y,minY,z)
    return {CFrame.new(x,y,z),CFrame.new(-x,y,z),CFrame.new(x,y,-z),CFrame.new(-x,y,-z),CFrame.new(x,-minY,z),CFrame.new(-x,-minY,z),CFrame.new(x,-minY,-z),CFrame.new(-x,-minY,-z)}
end

function floor(val)
    return Vector2.new(math.floor(val.X),math.floor(val.Y))
end

local btInfo = {parent = nil,folder = nil}
local preventBt = false
local silentPart = nil
local hookJp = nil
local hookWs = nil
local timeout = 0
local meta = getrawmetatable(game)
setreadonly(meta,false)
local oldNamecall = meta.__namecall
local oldNewindex = meta.__newindex




meta.__newindex = newcclosure(function(self,idx,val)
    if self.Name == "Crosshair" and idx == "Visible" and val == false and localPlayer.PlayerGui.GUI.Crosshairs.Scope.Visible == false and library.flags["force_cross"] == true then
		val = true
	end
    if idx == "JumpPower" and hookJp then
        val = 22
    end
    return oldNewindex(self,idx,val)
end)

meta.__namecall = newcclosure(function(self,...)
    local args = {...}
    local method = getnamecallmethod()

    if method == "Kick" then
        return
    end
    if self.Name == "RemoteEvent" and typeof(args[1]) == "table" and args[1][1] == "kick" then
        return
    end
    if method == "InvokeServer" and self.Name == "Hugh" then
        return
    end

    if string.find(method,"IgnoreList") and silentPart then
        args[1] = Ray.new(camera.CFrame.p, (silentPart.Position + Vector3.new(0,(camera.CFrame.p-silentPart.Position).Magnitude/500,0) - camera.CFrame.p).unit * 500)
    end

    if method == "SetPrimaryPartCFrame" and library.flags["viewmodel_changer"] then
        args[1] *= CFrame.new(Vector3.new(math.rad(library.flags["viewmodel_x"]-180),math.rad(library.flags["viewmodel_y"]-180),math.rad(library.flags["viewmodel_z"]-180))) * CFrame.Angles(0, 0, math.rad(library.flags["viewmodel_roll"]-180))
    end

    if method == "FireServer" then
        if args[1] == localPlayer.UserId or string.find(tostring(args[1]),'{') then
            return
        end
        if not btInfo.parent and self.Name == "RemoteEvent" and tostring(args[1][3]) == "btp" then
            btInfo.parent = args[1][3].read.Value
            btInfo.folder = args[1][3].Parent
            spawn(function()
                wait()
                btInfo.parent = nil
            end)
            return
        end
        if self.Name == "ApplyGun" then
            if string.find(args[1].Name,"Banana") or string.find(args[1].Name,"Flip") then
                args[1] = replicatedStorage.Weapons[localPlayer.Status.Team.Value.." Knife"]
            end
        end
        if self.Name == "HitPart" then
            if timeout > 0 then
                return
            end
            if string.find(string.lower(args[1].Name),"head") then
                timeout = 7
            end
            spawn(function()
                local hitplayer = players:FindFirstChild(args[1].Parent.Name)
                if hitplayer then
                    preventBt = true
                    wait()
                    preventBt = false
                end
                if library.flags["hitsound_enabled"] and hitplayer and teamCheck(hitplayer,false) then
                    local hitsound = Instance.new("Sound",workspace)
                    hitsound.SoundId = hitsounds[library.flags["hitsound_value"]]
                    hitsound.PlayOnRemove = true
                    hitsound.Volume = 4
                    hitsound:Destroy()
                end
                

                if library.flags["bullet_tracer"] and localPlayer.Character and  camera:FindFirstChild("Arms") then
                    local from = camera.Arms:FindFirstChild("Flash")
                    if from then
                        createTracer(args[2],from)
                    end
                end
                if library.flags["bullet_imp"] == true then
					spawn(function()
						local bulletImpacts = Instance.new("Part")
						bulletImpacts.Anchored = true
						bulletImpacts.CanCollide = false
						bulletImpacts.Material = "ForceField"
						bulletImpacts.Color = library.flags["bullet_impcol"]
						bulletImpacts.Size = Vector3.new(0.25, 0.25, 0.25)
						bulletImpacts.CFrame = CFrame.new(args[2])
						bulletImpacts.Name = "bulletImpacts"
						bulletImpacts.Parent = camera
						wait(3)
						bulletImpacts:Destroy()
					end)
				end
            end)
            if btInfo.parent and not preventBt then
                args[1] = btInfo.parent.Head
                args[2] = args[1].Position
                timeout = 7
                btInfo.parent = nil
                spawn(function()
                    btInfo.folder:ClearAllChildren()
                end)
            end
        end

            if self.Name == "DataEvent" and args[1][4] then
                local currentSkin = string.split(args[1][4][1],"_")[2]
                local name = args[1][3]
                if args[1][2] == "Both" then
                    localPlayer["SkinFolder"]["CTFolder"][name].Value = currentSkin
                    localPlayer["SkinFolder"]["TFolder"][name].Value = currentSkin
                else
                    localPlayer["SkinFolder"][args[1][2].."Folder"][name].Value = currentSkin
                end
            end
    end
    return oldNamecall(self,unpack(args))
end)

local aimbotTab = library:addTab("Aimbot")
local visualsTab = library:addTab("Visuals")
local skinsTab = library:addTab("Skins")
local miscTab = library:addTab("Misc")
local configTab = library:addTab("Settings")

local configGroup = configTab:createGroup(0)
local configGroup1 = configTab:createGroup(0)
local serverGroup = configTab:createGroup(1)


configGroup:addColorpicker({text = "Menu Accent",flag = "menu_accent",ontop = true,color = Color3.new(0.4,0.4,0.4),callback = function(val)
    for i,v in next, tabholder:GetDescendants() do
        pcall(function()
            if v.Name ~= "dontchange" and v.BackgroundColor3 == library.libColor then
                v.BackgroundColor3 = val
            end
        end)
    end
    library.libColor = val
    aloraWatermark.Color = val
end})

configGroup:addList({text = "Config",flag = "selected_config",skipflag = true,values = {}})
configGroup:addButton({text = "Load Config",callback = library.loadConfig})

configGroup1:addTextbox({text = "config name",flag = "config_name"})
configGroup1:addButton({text = "Save Config",callback = library.saveConfig})
configGroup1:addButton({text = "Delete Config",callback = library.deleteConfig})
configGroup1:addButton({text = "Refresh Configs",callback = library.refreshConfigs})

library:refreshConfigs()

serverGroup:addToggle({text = "Disable Global Shadows","gfxx"})
serverGroup:addButton({text = "Delete Graphics",callback = function()
	workspace:FindFirstChildOfClass('Terrain').WaterWaveSize = 0
	workspace:FindFirstChildOfClass('Terrain').WaterWaveSpeed = 0
	workspace:FindFirstChildOfClass('Terrain').WaterReflectance = 1
	workspace:FindFirstChildOfClass('Terrain').WaterTransparency = 0
	game:GetService("Lighting").FogEnd = 999e3
	for i,v in pairs(game:GetDescendants()) do
		if v:IsA("Part") or v:IsA('BasePart') or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
			v.Material = "Plastic"
		elseif v:IsA("Decal") then
			v.Transparency = 1
		elseif v:IsA("Explosion") then
			v.BlastPressure = 1
			v.BlastRadius = 1
		end
	end
    for _, v in pairs(workspace.Map.Regen:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Material = "Plastic"
        --    v.Color = Color3.new(0,0,0)
		end
	end
	for i,v in pairs(game:GetService("Lighting"):GetDescendants()) do
		if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
			v.Enabled = false
            
		end
	end
end})
serverGroup:addDivider()
serverGroup:addButton({text = "Rejoin Server", callback = function() teleportService:Teleport(game.PlaceId, localPlayer) end})

local aimbotGroup = aimbotTab:createGroup(0)
local rifleGroup,rifleFrame = aimbotTab:createGroup(1)
local pistolGroup,pistolFrame = aimbotTab:createGroup(1)
local heavypGroup,heavypFrame = aimbotTab:createGroup(1)
local awpGroup,awpFrame = aimbotTab:createGroup(1)
local scoutGroup,scoutFrame = aimbotTab:createGroup(1)
local otherGroup,otherFrame = aimbotTab:createGroup(1)

-- insane code
rifleGroup:addToggle({text = "Aim Assist",flag = "rifle_assist"})
rifleGroup:addToggle({text = "Silent Aim",flag = "rifle_silent"})
rifleGroup:addToggle({text = "Triggerbot",flag = "rifl_triggerbot"})
rifleGroup:addSlider({text = "Aim Assist FOV",flag = "rifle_assist_fov",min = 0,max = 500,value = 100})
rifleGroup:addSlider({text = "Silent Aim FOV",flag = "rifle_silent_fov",min = 0,max = 500,value = 25})
rifleGroup:addSlider({text = "Smoothness",flag = "rifle_assist_smoothness",min = 1,max = 50,value = 10})
rifleGroup:addSlider({text = "Triggerbot Delay",flag = "rifle_triggerdelay",min = 0,max = 200,value = 0})
rifleGroup:addList({text = "Hitboxes",flag = "rifle_hitboxes",multiselect = true,values = {"Head","Torso","Arms","Legs"}})

pistolGroup:addToggle({text = "Aim Assist",flag = "pistol_assist"})
pistolGroup:addToggle({text = "Silent Aim",flag = "pistol_silent"})
pistolGroup:addToggle({text = "Triggerbot",flag = "pistol_triggerbot"})
pistolGroup:addSlider({text = "Aim Assist FOV",flag = "pistol_assist_fov",min = 0,max = 500,value = 100})
pistolGroup:addSlider({text = "Silent Aim FOV",flag = "pistol_silent_fov",min = 0,max = 500,value = 25})
pistolGroup:addSlider({text = "Smoothness",flag = "pistol_assist_smoothness",min = 1,max = 50,value = 10})
pistolGroup:addSlider({text = "Triggerbot Delay",flag = "pistol_triggerdelay",min = 0,max = 200,value = 0})
pistolGroup:addList({text = "Hitboxes",flag = "pistol_hitboxes",multiselect = true,values = {"Head","Torso","Arms","Legs"}})

heavypGroup:addToggle({text = "Aim Assist",flag = "heavyp_assist"})
heavypGroup:addToggle({text = "Silent Aim",flag = "heavyp_silent"})
heavypGroup:addToggle({text = "Triggerbot",flag = "heavyp_triggerbot"})
heavypGroup:addSlider({text = "Aim Assist FOV",flag = "heavyp_assist_fov",min = 0,max = 500,value = 100})
heavypGroup:addSlider({text = "Silent Aim FOV",flag = "heavyp_silent_fov",min = 0,max = 500,value = 25})
heavypGroup:addSlider({text = "Smoothness",flag = "heavyp_assist_smoothness",min = 1,max = 50,value = 10})
heavypGroup:addSlider({text = "Triggerbot Delay",flag = "heavyp_triggerdelay",min = 0,max = 200,value = 0})
heavypGroup:addList({text = "Hitboxes",flag = "heavyp_hitboxes",multiselect = true,values = {"Head","Torso","Arms","Legs"}})

awpGroup:addToggle({text = "Aim Assist",flag = "awp_assist"})
awpGroup:addToggle({text = "Silent Aim",flag = "awp_silent"})
awpGroup:addToggle({text = "Triggerbot",flag = "awp_triggerbot"})
awpGroup:addSlider({text = "Aim Assist FOV",flag = "awp_assist_fov",min = 0,max = 500,value = 100})
awpGroup:addSlider({text = "Silent Aim FOV",flag = "awp_silent_fov",min = 0,max = 500,value = 25})
awpGroup:addSlider({text = "Smoothness",flag = "awp_assist_smoothness",min = 1,max = 50,value = 10})
awpGroup:addSlider({text = "Triggerbot Delay",flag = "awp_triggerdelay",min = 0,max = 200,value = 0})
awpGroup:addList({text = "Hitboxes",flag = "awp_hitboxes",multiselect = true,values = {"Head","Torso","Arms","Legs"}})

scoutGroup:addToggle({text = "Aim Assist",flag = "scout_assist"})
scoutGroup:addToggle({text = "Silent Aim",flag = "scout_silent"})
scoutGroup:addToggle({text = "Triggerbot",flag = "scout_triggerbot"})
scoutGroup:addSlider({text = "Aim Assist FOV",flag = "scout_assist_fov",min = 0,max = 500,value = 100})
scoutGroup:addSlider({text = "Silent Aim FOV",flag = "scout_silent_fov",min = 0,max = 500,value = 25})
scoutGroup:addSlider({text = "Smoothness",flag = "scout_assist_smoothness",min = 1,max = 50,value = 10})
scoutGroup:addSlider({text = "Triggerbot Delay",flag = "scout_triggerdelay",min = 0,max = 200,value = 0})
scoutGroup:addList({text = "Hitboxes",flag = "scout_hitboxes",multiselect = true,values = {"Head","Torso","Arms","Legs"}})

otherGroup:addToggle({text = "Aim Assist",flag = "other_assist"})
otherGroup:addToggle({text = "Silent Aim",flag = "other_silent"})
otherGroup:addToggle({text = "Triggerbot",flag = "other_triggerbot"})
otherGroup:addSlider({text = "Aim Assist FOV",flag = "other_assist_fov",min = 0,max = 500,value = 100})
otherGroup:addSlider({text = "Silent Aim FOV",flag = "other_silent_fov",min = 0,max = 500,value = 25})
otherGroup:addSlider({text = "Smoothness",flag = "other_assist_smoothness",min = 1,max = 50,value = 10})
otherGroup:addSlider({text = "Triggerbot Delay",flag = "other_triggerdelay",min = 0,max = 200,value = 0})
otherGroup:addList({text = "Hitboxes",flag = "other_hitboxes",multiselect = true,values = {"Head","Torso","Arms","Legs"}})

aimbotGroup:addToggle({text = "Enabled",flag = "aimbot_enabled"})
aimbotGroup:addToggle({text = "Teammates",flag = "aimbot_team"})
aimbotGroup:addToggle({text = "Visible Only",flag = "aimbot_visonly"})
aimbotGroup:addToggle({text = "Auto Pistol",flag = "auto_pistol",callback = function(val)
    for i,v in next, replicatedStorage.Weapons:GetChildren() do
        if v:FindFirstChild("Secondary") and v.Name ~= "CZ" then
            v.Auto.Value = val
        end
    end
end})
aimbotGroup:addKeybind({text = "Triggerbind",flag = "trigger_keybind",key = Enum.KeyCode.LeftAlt})
aimbotGroup:addList({text = "Weapon",skipflag = true,flag = "aimbot_weapon",values = {"Rifle","Pistol","Heavy Pistol","Awp","Scout","Other"},callback = function(val)
    rifleFrame.Visible = val == "Rifle"
    pistolFrame.Visible = val == "Pistol"
    heavypFrame.Visible = val == "Heavy Pistol"
    awpFrame.Visible = val == "Awp"
    scoutFrame.Visible = val == "Scout"
    otherFrame.Visible = val == "Other"
end})




local mainGroup,mainFrame = visualsTab:createGroup(0)
local viewmodelGroup,viewmodelFrame = visualsTab:createGroup(1)
local other,otherFrame = visualsTab:createGroup(1)

local config,configFrame = visualsTab:createGroup(0)
local config1,configFrame1 = visualsTab:createGroup(1)

local toggleTab,toggleFrame = visualsTab:createGroup(0)

mainGroup:addToggle({text = "ESP Enabled",flag = "esp_enabled",callback = function() for i,v in next, espObjects do v.invis() end end})
mainGroup:addToggle({text = "Box ESP",flag = "box_enabled"})
mainGroup:addToggle({text = "Name ESP",flag = "name_enabled"})
mainGroup:addToggle({text = "Health Bar",flag = "healthbar_enabled"})


mainGroup:addDivider()
mainGroup:addToggle({text = "Skybox Changer",flag = "skybox_changer",callback = updateSkybox})
mainGroup:addToggle({text = "World Gradient",flag = "world_gradient"})
mainGroup:addToggle({text = "Time Changer",flag = "time_changer",callback = function() lighting.TimeOfDay = 15 end})
mainGroup:addDivider()
mainGroup:addToggle({text = "Hitmarkers",flag = "hitmarkers"})
mainGroup:addToggle({text = "Bullet Tracers",flag = "bullet_tracer"})
mainGroup:addToggle({text = "Bullet Impacts",flag = "bullet_imp"})

viewmodelGroup:addToggle({text = "Viewmodel Changer",flag = "viewmodel_changer"})
viewmodelGroup:addToggle({text = "Weapon Chams",flag = "weapon_chams"})
viewmodelGroup:addToggle({text = "Remove Arms",flag = "remove_arms"})
viewmodelGroup:addToggle({text = "Remove Gloves",flag = "remove_gloves"})
viewmodelGroup:addToggle({text = "Remove Sleeves",flag = "remove_sleeves"})

local color = Color3.new(1,1,1)
local color2 = Color3.new(0,0,0)
local outlineTransparency = 0
local innerTransparency = 1
local depthMode = 'AlwaysOnTop'

other:addToggle({text = 'Player Glow',flag = 'highlights', function()
    for _, player in pairs(players:GetPlayers()) do
        if player.Team ~= localPlayer.Team and player.Status.Alive.Value == true and player.Character:FindFirstChild('Highlight') then
            player.Character:FindFirstChild('Highlight').OutlineColor = color
            player.Character:FindFirstChild('Highlight').OutlineTransparency = outlineTransparency
            player.Character:FindFirstChild('Highlight').FillTransparency = innerTransparency
            player.Character:FindFirstChild('Highlight').FillColor = color2
            player.Character:FindFirstChild('Highlight').DepthMode = depthMode
        end
    end
end
})
other:addColorpicker({text = "Glow Fill Color",ontop = true,flag = "glow_color",color = Color3.new(1, 0.7, 1),callback = function(value)
    color = value
    for _, player in pairs(players:GetPlayers()) do
        if player.Team ~= localPlayer.Team and player.Status.Alive.Value == true and player.Character:FindFirstChild('Highlight') then
            player.Character:FindFirstChild('Highlight').FillColor = color
        end
    end
end})

other:addColorpicker({text = "Glow Outline Color",ontop = true,flag = "glow_color2",color = Color3.new(1, 0.3, 1),callback = function(value)
    color2 = value
    for _, player in pairs(players:GetPlayers()) do
        if player.Team ~= localPlayer.Team and player.Status.Alive.Value == true and player.Character:FindFirstChild('Highlight') then
            player.Character:FindFirstChild('Highlight').OutlineColor = color2
        end
    end
end})

other:addSlider({text = 'Outline Glow Transparency',flag = "glow_outtrans",value = 10,min = 0, max = 10,callback = function(value)
    outlineTransparency = value / 10
    for _, player in pairs(players:GetPlayers()) do
        if player.Team ~= localPlayer.Team and player.Status.Alive.Value == true and player.Character:FindFirstChild('Highlight') then
            player.Character:FindFirstChild('Highlight').OutlineTransparency = outlineTransparency
        end
    end
end})
other:addSlider({text = 'Inner Transparency',flag = "glow_intrans",value = 10,min = 0, max = 10,callback = function(value)
    innerTransparency = value / 10
    for _, player in pairs(players:GetPlayers()) do
        if player.Team ~= localPlayer.Team and player.Status.Alive.Value == true and player.Character:FindFirstChild('Highlight') then
            player.Character:FindFirstChild('Highlight').FillTransparency = innerTransparency
        end
    end
end})
other:addList({text = "Glow Type",flag = "glow_mode",values = {'AlwaysOnTop','Occluded'},callback = function(value)
    depthMode = value
    for _, player in pairs(players:GetPlayers()) do
        if player.Team ~= localPlayer.Team and player.Status.Alive.Value == true and player.Character:FindFirstChild('Highlight') then
            player.Character:FindFirstChild('Highlight').DepthMode = depthMode
        end
    end
end})

config:addColorpicker({text = "Box Color",ontop = true,flag = "box_color",color = Color3.new(0.4,0.4,0.4)})
config:addColorpicker({text = "Name Color",ontop = true,flag = "name_color",color = Color3.new(0.4,0.4,0.4)})
config:addColorpicker({text = "Health Bar Color",ontop = true,flag = "healthbar_color",color = Color3.new(0.4,0.4,0.4)})
config:addDivider()
config:addColorpicker({text = "Hitmarker Color",ontop = true,flag = "hmcolor",color = Color3.new(1,1,1)})
config:addColorpicker({text = "Tracer Color",ontop = true,flag = "tracer_color",color = Color3.new(0.4,0.4,0.4)})
config:addColorpicker({text = "Impact Color",ontop = true,flag = "bullet_impcol",color = Color3.new(0.4,0.4,0.4)})
config:addDivider()
config:addColorpicker({text = "World Gradient Color",ontop = true,flag = "gradient_color",color = Color3.new(0.4,0.4,0.4)})
config:addColorpicker({text = "Outdoor Gradient Color",ontop = true,flag = "outdoor_gradient_color",color = Color3.new(0.4,0.4,0.4)})
config:addColorpicker({text = "Weapon Chams Color",ontop = true,flag = "weapon_color",color = Color3.new(0.4,0.4,0.4)})
config:addList({text = "Material",flag = "weapon_material", multiselect = false, values = {"SmoothPlastic", "Neon", "ForceField", "Wood", "Glass"}})
config:addList({text = "Skybox",flag = "selected_skybox",callback = updateSkybox,values = {"Aesthetic Night","Elegant Morning","Elegant Morning","Midnight","Morning Glow","Neptune","Night Sky","Pink Daylight","Purple Nebula","Redshift","Setting Sun"}})


config1:addSlider({text = "Viewmodel X",flag = "viewmodel_x",value = 180,min = 0,max = 360})
config1:addSlider({text = "Viewmodel Y",flag = "viewmodel_y",value = 180,min = 0,max = 360})
config1:addSlider({text = "Viewmodel Z",flag = "viewmodel_z",value = 180,min = 0,max = 360})
config1:addSlider({text = "Viewmodel Roll",flag = "viewmodel_roll",value = 180,min = 0,max = 360})
config1:addSlider({text = "Time",flag = "time_value",value = 24,min = 0,max = 48})
config1:addSlider({text = "Weapon Transparency",flag = "weap_trans",value = 0,min = 0,max = 10})
config1:addSlider({text = "Weapon Reflectance",flag = "weap_refl",value = 0,min = 0,max = 10})

local visualsTabToggle = true
toggleTab:addButton({text = "Toggle Tabs",callback = function()
    visualsTabToggle = not visualsTabToggle
    mainFrame.Visible = visualsTabToggle
    viewmodelFrame.Visible  = visualsTabToggle
    otherFrame.Visible  = visualsTabToggle
    configFrame.Visible = not visualsTabToggle
    configFrame1.Visible = not visualsTabToggle
end})


configFrame.Visible = false
configFrame1.Visible = false

local movementGroup,movementFrame = miscTab:createGroup(0)
local misc,miscFrame = miscTab:createGroup(0)
local misc2,miscFrame2 = miscTab:createGroup(1)

local cross,crossFrame = miscTab:createGroup(0)
local drawingGroup,drawingFrame = miscTab:createGroup(1)
local toggleTab,toggleFrame = miscTab:createGroup(0)

movementGroup:addToggle({text = "Bunny Hop",flag = "bunny_hop",callback = function()
    while library.flags["bunny_hop"] do runService.RenderStepped:Wait()--wait()
        if isAlive() and userInputService:IsKeyDown(Enum.KeyCode.Space) then
            localPlayer.Character.Humanoid.Jump = true
            local speed = library.flags["bhop_speed"]
            local dir = camera.CFrame.LookVector * Vector3.new(1,0,1)
            local move = Vector3.new()
            move = userInputService:IsKeyDown(Enum.KeyCode.W) and move + dir or move
            move = userInputService:IsKeyDown(Enum.KeyCode.S) and move - dir or move
            move = userInputService:IsKeyDown(Enum.KeyCode.D) and move + Vector3.new(-dir.Z,0,dir.X) or move
            move = userInputService:IsKeyDown(Enum.KeyCode.A) and move + Vector3.new(dir.Z,0,-dir.X) or move
            if move.Unit.X == move.Unit.X then
                move = move.Unit
                localPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(move.X*speed,localPlayer.Character.HumanoidRootPart.Velocity.Y,move.Z*speed)
            end
        end
    end
end})
movementGroup:addToggle({text = "Fast Crouch", callback = function(val)
	if val == true then
		runService:BindToRenderStep("Stamina", 100, function()
			if client.crouchcooldown ~= 0 then
				client.crouchcooldown = 0.6
			end
		end)
	elseif val == false then
		runService:UnbindFromRenderStep("Stamina")
	end
end})
movementGroup:addSlider({text = "Speed",flag = "bhop_speed",min = 1,max = 50,value = 15})

rayIgnore.ChildAdded:Connect(function(obj)
    if obj.Name == "Smokes" then
        obj.ChildAdded:Connect(function(smoke)
			runService.RenderStepped:Wait()
			if library.flags["remove_smoke"] then
				smoke.ParticleEmitter.Rate = 100 - library.flags["smoke_reduction"]
			end
            smoke.Material = Enum.Material.ForceField
        end)
    end
end)

if rayIgnore:FindFirstChild("Smokes") then
	for _,smoke in pairs(rayIgnore:FindFirstChild("Smokes"):GetChildren()) do
		local OriginalRate = Instance.new("NumberValue")
		OriginalRate.Value = smoke.ParticleEmitter.Rate
		OriginalRate.Name = "OriginalRate"
		OriginalRate.Parent = smoke
		smoke.Material = Enum.Material.ForceField
	end
    rayIgnore:FindFirstChild("Smokes").ChildAdded:Connect(function(smoke)
		runService.RenderStepped:Wait()
		local OriginalRate = Instance.new("NumberValue")
		OriginalRate.Value = smoke.ParticleEmitter.Rate
		OriginalRate.Name = "OriginalRate"
		OriginalRate.Parent = smoke
		if library.flags["remove_smoke"] then
			smoke.ParticleEmitter.Rate = 100 - library.flags["smoke_reduction"]
		end
        smoke.Material = Enum.Material.ForceField
    end)
end

local oldBloodSplatter = client.splatterBlood;
local newBloodSplatter = function() end;
misc:addToggle({text = "No Recoil",flag = "remove_recoil"})
misc:addToggle({text = "Remove Flash",flag = "remove_flash",callback = function(v) localPlayer.PlayerGui.Blnd.Blind.Visible = not v end})
misc:addToggle({text = 'Remove Blood', flag = 'Enabled', callback = function(bool) client.splatterBlood = bool and newBloodSplatter or oldBloodSplatter; end})
misc:addToggle({text = "Remove Bullets",flag = "no_bullet"})
misc:addToggle({text = "Reduce Smoke",flag = "remove_smoke"})
misc:addToggle({text = "Force Crosshair",flag = "force_cross"})

misc2:addToggle({text = "Backtrack",flag = "backtrack_enabled"})
misc2:addToggle({text = "Old Gun Sounds", callback = function(val)
    if val == true then
        OldGunSounds = game:GetService("RunService").RenderStepped:Connect(function()
            pcall(function()
                    local player = game:GetService("Players").LocalPlayer.Character
                    if player.EquippedTool.Value == "AK47" then
                        player.Gun.Shoot.SoundId = "rbxassetid://168436671"
                        player.Gun.bolt.SoundId = "rbxassetid://1684275289"
                        player.Gun.boltin.SoundId = "rbxassetid://3599995642"
                        player.Gun.boltrelease.SoundId = "rbxassetid://515216512"
                        player.Gun.magin.SoundId = "rbxassetid://1684275593"
                        player.Gun.magout.SoundId = "rbxassetid://1684275849"
                    end
                    if player.EquippedTool.Value == "M4A1" then
                        player.Gun.SShoot.SoundId = "rbxassetid://1665639883"
                        player.Gun.Equip.SoundId = "rbxassetid://6564247176"
                        player.Gun.Remove.SoundId = "rbxassetid://1665639103"
                        player.Gun.Shoot.SoundId = "rbxassetid://6564247176"
                        player.Gun.Apply.SoundId = "rbxassetid://1665639351"
                        player.Gun.Turn1.SoundId = "rbxassetid://925145888"
                        player.Gun.Turn2.SoundId = "rbxassetid://925145967"
                        player.Gun.Turn3.SoundId = "rbxassetid://925146060"
                        player.Gun.Turn4.SoundId = "rbxassetid://925146170"
                        player.Gun.Turn5.SoundId = "rbxassetid://925146323"
                        player.Gun.Turn6.SoundId = "rbxassetid://925146323"
                        player.Gun.Turn7.SoundId = "rbxassetid://925146323"
                        player.Gun.bolt.SoundId = "rbxassetid://1684291592"
                        player.Gun.boltin.SoundId = "rbxassetid://1684291797"
                        player.Gun.boltrelease.SoundId = "rbxassetid://1684291797"
                        player.Gun.magin.SoundId = "rbxassetid://1684292119"
                        player.Gun.magout.SoundId = "rbxassetid://1684292401"
                    end
                    if player.EquippedTool.Value == "Glock" then
                        player.Gun.Shoot.SoundId = "rbxassetid://1665635507"
                        player.Gun.Switch.SoundId = "rbxassetid://240962650"
                        player.Gun.maghit.SoundId = "rbxassetid://888771897"
                        player.Gun.magin.SoundId = "rbxassetid://1684288365"
                        player.Gun.magout.SoundId = "rbxassetid://1684288526"
                        player.Gun.slide.SoundId = "rbxassetid://1684288735"
                        player.Gun.slidein.SoundId = "rbxassetid://1684289044"
                    end
                    if player.EquippedTool.Value == "Galil" then
                        player.Gun.Shoot.SoundId = "rbxassetid://344800912"
                        player.Gun.Equip.SoundId = "rbxassetid://1665634238"
                        player.Gun.bolt.SoundId = "rbxassetid://1684286891"
                        player.Gun.boltin.SoundId = "rbxassetid://1684287138"
                        player.Gun.magin.SoundId = "rbxassetid://1684287952"
                        player.Gun.magout.SoundId = "rbxassetid://1684288128"
                    end
                    if player.EquippedTool.Value == "USP" then
                        player.Gun.SShoot.SoundId = "rbxassetid://1112952739"
                        player.Gun.Shoot.SoundId = "rbxassetid://1665652648"
                        player.Gun.apply.SoundId = "rbxassetid://1665639351"
                        player.Gun.magin.SoundId = "rbxassetid://206942341"
                        player.Gun.magout.SoundId = "rbxassetid://206942338"
                        player.Gun.remove.SoundId = "rbxassetid://1665639103"
                        player.Gun.slide.SoundId = "rbxassetid://223013136"
                        player.Gun.slidein.SoundId = "rbxassetid://206942322"
                        player.Gun.turn1.SoundId = "rbxassetid://936530480"
                        player.Gun.turn2.SoundId = "rbxassetid://936530564"
                        player.Gun.turn3.SoundId = "rbxassetid://936530659"
                        player.Gun.turn4.SoundId = "rbxassetid://936530800"
                        player.Gun.turn5.SoundId = "rbxassetid://936530926"
                        player.Gun.turn6.SoundId = "rbxassetid://936530926"
                        player.Gun.turn7.SoundId = "rbxassetid://936530926"
                    end
                    if player.EquippedTool.Value == "DualBerettas" then 
                        player.Gun1.Shoot.SoundId = "rbxassetid://251030881"
                        player.Gun2.Shoot.SoundId = "rbxassetid://251030881"
                    end
                    if player.EquippedTool.Value == "P250" then
                        player.Gun.Shoot.SoundId = "rbxassetid://340365431"
                        player.Gun.Shoot.TimePosition = 0
                        player.Gun.magin.SoundId = "rbxassetid://1684297881"
                        player.Gun.magout.SoundId = "rbxassetid://1684298091"
                        player.Gun.slide.SoundId = "rbxassetid://1684298337"
                        player.Gun.slidein.SoundId = "rbxassetid://1684298585"
                    end
                    if player.EquippedTool.Value == "DesertEagle" then
                        player.Gun.Shoot.SoundId = "rbxassetid://202918645"
                        player.Gun.Equip.SoundId = "rbxassetid://223012521"
                        player.Gun.magin.SoundId = "rbxassetid://1684279318"
                        player.Gun.magout.SoundId = "rbxassetid://1684279591"
                        player.Gun.slide.SoundId = "rbxassetid://1684279824"
                        player.Gun.slidein.SoundId = "rbxassetid://1684280102"
                    end
                    if player.EquippedTool.Value == "M249" then
                        player.Gun.Shoot.SoundId = "rbxassetid://193868290"
                        player.Gun.bolt.SoundId = "rbxassetid://1158042711"
                        player.Gun.boltin.SoundId = "rbxassetid://1158042903"
                        player.Gun.boxin.SoundId = "rbxassetid://1158045048"
                        player.Gun.boxout.SoundId = "rbxassetid://1158045203"
                        player.Gun.bullets.SoundId = "rbxassetid://1158043093"
                        player.Gun.close.SoundId = "rbxassetid://1158044531"
                        player.Gun.open.SoundId = "rbxassetid://1158044816"
                    end
                    if player.EquippedTool.Value == "MP9" then
                        player.Gun.Shoot.SoundId = "rbxassetid://222888810"
                        player.Gun.bolt.SoundId = "rbxassetid://1684295316"
                        player.Gun.boltin.SoundId = "rbxassetid://1684295598"
                        player.Gun.magin.SoundId = "rbxassetid://1684294512"
                        player.Gun.magout.SoundId = "rbxassetid://1684294744"
                    end
                    if player.EquippedTool.Value == "UMP" then
                        player.Gun.Shoot.SoundId = "rbxassetid://206953341"
                        player.Gun.bolt.SoundId = "rbxassetid://1684306766"
                        player.Gun.boltin.SoundId = "rbxassetid://1684285841"
                        player.Gun.magin.SoundId = "rbxassetid://1684306283"
                        player.Gun.magout.SoundId = "rbxassetid://1684306521"
                    end
                    if player.EquippedTool.Value == "P90" then
                        player.Gun.Shoot.SoundId = "rbxassetid://1665644012"
                        player.Gun.bolt.SoundId = "rbxassetid://1684297105"
                        player.Gun.boltin.SoundId = "rbxassetid://1684297300"
                        player.Gun.maghit.SoundId = "rbxassetid://1684296035"
                        player.Gun.magin.SoundId = "rbxassetid://1684296357"
                        player.Gun.magout.SoundId = "rbxassetid://1684296652"
                    end
                    if player.EquippedTool.Value == "Bizon" then
                        player.Gun.Equip.SoundId = "rbxassetid://485606203"
                        player.Gun.Shoot.SoundId = "rbxassetid://1544325366"
                        player.Gun.bolt.SoundId = "rbxassetid://1183581141"
                        player.Gun.boltin.SoundId = "rbxassetid://1544325072"
                        player.Gun.magin.SoundId = "rbxassetid://1505933747"
                        player.Gun.magout.SoundId = "rbxassetid://1505933951"
                    end
                    if player.EquippedTool.Value == "Famas" then
                        player.Gun.Shoot.SoundId = "rbxassetid://206953280"
                        player.Gun.Switch.SoundId = "rbxassetid://240962650"
                        player.Gun.bolt.SoundId = "rbxassetid://1684281554"
                        player.Gun.boltin.SoundId = "rbxassetid://1684281882"
                        player.Gun.maghit.SoundId = "rbxassetid://1684282232"
                        player.Gun.magin.SoundId = "rbxassetid://1684282468"
                        player.Gun.magout.SoundId = "rbxassetid://1684284000"
                    end
                    if player.EquippedTool.Value == "Scout" then
                        player.Gun.Shoot.SoundId = "rbxassetid://2476571739"
                        player.Gun.bolt.SoundId = "rbxassetid://516399716"
                        player.Gun.boltin.SoundId = "rbxassetid://516399736"
                        player.Gun.maghit.SoundId = "rbxassetid://516399754"
                        player.Gun.magin.SoundId = "rbxassetid://516399767"
                        player.Gun.magout.SoundId = "rbxassetid://516399791"
                        player.Gun.Zoom.SoundId = "rbxassetid://2862871544"
                        player.Gun.Zoom.PlaybackSpeed = 1
                    end
                    if player.EquippedTool.Value == "AUG" then
                        player.Gun.Shoot.SoundId = "rbxassetid://1657593449"
                        player.Gun.bolt.SoundId = "rbxassetid://1684276056"
                        player.Gun.boltin.SoundId = "rbxassetid://1684276387"
                        player.Gun.maghit.SoundId = "rbxassetid://1684276669"
                        player.Gun.magin.SoundId = "rbxassetid://1684276943"
                        player.Gun.magout.SoundId = "rbxassetid://1684277138"
                    end
                    if player.EquippedTool.Value == "AWP" then
                        player.Gun.Shoot.SoundId = "rbxassetid://2753888131"
                        player.Gun.bolt.SoundId = "rbxassetid://1684277591"
                        player.Gun.boltin.SoundId = "rbxassetid://1684277363"
                        player.Gun.maghit.SoundId = "rbxassetid://1684277814"
                        player.Gun.magin.SoundId = "rbxassetid://1684278055"
                        player.Gun.magout.SoundId = "rbxassetid://1684278254"
                        player.Gun.Zoom.SoundId = "rbxassetid://2862871544"
                        player.Gun.Zoom.PlaybackSpeed = 1
                    end
                    if player.EquippedTool.Value == "G3SG1" then
                        player.Gun.Shoot.SoundId = "rbxassetid://340365815"
                        player.Gun.bolt.SoundId = "rbxassetid://1684285559"
                        player.Gun.boltin.SoundId = "rbxassetid://1684285841"
                        player.Gun.maghit.SoundId = "rbxassetid://777244606"
                        player.Gun.magin.SoundId = "rbxassetid://1684286087"
                        player.Gun.magout.SoundId = "rbxassetid://1684286303"
                    player.Gun.Zoom.SoundId = "rbxassetid://1684300267"
                        player.Gun.Zoom.PlaybackSpeed = 1
                    end
                    if player.EquippedTool.Value == "MAC10" then
                        player.Gun.Shoot.SoundId = "rbxassetid://242422782"
                        player.Gun.bolt.SoundId = "rbxassetid://1684293112"
                        player.Gun.boltin.SoundId = "rbxassetid://1684293359"
                        player.Gun.maghit.SoundId = "rbxassetid://1183581737"
                        player.Gun.magin.SoundId = "rbxassetid://1684292666"
                        player.Gun.magout.SoundId = "rbxassetid://1684292928"
                    end
                    if player.EquippedTool.Value == "SawedOff" then
                        player.Gun.Shoot.SoundId = "rbxassetid://1158047483"
                        player.Gun.bolt.SoundId = "rbxassetid://222889105"
                        player.Gun.insert1.SoundId = "rbxassetid://1657167530"
                        player.Gun.insert2.SoundId = "rbxassetid://1657167827"
                        player.Gun.insert3.SoundId = "rbxassetid://1657168103"
                        player.Gun.insert4.SoundId = "rbxassetid://1657167530"
                        player.Gun.insert5.SoundId = "rbxassetid://1657167827"
                    end
                    if player.EquippedTool.Value == "CZ" then
                        player.Gun.Shoot.SoundId = "rbxassetid://458727115"
                        player.Gun.magin.SoundId = "rbxassetid://1684284159"
                        player.Gun.magout.SoundId = "rbxassetid://1684284647"
                        player.Gun.slide.SoundId = "rbxassetid://1684284931"
                        player.Gun.slidein.SoundId = "rbxassetid://1684285158"
                    end
                    if player.EquippedTool.Value == "Nova" then
                        player.Gun.Shoot.SoundId = "rbxassetid://206953213"
                        player.Gun.bolt.SoundId = "rbxassetid://206953217"
                        player.Gun.insert1.SoundId = "rbxassetid://1657167530"
                        player.Gun.insert2.SoundId = "rbxassetid://1657167827"
                        player.Gun.insert3.SoundId = "rbxassetid://1657168103"
                        player.Gun.insert4.SoundId = "rbxassetid://1657167530"
                        player.Gun.insert5.SoundId = "rbxassetid://1657167827"
                    end
                    if player.EquippedTool.Value == "XM" then
                        player.Gun.Shoot.SoundId = "rbxassetid://202918888"
                        player.Gun.bolt.SoundId = "rbxassetid://361445424"
                        player.Gun.boltin.SoundId = "rbxassetid://361445427"
                        player.Gun.insert1.SoundId = "rbxassetid://1657167530"
                        player.Gun.insert2.SoundId = "rbxassetid://1657167827"
                        player.Gun.insert3.SoundId = "rbxassetid://1657168103"
                        player.Gun.insert4.SoundId = "rbxassetid://1657167530"
                        player.Gun.insert5.SoundId = "rbxassetid://1657167827"
                    end
                    if player.EquippedTool.Value == "MAG7" then
                        player.Gun.Shoot.SoundId = "rbxassetid://395724758"
                        player.Gun.maghit.SoundId = "rbxassetid://515216161"
                        player.Gun.magin.SoundId = "rbxassetid://395724624"
                        player.Gun.magout.SoundId = "rbxassetid://395724665"
                        player.Gun.pump.SoundId = "rbxassetid://206953217"
                    end
            
                    if player.EquippedTool.Value == "Negev" then
                        player.Gun.Shoot.SoundId = "rbxassetid://396243767"
                        player.Gun.bolt.SoundId = "rbxassetid://1158042711"
                        player.Gun.boltin.SoundId = "rbxassetid://1158042903"
                        player.Gun.bullets.SoundId = "rbxassetid://1158043093"
                        player.Gun.lidclose.SoundId = "rbxassetid://1158044531"
                        player.Gun.lidopen.SoundId = "rbxassetid://1158044816"
                        player.Gun.magin.SoundId = "rbxassetid://1158045048"
                        player.Gun.magout.SoundId = "rbxassetid://1158045203"
                    end
            
                    if player.EquippedTool.Value == "SG" then
                        player.Gun.Shoot.SoundId = "rbxassetid://347270113"
                        player.Gun.bolt.SoundId = "rbxassetid://1684300765"
                        player.Gun.boltin.SoundId = "rbxassetid://1684301039"
                        player.Gun.magin.SoundId = "rbxassetid://1684301939"
                        player.Gun.magout.SoundId = "rbxassetid://1684302178"
                    end
                    if player.EquippedTool.Value == "T Knife" then
                        player.Gun.Shoot1.SoundId = "rbxassetid://1665637464"
                        player.Gun.Shoot2.SoundId = "rbxassetid://1665637740"
                    end
                    if player.EquippedTool.Value == "CT Knife" then
                        player.Gun.Shoot1.SoundId = "rbxassetid://1665637464"
                        player.Gun.Shoot2.SoundId = "rbxassetid://1665637740"
                    end
                    if player.EquippedTool.Value == "M4A4" then
                        player.Gun.Equip.SoundId = "rbxassetid://1665638797"
                        player.Gun.Shoot.SoundId = "rbxassetid://4827208824"
                        player.Gun.bolt.SoundId = "rbxassetid://1684291592"
                        player.Gun.boltin.SoundId = "rbxassetid://1684291797"
                        player.Gun.boltrelease.SoundId = "rbxassetid://1684291797"
                        player.Gun.magin.SoundId = "rbxassetid://1684292119"
                        player.Gun.magout.SoundId = "rbxassetid://1684292401"
                    end
                    if player.EquippedTool.Value == "FiveSeven" then
                        player.Gun.Shoot.SoundId = "rbxassetid://212374232"
                        player.Gun.magin.SoundId = "rbxassetid://1684284159"
                        player.Gun.magout.SoundId = "rbxassetid://1684284647"
                        player.Gun.slide.SoundId = "rbxassetid://1684284931"
                        player.Gun.slidein.SoundId = "rbxassetid://1684285158"
                    end
                    if player.EquippedTool.Value == "Tec9" then
                        player.Gun.Shoot.SoundId = "rbxassetid://206953317"
                        player.Gun.bolt.SoundId = "rbxassetid://206953330"
                        player.Gun.boltin.SoundId = "rbxassetid://206953326"
                        player.Gun.magin.SoundId = "rbxassetid://206953325"
                        player.Gun.magout.SoundId = "rbxassetid://206953321"
                        player.Gun.Shoot.TimePosition = 0
                    end
                    if player.EquippedTool.Value == "R8" then
                         player.Gun.Shoot.SoundId = "rbxassetid://3292861902"
                    player.Gun.Shoot.PlaybackSpeed = 1
                    end
                end)
        end)
    else
        OldGunSounds:Disconnect()
    end
end})
misc2:addToggle({text = "Hitsound",flag = "hitsound_enabled"})
misc2:addToggle({text = "Show Watermark",flag = "watermark_enabled",callback = function(val) aloraWatermark.Visible = val end})
misc2:addToggle({text = "Show Bomb Info",flag = "bomb_vitals"})
misc2:addToggle({text = "Show Spectators",flag = "spec_list",callback = function(val) speclistText.Visible = val end})
misc2:addList({text = "Hit Sound",flag = "hitsound_value",values = {"Rust","Skeet","Neverlose","Minecraft","jewelxx","hexx","krxxxk","slots","sonic"}})
misc2:addSlider({text = "Backtrack Latency",flag = "backtrack_time",value = 500,min = 1,max = 2000})
misc2:addSlider({text = "Backtrack Transparency",flag = "backtrack_transparency",value = 75,min = 0,max = 100})
misc2:addSlider({text = "Smoke Reduction %",flag = "smoke_reduction",value = 50,min = 1,max = 100})

local outline = false
local override = false
local crosshair_length = 1
local thickness = 1
cross:addToggle({text = 'Customise Crosshair',flag = 'custom_cross',callback = function() updateCross() end})
cross:addToggle({text = 'Outline',flag = 'crossOutline', callback = function(value) 
    outline = value
    updateCross()
end})
cross:addSlider({text = 'Crosshair Lenght',flag = 'crossLength',min = 1, max = 15,value = 10,callback = function(value)
    if library.flags["custom_cross"] then
        crosshair_length = value
        updateCross()
    end
end})
cross:addSlider({text = 'Thickness',flag = 'crossThick',min = 1, max = 5,value = 1,callback = function(value)
    if library.flags["custom_cross"] then
        thickness = value
        updateCross()
    end
end})
cross:addDivider()
cross:addToggle({text = "Jumpbug",flag = "jump_bug"})
cross:addToggle({text = "Edgebug",flag = "edge_bug"})
cross:addKeybind({text = "EB Bind",flag = "eb_bind",key = Enum.KeyCode.E})
cross:addKeybind({text = "JB Bind",flag = "jb_bind",key = Enum.UserInputType.MouseButton3})

local lines = {}
local lastPos = camera.ViewportSize.Y-90
local veloIndicator = Drawing.new("Text");veloIndicator.Center = true;veloIndicator.Outline = true;veloIndicator.Color = Color3.new(1,1,1);veloIndicator.Font = 2;veloIndicator.Size = 13;veloIndicator.Visible = false;veloIndicator.Text = "0"
local wIndicator = Drawing.new("Text");wIndicator.Center = true;wIndicator.Outline = true;wIndicator.Color = Color3.new(1,1,1);wIndicator.Font = 2;wIndicator.Size = 13;wIndicator.Visible = false;wIndicator.Text = "-"
local aIndicator = Drawing.new("Text");aIndicator.Center = true;aIndicator.Outline = true;aIndicator.Color = Color3.new(1,1,1);aIndicator.Font = 2;aIndicator.Size = 13;aIndicator.Visible = false;aIndicator.Text = "-"
local sIndicator = Drawing.new("Text");sIndicator.Center = true;sIndicator.Outline = true;sIndicator.Color = Color3.new(1,1,1);sIndicator.Font = 2;sIndicator.Size = 13;sIndicator.Visible = false;wIndicator.Text = "-"
local dIndicator = Drawing.new("Text");dIndicator.Center = true;dIndicator.Outline = true;dIndicator.Color = Color3.new(1,1,1);dIndicator.Font = 2;dIndicator.Size = 13;dIndicator.Visible = false;dIndicator.Text = "-"
local spaceIndicator = Drawing.new("Text");spaceIndicator.Center = true;spaceIndicator.Outline = true;spaceIndicator.Color = Color3.new(1,1,1);spaceIndicator.Font = 2;spaceIndicator.Size = 13;spaceIndicator.Visible = false;spaceIndicator.Text = "-"
local ctrlIndicator = Drawing.new("Text");ctrlIndicator.Center = true;ctrlIndicator.Outline = true;ctrlIndicator.Color = Color3.new(1,1,1);ctrlIndicator.Font = 2;ctrlIndicator.Size = 13;ctrlIndicator.Visible = false;ctrlIndicator.Text = "-"

drawingGroup:addToggle({text = "Drawing Enabled",flag = "drawing_enabled",callback = function()
    while library.flags["drawing_enabled"] do wait()
        local normalY = camera.ViewportSize.Y-90
        local alive = isAlive()
        local value = alive and math.floor(math.clamp((localPlayer.Character.HumanoidRootPart.Velocity * Vector3.new(1,0,1)).magnitude*14.85,0,400)) or 0
        if library.flags["velo_graph"] then
            local width = library.flags["graph_width"]+1
            local line = Drawing.new("Line")
            table.insert(lines,line)
            line.From = Vector2.new(camera.ViewportSize.X/2 + (60*width - width),lastPos)
            line.To = Vector2.new(camera.ViewportSize.X/2 + 60*width,normalY - value/4)
            line.Thickness = 1
            line.Transparency = 1
            line.Color = Color3.new(1,1,1)
            line.Visible = true
            if #lines > 1 then
                if #lines > 110 then
                    lines[1]:Remove()
                    table.remove(lines,1)
                    for i = 2,8 do
                        lines[i].Transparency = i/10
                    end
                    local count = 0
                    for i=110,110-6,-1 do
                        count = count + 1
                        lines[i].Transparency = count/10
                    end
                    lines[110-7].Transparency = 1
                end
                for i,v in ipairs(lines) do
                    v.To = v.To - Vector2.new(width,0)
                    v.From = v.From - Vector2.new(width,0)
                end
            end
            lastPos = line.To.Y
        end
        if library.flags["velo_indicator"] then
            veloIndicator.Text = tostring(value)
            veloIndicator.Position = Vector2.new(camera.ViewportSize.X/2,camera.ViewportSize.Y-75)
        end
        if library.flags["wasd_indicator"] then
            wIndicator.Position = Vector2.new(camera.ViewportSize.X/2,camera.ViewportSize.Y-50)
            aIndicator.Position = Vector2.new(camera.ViewportSize.X/2,camera.ViewportSize.Y-50) + Vector2.new(-40,25)
            sIndicator.Position = Vector2.new(camera.ViewportSize.X/2,camera.ViewportSize.Y-50) + Vector2.new(0,25)
            dIndicator.Position = Vector2.new(camera.ViewportSize.X/2,camera.ViewportSize.Y-50) + Vector2.new(40,25)
            spaceIndicator.Position = Vector2.new(camera.ViewportSize.X/2,camera.ViewportSize.Y-50) + Vector2.new(40,0)
            ctrlIndicator.Position = Vector2.new(camera.ViewportSize.X/2,camera.ViewportSize.Y-50) + Vector2.new(-40,0)

            wIndicator.Text = userInputService:IsKeyDown(Enum.KeyCode.W) and "W" or "-"
            aIndicator.Text = userInputService:IsKeyDown(Enum.KeyCode.A) and "A" or "-"
            sIndicator.Text = userInputService:IsKeyDown(Enum.KeyCode.S) and "S" or "-"
            dIndicator.Text = userInputService:IsKeyDown(Enum.KeyCode.D) and "D" or "-"
            spaceIndicator.Text = userInputService:IsKeyDown(Enum.KeyCode.Space) and "J" or "-"
            ctrlIndicator.Text = userInputService:IsKeyDown(Enum.KeyCode.LeftControl) and "C" or "-"
        end
    end
end})
drawingGroup:addToggle({text = "Velocity Graph",flag = "velo_graph"})
drawingGroup:addToggle({text = "Velocity Indicator",flag = "velo_indicator"})
drawingGroup:addToggle({text = "WASD Indicator",flag = "wasd_indicator"})
drawingGroup:addSlider({text = "Graph Width",flag = "graph_width",min = 1,max = 5,value = 1})


local miscTabToggle = true
toggleTab:addButton({text = "Toggle Tabs",callback = function()
    miscTabToggle = not miscTabToggle
    movementFrame.Visible = miscTabToggle
    miscFrame.Visible = miscTabToggle
    miscFrame2.Visible  = miscTabToggle
    crossFrame.Visible = not miscTabToggle
    drawingFrame.Visible = not miscTabToggle
end})

crossFrame.Visible = false
drawingFrame.Visible = false

local rifles,rifleFrame = skinsTab:createGroup(0)
local snipers,sniperFrame = skinsTab:createGroup(1)
local pistols,pistolFrame = skinsTab:createGroup(1)

local glove,gloveFrame = skinsTab:createGroup(0)
local knife,knifeFrame = skinsTab:createGroup(1)

local karambit,karambitFrame = skinsTab:createGroup(1)
local oldKara,oldkaraFrame = skinsTab:createGroup(1)
local bayonet,bayonetFrame = skinsTab:createGroup(1)
local oldbayonet,oldbayonetFrame = skinsTab:createGroup(1)
local huntsman,huntsmanFrame = skinsTab:createGroup(1)
local butterfly,butterflyFrame = skinsTab:createGroup(1)
local oldbutterfly,oldbutterflyFrame = skinsTab:createGroup(1)

local skinToggle,skinToggleFrame = skinsTab:createGroup(0)
local skinTabToggle = true

rifles:addToggle({text = "Rifles", flag = "sc_rifles"})
rifles:addList({text = "AK47",flag = "selected_ak",values= {"Disabled","Stock","Eve","Galaxy Corpse","Goddess","Hallows","Mean Green","Outrunner","Scapter","Skin Committee","Survivor","Variant Camo","VAV","Yltude","[CBCL] Hypersonic","[CBCL] Outlaws"}})
rifles:addList({text = "AK47 (CS)", flag = "selected_ak1", values = {"Disabled","Stock", "Aquamarine Revenge","Asiimov","Bloodsport","Case Hardened","Chromatic Abberation","Legion of Anubis","Neon Rider","Nightmare","Redline","Vulcan","Wild Lotus"}}) 
rifles:addList({text = "Models", flag = "selected_ak2",values = {"Disabled","Stock","Pearl I","Pearl II","Ivory","Darkheart","Draco"}}) 
rifles:addDivider()
rifles:addList({text = "M4A4",flag = "selected_m4",values= {"Disabled","Stock","Delinquent","Devil","Jester","King","[CBCL] BOT[s]","[CBCL] Endline","Dragon","[BF] Howl","[BF] Regina"}--[[,callback = function(val) print(val) end]]})
rifles:addList({text = "M4A1-s",flag = "selected_a1",values= {"Disabled","Stock","Animatic","Heavens Gates","Lunar","[BF] Black Death","[BF] Hyper Beast"}})
rifles:addList({text = "SG",flag = "selected_sg",values= {"Disabled","Stock","Drop Out","Variant Camo","Yltude","[CBCL] DropX"}})

snipers:addToggle({text = "Snipers", flag = "sc_snipers"}) 
snipers:addList({text = "AWP",flag = "selected_awp",values = {"Disabled","Stock","Darkness","Grepkin","Grim","Hika","Nerf","Pinkie","Regina","Scapter","Weeb","[CBCL] Blastech","[CBCL] JTF2"}})
snipers:addList({text = "AWP (CS)", flag = "selected_awp1", values = {"Disabled","Stock","Ancient Dragon","Dragon Lore","Gungnir","Hyper Beast","Mecha Dragon","Nerf","Oni Taiji","Prince","Twitch"}}) 
snipers:addList({text = "Models", flag = "selected_awp2",values = {"Disabled","Stock","Codol","Freedom","Forsaken Operator","Barrett","BSW-460"}}) 
snipers:addDivider()
snipers:addList({text = "Scout", flag = "selected_ssg", values = {"Disabled","Stock","Hellborn","Neon Regulation","Xmas"}, callback = runSSG}) 
snipers:addList({text = "Models", flag = "selected_ssg2", values = {"Disabled", "Stock","OG Xmas", "Newan", "Outlaw"}, callback = runSSG}) 

pistols:addToggle({text = "Pistols", flag = "sc_pistols"}) 
pistols:addList({text = "Deagle", flag = "selected_deagle", values = {"Disabled","Stock","Code Red","Glittery","Grim","Honor-Bound","Independence","Racer","Scapter","Skin Committee","Weeb","Xmas","[CBCL] DropX","[CBCL] TC"}, callback = runDeagle}) 

knife:addToggle({text = "Knives", flag = "sc_knives"})
knife:addList({text = "Your Knife", flag = "OldKnife", values = {"T Knife","CT Knife","Bayonet","Butterfly Knife","Falchion Knife","Gut Knife","Huntsman Knife","Karambit"}})

local sexdogwwdw = {}
knife:addList({text = "New Type",flag = "NewKnife",values = {"Bayonet","Old Bayonet","Butterfly Knife","Old Butterfly Knife","Karambit","Old Karambit","Gut Knife","Huntsman Knife"},callback = function(val)
    sexdogwwdw = val
    bayonetFrame.Visible = val == "Bayonet"
    oldbayonetFrame.Visible = val == "Old Bayonet"
    butterflyFrame.Visible = val == "Butterfly Knife"
    oldbutterflyFrame.Visible = val == "Old Butterfly Knife"
    karambitFrame.Visible = val == "Karambit"
    oldkaraFrame.Visible = val == "Old Karambit"
    huntsmanFrame.Visible = val == "Huntsman Knife"
end})

karambit:addList{text = "Karambit",flag = "kar_skin",values = {"Vanilla","Bloodwidow","Cob Web","Cosmos","Consumed","Death Wish","Digital","Drop Out","Festive","Gold","Goo","Hallows","Jester","Lantern","Liberty Camo","Peppermint","Pizza","Ruby","Scapter","Topaz","Twitch"}}
oldKara:addList{text = "Karambit",flag = "oldkar_skin",values = {"Vanilla","Bloodwidow","Crippled Fade","Frozen Dream","Glossed","Gold","Hallows","Jade Dream","Lantern","Marbelized","Naval","Ruby","Scapter","Splattered","Twitch","Wetland"}}
bayonet:addList{text = "Bayonet",flag = "bay_skin",values = {"Vanilla","Consumed","Cosmos","Crow","Digital","Easy-Bake","Frozen Dream","Goo","Hallows","Intertwine","RSL","Racer","Sapphire","Topaz","Twitch"}}
oldbayonet:addList{text = "Bayonet",flag = "oldbay_skin",values = {"Vanilla"}}
butterfly:addList{text = "Butterfly",flag = "butter_skin",values = {"Vanilla"}}
oldbutterfly:addList{text = "Butterfly",flag = "oldbutter_skin",values = {"Vanilla","Bloodwidow","Crippled Fade","Frozen Dream","Hallows","Icicle","Jade Dream","Marbelized","Naval","Reaper","Ruby","Scapter","Splattered","Twitch","Wetland","White Boss"}}
huntsman:addList{text = "Huntsman",flag = "hunts_skin",values = {"Vanilla"}}

glove:addToggle({text = "Gloves",flag = "glove_changer"})
glove:addList({text = "Skins",flag = "selected_glove",values = {"Disabled", "Stock"}})
glove:addList({text = "Customs",flag = "selected_glove1",values = {"Disabled", "Stock"}})


skinToggle:addToggle({text = "Auto Load",flag = "autoload"})
skinToggle:addButton({text = "Load Selected",callback = function() loadskins() end})


skinToggle:addDivider()
skinToggle:addButton({text = "Toggle Tabs", callback = function()
    skinTabToggle = not skinTabToggle
    rifleFrame.Visible  =  skinTabToggle
    sniperFrame.Visible =  skinTabToggle
    pistolFrame.Visible = skinTabToggle
    knifeFrame.Visible = not skinTabToggle
    gloveFrame.Visible = not skinTabToggle
    if knifeFrame.Visible == true then
        bayonetFrame.Visible = sexdogwwdw == "Bayonet"
        oldbayonetFrame.Visible = sexdogwwdw == "Old Bayonet"
        butterflyFrame.Visible = sexdogwwdw == "Butterfly Knife"
        oldbutterflyFrame.Visible = sexdogwwdw == "Old Butterfly Knife"
        karambitFrame.Visible = sexdogwwdw == "Karambit"
        oldkaraFrame.Visible = sexdogwwdw == "Old Karambit"
        huntsmanFrame.Visible = sexdogwwdw == "Huntsman Knife"
    else
        bayonetFrame.Visible = false
        oldbayonetFrame.Visible = false
        oldbutterflyFrame.Visible = false
        butterflyFrame.Visible = false
        karambitFrame.Visible = false
        oldkaraFrame.Visible = false
        huntsmanFrame.Visible = false
    end

end})

--pistolFrame.Visible = false
knifeFrame.Visible  = false
gloveFrame.Visible = false
bayonetFrame.Visible = false
oldbayonetFrame.Visible = false
oldbutterflyFrame.Visible = false
butterflyFrame.Visible = false
oldkaraFrame.Visible = false
karambitFrame.Visible = false
huntsmanFrame.Visible = false


function setBay()
    game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]:Destroy()
    local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
    game:GetObjects('rbxassetid://7311299522')[1].Parent = Model1
    Model = game.ReplicatedStorage.Viewmodels.Model
    for _, Child in pairs(Model:GetChildren()) do
        Child.Parent = Model.Parent
    end
    Model:Destroy()
    local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
    game:GetObjects('rbxassetid://7311299522')[1].Parent = Model1
    Model = game.ReplicatedStorage.Viewmodels.Model
    for _, Child in pairs(Model:GetChildren()) do
        Child.Parent = Model.Parent
    end
    Model:Destroy()
    game.ReplicatedStorage.Viewmodels["v_Bayonet"].Name = "v_".. library.flags["OldKnife"]
end

function setoldButter()
    game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]:Destroy()
    local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
    game:GetObjects('rbxassetid://9918095549')[1].Parent = Model1
    Model = game.ReplicatedStorage.Viewmodels.Model
    for _, Child in pairs(Model:GetChildren()) do
        Child.Parent = Model.Parent
    end
    Model:Destroy()
    local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
    game:GetObjects('rbxassetid://9918095549')[1].Parent = Model1
    Model = game.ReplicatedStorage.Viewmodels.Model
    for _, Child in pairs(Model:GetChildren()) do
        Child.Parent = Model.Parent
    end
    Model:Destroy()
    game.ReplicatedStorage.Viewmodels["v_oldButterfly"].Name = "v_".. library.flags["OldKnife"]
end

function setoldKar()
    game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]:Destroy()
    local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
    game:GetObjects('rbxassetid://9912405446')[1].Parent = Model1
    Model = game.ReplicatedStorage.Viewmodels.Model
    for _, Child in pairs(Model:GetChildren()) do
        Child.Parent = Model.Parent
    end
    Model:Destroy()
    local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
    game:GetObjects('rbxassetid://9912405446')[1].Parent = Model1
    Model = game.ReplicatedStorage.Viewmodels.Model
    for _, Child in pairs(Model:GetChildren()) do
        Child.Parent = Model.Parent
    end
    Model:Destroy()
    game.ReplicatedStorage.Viewmodels["v_oldKarambit"].Name = "v_".. library.flags["OldKnife"]
end

function setKar()
    game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]:Destroy()
    local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
    game:GetObjects('rbxassetid://7311329570')[1].Parent = Model1
    Model = game.ReplicatedStorage.Viewmodels.Model
    for _, Child in pairs(Model:GetChildren()) do
        Child.Parent = Model.Parent
    end
    Model:Destroy()
    local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
    game:GetObjects('rbxassetid://7311329570')[1].Parent = Model1
    Model = game.ReplicatedStorage.Viewmodels.Model
    for _, Child in pairs(Model:GetChildren()) do
        Child.Parent = Model.Parent
    end
    Model:Destroy()
    game.ReplicatedStorage.Viewmodels["v_Karambit"].Name = "v_".. library.flags["OldKnife"]
end

function runKnife()
    if library.flags["sc_knives"] then
        if library.flags["NewKnife"] == "Bayonet" then
            setBay()
            if library.flags["bay_skin"] == "Vanilla" then
                setBay()
            elseif library.flags["bay_skin"] == "Hallows" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]].Handle.TextureID = "rbxassetid://3037384053"
            elseif library.flags["bay_skin"] == "Twitch" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]].Handle.TextureID = "rbxassetid://3037442406"
            elseif library.flags["bay_skin"] == "Sapphire" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]].Handle.TextureID = "rbxassetid://3086628858"
            elseif library.flags["bay_skin"] == "Crow" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]].Handle.TextureID = "rbxassetid://3037381136"
            elseif library.flags["bay_skin"] == "Cosmos" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]].Handle.TextureID = "rbxassetid://3037403943"
            elseif library.flags["bay_skin"] == "Digital" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]].Handle.TextureID = "rbxassetid://3037376419"
            elseif library.flags["bay_skin"] == "Topaz" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]].Handle.TextureID = "rbxassetid://3037434456"
            elseif library.flags["bay_skin"] == "Racer" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]].Handle.TextureID = "rbxassetid://4614510987"
            elseif library.flags["bay_skin"] == "RSL" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]].Handle.TextureID = "rbxassetid://3366908735"
            elseif library.flags["bay_skin"] == "Easy-Bake" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]].Handle.TextureID = "rbxassetid://2231157740"
            elseif library.flags["bay_skin"] == "Frozen Dream" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]].Handle.TextureID = "rbxassetid://3037412263"
            elseif library.flags["bay_skin"] == "Intertwine" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]].Handle.TextureID = "rbxassetid://3148103638"
            elseif library.flags["bay_skin"] == "Goo" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]].Handle.TextureID = "rbxassetid://4229838546"
            elseif library.flags["bay_skin"] == "Consumed" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]].Handle.TextureID = "rbxassetid://4204673536"
            end
        elseif library.flags["NewKnife"] == "Karambit" then
            setKar()
            if library.flags["kar_skin"] == "Vanilla" then
                setKar()
            elseif library.flags["kar_skin"] == "Hallows" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://3037385194"
            elseif library.flags["kar_skin"] == "Twitch" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://3645660367"
            elseif library.flags["kar_skin"] == "Lantern" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://3037382373"
            elseif library.flags["kar_skin"] == "Digital" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://3037377788"
            elseif library.flags["kar_skin"] == "Topaz" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://3037434205"
            elseif library.flags["kar_skin"] == "Liberty Camo" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://3411673664"
            elseif library.flags["kar_skin"] == "Consumed" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://4204685125"
            elseif library.flags["kar_skin"] == "Goo" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://4229848753"
            elseif library.flags["kar_skin"] == "Death Wish" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://4428764389"
            elseif library.flags["kar_skin"] == "Festive" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://4563314972"
            elseif library.flags["kar_skin"] == "Pizza" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://5902165519"
            elseif library.flags["kar_skin"] == "Jester" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://4614563586"
            elseif library.flags["kar_skin"] == "Drop Out" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://5857462745"
            elseif library.flags["kar_skin"] == "Peppermint" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://6102034764"
            elseif library.flags["kar_skin"] == "Cob Web" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://7944099664"
            elseif library.flags["kar_skin"] == "Gold" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://3414427562"
            elseif library.flags["kar_skin"] == "Cosmos" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://3037403576"
            elseif library.flags["kar_skin"] == "Ruby" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://3037428363"
            elseif library.flags["kar_skin"] == "Bloodwidow" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].TextureID = "rbxassetid://3037401055"
            end
        elseif library.flags["NewKnife"] == "Old Karambit" then
            setoldKar()
            if library.flags["kar_skin"] == "Vanilla" then
                setoldKar()
            elseif library.flags["oldkar_skin"] == "Gold" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle"].Mesh.TextureId = "rbxassetid://2209413746"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Part"].Mesh.TextureId = "rbxassetid://2209413746"
            elseif library.flags["oldkar_skin"] == "Twitch" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle"].Mesh.TextureId = "rbxassetid://1093232020"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Part"].Mesh.TextureId = "rbxassetid://1093232020"
            elseif library.flags["oldkar_skin"] == "Scapter" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle"].Mesh.TextureId = "rbxassetid://2227416644"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Part"].Mesh.TextureId = "rbxassetid://2227416644"
            elseif library.flags["oldkar_skin"] == "Ruby" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle"].Mesh.TextureId = "rbxassetid://841633476"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Part"].Mesh.TextureId = "rbxassetid://841633476"
            elseif library.flags["oldkar_skin"] == "Naval" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle"].Mesh.TextureId = "rbxassetid://686492627"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Part"].Mesh.TextureId = "rbxassetid://686492627"
            elseif library.flags["oldkar_skin"] == "Marbelized" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle"].Mesh.TextureId = "rbxassetid://686492390"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Part"].Mesh.TextureId = "rbxassetid://686492390"
            elseif library.flags["oldkar_skin"] == "Wetland" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle"].Mesh.TextureId = "rbxassetid://686489859"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Part"].Mesh.TextureId = "rbxassetid://686489859"
            elseif library.flags["oldkar_skin"] == "Jade Dream" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle"].Mesh.TextureId = "rbxassetid://686492193"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Part"].Mesh.TextureId = "rbxassetid://686492193"
            elseif library.flags["oldkar_skin"] == "Hallows" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle"].Mesh.TextureId = "rbxassetid://1141693118"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Part"].Mesh.TextureId = "rbxassetid://1141693118"
            elseif library.flags["oldkar_skin"] == "Frozen Dream" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle"].Mesh.TextureId = "rbxassetid://1257241832"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Part"].Mesh.TextureId = "rbxassetid://1257241832"
            elseif library.flags["oldkar_skin"] == "Bloodwidow" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle"].Mesh.TextureId = "rbxassetid://841614374"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Part"].Mesh.TextureId = "rbxassetid://841614374"
            elseif library.flags["oldkar_skin"] == "Lantern" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle"].Mesh.TextureId = "rbxassetid://2499216108"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Part"].Mesh.TextureId = "rbxassetid://2499216108"
            elseif library.flags["oldkar_skin"] == "Splattered" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle"].Mesh.TextureId = "rbxassetid://1158075852"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Part"].Mesh.TextureId = "rbxassetid://1158075852"
            elseif library.flags["oldkar_skin"] == "Crippled Fade" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle"].Mesh.TextureId = "rbxassetid://841623787"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Part"].Mesh.TextureId = "rbxassetid://841623787"
            elseif library.flags["oldkar_skin"] == "Glossed" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle"].Mesh.TextureId = "rbxassetid://841623787"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Part"].Mesh.TextureId = "rbxassetid://841623787"
            end
        elseif library.flags["NewKnife"] == "Old Butterfly Knife" then
            setoldButter()
            if library.flags["oldbutter_skin"] == "Vanilla" then
                setoldButter()
            elseif library.flags["oldbutter_skin"] == "Twitch" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Bite2"].Mesh.TextureId = "rbxassetid://1342643466"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Blade2"].Mesh.TextureId = "rbxassetid://1342643466"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].Mesh.TextureId = "rbxassetid://1342643466"
            elseif library.flags["oldbutter_skin"] == "Wetland" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Bite2"].Mesh.TextureId = "rbxassetid://540165779"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Blade2"].Mesh.TextureId = "rbxassetid://540165779"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].Mesh.TextureId = "rbxassetid://540165779"
            elseif library.flags["oldbutter_skin"] == "Naval" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Bite2"].Mesh.TextureId = "rbxassetid://540165614"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Blade2"].Mesh.TextureId = "rbxassetid://540165614"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].Mesh.TextureId = "rbxassetid://540165614"
            elseif library.flags["oldbutter_skin"] == "Ruby" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Bite2"].Mesh.TextureId = "rbxassetid://841632940"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Blade2"].Mesh.TextureId = "rbxassetid://841632940"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].Mesh.TextureId = "rbxassetid://841632940"
            elseif library.flags["oldbutter_skin"] == "Splattered" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Bite2"].Mesh.TextureId = "rbxassetid://1158075574"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Blade2"].Mesh.TextureId = "rbxassetid://1158075574"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].Mesh.TextureId = "rbxassetid://1158075574"
            elseif library.flags["oldbutter_skin"] == "Frozen Dream" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Bite2"].Mesh.TextureId = "rbxassetid://1257243213"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Blade2"].Mesh.TextureId = "rbxassetid://1257243213"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].Mesh.TextureId = "rbxassetid://1257243213"
            elseif library.flags["oldbutter_skin"] == "Hallows" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Bite2"].Mesh.TextureId = "rbxassetid://1141692457"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Blade2"].Mesh.TextureId = "rbxassetid://1141692457"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].Mesh.TextureId = "rbxassetid://1141692457"
            elseif library.flags["oldbutter_skin"] == "Bloodwidow" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Bite2"].Mesh.TextureId = "rbxassetid://841613162"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Blade2"].Mesh.TextureId = "rbxassetid://841613162"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].Mesh.TextureId = "rbxassetid://841613162"
            elseif library.flags["oldbutter_skin"] == "Scapter" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Bite2"].Mesh.TextureId = "rbxassetid://2270529123"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Blade2"].Mesh.TextureId = "rbxassetid://2270529123"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].Mesh.TextureId = "rbxassetid://2270529123"
            elseif library.flags["oldbutter_skin"] == "White Boss" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Bite2"].Mesh.TextureId = "rbxassetid://560174166"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Blade2"].Mesh.TextureId = "rbxassetid://560174166"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].Mesh.TextureId = "rbxassetid://560174166"
            elseif library.flags["oldbutter_skin"] == "Crippled Fade" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Bite2"].Mesh.TextureId = "rbxassetid://841623423"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Blade2"].Mesh.TextureId = "rbxassetid://841623423"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].Mesh.TextureId = "rbxassetid://841623423"
            elseif library.flags["oldbutter_skin"] == "Marbelized" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Bite2"].Mesh.TextureId = "rbxassetid://540165482"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Blade2"].Mesh.TextureId = "rbxassetid://540165482"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].Mesh.TextureId = "rbxassetid://540165482"
            elseif library.flags["oldbutter_skin"] == "Reaper" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Bite2"].Mesh.TextureId = "rbxassetid://2499215485"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Blade2"].Mesh.TextureId = "rbxassetid://2499215485"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].Mesh.TextureId = "rbxassetid://2499215485"
            elseif library.flags["oldbutter_skin"] == "Icicle" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Bite2"].Mesh.TextureId = "rbxassetid://2664356728"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Blade2"].Mesh.TextureId = "rbxassetid://2664356728"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].Mesh.TextureId = "rbxassetid://2664356728"
            elseif library.flags["oldbutter_skin"] == "Jade Dream" then
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Bite2"].Mesh.TextureId = "rbxassetid://540165364"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Blade2"].Mesh.TextureId = "rbxassetid://540165364"
                game.ReplicatedStorage.Viewmodels["v_".. library.flags["OldKnife"]]["Handle2"].Mesh.TextureId = "rbxassetid://540165364"
            end
        end
    end
end

function setA1()
    if game.ReplicatedStorage["Viewmodels"]:FindFirstChild("v_M4A1", true) then
        game.ReplicatedStorage.Viewmodels["v_M4A1"]:Destroy()
        wait()
        local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
        game:GetObjects('rbxassetid://7311331935')[1].Parent = Model1
        Model = game.ReplicatedStorage.Viewmodels.Model
        for _, Child in pairs(Model:GetChildren()) do
            Child.Parent = Model.Parent
        end
        Model:Destroy()
    else
        local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
        game:GetObjects('rbxassetid://7311331935')[1].Parent = Model1
        Model = game.ReplicatedStorage.Viewmodels.Model
        for _, Child in pairs(Model:GetChildren()) do
            Child.Parent = Model.Parent
        end
        Model:Destroy()
    end
end

function runA1()
    if library.flags["sc_rifles"] then
        if library.flags["selected_a1"] == "Stock" then
            setA1()
        elseif library.flags["selected_a1"] == "[BF] Hyper Beast" then
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Silencer2"].TextureID = "rbxassetid://6451124368"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Silencer"].TextureID = "rbxassetid://6451124368"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Barrel"].TextureID = "rbxassetid://6451126496"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Handle"].TextureID = "rbxassetid://6451126496"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Bolt"].TextureID = "rbxassetid://6451126496"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Grip"].TextureID = "rbxassetid://6451126496"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Back"].TextureID = "rbxassetid://6451126496"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Top"].TextureID = "rbxassetid://6451126496"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Mag"].TextureID = "rbxassetid://6451127619"
        elseif library.flags["selected_a1"] == "[BF] Black Death" then
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Silencer2"].TextureID = "rbxassetid://9639828499"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Silencer"].TextureID = "rbxassetid://9639828499"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Barrel"].TextureID = "rbxassetid://9639827892"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Handle"].TextureID = "rbxassetid://9639827892"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Bolt"].TextureID = "rbxassetid://9639827892"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Grip"].TextureID = "rbxassetid://9639827892"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Back"].TextureID = "rbxassetid://9639827892"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Top"].TextureID = "rbxassetid://9639827892"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Mag"].TextureID = "rbxassetid://9639829370"
        elseif library.flags["selected_a1"] == "Heavens Gates" then
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Silencer2"].TextureID = "rbxassetid://2524141970"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Silencer"].TextureID = "rbxassetid://2524141970"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Barrel"].TextureID = "rbxassetid://2524142163"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Handle"].TextureID = "rbxassetid://2524142163"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Bolt"].TextureID = "rbxassetid://2524142163"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Grip"].TextureID = "rbxassetid://2524142163"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Back"].TextureID = "rbxassetid://2524142163"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Top"].TextureID = "rbxassetid://2524142163"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Mag"].TextureID = "rbxassetid://2524139960"
        elseif library.flags["selected_a1"] == "Lunar" then
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Silencer2"].TextureID = "rbxassetid://3414435728"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Silencer"].TextureID = "rbxassetid://3414435728"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Barrel"].TextureID = "rbxassetid://3414435728"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Handle"].TextureID = "rbxassetid://3414435472"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Bolt"].TextureID = "rbxassetid://2524142163"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Grip"].TextureID = "rbxassetid://3414435472"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Back"].TextureID = "rbxassetid://3414435472"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Top"].TextureID = "rbxassetid://3414435472"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Mag"].TextureID = "rbxassetid://3414435122"
        elseif library.flags["selected_a1"] == "Animatic" then 
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Silencer2"].TextureID = "rbxassetid://1630969918"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Silencer"].TextureID = "rbxassetid://1630969918"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Barrel"].TextureID = "rbxassetid://1630969918"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Handle"].TextureID = "rbxassetid://1630969918"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Bolt"].TextureID = "rbxassetid://1630969918"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Grip"].TextureID = "rbxassetid://1630969918"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Back"].TextureID = "rbxassetid://1630969918"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Top"].TextureID = "rbxassetid://1630969918"
            game.ReplicatedStorage.Viewmodels["v_M4A1"]["Mag"].TextureID = "rbxassetid://1232538589"
        end
    end
end



function setSG()
    if game.ReplicatedStorage["Viewmodels"]:FindFirstChild("v_SG", true) then
		game.ReplicatedStorage.Viewmodels["v_SG"]:Destroy()
    	wait()
    	local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
    	game:GetObjects('rbxassetid://7311349096')[1].Parent = Model1
    	Model = game.ReplicatedStorage.Viewmodels.Model
    	for _, Child in pairs(Model:GetChildren()) do
    	    Child.Parent = Model.Parent
    	end
    	Model:Destroy()
	else
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
    	game:GetObjects('rbxassetid://7311349096')[1].Parent = Model1
    	Model = game.ReplicatedStorage.Viewmodels.Model
    	for _, Child in pairs(Model:GetChildren()) do
    	    Child.Parent = Model.Parent
    	end
    	Model:Destroy()
	end
end


function runSG()
    if library.flags["sc_rifles"] then
        if library.flags["selected_sg"] == "Stock" then
            setSG()
        elseif library.flags["selected_sg"] == "Yltude" then
            game.ReplicatedStorage.Viewmodels["v_SG"]["Handle"].TextureID = "rbxassetid://3270746596"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Scope"].TextureID = "rbxassetid://3270746686"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Mag 2"].TextureID = "rbxassetid://3270746596"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Front"].TextureID = "rbxassetid://3270746596"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Back"].TextureID = "rbxassetid://3270746596"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Bolt"].TextureID = "rbxassetid://3270746596"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Mag"].TextureID = "rbxassetid://3270746596"
        elseif library.flags["selected_sg"] == "[CBCL] DropX" then 
            game.ReplicatedStorage.Viewmodels["v_SG"]["Handle"].TextureID = "rbxassetid://3777235873"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Scope"].TextureID = "rbxassetid://3777365309"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Mag 2"].TextureID = "rbxassetid://3777235873"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Front"].TextureID = "rbxassetid://3777235873"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Back"].TextureID = "rbxassetid://3777235873"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Bolt"].TextureID = "rbxassetid://3777235873"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Mag"].TextureID = "rbxassetid://3777235873"
        elseif library.flags["selected_sg"] == "Drop Out" then
            game.ReplicatedStorage.Viewmodels["v_SG"]["Handle"].TextureID = "rbxassetid://5894322696"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Scope"].TextureID = "rbxassetid://5894322792"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Mag 2"].TextureID = "rbxassetid://5894322696"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Front"].TextureID = "rbxassetid://5894322696"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Back"].TextureID = "rbxassetid://5894322696"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Bolt"].TextureID = "rbxassetid://5894322696"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Mag"].TextureID = "rbxassetid://5894322696"
        elseif library.flags["selected_sg"] == "Variant Camo" then
            game.ReplicatedStorage.Viewmodels["v_SG"]["Handle"].TextureID = "rbxassetid://1641905659"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Scope"].TextureID = "rbxassetid://1641905859"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Mag 2"].TextureID = "rbxassetid://1641905659"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Front"].TextureID = "rbxassetid://1641905659"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Back"].TextureID = "rbxassetid://1641905659"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Bolt"].TextureID = "rbxassetid://1641905659"
            game.ReplicatedStorage.Viewmodels["v_SG"]["Mag"].TextureID = "rbxassetid://1641905659"
        end
    end
end
function setM4()
    if game.ReplicatedStorage["Viewmodels"]:FindFirstChild("v_M4A4", true) then
		game.ReplicatedStorage.Viewmodels["v_M4A4"]:Destroy()
    	wait()
    	local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
    	game:GetObjects('rbxassetid://7311333061')[1].Parent = Model1
    	Model = game.ReplicatedStorage.Viewmodels.Model
    	for _, Child in pairs(Model:GetChildren()) do
    	    Child.Parent = Model.Parent
    	end
    	Model:Destroy()
	else
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
    	game:GetObjects('rbxassetid://7311333061')[1].Parent = Model1
    	Model = game.ReplicatedStorage.Viewmodels.Model
    	for _, Child in pairs(Model:GetChildren()) do
    	    Child.Parent = Model.Parent
    	end
    	Model:Destroy()
	end
end

function runM4()
    if library.flags["sc_rifles"] then
        if library.flags["selected_m4"] == "Stock" then
            setM4()
        elseif library.flags["selected_m4"] == "Devil" then
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Chamber"].TextureID = "rbxassetid://1229672746"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Handle"].TextureID = "rbxassetid://1229672746"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Barrel"].TextureID = "rbxassetid://1229672746"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Sight"].TextureID = "rbxassetid://1229672746"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Cover"].TextureID = "rbxassetid://1229672746"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["notex"].TextureID = "rbxassetid://1229672746"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Back"].TextureID = "rbxassetid://1229672746"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Bolt"].TextureID = "rbxassetid://1229672746"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Mag"].TextureID = "rbxassetid://1229672746"
        elseif library.flags["selected_m4"] == "[CBCL] BOT[s]" then
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Chamber"].TextureID = "rbxassetid://3037283257"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Handle"].TextureID = "rbxassetid://3037283257"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Barrel"].TextureID = "rbxassetid://3037283257"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Sight"].TextureID = "rbxassetid://3037283257"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Cover"].TextureID = "rbxassetid://3037283257"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["notex"].TextureID = "rbxassetid://3037283257"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Back"].TextureID = "rbxassetid://3037283257"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Bolt"].TextureID = "rbxassetid://3037283257"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Mag"].TextureID = "rbxassetid://3037283257"
        elseif library.flags["selected_m4"] == "[CBCL] Endline" then
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Chamber"].TextureID = "rbxassetid://3645642115"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Handle"].TextureID = "rbxassetid://3645642115"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Barrel"].TextureID = "rbxassetid://3645642115"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Sight"].TextureID = "rbxassetid://3645642115"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Cover"].TextureID = "rbxassetid://3645642115"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["notex"].TextureID = "rbxassetid://3645642115"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Back"].TextureID = "rbxassetid://3645642115"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Bolt"].TextureID = "rbxassetid://3645642115"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Mag"].TextureID = "rbxassetid://3645642115"
        elseif library.flags["selected_m4"] == "King" then
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Chamber"].TextureID = "rbxassetid://4229562713"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Handle"].TextureID = "rbxassetid://4229562713"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Barrel"].TextureID = "rbxassetid://4229562713"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Sight"].TextureID = "rbxassetid://4229562713"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Cover"].TextureID = "rbxassetid://4229562713"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["notex"].TextureID = "rbxassetid://4229562713"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Back"].TextureID = "rbxassetid://4229562713"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Bolt"].TextureID = "rbxassetid://4229562713"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Mag"].TextureID = "rbxassetid://4229562713"
        elseif library.flags["selected_m4"] == "Jester" then
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Chamber"].TextureID = "rbxassetid://4614562041"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Handle"].TextureID = "rbxassetid://4614562041"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Barrel"].TextureID = "rbxassetid://4614562041"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Sight"].TextureID = "rbxassetid://4614562041"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Cover"].TextureID = "rbxassetid://4614562041"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["notex"].TextureID = "rbxassetid://4614562041"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Back"].TextureID = "rbxassetid://4614562041"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Bolt"].TextureID = "rbxassetid://4614562041"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Mag"].TextureID = "rbxassetid://4614562041"
        elseif library.flags["selected_m4"] == "Delinquent" then
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Chamber"].TextureID = "rbxassetid://4587060763"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Handle"].TextureID = "rbxassetid://4587060763"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Barrel"].TextureID = "rbxassetid://4587060763"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Sight"].TextureID = "rbxassetid://4587060763"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Cover"].TextureID = "rbxassetid://4587060763"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["notex"].TextureID = "rbxassetid://4587060763"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Back"].TextureID = "rbxassetid://4587060763"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Bolt"].TextureID = "rbxassetid://4587060763"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Mag"].TextureID = "rbxassetid://4587060763"
        elseif library.flags["selected_m4"] == "[BF] Regina" then
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Chamber"].TextureID = "rbxassetid://9116144313"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Handle"].TextureID = "rbxassetid://9116144313"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Barrel"].TextureID = "rbxassetid://9116144313"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Sight"].TextureID = "rbxassetid://9116144313"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Cover"].TextureID = "rbxassetid://9116144313"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["notex"].TextureID = "rbxassetid://9116144313"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Back"].TextureID = "rbxassetid://9116144313"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Bolt"].TextureID = "rbxassetid://9116144313"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Mag"].TextureID = "rbxassetid://9116144313"
        elseif library.flags["selected_m4"] == "[BF] Howl" then
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Chamber"].TextureID = "rbxassetid://6451097179"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Handle"].TextureID = "rbxassetid://6451097179"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Barrel"].TextureID = "rbxassetid://6451097179"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Sight"].TextureID = "rbxassetid://6451097179"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Cover"].TextureID = "rbxassetid://6451097179"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["notex"].TextureID = "rbxassetid://6451097179"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Back"].TextureID = "rbxassetid://6451097179"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Bolt"].TextureID = "rbxassetid://6451097179"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Mag"].TextureID = "rbxassetid://6451097179"
        elseif library.flags["selected_m4"] == "[BF] Dragon" then
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Chamber"].TextureID = "rbxassetid://6522624583"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Handle"].TextureID = "rbxassetid://6522624583"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Barrel"].TextureID = "rbxassetid://6522624583"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Sight"].TextureID = "rbxassetid://6522624583"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Cover"].TextureID = "rbxassetid://6522624583"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["notex"].TextureID = "rbxassetid://6522624583"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Back"].TextureID = "rbxassetid://6522624583"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Bolt"].TextureID = "rbxassetid://6522624583"
            game.ReplicatedStorage.Viewmodels["v_M4A4"]["Mag"].TextureID = "rbxassetid://6522624583"
        end
    end
end


function setAWP()
    if game.ReplicatedStorage["Viewmodels"]:FindFirstChild("v_AWP", true) then
	game.ReplicatedStorage.Viewmodels["v_AWP"]:Destroy()
    	wait()
    	local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
    	game:GetObjects('rbxassetid://7311298463')[1].Parent = Model1
    	Model = game.ReplicatedStorage.Viewmodels.Model
    	for _, Child in pairs(Model:GetChildren()) do
    	    Child.Parent = Model.Parent
    	end
    	Model:Destroy()
	end
end

function  runAWP()
    if library.flags["sc_snipers"] then
        if library.flags["selected_awp"] == "Stock" then
            setAWP()
        elseif library.flags["selected_awp"] == "Grepkin" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://3037064717"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://1598635820"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://3037064717"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://3037064717"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://3037064717"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://3037064717"
        elseif library.flags["selected_awp"] == "Nerf" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://1598678379"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://1598678227"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://1598678379"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://1598678379"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://1598678379"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://1598678379"
        elseif library.flags["selected_awp"] == "[CBCL] JTF2" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://4275330850"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://4275335996"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://4275330850"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://4275330850"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://4275330850"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://4275330850"
        elseif library.flags["selected_awp"] == "Weeb" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://3099184540"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://3055561941"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://3099184540"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://3099184540"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://3099184540"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://3099184540"
        elseif library.flags["selected_awp"] == "Scapter" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://2218460521"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://2218460521"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://2218460521"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://2218460521"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://2218460521"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://2218460521"
        elseif library.flags["selected_awp"] == "[CBCL] Blastech" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://2957203652"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://2957205106"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://2957203652"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://2957203652"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://2957203652"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://2957203652"
        elseif library.flags["selected_awp"] == "Pinkie" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://3414434507"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://3415157031"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://3414434507"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://3414434507"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://3414434507"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://3414434507"
        elseif library.flags["selected_awp"] == "Hika" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://4229559558"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://4229560278"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://4229559558"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://4229559558"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://4229559558"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://4229559558"
        elseif library.flags["selected_awp"] == "Regina" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://4502758453"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://4502758601"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://4502758453"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://4502758453"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://4502758453"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://4502758453"
        elseif library.flags["selected_awp"] == "Darkness" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://5861041299"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://5861333677"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://5861041299"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://5861041299"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://5861041299"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://5861041299"
        elseif library.flags["selected_awp"] == "Grim" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://7943837662"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://5861139281"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://7943837662"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://7943837662"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://7943837662"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://7943837662"
        elseif library.flags["selected_awp1"] == "Stock" then
		    setAWP()
        elseif library.flags["selected_awp1"] == "Ancient Dragon" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://6668821785"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://6668822961"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://6668821785"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://6668821785"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://6668821785"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://6668821785"
        elseif library.flags["selected_awp1"] == "Dragon Lore" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://6451539744"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://6451541040"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://6451539744"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://6451539744"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://6451539744"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://6451539744"
        elseif library.flags["selected_awp1"] == "Gungnir" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://6559063434"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://6561080965"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://6559063434"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://6559063434"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://6559063434"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://6559063434"
        elseif library.flags["selected_awp1"] == "Prince" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://6439619884"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://6439621097"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://6439619884"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://6439619884"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://6439619884"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://6439619884"
        elseif library.flags["selected_awp1"] == "Mecha Dragon" then
            	--AWP Mecha Dragon
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://6451200990"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://6451199638"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://6451200990"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://6451200990"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://6451200990"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://6451200990"
        elseif library.flags["selected_awp1"] == "Oni Taiji" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://6451254361"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://6451255146"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://6451254361"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://6451254361"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://6451254361"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://6451254361"
        elseif library.flags["selected_awp1"] == "Hyper Beast" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://6576205981"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://6576207672"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://6576205981"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://6576205981"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://6576205981"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://6576205981"
        elseif library.flags["selected_awp1"] == "Twitch" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://7826240654"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://7826242521"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://7826240654"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://7826240654"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://7826240654"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://7826240654"
        elseif library.flags["selected_awp1"] == "Nerf" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://7701405678"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://7701407577"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://7701405678"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://7701405678"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://7701405678"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://7701405678"
        elseif library.flags["selected_awp1"] == "Redline" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Handle"].TextureID = "rbxassetid://6657425659"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Scope"].TextureID = "rbxassetid://6657426143"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Mag"].TextureID = "rbxassetid://6657425659"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Barrel"].TextureID = "rbxassetid://6657425659"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide"].TextureID = "rbxassetid://6657425659"
            game.ReplicatedStorage.Viewmodels["v_AWP"]["Slide 2"].TextureID = "rbxassetid://6657425659"
        elseif library.flags["selected_awp2"] == "Stock" then
            setAWP()
        elseif library.flags["selected_awp2"] == "Codol" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]:Destroy()
            local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
            game:GetObjects('rbxassetid://7161371614')[1].Parent = Model1
            Model = game.ReplicatedStorage.Viewmodels.Model
            for _, Child in pairs(Model:GetChildren()) do
                Child.Parent = Model.Parent
            end
            Model:Destroy()
            game.ReplicatedStorage.Viewmodels["v_codol"].Name = "v_AWP"
        elseif library.flags["selected_awp2"] == "Freedom" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]:Destroy()
            local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
            game:GetObjects('rbxassetid://7161374917')[1].Parent = Model1
            Model = game.ReplicatedStorage.Viewmodels.Model
            for _, Child in pairs(Model:GetChildren()) do
                Child.Parent = Model.Parent
            end
            Model:Destroy()
            game.ReplicatedStorage.Viewmodels["v_freedomawp"].Name = "v_AWP"
        elseif library.flags["selected_awp2"] == "Forsaken Operator" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]:Destroy()
            local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
            game:GetObjects('rbxassetid://9470996900')[1].Parent = Model1
            Model = game.ReplicatedStorage.Viewmodels.Model
            for _, Child in pairs(Model:GetChildren()) do
                Child.Parent = Model.Parent
            end
            Model:Destroy()
            game.ReplicatedStorage.Viewmodels["v_sniper01234"].Name = "v_AWP"
        elseif library.flags["selected_awp2"] == "BSW-460" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]:Destroy()
            local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
            game:GetObjects('rbxassetid://9470974218')[1].Parent = Model1
            Model = game.ReplicatedStorage.Viewmodels.Model
            for _, Child in pairs(Model:GetChildren()) do
                Child.Parent = Model.Parent
            end
            Model:Destroy()
            game.ReplicatedStorage.Viewmodels["v_sniper09876"].Name = "v_AWP"
        elseif library.flags["selected_awp2"] == "Barrett" then
            game.ReplicatedStorage.Viewmodels["v_AWP"]:Destroy()
            local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
            game:GetObjects('rbxassetid://6477308219')[1].Parent = Model1
            Model = game.ReplicatedStorage.Viewmodels.Model
            for _, Child in pairs(Model:GetChildren()) do
                Child.Parent = Model.Parent
            end
            Model:Destroy()
            game.ReplicatedStorage.Viewmodels["v_Barrett"].Name = "v_AWP"
        end
    end
end

function setAK()
    if game.ReplicatedStorage["Viewmodels"]:FindFirstChild("v_AK47", true) then
        game.ReplicatedStorage.Viewmodels["v_AK47"]:Destroy()
        wait()
        local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
        game:GetObjects('rbxassetid://7311297308')[1].Parent = Model1
        Model = game.ReplicatedStorage.Viewmodels.Model
        for _, Child in pairs(Model:GetChildren()) do
            Child.Parent = Model.Parent
        end
        Model:Destroy()
    else
        local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
        game:GetObjects('rbxassetid://7311297308')[1].Parent = Model1
        Model = game.ReplicatedStorage.Viewmodels.Model
        for _, Child in pairs(Model:GetChildren()) do
            Child.Parent = Model.Parent
        end
        Model:Destroy()
    end
end

function runAK()
    if library.flags["sc_rifles"] then
        if library.flags["selected_ak"] == "Stock" then
            setAK()
        elseif library.flags["selected_ak"] == "[CBCL] Outlaws" then
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://2687973291"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://2687973291"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://2687973291"
	    elseif library.flags["selected_ak"] == "Hallows" then
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://1228382685"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://1228382685"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://1228382685"
        elseif library.flags["selected_ak"] == "Variant Camo" then
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://1837902606"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://1837902606"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://1837902606"
        elseif library.flags["selected_ak"] == "Mean Green" then
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://3037064977"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://3037064977"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://3037064977"
        elseif library.flags["selected_ak"] == "Goddess" then
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://3414429745"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://3414429745"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://3414429745"
        elseif library.flags["selected_ak"] == "Outrunner" then
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://3180036472"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://3180036472"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://3180036472"
        elseif library.flags["selected_ak"] == "Yltude" then
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://4502750208"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://4502750208"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://4502750208"
        elseif library.flags["selected_ak"] == "Galaxy Corpse" then
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://7943809418"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://7943809418"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://7943809418"
        elseif library.flags["selected_ak"] == "[CBCL] Hypersonic" then
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://9830616145"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://9830616145"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://9830616145"
        elseif library.flags["selected_ak"] == "Scapter" then
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://2214315787"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://2214315787"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://2214315787"
        elseif library.flags["selected_ak"] == "Survivor" then
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://4204545219"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://4204545219"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://4204545219"
        elseif library.flags["selected_ak"] == "Skin Committee" then
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://2218676526"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://2218676526"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://2218676526"
        elseif library.flags["selected_ak"] == "VAV" then
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://3984665816"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://3984665816"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://3984665816"
        elseif library.flags["selected_ak"] == "Eve" then
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://1761152207"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://1761152207"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://1761152207"
        elseif library.flags["selected_ak1"] == "Stock" then
            setAK()
        elseif library.flags["selected_ak1"] == "Asiimov" then
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://6698314618"
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://6698316807"
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://6820836083"
        elseif library.flags["selected_ak1"] == "Aquamarine Revenge" then
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://6448558943"
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://6448557262"
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://6448560045"
        elseif library.flags["selected_ak1"] == "Bloodsport" then
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://6698325103"
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://6698327498"
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://6698326376"
        elseif library.flags["selected_ak1"] == "Case Hardened" then
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://9438683416"
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://9438683416"
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://9438683416"
        elseif library.flags["selected_ak1"] == "Chromatic Abberation" then
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://6585686554"
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://6585685092"
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://6585687653"
        elseif library.flags["selected_ak1"] == "Wild Lotus" then
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://6451260038"
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://6451261292"
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://6451260682"
        elseif library.flags["selected_ak1"] == "Vulcan" then
	        game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://6698167994"
    	    game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://6698170295"
    	    game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://6698169370"
	    elseif library.flags["selected_ak1"] == "Neon Rider" then
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://6451119080"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://6451120406"
    		game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://6451117699"
        elseif library.flags["selected_ak1"] == "Redline" then
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://6663268904"
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://6663270884"
            game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://6663270220"
	    elseif library.flags["selected_ak1"] == "Legion of Anubis" then
    	    game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://6451429545"
    	    game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://6476838768"
    	    game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://6451427955"
        elseif library.flags["selected_ak1"] == "Nightmare" then
    	    game.ReplicatedStorage.Viewmodels["v_AK47"]["Handle"].TextureID = "rbxassetid://6667790295"
    	    game.ReplicatedStorage.Viewmodels["v_AK47"]["Bolt"].TextureID = "rbxassetid://6667791939"
    	    game.ReplicatedStorage.Viewmodels["v_AK47"]["Mag"].TextureID = "rbxassetid://6667791440"
        elseif library.flags["selected_ak2"] == "Stock" then
		    setAK()
        elseif library.flags["selected_ak2"] == "Pearl I" then
	        game.ReplicatedStorage.Viewmodels["v_AK47"]:Destroy()
	        local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
	        game:GetObjects('rbxassetid://7161341595')[1].Parent = Model1
	        Model = game.ReplicatedStorage.Viewmodels.Model
	        for _, Child in pairs(Model:GetChildren()) do
	        	Child.Parent = Model.Parent
	        end
	        Model:Destroy()
	        game.ReplicatedStorage.Viewmodels["v_AK47pearl1"].Name = "v_AK47"
        elseif library.flags["selected_ak2"] == "Pearl II" then
        	game.ReplicatedStorage.Viewmodels["v_AK47"]:Destroy()
	        local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
	        game:GetObjects('rbxassetid://7161342268')[1].Parent = Model1
	        Model = game.ReplicatedStorage.Viewmodels.Model
	        for _, Child in pairs(Model:GetChildren()) do
	        	Child.Parent = Model.Parent
	        end
	        Model:Destroy()
	        game.ReplicatedStorage.Viewmodels["v_AK47pearl2"].Name = "v_AK47"
        elseif library.flags["selected_ak2"] == "Ivory" then
	        game.ReplicatedStorage.Viewmodels["v_AK47"]:Destroy()
	        local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
	        game:GetObjects('rbxassetid://7161345483')[1].Parent = Model1
	        Model = game.ReplicatedStorage.Viewmodels.Model
	        for _, Child in pairs(Model:GetChildren()) do
	        	Child.Parent = Model.Parent
	        end
	        Model:Destroy()
	        game.ReplicatedStorage.Viewmodels["v_AK47drangon"].Name = "v_AK47"
        elseif library.flags["selected_ak2"] == "Darkheart" then
	        game.ReplicatedStorage.Viewmodels["v_AK47"]:Destroy()
	        local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
	        game:GetObjects('rbxassetid://9766269711')[1].Parent = Model1
	        Model = game.ReplicatedStorage.Viewmodels.Model
	        for _, Child in pairs(Model:GetChildren()) do
	        	Child.Parent = Model.Parent
	        end
	        Model:Destroy()
	        game.ReplicatedStorage.Viewmodels["v_AK47 Darkheart"].Name = "v_AK47"
        elseif library.flags["selected_ak2"] == "Draco" then
	        game.ReplicatedStorage.Viewmodels["v_AK47"]:Destroy()
	        local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
	        game:GetObjects('rbxassetid://9794270542')[1].Parent = Model1
	        Model = game.ReplicatedStorage.Viewmodels.Model
	        for _, Child in pairs(Model:GetChildren()) do
	        	Child.Parent = Model.Parent
	        end
	        Model:Destroy()
	        game.ReplicatedStorage.Viewmodels["Draco"].Name = "v_AK47"
        end
    end
end

function setDeagle()
    if game.ReplicatedStorage["Viewmodels"]:FindFirstChild("v_DesertEagle", true) then
        game.ReplicatedStorage.Viewmodels["v_DesertEagle"]:Destroy()
        wait()
        local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
        game:GetObjects('rbxassetid://7311314077')[1].Parent = Model1
        Model = game.ReplicatedStorage.Viewmodels.Model
        for _, Child in pairs(Model:GetChildren()) do
            Child.Parent = Model.Parent
        end
        Model:Destroy()
    else
        local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
        game:GetObjects('rbxassetid://7311314077')[1].Parent = Model1
        Model = game.ReplicatedStorage.Viewmodels.Model
        for _, Child in pairs(Model:GetChildren()) do
            Child.Parent = Model.Parent
        end
        Model:Destroy()
    end
end
 
 function runDeagle()
    if library.flags["sc_pistols"] then
        if library.flags["selected_deagle"] == "Stock" then
            setDeagle()
        elseif library.flags["selected_deagle"] == "Code Red" then
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Handle"].TextureID = "rbxassetid://6451093913"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Slide"].TextureID = "rbxassetid://6451093913"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag 2"].TextureID = "rbxassetid://6451093913"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag"].TextureID = "rbxassetid://6451093913"
        elseif library.flags["selected_deagle"] == "[CBCL] DropX" then
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Handle"].TextureID = "rbxassetid://2209401246"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Slide"].TextureID = "rbxassetid://2209401246"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag 2"].TextureID = "rbxassetid://2209401246"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag"].TextureID = "rbxassetid://2209401246"
        elseif library.flags["selected_deagle"] == "Glittery" then
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Handle"].TextureID = "rbxassetid://1229619847"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Slide"].TextureID = "rbxassetid://1229619847"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag 2"].TextureID = "rbxassetid://1229619847"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag"].TextureID = "rbxassetid://1229619847"
        elseif library.flags["selected_deagle"] == "Grim" then
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Handle"].TextureID = "rbxassetid://1230023014"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Slide"].TextureID = "rbxassetid://1230023014"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag 2"].TextureID = "rbxassetid://1230023014"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag"].TextureID = "rbxassetid://1230023014"
        elseif library.flags["selected_deagle"] == "Honor-Bound" then
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Handle"].TextureID = "rbxassetid://3398984268"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Slide"].TextureID = "rbxassetid://3398984268"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag 2"].TextureID = "rbxassetid://3398984268"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag"].TextureID = "rbxassetid://3398984268"
        elseif library.flags["selected_deagle"] == "Independence" then
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Handle"].TextureID = "rbxassetid://3414426853"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Slide"].TextureID = "rbxassetid://3414426853"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag 2"].TextureID = "rbxassetid://3414426853"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag"].TextureID = "rbxassetid://3414426853"
        elseif library.flags["selected_deagle"] == "Racer" then
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Handle"].TextureID = "rbxassetid://3801635136"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Slide"].TextureID = "rbxassetid://3801635136"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag 2"].TextureID = "rbxassetid://3801635136"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag"].TextureID = "rbxassetid://3801635136"
        elseif library.flags["selected_deagle"] == "Scapter" then
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Handle"].TextureID = "rbxassetid://2226675143"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Slide"].TextureID = "rbxassetid://2226675143"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag 2"].TextureID = "rbxassetid://2226675143"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag"].TextureID = "rbxassetid://2226675143"
        elseif library.flags["selected_deagle"] == "Xmas" then
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Handle"].TextureID = "rbxassetid://1777612792"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Slide"].TextureID = "rbxassetid://1777612792"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag 2"].TextureID = "rbxassetid://1777612792"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag"].TextureID = "rbxassetid://1777612792"
        elseif library.flags["selected_deagle"] == "[CBCL] TC" then
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Handle"].TextureID = "rbxassetid://5668469472"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Slide"].TextureID = "rbxassetid://5668469472"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag 2"].TextureID = "rbxassetid://5668469472"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag"].TextureID = "rbxassetid://5668469472"
        elseif library.flags["selected_deagle"] == "Weeb" then
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Handle"].TextureID = "rbxassetid://1761151907"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Slide"].TextureID = "rbxassetid://1761151907"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag 2"].TextureID = "rbxassetid://1761151907"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag"].TextureID = "rbxassetid://1761151907"
        elseif library.flags["selected_deagle"] == "Skin Committee" then
            setDeagle()
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Handle"].TextureID = "rbxassetid://4587053979"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Slide"].TextureID = "rbxassetid://4587053979"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag 2"].TextureID = "rbxassetid://4587053979"
            game.ReplicatedStorage.Viewmodels["v_DesertEagle"]["Mag"].TextureID = "rbxassetid://4587053979"
        end
    end
end


function setSSG()
    if game.ReplicatedStorage["Viewmodels"]:FindFirstChild("v_Scout", true) then
        game.ReplicatedStorage.Viewmodels["v_Scout"]:Destroy()
        wait()
        local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
        game:GetObjects('rbxassetid://7311362570')[1].Parent = Model1
        Model = game.ReplicatedStorage.Viewmodels.Model
        for _, Child in pairs(Model:GetChildren()) do
            Child.Parent = Model.Parent
        end
        Model:Destroy()
    else
        local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
        game:GetObjects('rbxassetid://7311362570')[1].Parent = Model1
        Model = game.ReplicatedStorage.Viewmodels.Model
        for _, Child in pairs(Model:GetChildren()) do
            Child.Parent = Model.Parent
        end
        Model:Destroy()
    end
end
 
function runSSG()
    if library.flags["sc_snipers"] then
        if library.flags["selected_ssg"] == "Stock" then
            setSSG()
        elseif library.flags["selected_ssg"] == "Xmas" then
            game.ReplicatedStorage.Viewmodels["v_Scout"]["Handle"].TextureID = "rbxassetid://3037243593"
            game.ReplicatedStorage.Viewmodels["v_Scout"]["Mag"].TextureID = "rbxassetid://3037243593"
            game.ReplicatedStorage.Viewmodels["v_Scout"]["Part"].TextureID = "rbxassetid://3037243593"
            game.ReplicatedStorage.Viewmodels["v_Scout"]["Slide"].TextureID = "rbxassetid://3037243593"
            game.ReplicatedStorage.Viewmodels["v_Scout"]["Slide 2"].TextureID = "rbxassetid://3037243593"
        elseif library.flags["selected_ssg"] == "Neon Regulation" then
            game.ReplicatedStorage.Viewmodels["v_Scout"]["Handle"].TextureID = "rbxassetid://4433021226"
            game.ReplicatedStorage.Viewmodels["v_Scout"]["Mag"].TextureID = "rbxassetid://4433021226"
            game.ReplicatedStorage.Viewmodels["v_Scout"]["Part"].TextureID = "rbxassetid://4433021226"
            game.ReplicatedStorage.Viewmodels["v_Scout"]["Slide"].TextureID = "rbxassetid://4433021226"
            game.ReplicatedStorage.Viewmodels["v_Scout"]["Slide 2"].TextureID = "rbxassetid://4433021226"
        elseif library.flags["selected_ssg"] == "Hellborn" then
            game.ReplicatedStorage.Viewmodels["v_Scout"]["Handle"].TextureID = "rbxassetid://2490656082"
            game.ReplicatedStorage.Viewmodels["v_Scout"]["Mag"].TextureID = "rbxassetid://2490656082"
            game.ReplicatedStorage.Viewmodels["v_Scout"]["Part"].TextureID = "rbxassetid://2490656082"
            game.ReplicatedStorage.Viewmodels["v_Scout"]["Slide"].TextureID = "rbxassetid://2490656082"
            game.ReplicatedStorage.Viewmodels["v_Scout"]["Slide 2"].TextureID = "rbxassetid://2490656082"
        elseif library.flags["selected_ssg2"] == "Stock" then
            setSSG()
        elseif library.flags["selected_ssg2"] == "OG Xmas" then
            game.ReplicatedStorage.Viewmodels["v_Scout"]:Destroy()
            local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
            game:GetObjects('rbxassetid://9816062073')[1].Parent = Model1
            Model = game.ReplicatedStorage.Viewmodels.Model
            for _, Child in pairs(Model:GetChildren()) do
                Child.Parent = Model.Parent
            end
            Model:Destroy()
            game.ReplicatedStorage.Viewmodels["Scout Xmas"].Name = "v_Scout"
        elseif library.flags["selected_ssg2"] == "Newan" then
            game.ReplicatedStorage.Viewmodels["v_Scout"]:Destroy()
            local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
            game:GetObjects('rbxassetid://7161433164')[1].Parent = Model1
            Model = game.ReplicatedStorage.Viewmodels.Model
            for _, Child in pairs(Model:GetChildren()) do
                Child.Parent = Model.Parent
            end
            Model:Destroy()
            game.ReplicatedStorage.Viewmodels["v_Scoutnewan"].Name = "v_Scout"
        elseif library.flags["selected_ssg2"] == "Outlaw" then
            game.ReplicatedStorage.Viewmodels["v_Scout"]:Destroy()
            local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
            game:GetObjects('rbxassetid://9470925479')[1].Parent = Model1
            Model = game.ReplicatedStorage.Viewmodels.Model
            for _, Child in pairs(Model:GetChildren()) do
                Child.Parent = Model.Parent
            end
            Model:Destroy()
            game.ReplicatedStorage.Viewmodels["v_outlaw"].Name = "v_Scout"
        end
    end
end

function updateCross()
    local crosshair = localPlayer.PlayerGui.GUI.Crosshairs.Crosshair
    crosshair.LeftFrame.BorderColor3 = Color3.new(0,0,0)
    crosshair.RightFrame.BorderColor3 = Color3.new(0,0,0)
    crosshair.TopFrame.BorderColor3 = Color3.new(0,0,0)
    crosshair.BottomFrame.BorderColor3 = Color3.new(0,0,0)
    crosshair.Dot.BorderColor3 = Color3.new(0,0,0)
    for _, guiPart in pairs(crosshair:GetChildren()) do
        if string.find(guiPart.Name, "Frame") then
            guiPart.BorderSizePixel = 0
            if library.flags["custom_cross"] == true then
                crosshair.LeftFrame.Size = UDim2.new(0, crosshair_length, 0, thickness)
                crosshair.RightFrame.Size = UDim2.new(0, crosshair_length, 0, thickness)
                crosshair.TopFrame.Size = UDim2.new(0, thickness, 0, crosshair_length)
                crosshair.BottomFrame.Size = UDim2.new(0, thickness, 0, crosshair_length)
                if outline == true then
                    crosshair.LeftFrame.BorderSizePixel = 1
                    crosshair.RightFrame.BorderSizePixel = 1
                    crosshair.TopFrame.BorderSizePixel = 1
                    crosshair.BottomFrame.BorderSizePixel = 1
                    crosshair.Dot.BorderSizePixel = 1
                else
                    crosshair.LeftFrame.BorderSizePixel = 0
                    crosshair.RightFrame.BorderSizePixel = 0
                    crosshair.TopFrame.BorderSizePixel = 0
                    crosshair.BottomFrame.BorderSizePixel = 0
                    crosshair.Dot.BorderSizePixel = 0
                end
            else
                crosshair.LeftFrame.Size = UDim2.new(0, 10, 0, 2)
                crosshair.RightFrame.Size = UDim2.new(0, 10, 0, 2)
                crosshair.TopFrame.Size = UDim2.new(0, 2, 0, 10)
                crosshair.BottomFrame.Size = UDim2.new(0, 2, 0, 10)
            end
        end
    end
end


local btFolder = Instance.new("Folder",workspace)
players.PlayerAdded:Connect(function(plr)
    createEsp(plr)
    if btFolder:FindFirstChild(plr.Name) then return end
    local plrbtFolder = Instance.new("Folder",btFolder)
    plrbtFolder.Name = plr.Name
end)

for i,v in next, players:GetPlayers() do
    createEsp(v)
    if btFolder:FindFirstChild(v.Name) then return end
    local plrbtFolder = Instance.new("Folder",btFolder)
    plrbtFolder.Name = v.Name
end

for i,v in next, replicatedStorage.Viewmodels:GetDescendants() do
    if v.Name == "HumanoidRootPart" and v:IsA("BasePart") then
        v.Transparency = 1
    end
end

local preloadSound = Instance.new("Sound")
for i,v in next, hitsounds do
    preloadSound.SoundId = v
    game:GetService('ContentProvider'):PreloadAsync({preloadSound},function()end)
end
preloadSound:Destroy()

camera.ChildAdded:Connect(function(new)
    spawn(function()
        if new.Name == "Arms" and new:IsA("Model") then
            for i,v in pairs(new:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("Right Arm") or v:FindFirstChild("Left Arm") then
                    local RightArm = v:FindFirstChild("Right Arm") or nil
                    local LeftArm = v:FindFirstChild("Left Arm") or nil

                    local RightGlove = (RightArm and (RightArm:FindFirstChild("Glove") or RightArm:FindFirstChild("RGlove"))) or nil
                    local LeftGlove = (LeftArm and (LeftArm:FindFirstChild("Glove") or LeftArm:FindFirstChild("LGlove"))) or nil

                    local RightSleeve = RightArm and RightArm:FindFirstChild("Sleeve") or nil
                    local LeftSleeve = LeftArm and LeftArm:FindFirstChild("Sleeve") or nil

                    if library.flags["remove_gloves"] == true then
                        if RightGlove ~= nil then
                            RightGlove.Transparency = 1
                        end
                        if LeftGlove ~= nil then
                            LeftGlove.Transparency = 1
                        end
                    end

                    if library.flags["remove_sleeves"] == true then
                        if RightSleeve ~= nil then
                            RightSleeve.Transparency = 1
                        end
                        if LeftSleeve ~= nil then
                            LeftSleeve.Transparency = 1
                        end
                    end
                    if library.flags["remove_arms"] == true then
                        if RightArm ~= nil then
                            RightArm.Transparency = 1
                        end
                        if LeftArm ~= nil then
                            LeftArm.Transparency = 1
                        end
                    end
                elseif library.flags["weapon_chams"] == true and v:IsA("BasePart") and not table.find({"Right Arm", "Left Arm", "Flash"}, v.Name) and v.Transparency ~= 1 then
                    if v:IsA("MeshPart") then v.TextureID = "" end
                    if v:FindFirstChildOfClass("SpecialMesh") then v:FindFirstChildOfClass("SpecialMesh").TextureId = "" end
                    v.Color = library.flags["weapon_color"]
                    v.Material = library.flags["weapon_material"]
                    v.Reflectance = library.flags["weap_refl"]*0.1
                    v.Transparency = library.flags["weap_trans"]*0.1
                end
            end
        end
        if library.flags["autoload"] then
            loadskins()
        end
    end)
end)

local ebCooldown = false
local triggerbotDebounce = false
local silentTrigger = false
local oldAmbient = lighting.Ambient
local oldOutdoorAmbient = lighting.OutdoorAmbient
local oldState = Enum.HumanoidStateType.None

local btPart = Instance.new("Part")
local readValue = Instance.new("ObjectValue",btPart)
readValue.Name = "read"
btPart.Material = "SmoothPlastic"
btPart.CanCollide = false
btPart.Anchored = true
btPart.Name = "btp"

function loadskins()
    if library.flags["sc_rifles"] then 
        runAK()  
    end
    if library.flags["sc_rifles"] then 
        runM4()
    end
    if library.flags["sc_rifles"] then 
        runSG()
    end
    if library.flags["sc_rifles"] then 
        runA1()
    end
    if library.flags["sc_snipers"] then 
        runAWP() 
    end
    if library.flags["sc_snipers"] then 
        runSSG()
    end
    if library.flags["sc_pistols"] then  
        runDeagle() 
    end
    if library.flags["sc_knives"] then 
        runKnife() 
    end
end

local BombTimer = 40
local sexinfo = "Site: - ; Timer: --/--"

workspace.ChildAdded:Connect(function(new)
	if new.Name == "C4" and library.flags["bomb_vitals"] == true then

        local fakebomb = Instance.new("Part")
        fakebomb.Parent = new
        fakebomb.Size = Vector3.new(1,1,1)
        fakebomb.Anchored = true


        new.PrimaryPart = fakebomb

        local bombPlant = "-"

		spawn(function()
            if (new.PrimaryPart.Position - workspace.Map.SpawnPoints.C4Plant.Position).Magnitude > (new.PrimaryPart.Position - workspace.Map.SpawnPoints.C4Plant2.Position).Magnitude then
                bombPlant = "A"
            elseif (new.PrimaryPart.Position - workspace.Map.SpawnPoints.C4Plant2.Position).Magnitude > (new.PrimaryPart.Position - workspace.Map.SpawnPoints.C4Plant.Position).Magnitude then
                bombPlant = "B"
            end
            
            local highlight = Instance.new('Highlight',new);highlight.FillTransparency = 0.7;highlight.FillColor = Color3.new(1,0,0);highlight.OutlineTransparency = 1;highlight.OutlineColor = Color3.new(1,1,1);highlight.Adornee = new;highlight.DepthMode = 'AlwaysOnTop'
			
			repeat
			    bvitalsOutline.Visible = true
                bvitals.Visible = true
                bvitalsText.Visible = true
                bombStats.Visible = true
				wait(1)
				BombTimer = BombTimer - 1
                sexinfo =  "Site: "..bombPlant.." ; Timer: "..tostring(BombTimer.. "/40")
                bvitalsOutline.Size = (Vector2.new(502,5));bvitals.Size = (Vector2.new(BombTimer*12.5,3))
			until BombTimer == 0 or workspace.Status.RoundOver.Value == true
            wait(2)
            sexinfo = "Site: - ; Timer: --/--"
            bombStats.Visible = false;bvitalsOutline.Visible = false;bvitals.Visible = false;bvitalsText.Visible = false
            BombTimer = 40
			bvitals.Size = (Vector2.new(500,3))
		end)
	end
end)


function onStep()
    silentPart = nil
    local spectators = {}
    speclistText.Text = "Spectators"
    bombStats.Text = sexinfo
    local weapon = getWeaponInfo()
    if library.flags["esp_enabled"] then
        for playerName,esp in next, espObjects do
            local player = players:FindFirstChild(playerName)
            if not player then
                esp.invis()
                espObjects[playerName] = nil
                continue
            end
            if player.Team ~= localPlayer.Team then
                if isAlive(player) then
                    local character = player.Character
                    local pos,onscreen = camera:WorldToViewportPoint(character["HumanoidRootPart"].Position)
                    if onscreen then
                        if weapon.alive then
                            if math.abs(localPlayer.Character.HumanoidRootPart.Position.Y-character["HumanoidRootPart"].Position.Y) > 50 then
                                esp.invis()
                                continue
                            end
                        end
                        local middle = character["HumanoidRootPart"].CFrame
                        local smallestX,biggestX = 9e9,-9e9
                        local smallestY,biggestY = 9e9,-9e9

                        local y = (middle.p-character["Head"].Position).magnitude + character["Head"].Size.Y/2
                        local x1 = (middle.p-character["LeftHand"].Position).magnitude
                        local x2 = (middle.p-character["LeftHand"].Position).magnitude
                        local minY1 = (middle.p-character["RightFoot"].Position).magnitude
                        local minY2 = (middle.p-character["LeftFoot"].Position).magnitude

                        local minY = minY1 > minY2 and minY1 or minY2
                        local minX = x1 < x2 and x1 or x2

                        local espOffsets = getOffsets(minX+character["LeftHand"].Size.X/2,y,minY+character["RightFoot"].Size.Y/2,character["HumanoidRootPart"].Size.Z/2)
                        for i,v in next, espOffsets do
                            local pos = camera:WorldToViewportPoint(middle * v.p)
                            if smallestX > pos.X then
                                smallestX = pos.X
                            end
                            if biggestX < pos.X then
                                biggestX = pos.X
                            end

                            if smallestY > pos.Y then
                                smallestY = pos.Y
                            end
                            if biggestY < pos.Y then
                                biggestY = pos.Y
                            end
                        end

                        esp.box.Visible = library.flags["box_enabled"]
                        esp.boxol.Visible = library.flags["box_enabled"]
                        esp.boxil.Visible = library.flags["box_enabled"]
                        esp.text.Visible = library.flags["name_enabled"]
                        esp.textshadow.Visible = library.flags["name_enabled"]
                        esp.healthb.Visible = library.flags["healthbar_enabled"]
                        esp.healthbo.Visible = library.flags["healthbar_enabled"]

                        esp.box.Color = library.flags["box_color"]
                        esp.text.Color = library.flags["name_color"]
                        esp.healthb.Color = library.flags["healthbar_color"]

                        if true then
                            esp.box.Size = floor(Vector2.new(biggestX-smallestX,biggestY-smallestY))
                            esp.box.Position = floor(Vector2.new(smallestX,smallestY))

                            esp.boxol.Size = floor(Vector2.new(biggestX-smallestX,biggestY-smallestY) + Vector2.new(2,2))
                            esp.boxol.Position = floor(Vector2.new(smallestX,smallestY) - Vector2.new(1,1))

                            esp.boxil.Size = floor(Vector2.new(biggestX-smallestX,biggestY-smallestY) - Vector2.new(2,2))
                            esp.boxil.Position = floor(Vector2.new(smallestX,smallestY) + Vector2.new(1,1))
                        end
                        if true then
                            esp.text.Text = playerName
                            esp.textshadow.Text = playerName
                            esp.text.Position = floor(Vector2.new(smallestX + (biggestX-smallestX)/2 - (esp.text.TextBounds.X/2),smallestY-esp.text.TextBounds.Y-2))
                            esp.textshadow.Position = esp.text.Position + Vector2.new(1,1)
                        end
                        if true then
                            esp.healthbo.Size = floor(Vector2.new(4,(biggestY-smallestY)+2))
                            esp.healthbo.Position = floor(Vector2.new(smallestX-6,smallestY-1))

                            esp.healthb.Size = floor(Vector2.new(2,(-player.Character.Humanoid.Health/100*(biggestY-smallestY))+3))
                            esp.healthb.Position = floor(Vector2.new(smallestX-5,smallestY+esp.healthbo.Size.Y-3))
                        end
                    else
                        esp.invis()
                    end
                else
                    esp.invis()
                end
            else
                esp.invis()
            end
        end
    end
    for _, player in pairs(players:GetPlayers()) do
        if player.Team ~= localPlayer.Team and player.Status.Alive.Value == true and not player.Character:FindFirstChild('Highlight') then
            local highlight = Instance.new('Highlight',player.Character)
            highlight.FillTransparency = innerTransparency
            highlight.FillColor = color
            highlight.OutlineTransparency = outlineTransparency
            highlight.OutlineColor = color2
            highlight.Adornee = player.Character
            highlight.DepthMode = depthMode
        end
        if player.Status.Alive.Value == true then
            if player.Team == localPlayer.Team or library.flags["highlights"] == false then
                if player.Character:FindFirstChild('Highlight') then
                    player.Character.Highlight.Enabled = false
                end
            else
                if player.Character:FindFirstChild('Highlight') then
                    player.Character.Highlight.Enabled = true
                end
            end
        end
    end
    if weapon.alive then
        local currentState = localPlayer.Character.Humanoid:GetState()
        hookJp = library.flags["jump_bug"] and isButtonDown(library.flags["jb_bind"])
        if weapon.triggerbot and not triggerbotDebounce and isButtonDown(library.flags["trigger_keybind"]) then
            local raycastParams = RaycastParams.new();raycastParams.FilterType = Enum.RaycastFilterType.Blacklist;raycastParams.FilterDescendantsInstances = {camera,localPlayer.Character,workspace.Debris,workspace.Map.SpawnPoints}
            local raycastResult = workspace:Raycast(camera.CFrame.p, camera.CFrame.LookVector * 4096, raycastParams)
            if raycastResult and raycastResult.Instance:IsA("BasePart") then
                for i,v in next, players:GetPlayers() do
                    if v ~= localPlayer and teamCheck(v,library.flags["aimbot_team"]) and isAlive(v) then
                        if raycastResult.Instance:IsDescendantOf(v.Character) or raycastResult.Instance.Name == "btp" then
                            triggerbotDebounce = true
                            if weapon.trigger_delay ~= 0 then
                                wait(weapon.trigger_delay/1000)
                            end
                            mouse1press(); silentTrigger = true; wait(); mouse1release(); silentTrigger = false
                            triggerbotDebounce = false
                        end
                    end
                end
            end
        end
        if library.flags["aimbot_enabled"] and (userInputService:IsMouseButtonPressed(0) or silentTrigger) then
            if weapon.aim_assist or weapon.silent_aim then
                local player,distance = getNearest(library.flags["aimbot_visonly"],library.flags["aimbot_team"])
                local aimbotPart,nearest,partPos = nil,9e9,nil
                if player then
                    for i,v in next, weapon.hitboxes do
                        local screenPos,onScreen = camera:WorldToScreenPoint(player.Character[v].Position)
                        local magnitude = (Vector2.new(screenPos.X,screenPos.Y)-Vector2.new(mouse.X,mouse.Y)).magnitude
                        if onScreen and magnitude < nearest then
                            nearest = magnitude
                            partPos = screenPos
                            aimbotPart = player.Character[v]
                        end
                    end
                end
                if aimbotPart and not menu.Enabled then
                    if weapon.aim_assist and distance <= weapon.assist_fov then
                        mousemoverel(-((mouse.X - partPos.X)/weapon.smoothness),-((mouse.Y - partPos.Y)/weapon.smoothness))
                    end
                    if weapon.silent_aim and distance <= weapon.silent_fov then
                        silentPart = aimbotPart
                    end
                end
            end
        end
        if library.flags["edge_bug"] and not ebCooldown and isButtonDown(library.flags["eb_bind"]) then
            if oldState == Enum.HumanoidStateType.Freefall and currentState == Enum.HumanoidStateType.Landed then
                ebCooldown = true
                local dir = localPlayer.Character.HumanoidRootPart.Velocity
                for i=1,5 do wait()
                    localPlayer.Character.HumanoidRootPart.Velocity = (Vector3.new(1.2,0,1.2) * dir) - Vector3.new(0,15,0)
                end
                wait()
                localPlayer.Character.HumanoidRootPart.Velocity *= Vector3.new(1.8,1,1.8)
                spawn(function()
                    wait(0.075)
                    ebCooldown = false
                end)
            end
        end
        localPlayer.Cash.Value = library.flags["inf_cash"] and 16000 or localPlayer.Cash.Value
        oldState = currentState
        local btTime = library.flags["backtrack_time"]/1000
        local trans = library.flags["backtrack_transparency"]/100
        local aimbotTeam = library.flags["aimbot_team"]
        local plrPos = localPlayer:FindFirstChild("CameraCF") and localPlayer.CameraCF.Value.p or nil
        for i,v in next, players:GetPlayers() do
            if v == localPlayer then continue end
            if library.flags["backtrack_enabled"] then
                if teamCheck(v,aimbotTeam) then
                    spawn(function()
                        wait()
                        if isAlive(v) then
                            local bt = btPart:Clone()
                            bt.read.Value = v.Character
                            bt.Transparency = trans
                            bt.Size = v.Character.Head.Size - Vector3.new(0.025,0.025,0.025)
                            bt.CFrame = v.Character.Head.CFrame
                            bt.Parent = btFolder[v.Name]

                            debris:AddItem(bt,btTime)
                        end
                    end)
                end
            end
            if not isAlive(v) then
                if library.flags["spec_list"] and plrPos and v:FindFirstChild("CameraCF") then
                    if (v.CameraCF.Value.p-plrPos).magnitude < 20 then
                        speclistText.Text = speclistText.Text.."\n"..v.Name
                    end
                end
            end
        end
    end
    if library.flags["remove_recoil"] then
        client.RecoilX = 0
        client.RecoilY = 0
        client.resetaccuracy()
    end
    localPlayer.PlayerGui.GUI.SuitZoom.Visible = false
    if not library.flags["drawing_enabled"] or not library.flags["velo_graph"] then
        for i,v in ipairs(lines) do
            v:Remove()
            table.remove(lines,i)
        end
    end
    wIndicator.Visible = library.flags["drawing_enabled"] and library.flags["wasd_indicator"]
    aIndicator.Visible = library.flags["drawing_enabled"] and library.flags["wasd_indicator"]
    sIndicator.Visible = library.flags["drawing_enabled"] and library.flags["wasd_indicator"]
    dIndicator.Visible = library.flags["drawing_enabled"] and library.flags["wasd_indicator"]
    spaceIndicator.Visible = library.flags["drawing_enabled"] and library.flags["wasd_indicator"]
    ctrlIndicator.Visible = library.flags["drawing_enabled"] and library.flags["wasd_indicator"]
    veloIndicator.Visible = library.flags["velo_graph"] and library.flags["drawing_enabled"]
    if library.flags["world_gradient"] then
        lighting.Ambient = library.flags["gradient_color"]
        lighting.OutdoorAmbient = library.flags["outdoor_gradient_color"]
    else
        lighting.Ambient = oldAmbient
        lighting.OutdoorAmbient = oldOutdoorAmbient
    end
    lighting.TimeOfDay = library.flags["time_changer"] and library.flags["time_value"]/2 or lighting.TimeOfDay
    localPlayer.Cash.Value = library.flags["inf_cash"] and 16000 or localPlayer.Cash.Value
    if library.flags["watermark_enabled"] then
        local sec,min,hrs = os.date("*t",os.time())["sec"],os.date("*t",os.time())["min"],os.date("*t",os.time())["hour"]
        local seconds = string.len(sec) == 2 and sec or "0"..sec
        local minutes = string.len(min) == 2 and min or "0"..min
        local hours = string.len(hrs) == 2 and hrs or "0"..hrs
        aloraWatermark.Text = "alora | "..ver.." | "..hours..":"..minutes..":"..seconds
    end
end


localPlayer.Additionals.TotalDamage.Changed:Connect(function(val)
	if current == 0 then return end
	coroutine.wrap(function()
		if library.flags["hitmarkers"] then
			local Line = Drawing.new("Line")
			local Line2 = Drawing.new("Line")
			local Line3 = Drawing.new("Line")
			local Line4 = Drawing.new("Line")

			local x, y = camera.ViewportSize.X/2, camera.ViewportSize.Y/2

			Line.From = Vector2.new(x + 4, y + 4)
			Line.To = Vector2.new(x + 10, y + 10)
			Line.Color = library.flags["hmcolor"]
			Line.Visible = true

			Line2.From = Vector2.new(x + 4, y - 4)
			Line2.To = Vector2.new(x + 10, y - 10)
			Line2.Color = library.flags["hmcolor"]
			Line2.Visible = true

			Line3.From = Vector2.new(x - 4, y - 4)
			Line3.To = Vector2.new(x - 10, y - 10)
			Line3.Color = library.flags["hmcolor"]
			Line3.Visible = true

			Line4.From = Vector2.new(x - 4, y + 4)
			Line4.To = Vector2.new(x - 10, y + 10)
			Line4.Color = library.flags["hmcolor"]
			Line4.Visible = true

			Line.Transparency = 1
			Line2.Transparency = 1
			Line3.Transparency = 1
			Line4.Transparency = 1

			Line.Thickness = 1
			Line2.Thickness = 1
			Line3.Thickness = 1
			Line4.Thickness = 1

			wait(0.3)
			for i = 1,0,-0.1 do
				wait()
				Line.Transparency = i
				Line2.Transparency = i
				Line3.Transparency = i
				Line4.Transparency = i
			end
			Line:Remove()
			Line2:Remove()
			Line3:Remove()
			Line4:Remove()
		end
	end)()
end)

client.splatterBlood = function() end

runService.RenderStepped:Connect(onStep)
spawn(function()
    while wait() do
        timeout -= 1
    end
end)
while wait(5) do
    if library.flags["skybox_changer"] then
        updateSkybox()
    end
end
