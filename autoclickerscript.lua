getgenv().autoTap = false
getgenv().autoRebirth = false
getgenv().autoMultiply = false

local remotePath = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices








function doTap()
    spawn(function()
        while autoTap == true do
            local args = {[1] = 1}
            remotePath.ClickService.Click:FireServer(unpack(args))
            wait()
        end
    end)
end



function rebirth(rebirthAmount)
    spawn(function()
        while autoRebirth do
            local args = {[1] = rebirthAmount} 
            remotePath.RebirthService.BuyRebirths:FireServer(unpack(args))
            wait()
        end 
    end)
end



function multiplier()
    spawn(function ()
        while autoMultiply do
          local args = {[1] = "ClickMultiply"}  
          remotePath.UpgradeService.BuyUpgrade:FireServer(unpack(args))
          wait()
        end
    end)
end



function getCurrentPlayerPOS()
    local plyr = game.Players.LocalPlayer
    if plyr.Character then
        return plyr.Character.HumanoidRootPart.Position
    end    
        return false
end

function teleportTO(placeCFrame)
    local plyr = game.Players.LocalPlayer
    if plyr.Character then
        plyr.Character.HumanoidRootPart.CFrame = placeCFrame
    end    
end

function teleportWorld(world)
    if game:GetService("Workspace").Worlds:FindFirstChild(world) then
        teleportTO(game:GetService("Workspace").Worlds[world].Teleport.CFrame)
    end
end

local library = loadstring(game:HttpGet(("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3")))()

local w = library:CreateWindow("Clicker Madness") -- Creates the window

local b = w:CreateFolder("AutoTap")

local c = w:CreateFolder("Multiplier") -- Creates the folder(U will put here your buttons,etc)

local d = w:CreateFolder("Teleport")

b:DestroyGui()

b:Toggle("Auto Farm",function(bool)
    getgenv().autoTap = bool
    getgenv().autoRebirth = bool
    print("Auto farm is now:", bool)
    if bool then
        doTap()
        rebirth(1000)
    end
end)

c:Toggle("Auto Upgrade",function(bool)
    getgenv().autoMultiply = bool
    print("Auto upgrader is now:", bool)
    if bool then
        multiplier()
    end
end)


local selectedWorld
d:Dropdown("Choose World",{"Lava","Desert","Dominus","Fire"},true,function(value)
    selectedWorld = value
    print(value)
end)

d:Button("Teleport",function()
    if selectedWorld then
        teleportWorld(selectedWorld) 
    end
end)


--[[
    b:Label("Pretty Useless NGL",{
    TextSize = 25; -- Self Explaining
    TextColor = Color3.fromRGB(201, 4, 4); -- Self Explaining
    BgColor = Color3.fromRGB(51, 50, 49); -- Self Explaining
    
}) 

b:Button("Button",function()
    print("Elym Winning")
end)

b:Slider("Slider",{
    min = 10; -- min value of the slider
    max = 50; -- max value of the slider
    precise = true; -- max 2 decimals
},function(value)
    print(value)
end)

b:Dropdown("Dropdown",{"A","B","C"},true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
    print(mob)
end)

b:Bind("Bind",Enum.KeyCode.C,function() --Default bind
    print("Yes")
end)

b:ColorPicker("ColorPicker",Color3.fromRGB(255,0,0),function(color) --Default color
    print(color)
end)

b:Box("Box","number",function(value) -- "number" or "string"
    print(value)
end)
]]