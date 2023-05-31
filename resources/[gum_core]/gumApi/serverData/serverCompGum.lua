if Config.Framework == "GUM" then
    local apiSrv = {}
    RegisterServerEvent('getApi')
    AddEventHandler('getApi', function(cb)
        cb(apiSrv)
    end)

    local gumCore = {}
    TriggerEvent("getCore",function(core)
        gumCore = core
    end)

    Inventory = exports.gum_inventory:gum_inventoryApi()

    
    function apiSrv.registerItem(itemId, callback)
        Inventory.RegisterUsableItem(itemId, callback)
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
        return "charidentifier"
    end

    function apiSrv.notify(source, title, message, image, time)
        TriggerClientEvent("gum_notify:notify", source, title, message, image, time)
    end

    function apiSrv.getInformation(source, cb)
        local _source = source
        local User = gumCore.getUser(_source)
        if User then
            local Character = User.getUsedCharacter
            local player = {}
            player.getGroup = function() return
                User.group
            end 
            player.getItemNames = function()
                local globalTable = {}
                exports.oxmysql:execute('SELECT * FROM items' , {}, function(result)
                    if result ~= nil then
                        globalTable = result
                    end
                end)
                Citizen.Wait(100)
                return globalTable
            end
            
            player.getFirstname = function() return
                Character.firstname
            end 
            player.getLastname = function() return
                Character.lastname
            end 
            player.getSteamIdentifier = function() return
                Character.identifier
            end 
            player.getCharIdentifier = function() return
                Character.charIdentifier
            end 
            player.getMoney = function() return
                Character.money
            end
            player.getGold = function() return
                Character.gold
            end
            player.getJob = function() return
                Character.job
            end
            player.getGrade = function() return
                Character.jobGrade
            end
            player.getCountItem = function(id)
                return Inventory.getItemCount(tonumber(_source), id)
            end
            player.removeMoney = function(amount)
                Character.removeCurrency(_source, 0, amount)
            end
            player.addMoney = function(amount)
                Character.addCurrency(_source, 0, amount)
            end
            player.setJob = function(job, grade, arg)
                Character.setJob(tonumber(_source), job, grade, arg)
            end
            player.setGrade = function(amount)
                Character.setJobGrade(amount)
            end
            player.removeGold = function(amount)
                Character.removeCurrency(_source, 1, amount)
            end
            player.addGold = function(amount)
                Character.addCurrency(_source, 1, amount)
            end
            player.removeItem = function(id, amount)
                Inventory.subItem(_source, id, amount)
            end
            player.removeItemId = function(id, amount)
                Inventory.subItemByID(_source, id, amount)
            end
            player.addItem = function(id, amount, metadata)
                Inventory.addItem(_source, id, amount, metadata)
            end
            player.chanceSkin = function(skin)
                Character.changeSkin(_source, json.decode(skin))
            end
            player.createStorage = function(id, size)
                TriggerEvent("gumCore:registerstorage", _source, id, size)
            end
            player.openStorage = function(id, size)
                TriggerEvent("gumCore:openstorage", _source, id)
            end
            player.canCarryItem = function(id, count)
                local canCarry = false
                TriggerEvent("gumCore:canCarryItem", tonumber(_source), id, tonumber(count), function(canCarry1)
                    canCarry = canCarry1
                end)
                return canCarry
            end
            player.canCarryWeapon = function(count)
                TriggerEvent("gumCore:canCarryWeapons", tonumber(_source), tonumber(count), function(canCarry1)
                   canCarry = canCarry1
                end)
                return canCarry
            end
            player.createWeapon = function(weapon, ammo)
                Inventory.createWeapon(tonumber(_source), weapon, ammo)
            end
            player.closeInv = function()
                TriggerClientEvent("gum_inventory:CloseInv", tonumber(_source))
            end
            player.discord = function(webhookLink, imageUrl, description, color, steamHex, charIdentifier, firstName, lastName)
                sendDiscordMessage(webhookLink, imageUrl, description, color, steamHex, charIdentifier, firstName, lastName)
            end
            player.getMetadata = function(id)
                local itemId = Inventory.getLastUsedID(_source)
                local typeMeta = Inventory.getMetaTypeById(_source, itemId, id)
                return typeMeta, itemId
            end
            player.getInventory = function()
                return Inventory.getUserInventory(tonumber(_source))
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