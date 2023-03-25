AddEventHandler('onClientResourceStart', function (resourceName)
    TriggerServerEvent("gum:selectcharacter")
    Citizen.InvokeNative(0x4B8F743A4A6D2FF8, true)
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
end)
local CutCoordsx = 0.0
local CutCoordsy = 0.0
local CutCoordsz = 0.0

RegisterNetEvent("gum:SelectedCharacter")
AddEventHandler("gum:SelectedCharacter", function(charid)
    if Config.Eagle_Eye then
        Citizen.InvokeNative(0xA63FCAD3A6FEC6D2, PlayerId(), true)
    end
    Citizen.CreateThread(function()
        while true do
            local timer = 0
            if Config.Onesync == true then
                timer = 600000
            else
                timer = 2*60000
            end 
	        TriggerServerEvent("gum_core:checkPlayersOnline")
            Citizen.Wait(timer)
            local GetCoords = GetEntityCoords(PlayerPedId())
            local GetHeading = GetEntityHeading(PlayerPedId())
            if GetDistanceBetweenCoords(GetCoords.x, GetCoords.y, GetCoords.z, 1407.4278564453125, -1139.5155029296875, 75.34754180908203) > 5.0 or GetDistanceBetweenCoords(GetCoords.x, GetCoords.y, GetCoords.z, -563.77, -3776.49, 238.56) > 20.0 then
                if GetDistanceBetweenCoords(GetCoords.x, GetCoords.y, GetCoords.z, CutCoordsx, CutCoordsy, CutCoordsz, false) > 10.0 then
                    CutCoordsx = tonumber(string.format("%.2f", GetCoords.x))
                    CutCoordsy = tonumber(string.format("%.2f", GetCoords.y))
                    CutCoordsz = tonumber(string.format("%.2f", GetCoords.z))
                    CutHeading = tonumber(string.format("%.2f", GetHeading))
                    local coords_save = {x=CutCoordsx, y=CutCoordsy, z=CutCoordsz, heading=CutHeading}
                    TriggerServerEvent("gumCore:save_coords", coords_save)
                end
            end
        end
    end)
end)

RegisterNetEvent("gum_core:sendBack")
AddEventHandler("gum_core:sendBack", function(countchar)
    SetDiscordAppId(Config.DiscordID)
    SetDiscordRichPresenceAsset('biglogo')
    SetDiscordRichPresenceAssetText(Config.DiscordPText)
    SetDiscordRichPresenceAssetSmall('smalllogo')
    SetDiscordRichPresenceAssetSmallText(Config.DiscordSText)
    SetDiscordRichPresenceAction(0, "Discord", Config.DiscordButton) -- (OPTIONAL)

    local playerName = GetPlayerName(PlayerId())
    SetRichPresence(string.format("%s - %s/%s", playerName, countchar, 128))
end)

RegisterNetEvent("gum:endcallback", function(callbackName, ticket, ...)
	local fn = getCallbackResolution(callbackName, ticket)
	if fn then
		fn(...)
	end
end)

RegisterNetEvent("gum:ExecuteServerCallBack")
AddEventHandler("gum:ExecuteServerCallBack", function(callbackName, cb, ...)
    local ticket = generateTicket()
	addCallbackResolution(callbackName, ticket, function(...)
		cb(...)
		removeCallbackResolution(callbackName, ticket)
	end)

	TriggerServerEvent("gum:triggercallback", callbackName, ticket, ...)
end)
