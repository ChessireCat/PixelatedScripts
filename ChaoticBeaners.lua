local floor = game.Workspace.Floor
--#region
local fountains = floor:FindFirstChild("Fountains")

local AutoCollectGummies = "true" 

local track = {"previous"}

local ACGae = false --AutoCollectGummiesAlreadyEnabled
local ACCAE = false
local CSGAE = false
local AHAE = false

local frequency = 15

function ChatSystem(message)
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = tostring(message),
        Color = Color3.fromRGB(255, 160, 247),
        Font = Enum.Font.SourceSansSemibold,
        TextSize = 22
    })
end
ChatSystem("[PX]: Made by PX#4802 |commands are: [/e autocollectgummies], [/e autocollectcoins], [/e collectstargummies], [/e autohop], just rerun the command to disabled them | Owo")
game.Players.LocalPlayer.Chatted:Connect(function(message)
    local argument = message:split(" ")[3]
    local command = message:split(" ")[2]
    if string.lower(command) == "autocollectgummies" then
        if ACGae == false then
            ACGae = true
            ChatSystem("[PX]: Successfully enabled [Auto collect gummies]!!")
            repeat
                wait(frequency)
                for i,v in pairs(game.Workspace.Floor.Fountains:GetDescendants()) do
                    if v.Name == "Gumdrop" then
                         if v:FindFirstChild("GumdropHitbox") then
                             v.GumdropHitbox.Position = game.Players.LocalPlayer.Character.CollectionHitbox.Position
                         end
                     end
             end
            until ACGae == false
        elseif ACGae == true then
            ACGae = false
            ChatSystem("[PX]: Successfully disabled [Auto collect gummies]!!")
        end
    elseif string.lower(command) == "autocollectcoins" then
        if ACCAE == false then
            ACCAE = true
            ChatSystem("[PX]: Successfully enabled [Auto collect coins]!!")
            repeat
            wait(frequency)
            for i,v in pairs(game.Workspace.Coins:GetChildren()) do
                if v.Name == "Coin" and v:FindFirstChild("Coin") then
                     v.Coin.Position = game.Players.LocalPlayer.Character.CollectionHitbox.Position
                 end
             end  
            until ACCAE == false
        elseif ACCAE == true then
            ChatSystem("[PX]: Successfully disabled [Auto collect coins]!!")
            ACCAE = false
        end
    elseif command == "collectstargummies" then
        if CSGAE == false then
            ChatSystem("[PX]: Successfully enabled [Auto collect stargummies]!!")
            CSGAE = true
            for i,v in pairs(game.Workspace.EventObjects.RemoveAtDay:GetChildren()) do
                wait(frequency)
                if v:FindFirstChild("GumdropHitbox") then
                   v.GumdropHitbox.Position = game.Players.LocalPlayer.Character.CollectionHitbox.Position 
                end
            end
        elseif CSGAE == true then
            ChatSystem("[PX]: Successfully disabled [Auto collect stargummies]!!")
            CSGAE = false
        end
    elseif command == "autohop" then
        if AHAE == false then
            AHAE = true
            ChatSystem("[PX]: Successfully enabled [Auto hop points]!! We anchor the player to make sure that you will always get points.")
            game.Players.LocalPlayer.Character.CollectionHitbox.Anchored = true
            repeat
                wait(0.1)
                game:GetService("ReplicatedStorage").Events.OnLandFromJump:FireServer()
            until AHAE == false
        elseif AHAE == true then
            AHAE = false
                        game.Players.LocalPlayer.Character.CollectionHitbox.Anchored = false
            ChatSystem("[PX]: Successfully disabled [Auto hop points]!!")
        end
    end
end)
