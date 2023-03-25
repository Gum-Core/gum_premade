local active = false
local buttons_prompt = GetRandomIntInRange(0, 0xffffff)
local water = 100.0
local food = 100.0
local drunkPercent = 0
local temperature = 0

function getThirst()
	return water
end

function getHunger()
	return food
end

function getAlcohol()
	return drunkPercent
end
function getTemp()
	return temperature
end
RegisterNetEvent("gum:SelectedCharacter")
AddEventHandler("gum:SelectedCharacter", function(charid)
    Citizen.CreateThread(function()
        TriggerEvent('gum:ExecuteServerCallBack','gum_metabolism:getStatus', function(hunger, thirst) 
            if hunger ~= nil and thirst ~= nil then
                food = hunger
                water = thirst
            end
        end)
        while true do
            local tempCd = GetEntityCoords(PlayerPedId())
            Citizen.InvokeNative(0xB98B78C3768AF6E0, true)
            temperature = GetTemperatureAtCoords(tempCd)
            water = water-Config.CountDownStandart
            food = food-Config.CountDownStandart

            if tonumber(temperature) < 30 then
                water = water-Config.TempBiggerDown
            end
            if tonumber(temperature) < -2 then
                food = food-Config.TempLowwerDown
            end
            if Citizen.InvokeNative(0xDE4C184B2B9B071A, PlayerPedId()) then--Walk
                water = water-Config.CountDownIfWalk
            end
            if Citizen.InvokeNative(0xC5286FFC176F28A2, PlayerPedId()) then--Run
                water = water-Config.CountDownIfRun
            end
            if Citizen.InvokeNative(0x57E457CD2C0FC168, PlayerPedId()) then--Sprint
                water = water-Config.CountDownIfSprint
            end


            if drunkPercent >= 0 then
                drunkPercent = drunkPercent-Config.AlcoholCountDown
            end
            if drunkPercent <= 0 then
                drunkPercent = 0
            end
            if drunkPercent >= Config.PercentDrunkForVomit then
                local random = math.random(0,100)
                if random < Config.PercentForVomit then
                    drunkPercent = drunkPercent-Config.HowMuchDownAfterVomit
                    playCustomAnim("amb_misc@world_human_vomit@male_a@base", "base", 10000, -1)
                end
            end
            if (food < 0) then
                food = 0
            end
            if (food > 100) then
                food = 100
            end
            if water < 0 then
                water = 0
            end
            if water > 100 then
                water = 100	
            end
            -- print("-----")
            -- print("Food : ", food)
            -- print("Water : ", water)
            -- print("Drunk : ", drunkPercent)
            -- print("Temp : ", temperature)
            -- print("Health : ", GetEntityHealth(PlayerPedId()))
            drunkSet(drunkPercent)
            if water == 0 then
                SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId())-5)
            end
            if food == 0 then
                SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId())-5)
            end
            Citizen.Wait(Config.CheckMetaTime*1000)
        end
    end)
    Citizen.CreateThread(function()
        while true do
            local tempCd = GetEntityCoords(PlayerPedId())
            Citizen.InvokeNative(0xB98B78C3768AF6E0, true)
            temperature = GetTemperatureAtCoords(tempCd)
            if temperature < 0 then
                exports['gum_notify']:DisplayLeftNotification("Temperature", "Are you cold", 'temp', 2000)
            elseif temperature > 35 then
                exports['gum_notify']:DisplayLeftNotification("Temperature", "Are you warn", 'temp', 2000)
            end
            Citizen.Wait(10000)
        end
    end)
    Citizen.CreateThread(function()
        while true do
            TriggerServerEvent("gum_metabolism:updateMeta", food, water)
            Citizen.Wait(30000)
        end
    end)
end)


RegisterNetEvent("gum_metabolism:eatIt")
AddEventHandler("gum_metabolism:eatIt", function(itemData)
    local itemInHand = 0
    playCustomAnim("mech_butcher", "small_rat_give_player", 1100, 25)
    Citizen.Wait(700)
    if itemData.animation == "eat" then
        if propName ~= "" then
            local pC = GetEntityCoords(PlayerPedId())
            itemInHand = CreateObject(itemData.propName, pC.x, pC.y, pC.z, true, false, false)
            AttachEntityToEntity(itemInHand, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "SKEL_L_Finger01"), 0.04, -0.03, -0.01, 0.0, 19.0, 46.0, true, true, false, true, 1, true)
        end
	Citizen.InvokeNative(0xFCCC886EDE3C63EC, ped, 2, 1) -- Removes Weapon from animation
	Citizen.Wait(0)
        playCustomAnim("mech_inventory@eating@multi_bite@sphere_d8-2_sandwich", "quick_left_hand", -1, 25)
        Citizen.Wait(2000)
        if propName ~= "" then
            deleteObj(itemInHand)
        end
        itemInHand = nil
        Citizen.Wait(700)
    elseif itemData.animation == "drink" then
        if propName ~= "" then
            local pC = GetEntityCoords(PlayerPedId())
            itemInHand = CreateObject(itemData.propName, pC.x, pC.y, pC.z, true, false, false)
            AttachEntityToEntity(itemInHand, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "PH_R_HAND"), 0.00, 0.00, 0.04, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        end
	Citizen.InvokeNative(0xFCCC886EDE3C63EC, ped, 2, 1) -- Removes Weapon from animation	
        Citizen.Wait(600)
        playCustomAnim("mech_inventory@drinking@bottle_cylinder_d1-3_h30-5_neck_a13_b2-5", "uncork", 500, 25)
        Citizen.Wait(500)
        playCustomAnim("mech_inventory@drinking@bottle_cylinder_d1-3_h30-5_neck_a13_b2-5", "chug_a", -1, 25)
        Citizen.Wait(5000)
        if propName ~= "" then
            deleteObj(itemInHand)
        end
        itemInHand = nil
    elseif itemData.animation == "berry" then
        if propName ~= "" then
            local pC = GetEntityCoords(PlayerPedId())
            itemInHand = CreateObject(itemData.propName, pC.x, pC.y, pC.z, true, false, false)
            AttachEntityToEntity(itemInHand, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "SKEL_L_Finger01"), 0.04, -0.03, -0.01, 0.0, 19.0, 46.0, true, true, false, true, 1, true)
        end
	Citizen.InvokeNative(0xFCCC886EDE3C63EC, ped, 2, 1) -- Removes Weapon from animation
	Citizen.Wait(0)
        playCustomAnim("mech_pickup@plant@berries", "exit_eat", -1, 25)
        Citizen.Wait(1000)
        if propName ~= "" then
            deleteObj(itemInHand)
        end
        itemInHand = nil
        Citizen.Wait(700)
    elseif itemData.animation == "syringe" then
        if propName ~= "" then
            local pC = GetEntityCoords(PlayerPedId())
            itemInHand = CreateObject(itemData.propName, pC.x, pC.y, pC.z, true, false, false)
            AttachEntityToEntity(itemInHand, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "SKEL_L_Finger01"), 0.04, -0.03, -0.01, 0.0, 19.0, 46.0, true, true, false, true, 1, true)
        end
        AttachEntityToEntity(itemInHand, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "SKEL_L_Finger01"), 0.04, -0.03, -0.01, 0.0, 19.0, 46.0, true, true, false, true, 1, true)
        Citizen.Wait(1000)
        if propName ~= "" then
            deleteObj(itemInHand)
        end
        itemInHand = nil
        Citizen.Wait(700)
    end

    drunkPercent = drunkPercent+itemData.alcoholGive
    food = food+itemData.hunger
    water = water+itemData.thirst
    if food > 100 then
		food = 100
	end
	if water > 100 then
		water = 100
	end
	if itemData.innerCoreStamina ~= 0 then
		local staminaNow = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1) 
        if staminaNow == false then
            staminaNow = 0
        end
		local staminaAfter = tonumber(staminaNow+itemData.innerCoreStamina)
		if (staminaAfter > 100) then
			staminaAfter = 100
		end
		Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, staminaAfter)
	end
	if itemData.innerCoreHealth ~= 0 then
		local healthNow = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 0)
		local healthAfter = tonumber(healthNow+itemData.innerCoreHealth)
		if (healthAfter > 100) then
			healthAfter = 100
		end
		Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, healthAfter)
	end
	if itemData.innerCoreStaminaGold ~= 0.0 then
		Citizen.InvokeNative(0x4AF5A4C7B9157D14, PlayerPedId(), 1, itemData.innerCoreStaminaGold, true)
	end
	if itemData.outerCoreStaminaGold ~= 0.0 then
		Citizen.InvokeNative(0xF6A7C08DF2E28B28, PlayerPedId(), 1, itemData.outerCoreStaminaGold, true)
	end
	if itemData.innerCoreHealthGold ~= 0.0 then
		Citizen.InvokeNative(0x4AF5A4C7B9157D14, PlayerPedId(), 0, itemData.innerCoreHealthGold, true)
	end
	if	itemData.OuterCoreHealthGold ~= 0.0 then
		Citizen.InvokeNative(0xF6A7C08DF2E28B28, PlayerPedId(), 0, itemData.OuterCoreHealthGold, true)
	end
    Citizen.Wait(50)
    deBlock()
    ClearPedTasks(PlayerPedId())
end)

function deBlock()
    TriggerServerEvent("gum_metabolism:deBlockSpam")
end

-- Citizen.CreateThread(function()
--     while true do 
--         if food <= 0 then
--             SetEntityHealth(PlayerPedId(), (GetEntityHealth(PlayerPedId())-1))
--         end
--         Citizen.Wait(0)
--         if water <= 0 then
--             SetEntityHealth(PlayerPedId(), (GetEntityHealth(PlayerPedId())-1))
--         end
--         Citizen.Wait(5*1000)
--     end
-- end)

function drunkSet(value)
    if tonumber(value) == 0 then
        Citizen.InvokeNative(0x406CCF555B04FAD3, PlayerPedId(), true, 0.0)
        if shake_cam_state ~= 0 then
            print(value.." == 0")
            shake_cam_state = 0
            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 0.0)
            ShakeGameplayCam("DRUNK_SHAKE", 0.0)
            AnimpostfxPlay("OJDominoBlur")
            Citizen.InvokeNative(0xCAB4DD2D5B2B7246, "OJDominoBlur", 0.0)
        end
    elseif tonumber(value) < 10 then
        Citizen.InvokeNative(0x406CCF555B04FAD3, PlayerPedId(), true, 0.1)
        if shake_cam_state ~= 1 then
            print(value.." < 10")
            shake_cam_state = 1
            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 0.1)
            ShakeGameplayCam("DRUNK_SHAKE", 0.1)
        end
    elseif tonumber(value) < 20 then
        Citizen.InvokeNative(0x406CCF555B04FAD3, PlayerPedId(), true, 0.2)
        if shake_cam_state ~= 2 then
            print(value.." < 20")
            shake_cam_state = 2
            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 0.2)
            ShakeGameplayCam("DRUNK_SHAKE", 0.2)
        end
    elseif tonumber(value) < 30 then
        Citizen.InvokeNative(0x406CCF555B04FAD3, PlayerPedId(), true, 0.3)
        if shake_cam_state ~= 3 then
            print(value.." < 30")
            shake_cam_state = 3
            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 0.3)
            ShakeGameplayCam("DRUNK_SHAKE", 0.3)
            AnimpostfxStop("OJDominoBlur")

        end
    elseif tonumber(value) < 40 then
        Citizen.InvokeNative(0x406CCF555B04FAD3, PlayerPedId(), true, 0.4)
        if shake_cam_state ~= 4 then
            print(value.." < 40")
            shake_cam_state = 4
            AnimpostfxPlay("OJDominoBlur")
            Citizen.InvokeNative(0xCAB4DD2D5B2B7246, "OJDominoBlur", 0.1)
            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 0.4)
            ShakeGameplayCam("DRUNK_SHAKE", 0.4)
        end
    elseif tonumber(value) < 50 then
        Citizen.InvokeNative(0x406CCF555B04FAD3, PlayerPedId(), true, 0.5)
        if shake_cam_state ~= 5 then
            print(value.." < 50")
            shake_cam_state = 5
            AnimpostfxPlay("OJDominoBlur")
            Citizen.InvokeNative(0xCAB4DD2D5B2B7246, "OJDominoBlur", 0.2)
            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 0.5)
            ShakeGameplayCam("DRUNK_SHAKE", 0.5)
        end
    elseif tonumber(value) < 60 then
        Citizen.InvokeNative(0x406CCF555B04FAD3, PlayerPedId(), true, 0.6)
        if shake_cam_state ~= 6 then
            print(value.." < 60")
            shake_cam_state = 6
            AnimpostfxPlay("OJDominoBlur")
            Citizen.InvokeNative(0xCAB4DD2D5B2B7246, "OJDominoBlur", 0.3)
            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 0.6)
            ShakeGameplayCam("DRUNK_SHAKE", 0.6)
        end
    elseif tonumber(value) < 70 then
        Citizen.InvokeNative(0x406CCF555B04FAD3, PlayerPedId(), true, 0.7)
        if shake_cam_state ~= 7 then
            print(value.." < 70")
            shake_cam_state = 7
            AnimpostfxPlay("OJDominoBlur")
            Citizen.InvokeNative(0xCAB4DD2D5B2B7246, "OJDominoBlur", 0.4)
            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 0.7)
            ShakeGameplayCam("DRUNK_SHAKE", 0.7)
        end
    elseif tonumber(value) < 80 then
        Citizen.InvokeNative(0x406CCF555B04FAD3, PlayerPedId(), true, 0.8)
        if shake_cam_state ~= 8 then
            print(value.." < 80")
            shake_cam_state = 8
            AnimpostfxPlay("OJDominoBlur")
            Citizen.InvokeNative(0xCAB4DD2D5B2B7246, "OJDominoBlur", 0.5)
            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 0.8)
            ShakeGameplayCam("DRUNK_SHAKE", 0.8)
        end
        local random = math.random(0,100)
    elseif tonumber(value) < 90 then
        Citizen.InvokeNative(0x406CCF555B04FAD3, PlayerPedId(), true, 0.9)
        if shake_cam_state ~= 9 then
            print(value.." < 90")
            shake_cam_state = 9
            AnimpostfxPlay("OJDominoBlur")
            Citizen.InvokeNative(0xCAB4DD2D5B2B7246, "OJDominoBlur", 0.6)
            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 0.9)
            ShakeGameplayCam("DRUNK_SHAKE", 0.9)
        end
    elseif tonumber(value) <= 110 then
        Citizen.InvokeNative(0x406CCF555B04FAD3, PlayerPedId(), true, 1.0)
        if shake_cam_state ~= 10 then
            print(value.." < 100")
            shake_cam_state = 10
            AnimpostfxPlay("OJDominoBlur")
            Citizen.InvokeNative(0xCAB4DD2D5B2B7246, "OJDominoBlur", 0.6)
            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0)
            ShakeGameplayCam("DRUNK_SHAKE", 1.0)
        end
    end
end

function deleteObj(obj)
    if DoesEntityExist(obj) then
        SetEntityAsMissionEntity(obj, false, true)
        NetworkRequestControlOfEntity(obj)
        local timeout = 0
        while not NetworkHasControlOfEntity(obj) and timeout < 5000 do
            timeout = timeout+100
            if timeout == 5000 then
            end
            Wait(100)
        end
        if NetworkHasControlOfEntity(obj) then
        end
        FreezeEntityPosition(obj , false)
        DeleteEntity(obj)
    end
end

function playCustomAnim(dict,name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
	TaskPlayAnim(PlayerPedId(), dict, name, 1.0, 1.0, time, flag, 0, true, 0, false, 0, false)  
end
