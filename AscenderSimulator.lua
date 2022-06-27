local client = game.Players.LocalPlayer

local checkforplus = {
    "1/1000"
}
local CMBH = "Rare:0" --charm must be equal to or higher than
local Tinbetween = 0
local HttpService = game:GetService("HttpService")
local RequiredTime = 5
function sendmessage(rarity, chance, globalchance, TSLasc)
    local msg = {
           ["embeds"] = {{
            ["title"] = "Ascended Rarity".." | ".."<t:"..tostring(os.time())..":R>",
            ["description"] = "New rarity - "..tostring(rarity).."\nChance - "..chance,
           ["color"] = 5986237,
           ["fields"] = {{
               ["name"] = "More info",
                ["value"] = "Global chance - " ..globalchance.."\nTSL ascended - "..TSLasc.."s"
           }},
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
if isfile("AscenderSaves.txt") then
    local contents = readfile("AscenderSaves.txt")
    local Info = tostring(contents):split(" ")
    CMBH = Info[1]
    checkforplus[1] = Info[2]
    RequiredTime = Info[3]
--print(CMBH)
--    print(checkforplus[1])
    else
    writefile("AscenderSaves.txt", "")
    appendfile("AscenderSaves.txt", CMBH.." "..checkforplus[1].." "..tostring(RequiredTime))
end
game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
    Text = "[PX]: The commands are\n/Ahook [1/x] \n/SChook [rarity:cavenumber]\n/RT [timeamount]\n--------------------------\n".."Charm requirement - "..tostring(CMBH).."\nAscender requirement - "..tostring(checkforplus[1]).."\nRequired time - "..tostring(RequiredTime);
    Color = Color3.fromRGB(255, 255, 255);
    Font = Enum.Font.SourceSansBold;
    TextSize = 20
})
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
            writefile("AscenderSaves.txt", CMBH.." "..checkforplus[1].." "..RequiredTime)
            game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
                Text = '[PX]: Successfully set "Charm Rarity Requirement" to '..tostring(CMBH);
                Color = Color3.fromRGB(255, 255, 255);
                Font = Enum.Font.SourceSansBold;
                TextSize = 20
            })
        elseif string.find(message, "Ahook") then
            local value = message:gsub("/e Ahook ", "")
            local Nv = value:split("/")
            if Nv[1]/Nv[2] then
                checkforplus[1] = tostring(value)
                writefile("AscenderSaves.txt", CMBH.." "..checkforplus[1].." "..RequiredTime)
                game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
                    Text = '[PX]: Successfully set "Required Change" to '..tostring(checkforplus[1]);
                    Color = Color3.fromRGB(255, 255, 255);
                    Font = Enum.Font.SourceSansBold;
                    TextSize = 20
                })
            end
            print(checkforplus[1])
        elseif string.find(message, "RT") then
            local value = message:gsub("/e RT ", "")
            RequiredTime =  tonumber(value)
            writefile("AscenderSaves.txt", CMBH.." "..checkforplus[1].." "..RequiredTime)
            game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
                Text = '[PX]: Successfully set "Required Time" to '..tostring(RequiredTime);
                Color = Color3.fromRGB(255, 255, 255);
                Font = Enum.Font.SourceSansBold;
                TextSize = 20
            })
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
    local Checkit = Rarity
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
   cR = Chance
   local splitted = Chance:split("/")
 --  print(Chance)
   Chance = tonumber(splitted[1])/tonumber(splitted[2])
      -- print(Chance)
   local SetChance = checkforplus[1]
   local RealChance = SetChance:split("/")
   SetChance = tonumber(RealChance[1])/(RealChance[2])
  -- print(SetChance)
  -- print(tostring(Rarity).." rarity"..":chance "..tostring(Chance))
  local GlobalC = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.RarityInfoFrame.MainFrame.RarityFrame.Main["3Chance"].Text
  print(Tinbetween)
  if Chance ~= logLchance then
   if tonumber(Chance) < tonumber(SetChance) then
             logLchance = Chance
        if string.find(Checkit, "success..") and Tinbetween > 5 then
            sendmessage(tostring(Rarity), cR, tostring(GlobalC), tostring(Tinbetween))
            Tinbetween = 0
        else
            --sendmessage(tostring(Rarity), cR, tonumber(16777215))
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
  local GemBoost
  local LuckBoost
  local Amount
    if tonumber(RarityNumber) >= tonumber(PrarityN) then
        if tonumber(Fcave) >= tonumber(Requirements[2]) then
          --  print(Charm)
            wait()
            for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.CharmsFrame.CharmFrame.MainFrame:GetChildren()) do
                if v.ClassName == "Frame" then
                    
                    if v.Title.Text == tostring(Charm) then
                        GemBoost = tostring(v.GemBoost.Text):split("+")[2]
                        LuckBoost = tostring(v.LuckBoost.Text):split("+")[2]
                        Amount = tostring(v.AmountLabel.Text)
                       -- print(GemBoost.." GEM BOOST")
                       -- print(LuckBoost.." LUCKBOOST")
                      --  print(Amount.." AMOUNT")
                        break
                    end
                end
            end
            --wait(0.2)
            local msg = {
                ["embeds"] = {{
                 ["title"] = "Rare charm obtained (C)".." | ".."<t:"..tostring(os.time())..":R>",
                 ["description"] = "Charm - "..tostring(Charm).."\n Rarity - "..tostring(CharmModule.RarityNames[RarityNumber]).."\nCave - ".."Cave"..tostring(Fcave),
                ["color"] = 5986237,
                ["fields"] = {{
                    ["name"] = "More info",
                     ["value"] = "Gem boost - plus "..tostring(GemBoost).."\nLuckboost - plus "..tostring(LuckBoost).."\nAmount - "..tostring(Amount)
                }},
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
           -- sendmessage(tostring(Charm.."(C)"), tostring(CharmModule.RarityNames[RarityNumber]), tonumber(16777215))
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
        local msg = {
            ["embeds"] = {{
             ["title"] = "Ascended core rarity (SA)".." | ".."<t:"..tostring(os.time())..":R>",
             ["description"] = "New rarity - "..tostring(newRarity).."\nCore luckboost - "..CoreLuckBoost,
            ["color"] = 5986237,
            ["fields"] = {{
                ["name"] = "More info",
                 ["value"] = "Token multiplier - " ..TokenGain.."\nTokens - "..Tokens
            }},
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
end)
game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.TopBar.TimePlayed.Label.Changed:Connect(function(change)
    if change == "Text" then
        Tinbetween = Tinbetween+1
        --print(Tinbetween)
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
local statistics = "Ascension - "..tostring(Ascension).."\nPrestiges - "..tostring(Prestige).."\nRebirths - "..rebirths.."\nAttempts - "..Attempts.."\n\nGems - "..Gems.."\nLuckboost - "..LuckBoost.."\nCurrent rarity - "..CurrentRarity
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
