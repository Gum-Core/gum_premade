if Config.Framework == "REDEMREBOOT" then
    local apiSrv = {}
    RegisterServerEvent('getApi')
    AddEventHandler('getApi', function(cb)
        cb(apiSrv)
    end)

    data = {}
    TriggerEvent("redemrp_inventory:getData",function(call)
            data = call
    end)

    RedEM = exports["redem_roleplay"]:RedEM()

    function apiSrv.registerItem(itemId, callback)
        RegisterServerEvent("RegisterUsableItem:"..itemId)
        AddEventHandler("RegisterUsableItem:"..itemId, function(source)
            callback(tonumber(source))
        end)
    end
    
    function apiSrv.notify(source, title, message, image, time)
        TriggerClientEvent("gum_notify:notify", source, title, message, image, time)
    end

    function apiSrv.CharacterTable()
        return "characters"
    end

    function apiSrv.JobColumn()
        return "job"
    end

    function apiSrv.JobGradeColumn()
        return "jobgrade"
    end

    function apiSrv.SteamColumn()
        return "identifier"
    end

    function apiSrv.CharIdColumn()
        return "characterid"
    end

    function apiSrv.getInformation(source, cb)
        local _source = source
        local User = RedEM.GetPlayer(_source)
        if User ~= nil then
            local player = {}
            player.getGroup = function() return
                User.group()
            end 
            player.getFirstname = function() return
                User.firstname
            end 
            player.getLastname = function() return
                User.lastname
            end 
            player.getSteamIdentifier = function() return
                User.identifier
            end 
            player.getCharIdentifier = function() return
                User.charid
            end 
            player.getMoney = function() return
                User.money
            end
            player.getGold = function() return
                User.money
            end
            player.getJob = function() return
                User.job
            end
            player.getGrade = function() return
                User.jobgrade
            end
            player.getCountItem = function(id)
                local ItemData = data.getItem(_source, id)
                return tonumber(ItemData.ItemAmount)
            end
            player.removeMoney = function(amount)
				User.RemoveMoney(amount)
            end
            player.addMoney = function(amount)
				User.AddMoney(amount)
            end
            player.removeGold = function(amount)
				--User.RemoveGold(amount)
            end
            player.addGold = function(amount)
				--User.AddGold(amount)
            end
            player.setJob = function(job, grade, arg)
                User.SetJob(job)
                User.SetJobGrade(grade)
            end
            player.setGrade = function(amount)
                User.SetJobGrade(grade)
            end
            player.removeItem = function(id, amount)
                local ItemData = data.getItem(_source, id)
                ItemData.RemoveItem(tonumber(amount))
            end
            player.addItem = function(id, amount)
                local ItemData = data.getItem(_source, id)
                ItemData.AddItem(tonumber(amount))
            end
            player.removeItemId = function(id, amount)
                local ItemData = data.getItem(_source, id)
                ItemData.RemoveItem(amount)
            end
            player.chanceSkin = function(skin)
                -- Character.changeSkin(_source, json.decode(skin))
            end
            player.createStorage = function(id, size)
            end
            player.openStorage = function(id, size)
                TriggerClientEvent("redemrp_inventory:OpenStash", _source, id, size)
            end
            player.canCarryItem = function(id, count)
                local canCarry = true
                return canCarry
            end
            player.canCarryWeapon = function(id, count)
                local canCarry = true
                return canCarry
            end
            player.createWeapon = function(id, ammo)
            end
            player.closeInv = function()
                TriggerClientEvent("redemrp_inventory:close_inventory", tonumber(_source))
            end
            player.discord = function(webhookLink, imageUrl, description, color, steamHex, charIdentifier, firstName, lastName)
                sendDiscordMessage(webhookLink, imageUrl, description, color, steamHex, charIdentifier, firstName, lastName)
            end
            player.getMetadata = function(id)
                local ItemData = data.getItem(_source, id)
                return ItemData.ItemMeta.id
            end
            cb(player)
        else
            cb(nil)
        end
    end
    function sendDiscordMessage(webhookLink, title, descriptionsString, color, steamHex, charIdentifier, firstName, lastName)
        local cleanSteamHex = string.sub(steamHex, 7)

        local footer = ""
        for i, line in ipairs(descriptionsString) do
            footer = footer .. line .. "\n"
        end
        local embed = {
            {
                ["color"] = color,
                ["title"] = title,
                ["description"] = footer,
                ["fields"] = {
                    {
                        ["name"] = ""..Config.Language[1].."",
                        ["value"] = ""..Config.Language[4]..""..cleanSteamHex.."\n"..Config.Language[3]..""..charIdentifier,
                        ["inline"] = true
                    },
                    {
                        ["name"] = ""..Config.Language[2].."",
                        ["value"] = ""..Config.Language[5]..""..firstName.."\n"..Config.Language[6]..""..lastName,
                        ["inline"] = true
                    }
                }
            }
        }
        PerformHttpRequest(""..webhookLink.."", function(err, text, headers) end, 'POST', json.encode({username = "Pets", embeds = embed}), { ['Content-Type'] = 'application/json' })
    end
end