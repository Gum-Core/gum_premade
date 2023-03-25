local noClip = false
local cam = nil
local angleY = 0.0
local angleZ = 0.0
local spectateId = 0
local attachSpectate = false

RegisterNetEvent("gum_adminmenu_nui:open")
AddEventHandler("gum_adminmenu_nui:open", function(myGroup, itemTable, playerTable, reportTable)
    SetNuiFocus(true, true)
    SendNUIMessage({type="openAdm",status=true,admin=myGroup,item=itemTable,player=playerTable,report=reportTable,perms=Config.Permissions})
end)
RegisterNetEvent("gum_adminmenu_nui:tepOnPlayer")
AddEventHandler("gum_adminmenu_nui:tepOnPlayer", function(coords)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z) 
end)
RegisterNetEvent("gum_adminmenu_nui:bring")
AddEventHandler("gum_adminmenu_nui:bring", function(coords)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z) 
end)
RegisterNetEvent("gum_adminmenu_nui:printMe")
AddEventHandler("gum_adminmenu_nui:printMe", function(id, tit, text)
    print('^8!!REPORT ID : '..id..' !!^0')
	print("^2Title - ^5"..tit.."^0")
	print("^2Text - ^5"..text.."^0")
    TriggerEvent('chat:addMessage', {color = { 239, 1, 1 },multiline = true,args = { "Report from ID "..id.." *"}})
    TriggerEvent('chat:addMessage', {color = { 1, 239, 215 },multiline = true,args = { ""..tit.." : Title"}})
end)
RegisterCommand("cc", function()
    local coords = GetEntityCoords(PlayerPedId())
    SendNUIMessage({type="cc",x=coords.x,y=coords.y,z=coords.z})
end)
RegisterCommand("cch", function()
    local coords = GetEntityCoords(PlayerPedId())
    SendNUIMessage({type="cch",x=coords.x,y=coords.y,z=coords.z-1.0,h=GetEntityHeading(PlayerPedId())})
end)

RegisterNetEvent("gum_adminmenu_nui:spectate")
AddEventHandler("gum_adminmenu_nui:spectate", function(id)
    if attachSpectate == false then
        SetEntityVisible(PlayerPedId(), false)
        SetPlayerInvincible(PlayerPedId(), true)
        FreezeEntityPosition(PlayerPedId(), true)
        Citizen.Wait(100)
        lastlocation = GetEntityCoords(PlayerPedId())
        for k,v in pairs(getPlayers()) do
            if tonumber(v[1]) == tonumber(id) then
                AttachEntityToEntity(PlayerPedId(), GetPlayerPed(v[2]), 0, 0.0, 0.0, -2.7, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
            end
        end
        attachSpectate = true
    else
        attachSpectate = false
        DetachEntity(PlayerPedId(), 1, 1)
        SetEntityCoords(PlayerPedId(), lastlocation)
        Citizen.Wait(100)
        SetEntityVisible(PlayerPedId(), true)
        SetPlayerInvincible(PlayerPedId(), false)
        FreezeEntityPosition(PlayerPedId(), false)
    end
end)
RegisterNetEvent("gum_adminmenu_nui:spectateOS")
AddEventHandler("gum_adminmenu_nui:spectateOS", function(id, coords)
    if attachSpectate == false then
        SetEntityVisible(PlayerPedId(), false)
        SetPlayerInvincible(PlayerPedId(), true)
        FreezeEntityPosition(PlayerPedId(), true)
        Citizen.Wait(100)
        lastlocation = GetEntityCoords(PlayerPedId())
        Citizen.Wait(50)
        local mathX = math.random(-5,5)
        local mathY = math.random(-5,5)
        local mathZ = math.random(-3,3)
        SetEntityCoords(PlayerPedId(), coords.x+mathX, coords.y+mathY, coords.z+mathZ)
        Citizen.Wait(1000)
        for k,v in pairs(getPlayers()) do
            if tonumber(v[1]) == tonumber(id) then
                if Citizen.InvokeNative(0xCDD36C9E5C469070, coords.x, coords.y, coords.z) ~= false then
                    AttachEntityToEntity(PlayerPedId(), GetPlayerPed(v[2]), 0, 0.0, 0.0, -1.7, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                    StartDeathCam(v[2])
                    spectateId = v[2]
                    attachSpectate = true
                else
                    AttachEntityToEntity(PlayerPedId(), GetPlayerPed(v[2]), 0, 0.0, 0.0, -2.7, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                    spectateId = v[2]
                    StartDeathCam(v[2])
                    attachSpectate = true
                end
            end
        end
    else
        spectateId = 0
        attachSpectate = false
        EndDeathCam()
        DetachEntity(PlayerPedId(), 1, 1)
        SetEntityCoords(PlayerPedId(), lastlocation)
        Citizen.Wait(100)
        SetEntityVisible(PlayerPedId(), true)
        SetPlayerInvincible(PlayerPedId(), false)
        FreezeEntityPosition(PlayerPedId(), false)
    end
end)

RegisterNUICallback('makeIt', function(data, cb)
	local action = tonumber(data.type)
    if action == 1 then
        if noclip == true then
            SetEntityVisible(PlayerPedId(), true)
            SetPlayerInvincible(PlayerPedId(), false)
            FreezeEntityPosition(PlayerPedId(), false)
            noclip = false
        else
            SetEntityVisible(PlayerPedId(), false)
            SetPlayerInvincible(PlayerPedId(), true)
            FreezeEntityPosition(PlayerPedId(), true)
            noclip = true
        end
    elseif action == 2 then
        local pCoords = GetEntityCoords(PlayerPedId())
        lastlocation = pCoords
        local wayPoint = GetWaypointCoords()
        if (wayPoint.x == 0 and wayPoint.y == 0) then
        else
            local height = 1
            for height = 1, 500 do
                SetEntityCoords(PlayerPedId(), wayPoint.x, wayPoint.y, height*3 + 0.0)
                local foundground, groundZ, normal = GetGroundZAndNormalFor_3dCoord(wayPoint.x, wayPoint.y, height*3 + 0.0)
                if foundground then
                    SetEntityCoords(PlayerPedId(), wayPoint.x, wayPoint.y, height*3 + 0.0)
                    break
                end
                Wait(0)
            end
        end
    elseif action == 3 then
        TriggerEvent("guminputs:getInput", "Accept", "Coord X", function(xCd)
            local x = xCd
            if x ~= 'close' then
                TriggerEvent("guminputs:getInput", "Accept", "Coord Y", function(yCd)
                    local y = yCd
                    if y ~= 'close' then
                        local pCoords = GetEntityCoords(PlayerPedId())
                        lastlocation = pCoords
                        if (x ~= 0 and y ~= 0) then
                            local height = 1
                            for height = 1, 500 do
                                SetEntityCoords(PlayerPedId(), tonumber(x), tonumber(y), height*2+0.0)
                                local foundground, groundZ, normal = GetGroundZAndNormalFor_3dCoord(tonumber(x), tonumber(y), height*2 + 0.0)
                                if foundground then
                                    SetEntityCoords(PlayerPedId(), tonumber(x), tonumber(y), height*2 + 0.0)
                                    break
                                end
                                Wait(0)
                            end
                        end
                    end
                    return false
                end)
            end
            return false
        end)
    elseif action == 4 then
        if lastlocation ~= nil then
            SetEntityCoords(PlayerPedId(), lastlocation)
        end
    elseif action == 7 then
        TriggerEvent("guminputs:getInput", "Accept", "Player ID", function(id)
            local id = id
            if id ~= 'close' then
                TriggerEvent("guminputs:getInput", "Accept", "Item ID", function(item)
                    local item = item
                    if item ~= 'close' then
                        TriggerEvent("guminputs:getInput", "Accept", "Count ID", function(count)
                            local count = count
                            if count ~= 'close' then
                                ExecuteCommand("giveitem "..id.." "..item.." "..count.."")
                            end
                        end)
                    end
                end)
            end
        end)
    elseif action == 8 then
        TriggerEvent("guminputs:getInput", "Accept", "Player ID", function(id)
            local id = id
            if id ~= 'close' then
                TriggerEvent("guminputs:getInput", "Accept", "Weapon hash", function(weaponHash)
                    local weaponHash = weaponHash
                    if weaponHash ~= 'close' then
                        TriggerServerEvent("gum_adminmenu_nui:giveWeaponId", id, weaponHash)
                    end
                end)
            end
        end)
    elseif action == 9 then
        TriggerEvent("guminputs:getInput", "Accept", "Player ID", function(id)
            local id = id
            if id ~= 'close' then
                TriggerEvent("guminputs:getInput", "Accept", "Count $", function(countDolar)
                    local countDolar = countDolar
                    if countDolar ~= 'close' then
                        ExecuteCommand("givemoney "..id.." 0 "..countDolar.."")
                    end
                end)
            end
        end)
    elseif action == 10 then
        TriggerEvent("guminputs:getInput", "Accept", "Player ID", function(id)
            local id = id
            if id ~= 'close' then
                TriggerEvent("guminputs:getInput", "Accept", "Count G", function(countGold)
                    local countGold = countGold
                    if countGold ~= 'close' then
                        ExecuteCommand("givegold "..id.." 1 "..countGold.."")
                    end
                end)
            end
        end)
    elseif action == 12 then
        TriggerEvent("guminputs:getInput", "Accept", "Ped model", function(hex)
            local hex = hex
            if hex ~= 'close' then
                SetMonModel(hex)
            end
        end)
    elseif action == 13 then
        TriggerEvent("guminputs:getInput", "Accept", "Hex without steam:", function(hex)
            local hex = hex
            if hex ~= 'close' then
                ExecuteCommand("addwl "..hex.."")
            end
        end)
    elseif action == 14 then
        TriggerEvent("guminputs:getInput", "Accept", "Hex without steam:", function(hex)
            local hex = hex
            if hex ~= 'close' then
                TriggerEvent("guminputs:getInput", "Accept", "Count char", function(count)
                    local count = count
                    if count ~= 'close' then
                        ExecuteCommand("setchar "..hex.." "..count.."")
                    end
                end)
            end
        end)
    elseif action == 15 then
        TriggerEvent("guminputs:getInput", "Accept", "Player ID", function(id)
            local id = id
            if id ~= 'close' then
                TriggerEvent("guminputs:getInput", "Accept", "Group", function(group)
                    local group = group
                    if group ~= 'close' then
                        ExecuteCommand("setgroup "..id.." "..group.."")
                    end
                end)
            end
        end)
    elseif action == 16 then
        TriggerEvent("guminputs:getInput", "Accept", "Player ID", function(id)
            local id = id
            if id ~= 'close' then
                TriggerEvent("guminputs:getInput", "Accept", "Job", function(job)
                    local job = job
                    if job ~= 'close' then
                        ExecuteCommand("setjob "..id.." "..job.."")
                    end
                end)
            end
        end)
    elseif action == 17 then
        TriggerEvent("guminputs:getInput", "Accept", "Player ID", function(cb)
            local id = tonumber(cb)
            if id ~= nil and id ~= 'close' then
                TriggerEvent("guminputs:getInput", "Accept", "Reason kick", function(cb)
                    local kickReason = tostring(cb)
                    if kickReason ~= nil and kickReason ~= 'close' then
                        TriggerServerEvent("gum_adminmenu_nui:kickFromServer", id, kickReason)
                    end
                    return  false
                end)
            end
        end)
    elseif action == 18 then
        TriggerEvent("guminputs:getInput", "Accept", "Player ID", function(cb)
            local id = tonumber(cb)
            if id ~= nil and id ~= 'close' then
                TriggerEvent("guminputs:getInput", "Accept", "Reason ban", function(cb)
                    local banReason = tostring(cb)
                    if banReason ~= nil and banReason ~= 'close' then
                        TriggerEvent("guminputs:getInput", "Accept", "Format date : 2021-08-16 10:00:00", function(cb)
                            local dateBan = tostring(cb)
                            if dateBan ~= nil and dateBan ~= 'close' then
                                TriggerServerEvent("gum_adminmenu_nui:banOnServer", id, banReason, dateBan)
                            end
                        end)
                    end
                    return  false
                end)
            end
        end)
    elseif action == 19 then
        TriggerEvent("guminputs:getInput", "Accept", "Char ID", function(id)
            local id = id
            if id ~= 'close' then
                ExecuteCommand("delchar "..id.."")
            end
        end)
    elseif action == 20 then
        TriggerEvent("guminputs:getInput", "Accept", "Player ID", function(id)
            local id = id
            if id ~= 'close' then
                if Config.OneSync == false then
                    lastlocation = GetEntityCoords(PlayerPedId())
                    for k,v in pairs(getPlayers()) do
                        if tonumber(id) == v[1] then
                             SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(v[2])))
                        end
                    end
                else
                    lastlocation = GetEntityCoords(PlayerPedId())
                    TriggerServerEvent("gum_adminmenu_nui:tepOnPlayer", id)
                end
            end
        end)
    elseif action == 21 then
        TriggerEvent("guminputs:getInput", "Accept", "Player ID", function(id)
            local id = id
            if id ~= 'close' then
                TriggerServerEvent("gum_adminmenu_nui:bringMe", id, GetEntityCoords(PlayerPedId()))
            end
        end)
    elseif action == 24 then
        if attachSpectate == false then
            TriggerEvent("guminputs:getInput", "Accept", "Player ID", function(id)
                local id = id
                if id ~= 'close' then
                    ExecuteCommand("spectate "..id.."")
                end
            end)
        else
            ExecuteCommand("spectate "..spectateId.."")
        end
    end
end)

RegisterNetEvent("gum_adminmenu_nui:noClip")
AddEventHandler("gum_adminmenu_nui:noClip", function()
    if noclip == true then
        SetEntityVisible(PlayerPedId(), true)
        SetPlayerInvincible(PlayerPedId(), false)
        FreezeEntityPosition(PlayerPedId(), false)
        noclip = false
    else
        SetEntityVisible(PlayerPedId(), false)
        SetPlayerInvincible(PlayerPedId(), true)
        FreezeEntityPosition(PlayerPedId(), true)
        noclip = true
    end
end)

RegisterNetEvent("gum_adminmenu_nui:tpw")
AddEventHandler("gum_adminmenu_nui:tpw", function()
    local pCoords = GetEntityCoords(PlayerPedId())
    lastlocation = pCoords
    local wayPoint = GetWaypointCoords()
    if (wayPoint.x == 0 and wayPoint.y == 0) then
    else
        local height = 1
        for height = 1, 500 do
            SetEntityCoords(PlayerPedId(), wayPoint.x, wayPoint.y, height*3 + 0.0)
            local foundground, groundZ, normal = GetGroundZAndNormalFor_3dCoord(wayPoint.x, wayPoint.y, height*3 + 0.0)
            if foundground then
                SetEntityCoords(PlayerPedId(), wayPoint.x, wayPoint.y, height*3 + 0.0)
                break
            end
            Wait(0)
        end
    end
end)

RegisterNetEvent("gum_adminmenu_nui:tpc")
AddEventHandler("gum_adminmenu_nui:tpc", function(x,y,z)
    local pCoords = GetEntityCoords(PlayerPedId())
    lastlocation = pCoords
    if (x ~= 0 and y ~= 0) then
        local height = 1
        for height = 1, 500 do
            SetEntityCoords(PlayerPedId(), tonumber(x), tonumber(y), height*2+0.0)
            local foundground, groundZ, normal = GetGroundZAndNormalFor_3dCoord(tonumber(x), tonumber(y), height*2 + 0.0)
            if foundground then
                SetEntityCoords(PlayerPedId(), tonumber(x), tonumber(y), height*2 + 0.0)
                break
            end
            Wait(0)
        end
    end
end)


RegisterNetEvent("gum_adminmenu_nui:ped")
AddEventHandler("gum_adminmenu_nui:ped", function(hash)
    SetMonModel(hash)
end)
RegisterNetEvent("gum_adminmenu_nui:tpb")
AddEventHandler("gum_adminmenu_nui:tpb", function()
    if lastlocation ~= nil then
        SetEntityCoords(PlayerPedId(), lastlocation)
    end
end)

RegisterNetEvent("gum_adminmenu_nui:kick")
AddEventHandler("gum_adminmenu_nui:kick", function(id, reason)
    TriggerServerEvent("gum_adminmenu_nui:kickFromServer", id, reason)
end)
RegisterNetEvent("gum_adminmenu_nui:tpp")
AddEventHandler("gum_adminmenu_nui:tpp", function(tpp)
    lastlocation = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("gum_adminmenu_nui:tepOnPlayer", tpp)
end)
RegisterNetEvent("gum_adminmenu_nui:tppwo")
AddEventHandler("gum_adminmenu_nui:tppwo", function(players, coords)
    lastlocation = GetEntityCoords(PlayerPedId())
    SetEntityCoords(PlayerPedId(), coords)
 end)
RegisterNetEvent("gum_adminmenu_nui:bring")
AddEventHandler("gum_adminmenu_nui:bring", function(second)
    for k,v in pairs(getPlayers()) do
        if second == v[1] then
            SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(v[2])))
        end
    end
end)
RegisterNetEvent("gum_adminmenu_nui:bringOW")
AddEventHandler("gum_adminmenu_nui:bringOW", function(coords)
    SetEntityCoords(PlayerPedId(), coords)
end)


function SetMonModel(name)
	local model = GetHashKey(name)
	local player = PlayerId()
	
	if not IsModelValid(model) then return end
	PerformRequest(model)
	
	if HasModelLoaded(model) then
		Citizen.InvokeNative(0xED40380076A31506, player, model, false)
		Citizen.InvokeNative(0x283978A15512B2FE, PlayerPedId(), true)
		SetModelAsNoLongerNeeded(model)
	end
end

function PerformRequest(hash)
    RequestModel(hash, 0)
    local bacon = 1
    while not Citizen.InvokeNative(0x1283B8B89DD5D1B6, hash) do
        Citizen.InvokeNative(0xFA28FE3A6246FC30, hash, 0)
        bacon = bacon + 1
        Citizen.Wait(50)
        if bacon >= 100 then break end
    end
end
RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
end)
RegisterNUICallback('giveItem', function(data, cb)
    TriggerServerEvent("gum_adminmenu_nui:giveItem", data.item)
end)
local speed = 0
Citizen.CreateThread(function()
    while true do
        local optimize = 200
        if attachSpectate then
            optimize = 5
            ProcessCamControls(spectateId)
        end
        if noclip == true then
            optimize = 5
            local minSpeed = 0.1
            local maxSpeed = 10.0

            SetEntityVisible(PlayerPedId(), false)
            DisableAllControlActions(0)
            EnableControlAction(0, 0x4A903C11)
            EnableControlAction(0, 0x9720fcee)
            EnableControlAction(0, 0xA987235F) 
            EnableControlAction(0, 0xD2047988)
            EnableControlAction(0, 0x3D99EEC6)
            EnableControlAction(0, 0xBFF476F9)
            EnableControlAction(0, 0xCF8A4ECA)
            EnableControlAction(0, 0x4AF4D473)
            DisableFirstPersonCamThisFrame()
            local entity = noClipTarget()
            FreezeEntityPosition(entity, true)
            local x, y, z = table.unpack(GetEntityCoords(entity))
            local h = toHeading(entity, GetEntityHeading(entity))
            if speed > maxSpeed then
                setSpeed(maxSpeed)
            end
            if speed < minSpeed then
                setSpeed(minSpeed)
            end
            if Citizen.InvokeNative(0xE2587F8CBBD87B1D, 0, `INPUT_PREV_WEAPON`) then
                setSpeed(speed+0.1)
            end
            if Citizen.InvokeNative(0xE2587F8CBBD87B1D, 0, `INPUT_NEXT_WEAPON`) then
                setSpeed(speed-0.1)
            end
            if Citizen.InvokeNative(0xE2587F8CBBD87B1D, 0, `INPUT_JUMP`) then
                z = z + speed
            end
            if Citizen.InvokeNative(0xE2587F8CBBD87B1D, 0, `INPUT_SPRINT`) then
                z = z - speed
            end
            local r = -h * math.pi / 180
            local dx = speed * math.sin(r)
            local dy = speed * math.cos(r)

            -- Move forward/backward
            if Citizen.InvokeNative(0xE2587F8CBBD87B1D, 0, `INPUT_MOVE_UP_ONLY`) then
                x = x + dx
                y = y + dy
            end
            if Citizen.InvokeNative(0xE2587F8CBBD87B1D, 0, `INPUT_MOVE_DOWN_ONLY`) then
                x = x - dx
                y = y - dy
            end
            local rot = GetGameplayCamRot(2)
            h = rot.z
            SetEntityCoordsNoOffset(entity, x, y, z)
            SetEntityHeading(entity, toHeading(entity, h))
        end
        Citizen.Wait(optimize)
    end
end)

function setSpeed(value)
	speed = value
	SetResourceKvp('speed', tostring(Speed))
end

function noClipTarget()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)
	local mnt = GetMount(ped)
	return (veh == 0 and (mnt == 0 and ped or mnt) or veh)
end

function toHeading(entity, h)
	if GetEntityType(entity) == 1 then
		return (h + 180) % 360
	else
		return h
	end
end

function getPlayers()
	local players = {}
	for i = 0, 256 do
		if NetworkIsPlayerActive(i) then
            table.insert(players, {GetPlayerServerId(i), i})
		end
	end
	return players
end




function StartDeathCam(v)
    ClearFocus()
    local playerPed = GetPlayerPed(v)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", GetEntityCoords(playerPed), 0, 0, 0, GetGameplayCamFov())
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1000, true, false)
end

function EndDeathCam()
    ClearFocus()
    RenderScriptCams(false, false, 0, true, false)
    DestroyCam(cam, false)
    cam = nil
end

function ProcessCamControls(v)
    local coords = GetEntityCoords(GetPlayerPed(v))
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z-10)
    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityVisible(PlayerPedId(), false)
    local playerCoords = GetEntityCoords(GetPlayerPed(v))
    DisableFirstPersonCamThisFrame()
    local newPos = ProcessNewPosition(v)
    SetCamCoord(cam, newPos.x, newPos.y, newPos.z)
    PointCamAtCoord(cam, playerCoords.x, playerCoords.y, playerCoords.z + 0.5)
end

function ProcessNewPosition(v)
    local mouseX = 0.0
    local mouseY = 0.0
    if (IsInputDisabled(0)) then
        mouseX = GetDisabledControlNormal(1, 0x4D8FB4C1) * 3.0
        mouseY = GetDisabledControlNormal(1, 0xFDA83190) * 3.0
    else
        mouseX = GetDisabledControlNormal(1, 0x4D8FB4C1) * 1.5
        mouseY = GetDisabledControlNormal(1, 0xFDA83190) * 1.5
    end
    angleZ = angleZ - mouseX
    angleY = angleY + mouseY

    if (angleY > 89.0) then angleY = 89.0 elseif (angleY < -89.0) then angleY = -89.0 end
    local pCoords = GetEntityCoords(GetPlayerPed(v))
    local behindCam = {
        x = pCoords.x + ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * (3.0 + 0.5),
        y = pCoords.y + ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * (3.0 + 0.5),
        z = pCoords.z + ((Sin(angleY))) * (3.0 + 0.5)
    }
    local a, hitBool, hitCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)

    local maxRadius = 3.0
    if (hitBool and Vdist(pCoords.x, pCoords.y, pCoords.z + 0.5, hitCoords) < 3.0 + 0.5) then
        maxRadius = Vdist(pCoords.x, pCoords.y, pCoords.z + 0.5, hitCoords)
    end

    local offset = {
        x = ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * maxRadius,
        y = ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * maxRadius,
        z = ((Sin(angleY))) * maxRadius
    }

    local pos = {
        x = pCoords.x + offset.x,
        y = pCoords.y + offset.y,
        z = pCoords.z + offset.z
    }

    return pos
end

function CancelCamera()
    RenderScriptCams(true, false, 1, true, true)
    DestroyCam(camera, true)
    DestroyAllCams()
    spectating = false
    Citizen.Wait(100)
    SetEntityCoords(PlayerPedId(), lastlocation.x, lastlocation.y, lastlocation.z)
    SetEntityVisible(PlayerPedId(), true)
    SetEntityInvincible(PlayerPedId(), false)
    FreezeEntityPosition(PlayerPedId(), false)
end


