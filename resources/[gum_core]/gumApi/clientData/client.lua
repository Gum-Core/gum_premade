local hit = 0
local coords = 0
local entity = 0
local gumApi = {}
local buttons = {}
local allNPCData = {}
local allNPCSpawned = {}
local allNPCChecker = {}
local allBlips = {}
local targetEnable = false
local notifyTable = {}
local send_value = nil
local answer_value = nil
local points = {}
local inPolyCreator = false
RegisterNetEvent('getApi')
AddEventHandler('getApi', function(cb)
	cb(gumApi)
end)

RegisterCommand("polyPoint", function(source, args, rawCommand)
    local playerPos = GetEntityCoords(PlayerPedId())
    if inPolyCreator == false then
		inPolyCreator = true
		table.insert(points, vector3(playerPos.x, playerPos.y, playerPos.z))
		print("New point added: " .. playerPos.x .. ", " .. playerPos.y .. ", " .. playerPos.z)
	else
		inPolyCreator = false
		print("All points cleared.")
		points = {}
	end
end, false)


Citizen.CreateThread(function()
    while true do
		local optimize = 70
        hit, coords, entity = RayCastGamePlayCamera(1000.0)
		if hit then
            gumApi.getTarget()
			if targetEnable == true then
				optimize = gumApi.fpsTimer()
				gumApi.drawMe(coords.x, coords.y, coords.z, "↓", 10.0)
			end
		end
		if #points ~= 0 then
			optimize = gumApi.fpsTimer()
			local coords = GetEntityCoords(PlayerPedId())
			gumApi.IsPlayerInsidePolygon(coords, points, true)
			if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x07B8BEAF) then
				table.insert(points, vector3(coords.x, coords.y, coords.z))
				SendNUIMessage({type = "copyPoly", status = bool, points = points})
			end
		end
        Citizen.Wait(optimize)
    end
end)

RegisterCommand("target", function(source, args, rawCommand)
	if targetEnable == false then
		targetEnable = true
	else
		targetEnable = false
	end
end)

function gumApi.getFolder()
	return Config.FolderWithIcons
end
function gumApi.drawMe(x, y, z, text, dist, marker)
	local playerCoords = GetEntityCoords(PlayerPedId())
	if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, x, y, z, true) < dist then
		local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
		local px,py,pz=table.unpack(GetGameplayCamCoord())  
		local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
		local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
		if onScreen then
			SetTextScale(0.30, 0.30)
			SetTextFontForCurrentCommand(1)
			SetTextColor(180, 180, 240, 205)
			SetTextCentre(1)
			DisplayText(str,_x,_y)
			local factor = (string.len(text)) / 225
			-- DrawSprite("feeds", "toast_bg", _x+0.01, _y+0.0125,0.0155+ factor, 0.03, 0.1, 1, 1, 1, 190, 0)
			if marker ~= nil then
				Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, x, y, z-1.0, 0, 0, 0, 0, 0, 0, 1.3, 1.3, 0.4, 255, 200, 122, 155, 0, 0, 2, 0, 0, 0, 0)
			end
		end
	end
end

function gumApi.playerNearCoords(x, y, z, dist, mark)
	local inCoords = false
	local playerCoords = GetEntityCoords(PlayerPedId())
	if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, x, y, z, true) < dist and GetEntityHealth(PlayerPedId()) ~= 0 and GetMount(PlayerPedId()) == 0 and GetVehiclePedIsUsing(PlayerPedId()) == 0 then
		inCoords = true
		if mark then
			Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, x, y, z-1.0, 0, 0, 0, 0, 0, 0, dist*2.0, dist*2.0, 0.4, 255, 200, 122, 155, 0, 0, 2, 0, 0, 0, 0)
		end
	end
	return inCoords
end

function gumApi.checkPlayersNearEntity(entity, distance)
    local isNearPlayer = false
    for k,v in pairs(getPlayers()) do
        local entityCoords = GetEntityCoords(entity)
        local playerCoords = GetEntityCoords(GetPlayerPed(v))
        if GetDistanceBetweenCoords(entityCoords.x, entityCoords.y, entityCoords.z, playerCoords.x, playerCoords.y, playerCoords.z, false) < distance then
            if PlayerPedId() ~= GetPlayerPed(v) then
                isNearPlayer = true
            end
        end
    end
    return isNearPlayer
end

function gumApi.groundCheck(x, y)
	local retval, whereGround = nil, nil
	for height = 1, 1000 do
		retval, whereGround = GetGroundZAndNormalFor_3dCoord(x, y, height+0.0)
		if retval then
			return whereGround
		end
	end
end

--   https://github.com/femga/rdr3_discoveries/tree/master/useful_info_from_rpfs/textures/blips
--   https://github.com/femga/rdr3_discoveries/tree/master/useful_info_from_rpfs/textures/blips_mp
function gumApi.createBlip(text, x, y, z, sprite)
	local blip = N_0x554d9d53f696d002(1664425300, x, y, z)
	SetBlipSprite(blip, sprite, 1)
	SetBlipScale(blip, 0.5)
	Citizen.InvokeNative(0x9CB1A1623062F402, blip, text)
	table.insert(allBlips, blip)
end
local lastVehicle = 0
function gumApi.createVehicle(model, x, y, z, h)
	local modelHash = GetHashKey(model)
	RequestModel(modelHash)
	while not Citizen.InvokeNative(0x1283B8B89DD5D1B6, modelHash, Citizen.ResultAsBoolean) do
		Wait(5)
	end
	local createdVehicle = Citizen.InvokeNative(0xAF35D0D2583051B0, modelHash, x,y,z,h, true, false, 0, 1)
	while not DoesEntityExist(entity2) do
		Citizen.Wait(5)
	end
	SetModelAsNoLongerNeeded(modelHash)
	SetEntityAsMissionEntity(createdVehicle, true, true)
	SetVehicleOnGroundProperly(createdVehicle)
	lastVehicle = createdVehicle
end

function gumApi.fpsTimer()
    local frameTime = GetFrameTime()
    local frame = 1.0 / frameTime

    local add = 1.0
    local fpsTable = {
        {upperLimit = 30, value = 15/2},
        {upperLimit = 40, value = 12.5/2},
        {upperLimit = 50, value = 10/2},
        {upperLimit = 60, value = 7.5/2},
        {upperLimit = 80, value = 5/2},
        {upperLimit = 100, value = 2.5/2},
        {upperLimit = math.huge, value = 0}
    }
    
    local tableSize = #fpsTable
    for i = 1, tableSize do
        local v = fpsTable[i]
        if frame < v.upperLimit then
            add = v.value
            break
        end
    end
    
    return add
end

function gumApi.getLastVehicle()
    return lastVehicle
end

-- https://github.com/femga/rdr3_discoveries/tree/master/Controls
-- Hold mode Hashes: SHORT_TIMED_EVENT_MP, SHORT_TIMED_EVENT, MEDIUM_TIMED_EVENT, LONG_TIMED_EVENT, RUSTLING_CALM_TIMING, PLAYER_FOCUS_TIMING, PLAYER_REACTION_TIMING
function gumApi.createPrompt(text, key, promptHash, holdMode)
	if buttons[text..promptHash] == nil then
		buttonPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(buttonPrompt, key)
		PromptSetText(buttonPrompt, CreateVarString(10, 'LITERAL_STRING', text))
		PromptSetEnabled(buttonPrompt, true)
		PromptSetVisible(buttonPrompt, true)
		if holdMode == false then
			PromptSetHoldMode(buttonPrompt, false)
		else
			PromptSetStandardizedHoldMode(buttonPrompt, GetHashKey(holdMode))
		end
		PromptSetGroup(buttonPrompt, promptHash)
		PromptRegisterEnd(buttonPrompt)
		buttons[text..promptHash] = buttonPrompt
	end
end

function gumApi.setPromptVisible(text, hash, state)
	if state then
		PromptSetVisible(buttons[text..hash], true)
	else
		PromptSetVisible(buttons[text..hash], false)
	end
end


function gumApi.getPrompt(promptHash, text)
	PromptSetActiveGroupThisFrame(promptHash, CreateVarString(10, 'LITERAL_STRING', ""..text..""))
end

function gumApi.getPromptButton(text, promptHash)
	local isComplete = false
	local button = buttons[text..promptHash]
	if Citizen.InvokeNative(0xE0F65F0640EF0617, buttons[text..promptHash]) then
		isComplete = true
		Citizen.InvokeNative(0xFC094EF26DD153FA, promptGroup)
		Citizen.InvokeNative(0xF1622CE88A1946FB)
	end
	return isComplete
end

function gumApi.setPromptEnable(text, hash, state)
	if state == true then
		Citizen.InvokeNative(0x8A0FB4D03A630D21, buttons[text..hash], true)
	else
		Citizen.InvokeNative(0x8A0FB4D03A630D21, buttons[text..hash], false)
	end
end
function gumApi.getPromptButtonData(text, promptHash)
	local isComplete = false
	local button = buttons[text..promptHash]
	return button
end

function gumApi.getTarget()
    return coords, entity
end

function gumApi.createPed(model,x,y,z,h,dist,scenario)
	local random = math.random(1,99999999999999)
	table.insert(allNPCData, {model=model, dist=dist, x=x, y=y, z=z, h=h, scenario=scenario, spawnChecker=random})
end

Citizen.CreateThread(function()
	while true do
		local playerCoords = GetEntityCoords(PlayerPedId())
		for a,b in pairs(allNPCData) do
			if gumApi.playerNearCoords(b.x, b.y, b.z, b.dist) then
				spawnNPC(b.model, b.x, b.y, b.z, b.h, b.dist, b.scenario, b.spawnChecker)
			end
		end
		for a,b in pairs(allNPCSpawned) do
			local npcCoords = GetEntityCoords(a)
			if not gumApi.playerNearCoords(npcCoords.x, npcCoords.y, npcCoords.z, b[1]) then
				deleteObj(a, b[2])
			end
		end

		Citizen.Wait(1000)
	end
end)

function gumApi.getAllPeds()
	return GetGamePool('CObject')
end

function gumApi.getAllEntities()
	return GetGamePool('CObject')
end

function gumApi.getAllVehicles()
	return GetGamePool('CPed')
end

function gumApi.getTime()
	return GetClockHours(), GetClockMinutes()
end


function gumApi.playAnim(entity, dict, name, flag, time)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(0)
	end
	TaskPlayAnim(entity, dict, name, 1.0, 1.0, time, flag, 0, true, 0, false, 0, false)  
end

function gumApi.deleteObj(obj)
	if obj and DoesEntityExist(obj) then
		SetEntityAsMissionEntity(obj, false, true)
		
		if NetworkGetEntityIsNetworked(obj) then
			NetworkRequestControlOfEntity(obj)
			
			local timeout = 0
			while not NetworkHasControlOfEntity(obj) do
				timeout = timeout + 1
				if timeout > 10 then
					break
				end
				Wait(100)
			end
		end
		
		if NetworkHasControlOfEntity(obj) or not NetworkGetEntityIsNetworked(obj) then
			DeleteEntity(obj)
		end
	end
end

function gumApi.deletePed(obj)
    if obj and DoesEntityExist(obj) then
		SetEntityAsMissionEntity(obj, false, true)
		
		if NetworkGetEntityIsNetworked(obj) then
			NetworkRequestControlOfEntity(obj)
			
			local timeout = 0
			while not NetworkHasControlOfEntity(obj) do
				timeout = timeout + 1
				if timeout > 10 then
					break
				end
				Wait(100)
			end
		end
		
		if NetworkHasControlOfEntity(obj) or not NetworkGetEntityIsNetworked(obj) then
			DeletePed(obj)
		end
    end
end

-- function gumApi.deleteObj(obj)
-- 	local timeout = 0
-- 	if obj ~= nil and obj ~= false then
-- 		SetEntityAsMissionEntity(obj, false, true)
-- 		NetworkRequestControlOfEntity(obj)
-- 		while not NetworkHasControlOfEntity(obj) do
-- 			timeout = timeout+1
-- 			if timeout > 10 then
-- 				break
-- 			end
-- 			if not DoesEntityExist(obj) then
-- 				break
-- 			end
-- 			Wait(100)
-- 		end
-- 		if NetworkHasControlOfEntity(obj) then
-- 		end
-- 		DeleteEntity(obj)
-- 	end
-- end
function spawnNPC(model, x, y, z, h, dist, scenario, spawnChecker)
	if allNPCChecker[spawnChecker] == nil then
		allNPCChecker[spawnChecker] = true
		local npcSpawn = model
		while not HasModelLoaded(GetHashKey(npcSpawn)) do
			Wait(0)
			modelRequest( GetHashKey(npcSpawn) )
		end
		npcSpawnCode = CreatePed(GetHashKey(npcSpawn), x, y, z, h, false, false, 0, 0)
		while not DoesEntityExist(npcSpawnCode) do
			Wait(0)
		end
		allNPCSpawned[npcSpawnCode] = {dist, spawnChecker}
		Citizen.InvokeNative(0x283978A15512B2FE, npcSpawnCode, true)
		SetPedAsGroupMember(npcSpawnCode, GetPedGroupIndex(PlayerPedId()))
		SetBlockingOfNonTemporaryEvents(npcSpawnCode,true)
		FreezeEntityPosition(npcSpawnCode, true)
		SetEntityInvincible(npcSpawnCode, true)
		TaskStandStill(npcSpawnCode, -1)
		SetEntityAsMissionEntity(npcSpawnCode, true, true)
		SetModelAsNoLongerNeeded(GetHashKey(npcSpawnCode))
		ClearPedEnvDirt(npcSpawnCode)
		ClearPedDamageDecalByZone(npcSpawnCode ,10 ,"ALL")
		ClearPedBloodDamage(npcSpawnCode)
		if scenario ~= nil then
			TaskStartScenarioInPlace(npcSpawnCode, GetHashKey(scenario), 0,1)
		end
	end
end

RegisterNetEvent('gum_notify:notify')
AddEventHandler('gum_notify:notify', function(title, subtext, icon, duration)
    show_notification(true, title, subtext, icon, duration)
end)

function gumApi.notify(title, text, img, time)
	TriggerEvent("gum_notify:notify", title, text, img, time)
end

function show_notification(bool, title_text, subtext_text, icon_text, duration)
    table.insert(notifyTable, {bool, title_text, subtext_text, icon_text, duration})
end

function delete_show_notification(bool)
    SendNUIMessage({type = "notify", status = bool, folder= Config.FolderWithIcons})
end


function gumApi.getAnswer(title, first, second, cb)
	local transfer_ans_value = nil
	SetNuiFocus(true, true);
	SendNUIMessage({type= "open_answer", status = true, title = title, first=first, second=second})
	while (answer_value == nil) do
		Citizen.Wait(0)
	end
	SendNUIMessage({type= "open_answer", status = false})
	SetNuiFocus(false, false);
	transfer_ans_value = answer_value;
	answer_value = nil
	cb(transfer_ans_value)
end

function gumApi.getInput(title, subtext, cb)
	local transfer_value = nil
	SetNuiFocus(true, true);
	SendNUIMessage({type= "open_inputs", status = true, title = subtext, subtext = title})
	while (send_value == nil) do
		Citizen.Wait(0)
	end
	SendNUIMessage({type= "open_inputs", status = false})
	SetNuiFocus(false, false);
	transfer_value = send_value;
	send_value = nil
	cb(transfer_value)
end

RegisterNUICallback('button_1', function(data, cb)
	send_value = "close"
end)

RegisterNUICallback('button_2', function(data, cb)
	send_value = data.text
end)

RegisterNUICallback('yes', function(data, cb)
	answer_value = true
end)
RegisterNUICallback('no', function(data, cb)
	answer_value = false
end)



Citizen.CreateThread(function()
    while true do
        for a,b in pairs(notifyTable) do
            SendNUIMessage({type = "notify",status = b[1],title = b[2],text = b[3],id = b[4], folder= Config.FolderWithIcons})
            Citizen.Wait(tonumber(b[5]))
            table.remove(notifyTable, a)
            delete_show_notification(false)
        end
        Citizen.Wait(200)
    end
end)

function gumApi.getLastPed()
    return npcSpawnCode
end

function modelRequest(model)
    Citizen.CreateThread(function()
        RequestModel(model)
    end)
end

function getPlayers()
	local players = {}
	for i = 0, 32 do
		if NetworkIsPlayerActive(i) then
			table.insert(players, i)
		end
	end
	return players
end
function gumApi.getPlayers()
	local players = {}
	for i = 0, 32 do
		if NetworkIsPlayerActive(i) then
            table.insert(players, GetPlayerServerId(i))
		end
	end
	return players
end


function RotationToDirection(rotation)
	local adjustedRotation = 
	{ 
		x = (math.pi / 180) * rotation.x, 
		y = (math.pi / 180) * rotation.y, 
		z = (math.pi / 180) * rotation.z 
	}
	local direction = 
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

function RayCastGamePlayCamera(distance)
	local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination = 
	{ 
		x = cameraCoord.x + direction.x * distance, 
		y = cameraCoord.y + direction.y * distance, 
		z = cameraCoord.z + direction.z * distance 
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, -1, 1))
	return b, c, e
end


function deleteObj(obj, check)
	local timeout = 0
	if obj ~= nil and obj ~= false then
		SetEntityAsMissionEntity(obj, false, true)
		NetworkRequestControlOfEntity(obj)
		while not NetworkHasControlOfEntity(obj) do
			timeout = timeout+1
			if timeout > 10 then
				break
			end
			if not DoesEntityExist(obj) then
				break
			end
			Wait(100)
		end
		if NetworkHasControlOfEntity(obj) then
		end
		DeleteEntity(obj)
		allNPCSpawned[obj] = nil
		allNPCChecker[check] = nil
	end
end

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
		for a,b in pairs(allNPCSpawned) do
			deleteObj(a, b[2])
		end
		for a,b in pairs(allBlips) do
			RemoveBlip(b)
		end
	end
end)


function gumApi.IsPlayerInsidePolygon(playerPos, polyPoints, debug, issmall)
    local oddNodes = false
    local x, y = playerPos.x, playerPos.y

    for i = 1, #polyPoints do
        if debug then
            local start = vector3(polyPoints[i].x, polyPoints[i].y, polyPoints[i].z + 4.5)
            local finish = vector3(polyPoints[i % #polyPoints + 1].x, polyPoints[i % #polyPoints + 1].y, polyPoints[i % #polyPoints + 1].z + 4.5)
            local label = tostring(i)
            gumApi.drawMe(polyPoints[i].x, polyPoints[i].y, polyPoints[i].z + 1.0, label, 4.0)
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, polyPoints[i].x, polyPoints[i].y, polyPoints[i].z - 1.0, 0, 0, 0, 0, 0, 0, 0.05, 0.05, 4.0, 255, 255, 255, 100, 0, 0, 2, 0, 0, 0, 0)
        end

        if issmall then
            local start = vector3(polyPoints[i].x, polyPoints[i].y, polyPoints[i].z + 0.2)
            local finish = vector3(polyPoints[i % #polyPoints + 1].x, polyPoints[i % #polyPoints + 1].y, polyPoints[i % #polyPoints + 1].z + 0.2)
            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, polyPoints[i].x, polyPoints[i].y, polyPoints[i].z - 1.0, 0, 0, 0, 0, 0, 0, 0.01, 0.01, 4.0, 255, 255, 255, 100, 0, 0, 2, 0, 0, 0, 0)
        end

      	local j = i % #polyPoints + 1
        if ((polyPoints[i].y <= y and polyPoints[j].y > y) or (polyPoints[j].y <= y and polyPoints[i].y > y)) then
            if (polyPoints[i].x + (y - polyPoints[i].y) / (polyPoints[j].y - polyPoints[i].y) * (polyPoints[j].x - polyPoints[i].x) < x) then
                oddNodes = not oddNodes
            end
        end
    end

    return oddNodes
end





function gumApi.calculatePolygonLength(polyPoints)
    local length = 0.0
    local prevPoint = polyPoints[#polyPoints]
    for _, point in ipairs(polyPoints) do
        length = length + #(point - prevPoint)
        prevPoint = point
    end
	return string.format("%.2f", length)
end

function DrawLine(x, y, z, _x, _y, _z, r, g, b, a)
	Citizen.InvokeNative(`DRAW_LINE` & 0xFFFFFFFF, x, y, z, _x, _y, _z, r, g, b, a)
end


----CORE LOAD

RegisterNetEvent("gum:SelectedCharacter")
AddEventHandler("gum:SelectedCharacter", function(charid)
    Citizen.Wait(2000)
    TriggerServerEvent("gumApi:checkLogin")
end)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
    Citizen.Wait(2000)
    TriggerServerEvent("gumApi:checkLogin")
end)

RegisterNetEvent('RSGCore:Client:OnPlayerLoaded', function()
	Citizen.Wait(2000)
	TriggerServerEvent("gumApi:checkLogin")
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	Citizen.Wait(2000)
	TriggerServerEvent("gumApi:checkLogin")
end)
