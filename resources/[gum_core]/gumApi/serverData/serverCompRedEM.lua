if Config.Framework == "REDEM" then
    local apiSrv = {}
    RegisterServerEvent('getApi')
    AddEventHandler('getApi', function(cb)
        cb(apiSrv)
    end)

    local data = {}
    TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
    end)


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
        return "Characters"
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
        TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
            if user ~= nil then
                local player = {}
                player.getGroup = function() return
                    user.getGroup() 
                end 
                player.getFirstname = function() return
                    user.getFirstname()
                end 
                player.getLastname = function() return
                    user.getLastname()
                end 
                player.getSteamIdentifier = function() return
                    user.getIdentifier()
                end 
                player.getCharIdentifier = function() return
                    user.getSessionVar("charid")
                end 
                player.getMoney = function() return
                    user.getMoney()
                end
                player.setJob = function(job, grade, arg)
                    user.SetJob(job)
                    user.SetJobGrade(grade)
                end
                player.setGrade = function(amount)
                    user.SetJobGrade(grade)
                end
                player.getGold = function() return
                    user.getGold()
                end
                player.getJob = function() return
                    user.getJob()
                end
                player.getGrade = function() return
                    user.jobGrade()
                end
                player.getCountItem = function(id)
                    local ItemData = data.getItem(_source, id)
                    return ItemData.ItemAmount
                end
                player.removeMoney = function(amount)
                    user.removeMoney(amount)
                end
                player.addMoney = function(amount)
                    user.addMoney(amount)
                end
                player.removeGold = function(amount)
                    user.removeGold(amount)
                end
                player.addGold = function(amount)
                    user.addGold(amount)
                end
                player.removeItem = function(id, amount)
                    local ItemData = data.getItem(_source, id)
                    ItemData.RemoveItem(amount)
                end
                player.addItem = function(id, amount, metadata)
                    local ItemData = data.getItem(_source, id, metadata)
                    ItemData.AddItem(amount)
                end
                player.removeItemId = function(id, amount)
                    local ItemData = data.getItem(_source, id)
                    ItemData.RemoveItem(amount)
                end
                player.chanceSkin = function(skin)
                    -- Character.changeSkin(_source, json.decode(skin))
                end
                player.createStorage = function(id, size)
					data.createLocker(id)
                end
                player.openStorage = function(id, size)
                    TriggerClientEvent("redemrp_inventory:OpenLocker", _source, id)
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
        end)
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