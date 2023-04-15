--Ui--
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("EHHANL", "Sentinel")
local Tab = Window:NewTab("SPIN")
local Section = Tab:NewSection("LNAHE")
Section:NewButton("CLICK", "", function()
    repeat wait() until game:IsLoaded()
    wait(2)
    local clans = {"Uryu", "Yamamoto", "Urahara", "Kurosaki"}
    local url = "https://discord.com/api/webhooks/1092318821995511888/BJvjvLRd32z2weegQkVBHqk9bgv1wnPWYa67VX6RsSvmS1ed4DNDZnOs0XBIKLdCD4an"

    game:GetService("ReplicatedStorage").Change_Slot:InvokeServer(1) --change slot here, 1 for 1st slot, 2 for 2nd

    function redeem()
        local a = {"35KLIKES", "SORRYFORSHUTDOWN", "RELEASE", "EXPLOITFIXES", "SHUTDOWNSPINS","SORRYFORPINGS","10MVISITS","50KLIKES","SHUTDOWNABILITYREROLL","40KLIKES"}

        for _, itemName in pairs(a) do
            game:GetService("ReplicatedStorage").Code:InvokeServer(itemName)
        end
    end

    redeem()
    wait(2)

    function spin()
        local user = tostring(game.Players.LocalPlayer)

        while true do
            game:GetService("ReplicatedStorage").Spin:InvokeServer(1)
            task.wait(0.1)
            local found = false

            for i=1, #clans do
                if clans[i]:lower() == game:GetService("ReplicatedStorage")["Player_Datas"][user]["Slot_1"].Clan.Value:lower() then
                    found = true
                    break
                end
            end

            if found then
                print("YAYYYYY YOU GOT "..tostring(game:GetService("ReplicatedStorage")["Player_Datas"][user]["Slot_1"].Clan.Value))
                local data = {
                    ["content"] = "@everyone YOU ROLLED SOMETHING",
                    ["username"] = "Jon Jones",
                    ["avatar_url"] = "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2335639.png",
                    ["embeds"] = {
                        {
                            ["description"] = "**Project Mugetsu**\n\n```User: "..user.."\n\nClan: "..game:GetService("ReplicatedStorage")["Player_Datas"][user]["Slot_1"].Clan.Value.."```",
                            ["type"] = "rich",
                            ["color"] = tonumber(0x5a3812)
                        }
                    }
                }
                local newdata = game:GetService("HttpService"):JSONEncode(data)
                local headers = {
                    ["content-type"] = "application/json"
                }
                request = http_request or request or HttpPost or syn.request
                local send = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                request(send)
                break
            else
                print("Rolled "..tostring(game:GetService("ReplicatedStorage")["Player_Datas"][user]["Slot_1"].Clan.Value))
            end
        end
    end

    spin()
end)
