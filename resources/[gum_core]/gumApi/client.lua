local entityEnumerator = {__gc = function(enum)      if enum.destructor and enum.handle then        enum.destructor(enum.handle)      end      enum.destructor = nil      enum.handle = nil end}
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

RegisterNetEvent('getApi')
AddEventHandler('getApi', function(cb)
	cb(gumApi)
end)

Citizen.CreateThread(function()
    while true do
        hit, coords, entity = RayCastGamePlayCamera(1000.0)
		if hit then
            gumApi.getTarget()
			if targetEnable == true then
				gumApi.drawMe(coords.x, coords.y, coords.z, "↓", 10.0)
			end
		end
        Citizen.Wait(5)
    end
end)


RegisterCommand("target", function(source, args, rawCommand)
	if targetEnable == false then
		targetEnable = true
	else
		targetEnable = false
	end
end)


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

function gumApi.getLastVehicle()
    return lastVehicle
end

-- https://github.com/femga/rdr3_discoveries/tree/master/Controls
-- Hold mode Hashes: SHORT_TIMED_EVENT_MP, SHORT_TIMED_EVENT, MEDIUM_TIMED_EVENT, LONG_TIMED_EVENT, RUSTLING_CALM_TIMING, PLAYER_FOCUS_TIMING, PLAYER_REACTION_TIMING
function gumApi.createPrompt(text, key, promptHash, holdMode)
	buttonPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
	PromptSetControlAction(buttonPrompt, key)
	PromptSetText(buttonPrompt, CreateVarString(10, 'LITERAL_STRING', text))
	PromptSetEnabled(buttonPrompt, true)
	PromptSetVisible(buttonPrompt, true)
	PromptSetStandardizedHoldMode(buttonPrompt, GetHashKey(holdMode))
	PromptSetGroup(buttonPrompt, promptHash)
	PromptRegisterEnd(buttonPrompt)
    buttons[text..promptHash] = buttonPrompt
end

function gumApi.getPrompt(promptHash, text)
	PromptSetActiveGroupThisFrame(promptHash, CreateVarString(10, 'LITERAL_STRING', ""..text..""))
end

function gumApi.notify(title, text, time, img)
	exports['gum_notify']:DisplayLeftNotification(title, text, img, time*1000)
end

function gumApi.getPromptButton(text, promptHash)
	local isComplete = false
	local button = buttons[text..promptHash]
	if Citizen.InvokeNative(0xE0F65F0640EF0617, buttons[text..promptHash]) then
		isComplete = true
	end
	return isComplete
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
	return EnumeratePeds()
end

function gumApi.getAllEntities()
	return EnumerateObjects()
end

function gumApi.getAllVehicles()
	return EnumerateVehicles()
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
	local timeout = 0
	if obj ~= nil then
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
	end
end

function spawnNPC(model, x, y, z, h, dist, scenario, spawnChecker)
	if allNPCChecker[spawnChecker] == nil then
		allNPCChecker[spawnChecker] = true
		local npcSpawn = model
		while not HasModelLoaded(GetHashKey(npcSpawn)) do
			Wait(0)
			modelRequest( GetHashKey(npcSpawn) )
		end
		local npcSpawnCode = CreatePed(GetHashKey(npcSpawn), x, y, z, h, false, false, 0, 0)
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

function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end
  
function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end
  
function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
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
	if obj ~= nil then
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

function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
      local iter, id = initFunc()
      if not id or id == 0 then
        disposeFunc(iter)
        return
      end
      
      local enum = {handle = iter, destructor = disposeFunc}
      setmetatable(enum, entityEnumerator)
      
      local next = true
      repeat
        coroutine.yield(id)
        next, id = moveFunc(iter)
      until not next
      
      enum.destructor, enum.handle = nil, nil
      disposeFunc(iter)
    end)
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
