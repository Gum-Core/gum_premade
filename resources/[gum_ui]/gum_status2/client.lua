local hud = false
local compass = false
local voiceVolume = 25
local voiceOn = false

local YouNeedMinimap = false

RegisterCommand("hud", function(source, args, rawCommand)
	if hud == true then
        hud = false
	else
        hud = true
	end
end)

RegisterCommand("prog_test", function(source, args, rawCommand)
    exports.gum_status2:DisplayProgressBar(15000)
end)
exports('DisplayProgressBar', function(time)
    local timer = (time / 100)
    local DisplayElemet = 0
    while DisplayElemet < 100 do
        SendNUIMessage({progress=true, time=DisplayElemet})
        DisplayElemet = DisplayElemet + 1
        Wait(timer)
        if DisplayElemet > 99 then
            SendNUIMessage({progress=false})
        end
    end
end)


RegisterNetEvent('gum_status:enable_compass')
AddEventHandler('gum_status:enable_compass', function()
    if compass == false then
        compass = true
    else
        compass = false
    end
end)

RegisterNetEvent("gum:SelectedCharacter")
AddEventHandler("gum:SelectedCharacter", function(charid)
    Citizen.CreateThread(function()
        hud = true
     end)
end)

RegisterNetEvent('gum_status:voiceOn')
AddEventHandler('gum_status:voiceOn', function(player)
    if player == PlayerPedId() then
        if voiceOn == false then
            voiceOn = true
        else
            voiceOn = false
        end
    end
end)

RegisterNetEvent('gum_status:range')
AddEventHandler('gum_status:range', function(player, range)
    if player == PlayerPedId() then
        if tonumber(range) == 30 then
            voiceVolume = 100
        elseif tonumber(range) == 15 then
            voiceVolume = 75
        elseif tonumber(range) == 8 then
            voiceVolume = 50
        elseif tonumber(range) == 3.5 then
            voiceVolume = 25
        end
    end
end)

function GetPlayerStamina(player)
    return Citizen.InvokeNative(0x0FF421E467373FCF, player, Citizen.ResultAsFloat())
end

function GetPlayerHealth(player)
    return Citizen.InvokeNative(0x0317C947D062854E, player, Citizen.ResultAsFloat())
end
function GetHorseStamina(player)
    return Citizen.InvokeNative(0x775A1CA7893AA8B5, player, Citizen.ResultAsFloat())
end
function GetHorseStaminaMax(player)
    return Citizen.InvokeNative(0xCB42AFE2B613EE55, player, Citizen.ResultAsFloat())
end

Citizen.CreateThread(function()
    Citizen.InvokeNative(0xFE7C9CF376D23342, PlayerId(), 0.02)
    while true do
        Citizen.Wait(100)
        if compass == true then
            local ped = PlayerPedId()
            local h = GetEntityHeading(PlayerPedId())        
            h = h + GetGameplayCamRelativeHeading()
            SendNUIMessage({compass=true, angle=h})
        else
            SendNUIMessage({compass=false})
        end
        Citizen.InvokeNative(0x4CC5F2FC1332577F, GetHashKey("HUD_CTX_INFINITE_AMMO"))
        if YouNeedMinimap == false then
            Citizen.InvokeNative(0x4CC5F2FC1332577F, GetHashKey("HUD_CTX_SHARP_SHOOTER_EVENT"))
            Citizen.InvokeNative(0x4CC5F2FC1332577F ,GetHashKey("HUD_CTX_RESTING_BY_FIRE"))
            Citizen.InvokeNative(0x4CC5F2FC1332577F ,GetHashKey("HUD_CTX_INFO_CARD"))
        end
        Citizen.InvokeNative(0x4CC5F2FC1332577F ,GetHashKey("HUD_CTX_GOLD_CURRENCY_CHANGE"))

        Citizen.InvokeNative(0xD4EE21B7CC7FD350, false)
        Citizen.InvokeNative(0x50C803A4CD5932C5, false)

        if GetMount(PlayerPedId()) ~= 0 then
            onhorse = true
        else
            onhorse = false
        end
        local myhunger = exports["gum_metabolism"]:getHunger()
        local mythirst = exports["gum_metabolism"]:getThirst()
        local myalcohol = exports["gum_metabolism"]:getAlcohol()
        local mytemp = exports["gum_metabolism"]:getTemp()
        --horse
        local horseMaxStaminaOuterCore = GetHorseStaminaMax(GetMount(PlayerPedId()))
        local horseStaminaOuterCore = GetHorseStamina(GetMount(PlayerPedId()))
        local horseHealthMaxOuterCore = Citizen.InvokeNative(0x4700A416E8324EF3, GetMount(PlayerPedId()))
        local horseHealthOuterCore = GetEntityHealth(GetMount(PlayerPedId()))

        local horseStaminaInnerCore = Citizen.InvokeNative(0x36731AC041289BB1, GetMount(PlayerPedId()), 1)
        local horseHealthInnerCore = Citizen.InvokeNative(0x36731AC041289BB1, GetMount(PlayerPedId()), 0)
        --horse
    
        -- player
        local playerHealthMaxOuterCore = Citizen.InvokeNative(0x4700A416E8324EF3, PlayerPedId())
        local playerHealthOuterCore = GetEntityHealth(PlayerPedId())
        local mystamina = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
        
        staminaDataTest = GetPlayerStamina(PlayerId())
        healthDataTest = GetPlayerHealth(PlayerId())
        if playerHealthOuterCore ~= false and playerHealthOuterCore ~= nil then
            if playerHealthOuterCore > 90 then
                Citizen.InvokeNative(0x8899C244EBCF70DE, PlayerId(), 5.0)
            else
                Citizen.InvokeNative(0x8899C244EBCF70DE, PlayerId(), 0.0)
            end
        end
        if playerHealthOuterCore < 60 or playerHealthOuterCore == false then
            DisableControlAction(0, 0xF84FA74F, true)
        end
        if staminaDataTest <= 3.0 then
            Citizen.InvokeNative(0xBBADFB5E5E5766FB, PlayerId(), 0.8)--Drain
            Citizen.InvokeNative(0xFECA17CF3343694B, PlayerId(), 0.1)--Recharde
        else
            Citizen.InvokeNative(0xBBADFB5E5E5766FB, PlayerId(), 0.6)--Drain
            Citizen.InvokeNative(0xFECA17CF3343694B, PlayerId(), 0.3)--Recharde
        end
        if playerHealthOuterCore == false then
            playerHealthOuterCore = 0
        end
        if mystamina == false then
            mystamina = 0
        end
        if horseHealthMaxOuterCore == false then
            horseHealthMaxOuterCore = 0
        end
        if playerHealthMaxOuterCore == false then
            playerHealthMaxOuterCore = 0
        end
        if hud == true then
            if IsCinematicCamRendering() == 1 then
                SendNUIMessage({show=false, health2=calculatePercent(playerHealthMaxOuterCore, playerHealthOuterCore), health=healthDataTest*2, thirst=math.floor(mythirst), hunger=math.floor(myhunger), stamina2=mystamina, stamina=staminaDataTest*8.95, on_horse=false, horse_stamina=calculatePercent(horseMaxStaminaOuterCore, horseStaminaOuterCore), horse_stamina2=horseStaminaInnerCore, horse_health=calculatePercent(horseHealthMaxOuterCore, horseHealthOuterCore), horse_health2=horseHealthInnerCore, alcohol=myalcohol, temp=(2.5*mytemp),voice=voiceOn,volume=voiceVolume,minimap=YouNeedMinimap })
            else
                SendNUIMessage({show=true, health2=calculatePercent(playerHealthMaxOuterCore, playerHealthOuterCore), health=healthDataTest*2, thirst=math.floor(mythirst), hunger=math.floor(myhunger), stamina2=mystamina, stamina=staminaDataTest*8.95, on_horse=onhorse, horse_stamina=calculatePercent(horseMaxStaminaOuterCore, horseStaminaOuterCore), horse_stamina2=horseStaminaInnerCore, horse_health=calculatePercent(horseHealthMaxOuterCore, horseHealthOuterCore), horse_health2=horseHealthInnerCore, alcohol=myalcohol, temp=(2.5*mytemp),voice=voiceOn,volume=voiceVolume,minimap=YouNeedMinimap })
            end
        else
            SendNUIMessage({show=false, health2=calculatePercent(playerHealthMaxOuterCore, playerHealthOuterCore), health=healthDataTest*2, thirst=math.floor(mythirst), hunger=math.floor(myhunger), stamina2=mystamina, stamina=staminaDataTest*8.95, on_horse=false, horse_stamina=calculatePercent(horseMaxStaminaOuterCore, horseStaminaOuterCore), horse_stamina2=horseStaminaInnerCore, horse_health=calculatePercent(horseHealthMaxOuterCore, horseHealthOuterCore), horse_health2=horseHealthInnerCore, alcohol=myalcohol, temp=(2.5*mytemp),voice=voiceOn,volume=voiceVolume,minimap=YouNeedMinimap })
        end
    end
end)

function calculatePercent(max, now)
    local percentValue = max/100
    local calculatePercent = now/percentValue
    return calculatePercent
end   
Citizen.CreateThread(function()
    while true do
        local size = GetNumberOfEvents(0)   
        if size > 0 then
            for i = 0, size - 1 do
                local eventAtIndex = GetEventAtIndex(0, i)
                if eventAtIndex == GetHashKey("EVENT_CHALLENGE_GOAL_COMPLETE") or eventAtIndex == GetHashKey("EVENT_CHALLENGE_REWARD") or eventAtIndex == GetHashKey("EVENT_DAILY_CHALLENGE_STREAK_COMPLETED") then 
                    Citizen.InvokeNative(0x6035E8FBCA32AC5E)
                end
            end
        end    
        Citizen.InvokeNative(0xFC094EF26DD153FA, 2)
        SetPlayerTargetingMode(3)
        if Citizen.InvokeNative(0x9DE327631295B4C2, PlayerPedId()) then
            Citizen.InvokeNative(0x675680D089BFA21F, PlayerPedId(), 0.001)
        end
       if staminaDataTest ~= nil then
            if staminaDataTest <= 1.0 then
                DisableControlAction(0, 0xF84FA74F, true)
                DisableControlAction(0, 0x8FFC75D6, true)
                DisableControlAction(0, 0xB5EEEFB7, true)
                SetPedMaxMoveBlendRatio(PlayerPedId(), 1.0)
            end
        end
        if staminaDataTest ~= nil then
            if staminaDataTest <= 3.5 then
                DisableControlAction(0, 0xD9D0E1C0, true)
            end
        end
        Citizen.Wait(10)
    end
end)

Citizen.CreateThread(function()
    while true do
        if Citizen.InvokeNative(0xCEDABC5900A0BF97, PlayerPedId()) then
            Citizen.InvokeNative(0x675680D089BFA21F, PlayerPedId(), 0.08)
            Citizen.Wait(800)
        end
        if Citizen.InvokeNative(0x53E8CB4F48BFE623, PlayerPedId()) then
            Citizen.InvokeNative(0x675680D089BFA21F, PlayerPedId(), 0.08)
            Citizen.Wait(1500)
        end
        Citizen.Wait(5)
    end
end)

