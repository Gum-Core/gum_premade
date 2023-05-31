if Config.Framework == "CUSTOM" then
    ------ DONT REMOVE ------
    local apiSrv = {}
    RegisterServerEvent('getApi')
    AddEventHandler('getApi', function(cb)
        cb(apiSrv)
    end)
    ------ DONT REMOVE ------







    

    ---EDIT THIS PART
    local gumCore = {}
    TriggerEvent("getCore",function(core)
        gumCore = core
    end)

    Inventory = exports.gum_inventory:gum_inventoryApi()

    function apiSrv.registerItem(itemId, callback)
        Inventory.RegisterUsableItem(itemId, callback)
    end

    function apiSrv.notify(source, title, message, image, time)
        TriggerClientEvent("gum_notify:notify", source, title, message, image, time)
    end

    function apiSrv.CharacterTable()
        return "Characters"--Database characters
    end

    function apiSrv.JobColumn()
        return "job"--Job column in characters
    end

    function apiSrv.JobGradeColumn()
        return "jobgrade"--Jobgrade column in characters
    end

    function apiSrv.SteamColumn()
        return "identifier"--Steam identifier column in characters
    end

    function apiSrv.CharIdColumn()
        return "charidentifier"--Char identifier column in characters
    end

    function apiSrv.getInformation(source, cb)
        local _source = source
        local User = gumCore.getUser(_source)
        if User then
            local Character = User.getUsedCharacter
            local player = {}
            player.getGroup = function() return--Get Admin Group
                User.group
            end 
            player.getFirstname = function() return--Get Firstname
                Character.firstname
            end 
            player.getLastname = function() return--Get Lastname
                Character.lastname
            end 
            player.getSteamIdentifier = function() return--Get Steam Identifier
                Character.identifier
            end 
            player.getCharIdentifier = function() return--Get Char Identifier
                Character.charIdentifier
            end 
            player.getMoney = function() return--Get Money
                Character.money
            end
            player.getGold = function() return--Get Gold
                Character.gold
            end
            player.getJob = function() return--Get Job
                Character.job
            end
            player.getGrade = function() return--Get Job Grade
                Character.jobGrade
            end
            player.setJob = function(job, grade, arg)
                Character.setJob(tonumber(_source), job, grade, arg)
            end
            player.setGrade = function(amount)
                Character.setJobGrade(amount)
            end
            player.getCountItem = function(id)--Get Item Count
                return Inventory.getItemCount(tonumber(_source), id)
            end
            player.removeMoney = function(amount)--Remove Money
                Character.removeCurrency(_source, 0, amount)
            end
            player.addMoney = function(amount)--Add Money
                Character.addCurrency(_source, 0, amount)
            end
            player.removeGold = function(amount)--Remove Gold
                Character.removeCurrency(_source, 1, amount)
            end
            player.addGold = function(amount)--Add Gold
                Character.addCurrency(_source, 1, amount)
            end
            player.removeItem = function(id, amount)--Remove Item
                Inventory.subItem(_source, id, amount)
            end
            player.addItem = function(id, amount)--Add Item
                Inventory.addItem(_source, id, amount)
            end
            player.chanceSkin = function(skin)--Change Skin
                Character.changeSkin(_source, json.decode(skin))
            end
            player.createStorage = function(id, size)--Create Storage
                TriggerEvent("gumCore:registerstorage", _source, id, size)
            end
            player.openStorage = function(id)--Open Storage
                TriggerEvent("gumCore:openstorage", _source, id)
            end
            player.canCarryItem = function(id, count)--Can Carry Item
                local canCarry = false
                TriggerEvent("gumCore:canCarryItem", tonumber(_source), id, tonumber(count), function(canCarry1)
                    canCarry = canCarry1
                end)
                return canCarry
            end
            player.closeInv = function()--Close Inventory
                TriggerClientEvent("gum_inventory:CloseInv", tonumber(_source))
            end
            player.discord = function(webhookLink, imageUrl, description, color, steamHex, charIdentifier)
                sendDiscordMessage(webhookLink, imageUrl, description, color, steamHex, charIdentifier)
            end

            ---Only if you have script where is metadatas --
            player.getMetadata = function(id)
                local itemId = Inventory.getLastUsedID(_source)
                local typeMeta = Inventory.getMetaTypeById(_source, itemId, id)
                return typeMeta, itemId
            end
            player.removeItemId = function(id, amount)
                Inventory.subItemByID(_source, id, amount)
            end
            ----------------------------------------------
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