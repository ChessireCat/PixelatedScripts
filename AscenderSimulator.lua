local client = game.Players.LocalPlayer

local checkforplus = {
    "1/1100"
}
local CMBH = "Epic:2" --charm must be equal to or higher than
local HttpService = game:GetService("HttpService")
function sendmessage(Title, Description, Color)
    print(Color)
    local msg = {
           ["embeds"] = {{
            ["title"] = Title.." | ".."<t:"..tostring(os.time())..":R>",
            ["description"] = Description,
           ["color"] = Color,
           ["fields"] = {{
               ["name"] = "More Info",
                ["value"] = "its rare I think..\nmaybe?"               
           }},
            ["author"] = {
                ["name"] = "Ascender Info | by px",
                ["icon_url"] = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTVtLSCiKl9tVK6YbhwmrjLBRc7ytLOp4Z5g&usqp=CAU"
            }
        }},
    ["username"] = "Info ascender",
    ["avatar_url"] = "https://i.pinimg.com/474x/11/e1/51/11e151d2f64254cd6e7e49dccb5e3016.jpg",
    }
    local response = syn.request(
    {
        Url = _G.Webhook,
        Method = "POST",
        Headers = {
        ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(msg)
    })
end
function findrarity(name)
    local NewV
    for i,v in pairs(client.PlayerGui.ScreenGui.RarityInfoFrame.MainFrame:GetChildren()) do
        if v:FindFirstChildWhichIsA("Frame") then
            if v.Main["1Rarity"].Text == name then
                NewV = v.Main["2CurrentChance"].Text
                break
            end
        end
        end
        wait()
    return NewV
end
function ConvertToDecimal()
    local hex = game.Players.LocalPlayer.PlayerGui.ScreenGui.AscenderFrame.FailedMessage.TextColor3:ToHex()
    local r = tonumber('0x'..string.sub(hex,1,2))
    local g = tonumber('0x'..string.sub(hex,3,4))
    local b = tonumber('0x'..string.sub(hex,5,6))
    local rh = string.format("%02x", r) 
    local gh = string.format("%02x", g)
    local bh = string.format("%02x", b)
    local hex = "0x"..rh..gh..bh
    local dec = tonumber(hex)
    print("Decimal: " .. dec)
    return dec
end
local Really = "."
function findPreciseRarity(chance)
    local NewChance = tostring(chance)
  --  print(NewChance.." gsdfg")
 --  print(chance)
    if string.find(chance, "M") then
        local newS = chance:gsub("M", "")
        local findidk = newS:gsub("1/", "")
        findidk = string.split(findidk, ".")[1]
        newS = newS:gsub("%.", "")
        local NOC = string.len(newS)-2
        if string.len(findidk) == 3 then
            for i = 1, 9-NOC do
                newS = newS.."0"
            end
        elseif string.len(findidk) == 2 then
            for i = 1, 8-NOC do
                newS = newS.."0"
            end
        elseif string.len(findidk) == 1 then
            for i = 1, 7-NOC do
                newS = newS.."0"
            end
        end
        wait()

        NewChance = newS
    elseif string.find(chance, "B") then
        local newS = chance:gsub("B", "")
        local findidk = newS:gsub("1/", "")
        findidk = string.split(findidk, ".")[1]
        newS = newS:gsub("%.", "")
        local NOC = string.len(newS)-2
        if string.len(findidk) == 3 then
            for i = 1, 12-NOC do
                newS = newS.."0"
            end
        elseif string.len(findidk) == 2 then
            for i = 1, 11-NOC do
                newS = newS.."0"
            end
        elseif string.len(findidk) == 1 then
            for i = 1, 10-NOC do
                newS = newS.."0"
            end
            print(NewChance)
        end
        NewChance = newS
    elseif string.find(chance, "T") then
      --  print(chance)

     --   NewChance = chance:gsub("1/", "")
        NewChance = NewChance:gsub("T", "")
        NewChance = NewChance:gsub("%.","") 
        local NOC = string.len(NewChance)
        for i = 1, tonumber(12-tonumber(NOC)) do
            NewChance = NewChance.."0"
        end
    elseif string.find(chance, "k") then
            local newS = chance:gsub("k", "")
            local findidk = newS:gsub("1/", "")
            findidk = string.split(findidk, ".")[1]
            newS = newS:gsub("%.", "")
            local NOC = string.len(newS)-2
            if string.len(findidk) == 3 then
                for i = 1, 6-NOC do
                    newS = newS.."0"
                end
            elseif string.len(findidk) == 2 then
                for i = 1, 5-NOC do
                    newS = newS.."0"
                end
            elseif string.len(findidk) == 1 then
                for i = 1, 4-NOC do
                    newS = newS.."0"
                end
            end
            wait()
            NewChance = newS
            print(NewChance)
        end
        if string.find(chance, "/0") then
            NewChance = "1/10"
        end
    wait()
   -- print(NewChance)
    return NewChance
end
client.Chatted:Connect(function(message)
    if string.find(message, "/e ") then
        if string.find(message, "SChook ") then
            local value = message:gsub("/e SChook ", "")
            CMBH = tostring(value)
            print(CMBH)
        elseif string.find(message, "Ahook") then
            local value = message:gsub("/e Ahook ", "")
            local Nv = value:split("/")
            if Nv[1]/Nv[2] then
                checkforplus[1] = tostring(value)
            end
            print(checkforplus[1])
        end
    end
end)
local logLchance = "1/43566745w34576354678746853"
local maybe = false
game.Players.LocalPlayer.PlayerGui.ScreenGui.AscenderFrame.FailedMessage.Changed:Connect(function(type)
   wait()
   if type == "Text" then
   local Rarity = tostring(client.PlayerGui.ScreenGui.AscenderFrame.FailedMessage.Text)
    local cR 
   Rarity = Rarity:gsub("failed..", "")
   Rarity = Rarity:gsub("success..", "")
--    Rarity = Rarity:gsub('%b[]', '')
   Rarity = Rarity:gsub("[^%w%s+-]", "")
    if string.find(Rarity, "2") or string.find(Rarity, "3") or string.find(Rarity, "4") then
        Rarity = string.split(Rarity, " ")
        Rarity = Rarity[2].." ("..Rarity[3]..")"
    else
        Rarity = Rarity:gsub(" ", "")
    end
    local Chance = findrarity(Rarity)
   -- print(Chance)
    if string.find(Chance, "k") or string.find(Chance, "M") or string.find(Chance, "B") or string.find(Chance, "T") then
        print(Chance.." chance")
   Chance = findPreciseRarity(Chance)
    elseif string.find(Chance, "1/0") then
   Chance = "1/10"
   end
   local splitted = Chance:split("/")
 --  print(Chance)
 cR = Chance
   Chance = tonumber(splitted[1])/tonumber(splitted[2])
      -- print(Chance)
   local SetChance = checkforplus[1]
   local RealChance = SetChance:split("/")
   SetChance = tonumber(RealChance[1])/(RealChance[2])
  -- print(SetChance)
  -- print(tostring(Rarity).." rarity"..":chance "..tostring(Chance))
  if Chance ~= logLchance then
   if tonumber(Chance) < tonumber(SetChance) then
             logLchance = Chance
        if string.find(Rarity, "success..") then
            sendmessage(tostring(Rarity), cR, tonumber(16777215))
        else
            sendmessage(tostring(Rarity), cR, tonumber(16777215))
        end
      -- print("t")
        wait(1)
   end 
   end
   end
end)



_G["Cave0"] = {"Red Stone".." ".. "Blue Stone".." ".. "Yellow Stone".." ".. "Orange Stone".." ".. "Pink Stone".." ".. "Titian Rock".." ".. "Teal Rock".." ".. "Bisque Rock".." ".. "Puce Rock".." ".. "Cattleya Rock".." ".. "Amethyst".." ".. "Peridot".." ".. "Alexandrite".." ".. "Sapphire".." ".. "Onyx".." ".. "Wulfenite".." ".. "Hercynite".." ".. "Aquamarine".." ".. "Rutile".." ".. "Ammonite".." ".. "Emerald".." ".. "Ruby".." ".. "Painite".." ".. "Jeremejevite".." ".. "Tanzanite"}
_G["Cave1"] = {"Magnesium Ore".." ".. "Nickel Ore".." ".. "Copper Ore".." ".. "Platinum Ore".." ".. "Silver Ore".." ".. "Gold Ore".." ".. "Cobalt Ore".." ".. "Titanium Ore".." ".. "Pallidium Ore".." ".. "Zinc Ore".." ".. "Bismuth Ore".." ".. "Chromite".." ".. "Bitumen".." ".. "Bauxite".." ".. "Fluorite Ore".." ".. "Oil".." ".. "Tin Ore".." ".. "Lapis Lazuli".." ".. "Iron Ore".." ".. "Diamond".." ".. "Anitomy Ore".." ".. "Cinnabar".." ".. "Agate".." ".. "Sulfur"}
_G["Cave2"] = {"Nabalamprophyllite".." ".. "Nabesite".." ".. "Millosevichite".." ".. "Mimetite".." ".. "Minium".." ".. "Minnesotaite".." ".. "Minyulite".." ".. "Mirabilite".." ".. "Mixite".." ".. "Moganite".." ".. "Mohite".." ".. "Mohrite".." ".. "Moissanite".." ".. "Nacrite".." ".. "Nadorite".." ".. "Abernathyite".." ".. "Nahcolite".." ".. "Naldrettite".." ".. "Nambulite".." ".. "Narsarsukite".." ".. "Telluric iron".." ".. "Abelsonite".." ".. "Natrolite".." ".. "Native copper".." ".. "Native Silver".." ".. "Natron"} 
_G["Cave3"] = { "Abhurite".." ".. "Abramovite".." ".. "Abswurmbachite".." ".. "Acanthite".." ".. "Achavalite".." ".. "Actinolite".." ".. "Acuminite".." ".. "Adelite".." ".. "Admontite".." ".. "Aegirine".." ".. "Aenigmatite".." ".. "Aerinite".." ".. "Aerugite".." ".. "Aeschynite".." ".. "Afwillite".." ".. "Agardite".." ".. "Agrellite".." ".. "Agrinierite".." ".. "Aguilarite".." ".. "Aheylite".." ".. "Ahlfeldite".." ".. "Aikinite".." ".. "Ajoite".." ".. "Akatoreite".." ".. "Afghanite".." ".. "Adamite"}
_G["Cave4"] = { "Babefphite".." ".. "Beryl".." ".. "Bityite".." ".. "Boussingaultite".." ".. "Bromellite".." ".. "Bowieite".." ".. "Bronzite".." ".. "Adelite".." ".. "Bixbyite".." ".. "Beryllonite".." ".. "Bavenite".." ".. "Baddeleyite".." ".. "Bayldonite".." ".. "Beudantite".." ".. "Braggite".." ".. "Bakerite".." ".. "Bayleyite".." ".. "Bicchulite".." ".. "Blossite".." ".. "Brassite".." ".. "Brownleeite".." ".. "Balangeroite".." ".. "Bazzite".." ".. "Biehlite".." ".. "Brookite".." ".. "Uranium"}
local Charminfo = require(game:GetService("ReplicatedStorage").Modules.CharmInfo)
client.PlayerGui.ScreenGui.CharmsFrame.Notify.ChildAdded:Connect(function(childname)
    local CharmModule = require(game:GetService("ReplicatedStorage").Modules.CharmInfo)
    local TextN = childname.Text
    local Charm = string.split(TextN, " (")[1]
    local Fcave
    local Requirements = string.split(CMBH, ":")
    local PrarityN
    --print(Charm.." CHARM")
    for i = 1, 8 do
        if CharmModule.RarityNames[i] == Requirements[1] then
            PrarityN = i
            break
        end
    end
    for i = 0, 4 do
       -- print(i)
      --  print(unpack((_G["Cave"..tostring(i)])))
        if string.find(unpack((_G["Cave"..tostring(i)])), tostring(Charm)) then
            Fcave = i
           -- print(i.. " II")
           -- print(Fcave.." F CAVE")
        else
          --  print(Charm)
            --print(i)
        end
    end
    local Crarity = string.split(TextN, " (")[2]
    Crarity = Crarity:gsub("[^%w%s+-]", "")
  --  print(Crarity)
    local RarityNumber 
    for i = 1, 8 do
        if CharmModule.RarityNames[i] == Crarity then
            RarityNumber = i
            break
        end
    end
    wait()
    --print(RarityNumber.." RarityN")
  --  print(PrarityN.." P rarity")
  --  print(tostring(Fcave).." cave")
    if tonumber(RarityNumber) >= tonumber(PrarityN) then
        if tonumber(Fcave) >= tonumber(Requirements[2]) then
            sendmessage(tostring(Charm.."(C)"), tostring(CharmModule.RarityNames[RarityNumber]), tonumber(16777215))
        end
    end
end)

client.PlayerGui.ScreenGui.AscenderCoreFrame.RarityCore.Changed:Connect(function(way)
    if way == "Text" then
        wait(0.1)
        local RarityCore = client.PlayerGui.ScreenGui.AscenderCoreFrame
        local RarityCoreT = client.PlayerGui.ScreenGui.AscenderCoreFrame.RarityCore.Text
        local newRarity = tostring(RarityCoreT):split(" ")[3]
        local Tokens = RarityCore.Tokens.Text
        Tokens = string.split(Tokens, " ")[4]
        Tokens = Tokens:gsub("[^%w%s+-.]", "")
        local TokenGain = string.split(tostring(RarityCore.TokenGain.Text), " ")[4]
        local CoreLuckBoost = string.split(tostring(RarityCore.CoreLuckBoost.Text), " ")[4]
        local luckBoost = string.split(tostring(RarityCore.LuckBoost.Text), " ")[3]
        sendmessage(tostring(newRarity.."(SA) | LuckBoost-"..luckBoost), tostring("Core Luck Boost-"..CoreLuckBoost.." | ".."Token Gain-"..TokenGain.." | ".."Tokens-"..Tokens), tonumber(16562432))
    end
end)
while wait(3600) do
local RarityCore = client.PlayerGui.ScreenGui.AscenderCoreFrame
local RarityCoreT = client.PlayerGui.ScreenGui.AscenderCoreFrame.RarityCore.Text
local ServerBoostFrame = client.PlayerGui.ScreenGui.ServerBoostFrame
local Leaderstats = game:GetService("Players").LocalPlayer.leaderstats
local Ascension = Leaderstats.Ascension.Value
local Transcension = Leaderstats.Transcension.Value
local Prestige = Leaderstats.Prestige.Value
local Attempts = Leaderstats.Attempts.Value
local rebirths = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.RebirthFrame.Main.Main.Title.Text
rebirths = rebirths:split("(")[2]
rebirths = rebirths:gsub("[^%w%s+-]", "")
local Gems = string.split(tostring(client.PlayerGui.ScreenGui.TopBar.Gems.Label.Text), " ")[2]
local LuckBoost = string.split(tostring(client.PlayerGui.ScreenGui.TopBar.LuckBoost.Label.Text), " ")[1]
local CurrentRarity = string.split(tostring(client.PlayerGui.ScreenGui.TopBar.CurrentRarity.Label.Text), " ")[2]
local CoreRarity = tostring(RarityCoreT):split(" ")[3]
local Tokens = RarityCore.Tokens.Text
Tokens = string.split(Tokens, " ")[4]
Tokens = Tokens:gsub("[^%w%s+-.]", "")
local TokenGain = string.split(tostring(RarityCore.TokenGain.Text), " ")[4]
local CoreLuckBoost = string.split(tostring(RarityCore.CoreLuckBoost.Text), " ")[4]
local luckBoost = string.split(tostring(RarityCore.LuckBoost.Text), " ")[3]
local ServerGems = string.split(tostring(ServerBoostFrame.CurrentGems.Text), " ")[3]
local ServerLuckBoost = string.split(tostring(ServerBoostFrame.RarityBoost.Text), " ")[5]
local CurrentServerRarity = string.split(tostring(ServerBoostFrame.CurrentRarity.Text), " ")[3]
local ServerLuckyBoost = string.split(tostring(ServerBoostFrame.LuckBoost.Text), " ")[3]
local statistics = "Ascension - "..tostring(Ascension).."\nTranscension - "..tostring(Transcension).."\nPrestiges - "..tostring(Prestige).."\nRebirths - "..rebirths.."\nAttempts - "..Attempts.."\n\nGems - "..Gems.."\nLuckboost - "..LuckBoost.."\nCurrent rarity - "..CurrentRarity
local AscenderCoreStat = "Core rarity - "..tostring(CoreRarity).."\nToken multiplier - "..tostring(TokenGain).."\nCore luckboost - "..tostring(luckBoost).."\nTokens - "..tostring(Tokens)
local ServerStats = "Server gems - "..tostring(ServerGems).."\nServer luckboost - "..tostring(ServerLuckBoost).."\nCurrent server rarity - "..CurrentServerRarity.."\nServer real boost - "..tostring(ServerLuckBoost)

    local msg = {
           ["embeds"] = {{
            ["title"] = "Info checkup".." | ".."<t:"..tostring(os.time())..":R>",
            ["description"] = "*Remember, PX will\nalways love you :heart:*",
           ["color"] = 5986237,
           ["fields"] = {{
               ["name"] = "Stats",
                ["value"] = statistics               
           },
           {
            ["name"] = "Ascender Core",
            ["value"] = AscenderCoreStat
           },
           {
            ["name"] = "Serverstats",
            ["value"] = ServerStats
           }
        },
            ["author"] = {
                ["name"] = "Ascender Info | by px",
                ["icon_url"] = "https://i.ibb.co/NZ5DQqK/sdfsgrgherg.png"
            }
        }},
    ["username"] = "Info ascender",
    ["avatar_url"] = "https://i.ibb.co/NZ5DQqK/sdfsgrgherg.png",
    }
    local response = syn.request(
    {
        Url = _G.Webhook,
        Method = "POST",
        Headers = {
        ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(msg)
    })
end
