MenuData = {}
TriggerEvent("gum_menu:getData",function(call)
    MenuData = call
end)

local gum
TriggerEvent("getApi",function(gumData)
    gum = gumData
end)

local Debug = true 
Protect = {SpammingEvent = false, SpammingBellEvent = false}
local control = false 
local CotonPrompt
local CotonPrompt2
local CotonPrompt3
local CotonGroup4
local active = false
local sleep = true
local CotondCotons = {}
local CotonAdd = {}
local InZone = false
local InZone2 = false 
local InZone3 = false 
local BellZone = false 
local machine = 'OFF'
local coton = 0
local sacscoton = 0
local CotonGroup = GetRandomIntInRange(0, 0xffffff)
local CotonGroup2 = GetRandomIntInRange(0, 0xffffff)
local CotonGroup3 = GetRandomIntInRange(0, 0xffffff)
local CotonGroup4 = GetRandomIntInRange(0, 0xffffff)
local Bell = GetRandomIntInRange(0, 0xffffff)

local Cotons = {
    "crp_cotton_ba_sim",
}

function Clochesound(volume)
    SendNUIMessage({
        playsound = 'cloche.mp3',
        soundvolume = volume
    })
end

function PromptCloche()
    str5 = "Ring the bell"
    promptCloche = PromptRegisterBegin()
    PromptSetControlAction(promptCloche, 0x53296B75) -- clique droit
    str = CreateVarString(10, 'LITERAL_STRING', str5)
    PromptSetText(promptCloche, str)
    PromptSetEnabled(promptCloche, 1)
    PromptSetVisible(promptCloche, 1)
    PromptSetStandardMode(promptCloche, 1)
    PromptSetHoldMode(promptCloche, 1)
    PromptSetGroup(promptCloche, Bell)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C, promptCloche, true)
    PromptRegisterEnd(promptCloche)
end

function Coton()
    Citizen.CreateThread(function()
        local str = 'Harvest'
        CotonPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(CotonPrompt, 0xD9D0E1C0)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(CotonPrompt, str)
        PromptSetEnabled(CotonPrompt, true)
        PromptSetVisible(CotonPrompt, true)
        PromptSetHoldMode(CotonPrompt, true)
        PromptSetGroup(CotonPrompt, CotonGroup)
        PromptRegisterEnd(CotonPrompt)
    end)
end

function AddFleurCoton()
    Citizen.CreateThread(function()
        local str2 = 'drop cotton'
        CotonPrompt2 = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(CotonPrompt2, 0xD9D0E1C0)
        str = CreateVarString(10, 'LITERAL_STRING', str2)
        PromptSetText(CotonPrompt2, str)
        PromptSetEnabled(CotonPrompt2, true)
        PromptSetVisible(CotonPrompt2, true)
        PromptSetHoldMode(CotonPrompt2, true)
        PromptSetGroup(CotonPrompt2, CotonGroup2)
        PromptRegisterEnd(CotonPrompt2)
    end)
end

function StartFleurCoton()
    Citizen.CreateThread(function()
        local str3 = 'Start the machine'
        CotonPrompt3 = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(CotonPrompt3, 0xD9D0E1C0)
        str = CreateVarString(10, 'LITERAL_STRING', str3)
        PromptSetText(CotonPrompt3, str)
        PromptSetEnabled(CotonPrompt3, true)
        PromptSetVisible(CotonPrompt3, true)
        PromptSetHoldMode(CotonPrompt3, true)
        PromptSetGroup(CotonPrompt3, CotonGroup3)
        PromptRegisterEnd(CotonPrompt3)
    end)
end

function SacFleurCoton()
    Citizen.CreateThread(function()
        local str4 = 'Take the cotton bag'
        CotonPrompt4 = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(CotonPrompt4, 0xD9D0E1C0)
        str = CreateVarString(10, 'LITERAL_STRING', str4)
        PromptSetText(CotonPrompt4, str)
        PromptSetEnabled(CotonPrompt4, true)
        PromptSetVisible(CotonPrompt4, true)
        PromptSetHoldMode(CotonPrompt4, true)
        PromptSetGroup(CotonPrompt4, CotonGroup4)
        PromptRegisterEnd(CotonPrompt4)
    end)
end

if Debug then 
    SacFleurCoton()
    AddFleurCoton()
    StartFleurCoton()
    Coton()
else
    RegisterNetEvent("gum:SelectedCharacter")
    AddEventHandler("gum:SelectedCharacter", function(charid)
        TriggerEvent('gum:ExecuteServerCallBack','getJobCoton', function(job)
            if job == 'coton' then
                SacFleurCoton()
                AddFleurCoton()
                StartFleurCoton()
                Coton()
            end
        end)
    end)
end

CreateThread(function()
    while true do
        local coords = vector3(1406.86083984375, -1284.4521484375, 80.99542236328125)
        local dist = #(GetEntityCoords(PlayerPedId()) - coords)
        if dist < 1.5 then
            InZone3 = true
            repeat
                if sacscoton >= 1 then 
                    color = '~t6~'
                else
                    color = '~e~'
                end
                local Traitement3GroupName = CreateVarString(10, 'LITERAL_STRING', color..""..sacscoton.. "~q~ cotton bags ")
                dist = #(GetEntityCoords(PlayerPedId()) - coords)
                PromptSetActiveGroupThisFrame(CotonGroup4, Traitement3GroupName)
                if PromptHasHoldModeCompleted(CotonPrompt4) then
                    Wait(0)
                    if sacscoton >= 1 then 
                        if not Protect.SpammingEvent then 
                            Protect.SpammingEvent = true 
                            FreezeEntityPosition(PlayerPedId(), true)
                            SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true, 0, false, false)
                            playCustomAnim("amb_work@world_human_bucket_fill@female_a@stand_exit_withprop","exit_front", 3000, 1)
                            sacscoton = 0
                            machine = 'OFF'
                            Wait(5000)
                            FreezeEntityPosition(PlayerPedId(), false)
                            TriggerServerEvent('dvr_cotonjob:givecotonsac')
                            Protect.SpammingEvent = false 
                        end
                    end
                end 
                Citizen.Wait(5)
            until dist > 1.5 
            InZone3 = false
        end

        if InZone3 then 
            Wait(5)
        else
            Wait(200)
        end
    end
end)

CreateThread(function()
    while true do
        local coords = vector3(1411.9371337890625, -1283.46826171875, 81.02912139892578)
        local dist = #(GetEntityCoords(PlayerPedId()) - coords)
        if dist < 1.5 then
            InZone2 = true
            repeat
                if coton < 10 then 
                    control = true 
                    color = '~e~'
                else
                    control = false 
                    color = '~t6~'
                end
                local TraitementGroupName = CreateVarString(10, 'LITERAL_STRING', color..''..coton.. "~q~ cotton flower(s) ")
                dist = #(GetEntityCoords(PlayerPedId()) - coords)
                PromptSetActiveGroupThisFrame(CotonGroup2, TraitementGroupName)
                if PromptHasHoldModeCompleted(CotonPrompt2) and control then
                    Wait(0)
                    TriggerEvent('gum:ExecuteServerCallBack','getItem:coton', function(cb)
                        if cb ~= nil then 
                            if cb then 
                                if not Protect.SpammingEvent then 
                                    Protect.SpammingEvent = true 
                                    FreezeEntityPosition(PlayerPedId(), true)
                                    PromptSetEnabled(CotonPrompt2, false)
                                    SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true, 0, false, false)
                                    playCustomAnim("amb_camp@world_camp_jack_plant@idle_a","idle_c", 5000, 1)
                                    TriggerEvent('gum_notify:notify', "cotton", "INFO: You need 10 cottons to make a bag, don't forget to start the cotton machine!", 'bag', 5000)
                                    Wait(6000)
                                    coton = coton + 2
                                    PromptSetEnabled(CotonPrompt2, true)
                                    FreezeEntityPosition(PlayerPedId(), false)
                                    Protect.SpammingEvent = false 
                                end
                            else
                                TriggerEvent('gum_notify:notify', "cotton", "You're out of cotton", 'bag', 5000)
                            end
                        end
                    end)
                end 
                Citizen.Wait(5)
            until dist > 1.5 
            InZone2 = false
        end

        if InZone2 then 
            Wait(5)
        else
            Wait(200)
        end
    end
end)

CreateThread(function()
    while true do
        local coords = vector3(1407.151123046875, -1286.86669921875, 78.21721649169922)
        local dist = #(GetEntityCoords(PlayerPedId()) - coords)
        if dist < 1.5 then
            InZone = true
            repeat
                if machine == 'OFF' then 
                    color = '~e~'
                    sacscoton = 0
                else
                    color = '~t6~'
                    sacscoton = 1
                end

                local Traitement2GroupName = CreateVarString(10, 'LITERAL_STRING', "cotton machine "..color.."" ..machine.. "~q~")
                dist = #(GetEntityCoords(PlayerPedId()) - coords)
                PromptSetActiveGroupThisFrame(CotonGroup3, Traitement2GroupName)
                if PromptHasHoldModeCompleted(CotonPrompt3) then
                    Wait(0)
                    if not Protect.SpammingEvent then 
                        Protect.SpammingEvent = true 
                        if coton >= 10 and coton ~= nil then 
                            FreezeEntityPosition(PlayerPedId(), true)
                            SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true, 0, false, false)
                            coton = 0
                            machine = 'ON'
                            playCustomAnim("amb_work@prop_human_pump_water@female_b@idle_a", "idle_a", 5000, 1)
                            exports.gum_status2:DisplayProgressBar(5000)
                            FreezeEntityPosition(PlayerPedId(), false)
                            Protect.SpammingEvent = false 
                        else
                            TriggerEvent('gum_notify:notify', 'cotton', "You didn't deposit enough cotton", 'bag', 5000)
                            Protect.SpammingEvent = false 
                        end
                    end
                end 
                Citizen.Wait(5)
            until dist > 1.5 
            InZone = false
        end

        if InZone then 
            Wait(5)
        else
            Wait(200)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local sleep = true
        local playerped = PlayerPedId()
        if not IsPedOnMount(playerped) and not IsPedInAnyVehicle(playerped) and not IsPedDeadOrDying(playerped) then
            local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
            for k,v in pairs(Cotons) do
            local Coton = DoesObjectOfTypeExistAtCoords(x, y, z, 1.0, GetHashKey(v), true)
                if Coton and not InArray(CotondCotons, tostring(v)) then
                    sleep = false
                    if active == false then
                        local CotingGroupName = CreateVarString(10, 'LITERAL_STRING', "Cotton")
                        PromptSetActiveGroupThisFrame(CotonGroup, CotingGroupName)
                    end
                    if PromptHasHoldModeCompleted(CotonPrompt) then
                        Wait(50)
                        if not Protect.SpammingEvent then 
                            Protect.SpammingEvent = true 
                            FreezeEntityPosition(PlayerPedId(), true)
                            SetCurrentPedWeapon(playerped, GetHashKey("WEAPON_UNARMED"), true, 0, false, false)
                            active = true
                            playAnim("mech_pickup@plant@berries","base", 5000)
                            exports.gum_status2:DisplayProgressBar(5000)
                            TriggerServerEvent('dvr_cotonjob:getitem')
                            Protect.SpammingEvent = false 
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    end
                end
            end
        end
        if sleep then
            Citizen.Wait(1000)
        end
    end
end)

CreateThread(function()
    PromptCloche()
    while true do
        BellZone = false 
        if gum.playerNearCoords(1038.1595458984375, -1793.9921875, 46.53904724121094, 2.0) then
            BellZone = true
            local label = CreateVarString(10, 'LITERAL_STRING', "Braithwaite Manor (cotton)")
            PromptSetActiveGroupThisFrame(Bell, label)
            if Citizen.InvokeNative(0xC92AC953F0A982AE, promptCloche) then
                playCustomAnim("amb_misc@world_human_browse_produce@poor@apple@male_a@wip_base","wip_base", 1000, 1)
                if not Protect.SpammingBellEvent then 
                    Protect.SpammingBellEvent = true 
                    Wait(1000)
                    TriggerServerEvent('dvr_cotonjob:server:Bell')
                    Protect.SpammingBellEvent = false 
                end
            end
        end
    
        if BellZone then 
            Wait(5)
        else
            Wait(200)
        end
    end
end)

function GetArrayKey(array, value)
    for k,v in pairs(array) do
        if v == value then return k	end
    end
    return false
end

function InArray(array, item)
    for k,v in pairs(array) do
        if v == item then return true end
    end
    return false
end

RegisterNetEvent('dvr_cotonjob:client:Bell', function()
    if gum.playerNearCoords(1010.602294921875, -1770.6439208984375, 64.09130859375, 90.0) then
        Clochesound(0.5)
    end
end)

function playCustomAnim(dict,name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
	TaskPlayAnim(PlayerPedId(), dict, name, 1.0, 1.0, time, flag, 0, true, 0, false, 0, false)  
end

RegisterNetEvent('dvr_cotonjob:activefalse', function()
    active = false
end)

--[[
~e~Red 
~o~Yellow 
~d~Orange 
~m~Grey 
~q~White 
~t~Light Grey 
~v~Black 
~u~Pink
~pa~Blue 
~t1~Purple 
~t2~Orange 
~t3~Light Blue 
~t4~Yellow 
~t5~Light Pink 
~t6~Green 
~t7~Dark Blue 
~t8~Light RedIsh
]]