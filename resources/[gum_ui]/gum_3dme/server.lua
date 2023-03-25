gum = exports.gum_core:gumAPI()

local stavInfo = {}
RegisterServerEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text)
	local _source = source
	drawtext = " "..text
	TriggerClientEvent('3dme:triggerDisplay', -1, drawtext, _source)

	local identifier = GetPlayerIdentifier(_source)
    DiscordWeb(16753920, "**Steam jméno** : "..GetPlayerName(tonumber(_source)).." \n **Steam hex** : "..identifier.."\n **/me** : "..drawtext.." " , args, "Přihlášení")

end)

RegisterServerEvent('3ddo:shareDisplay')
AddEventHandler('3ddo:shareDisplay', function(text)
	local _source = source
	drawtext = " "..text
	TriggerClientEvent('3ddo:triggerDisplay', -1, drawtext, _source)

	local identifier = GetPlayerIdentifier(_source)
    DiscordWeb(16753920, "**Steam jméno** : "..GetPlayerName(tonumber(_source)).." \n **Steam hex** : "..identifier.."\n **/do** : "..drawtext.." " , args, "Přihlášení")
end)

RegisterServerEvent('3ddoc:shareDisplay')
AddEventHandler('3ddoc:shareDisplay', function(text)
	local _source = source
	drawtext = " "..text
	TriggerClientEvent('3ddoc:triggerDisplay', -1, drawtext, _source)

	local identifier = GetPlayerIdentifier(_source)
    DiscordWeb(16753920, "**Steam jméno** : "..GetPlayerName(tonumber(_source)).." \n **Steam hex** : "..identifier.."\n **/do** : "..drawtext.." " , args, "Přihlášení")
end)

RegisterServerEvent('3dstav:shareDisplay')
AddEventHandler('3dstav:shareDisplay', function(text)
	local _source = source
	if text ~= nil then
        stavInfo[_source] = text.." -"
		TriggerClientEvent('3dstav:triggerDisplay', -1, stavInfo, source)
	end
end)
RegisterServerEvent('3dstav:stateDisable')
AddEventHandler('3dstav:stateDisable', function()
	local _source = source
    for k,v in pairs(stavInfo) do
        if tonumber(k) == tonumber(_source) then
            stavInfo[_source] = nil
            TriggerClientEvent('3dstav:triggerDisplay', -1, stavInfo, source)
            return false
        end
    end
end)
RegisterServerEvent('3dme:getState')
AddEventHandler('3dme:getState', function()
    TriggerClientEvent("3dme:getState", source, stavInfo)
end)
function DiscordWeb(color, name, footer)
    local embed = {
        {
            ["color"] = color,
            ["title"] = "",
            ["description"] = "".. name .."",
            ["footer"] = {
                ["text"] = footer,
            },
        }
    }
    PerformHttpRequest('https://discord.com/api/webhooks/885188336396939274/XMJySZsisUeTs4Jig7uDtvrAOMrtH0ox8Li8kOPzWeeIs7jOokbWCG7spr2PpL1k64hg', function(err, text, headers) end, 'POST', json.encode({username = "RedwestRP", embeds = embed}), { ['Content-Type'] = 'application/json' })
end


