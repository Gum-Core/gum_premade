local time = 7000
local chatMessage = true
local stav_state = false
local displaying = false
local displaying_2 = false
local displaying_3 = false
local stavInfo = {}
local meTable = {}
local doTable = {}
local prevtime = GetGameTimer();
local prevframes = GetFrameCount();
local fps = -1;

RegisterNetEvent('3dme:getState')
AddEventHandler('3dme:getState', function(stav)
	stavInfo = stav
end)

RegisterCommand('me', function(source, args)
	local text = ' '
	for i = 1,#args do
		text = text .. ' ' .. args[i]
	end
	text = text .. ' '
	TriggerServerEvent('3dme:shareDisplay', text)

end)

Citizen.CreateThread(function()
	TriggerServerEvent('3dme:getState')
end)

RegisterCommand('do', function(source, args)
	local text = ' '
	for i = 1,#args do
		text = text .. ' ' .. args[i]
	end
	text = text .. ' '
	TriggerServerEvent('3ddo:shareDisplay', text)
end)

RegisterCommand("try", function(source, args, rawCommand)
	AnoNe(args)
end)
function AnoNe(args)
	local anonene = 6
	if args[1] ~= nil and tonumber(args[1]) then
		anonene = tonumber(args[1])
	end
	local number_1 = math.random(1, 2)
	if number_1 == 1 then
		TriggerServerEvent('3ddo:shareDisplay', " | TRY : Ano")
	elseif anonene == 2 then
		TriggerServerEvent('3ddo:shareDisplay', " | TRY : Ne")
	else
		TriggerServerEvent('3ddo:shareDisplay', " | TRY : Ne")
	end
end

RegisterCommand('stav', function(source, args)
	local text = ' - '
	for i = 1,#args do
		text = text .. ' ' .. args[i]
	end
	text = text .. ' '
	if text ~= nil and args[1] ~= nil then
		TriggerServerEvent('3dstav:shareDisplay', text)
	else
		TriggerServerEvent('3dstav:stateDisable', text)
	end
end)

RegisterNetEvent('3dme:triggerDisplay')
AddEventHandler('3dme:triggerDisplay', function(text, source)
	table.insert(meTable, {GetPlayerFromServerId(source), text, 100})
end)

RegisterNetEvent('3ddo:triggerDisplay')
AddEventHandler('3ddo:triggerDisplay', function(text, source)
	table.insert(doTable, {GetPlayerFromServerId(source), text, 100})
end)

RegisterNetEvent('3ddoc:triggerDisplay')
AddEventHandler('3ddoc:triggerDisplay', function(text, source)
	table.insert(doTable, {GetPlayerFromServerId(source), text, 10})
end)

RegisterNetEvent('3dstav:triggerDisplay')
AddEventHandler('3dstav:triggerDisplay', function(stav, source)
	stavInfo = stav
end)
local chatMessage = {}
Citizen.CreateThread(function()
	while true do
		local coordsMe = GetEntityCoords(PlayerPedId(), false)
		for k,v in pairs(stavInfo) do
			if v ~= nil then
				local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(k)), false)
				local dist = Vdist2(coordsMe, coords)
				if dist < 60 then
					if GetMount(GetPlayerPed(GetPlayerFromServerId(k))) ~= 0 then
						DrawText3D_stav(coords['x'], coords['y'], coords['z']+2.2, v)
					else
						DrawText3D_stav(coords['x'], coords['y'], coords['z']+1.4, v)
					end
				end
			end
		end
		for a,b in pairs(meTable) do
			local coords = GetEntityCoords(GetPlayerPed(b[1]))
			local dist = GetDistanceBetweenCoords(coordsMe.x,coordsMe.y,coordsMe.z, coords.x,coords.y,coords.z, 1)
			if dist < 10 then
				if chatMessage["me"..b[2]..""..b[1]..""] == nil then
					chatMessage["me"..b[2]..""..b[1]..""] = true
					TriggerEvent('chat:addMessage', {color = { 14, 140, 236 },multiline = true,args = {"^4[ME] ", b[2]}})
				end
			end
			if b[3] < 0 then
				chatMessage["me"..b[2]..""..b[1]..""] = nil
				table.remove(meTable, a)
			else
				b[3] = b[3] - fpsToTick(fps)/2
			end
			if dist < 30 then
				DrawText3D(coords.x, coords.y, coords.z+1.0, b[2])
			end
		end
		for a,b in pairs(doTable) do
			local coords = GetEntityCoords(GetPlayerPed(b[1]))
			local dist = GetDistanceBetweenCoords(coordsMe.x,coordsMe.y,coordsMe.z, coords.x,coords.y,coords.z, 1)
			if dist < 10 then
				if chatMessage["do"..b[2]..""..b[1]..""] == nil then
					chatMessage["do"..b[2]..""..b[1]..""] = true
					TriggerEvent('chat:addMessage', {color = { 169, 14, 138 },multiline = true,args = {"^9[DO] ", b[2]}})
				end
			end
			if b[3] < 0 then
				chatMessage["do"..b[2]..""..b[1]..""] = nil
				table.remove(doTable, a)
			else
				b[3] = b[3] - fpsToTick(fps)/2
			end
			if dist < 30 then
				DrawText3D_do(coords.x, coords.y, coords.z+1.2, b[2])
			end
		end
		Citizen.Wait(5)
	end
end)
CreateThread(function();
    while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do;
        Wait(250);
        prevframes = GetFrameCount();
        prevtime = GetGameTimer();        
    end;
    while true do;
        curtime = GetGameTimer();
        curframes = GetFrameCount();
        if ((curtime - prevtime) > 1000) then;
            fps = (curframes - prevframes) - 1;				
            prevtime = curtime;
            prevframes = curframes;
        end;
        if IsGameplayCamRendering() and fps >= 0 then;
            fpsToTick(fps)
        end;
        Wait(1000);
    end;
end);

function fpsToTick(frame)
    local add = 0
    if frame < 20 then
        add = 3
    elseif frame < 30 then
        add = 2
    elseif frame < 40 then
        add = 1.5
    elseif frame < 50 then
        add = 1.20
    elseif frame < 60 then
        add = 1
    elseif frame < 70 then
        add = 0.858
    elseif frame < 80 then
        add = 0.75
    elseif frame < 90 then
        add = 0.6667
    elseif frame < 100 then
        add = 0.6
    elseif frame < 110 then
        add = 0.546
    elseif frame < 120 then
        add = 0.5
    elseif frame < 130 then
        add = 0.4
    elseif frame > 131 then
        add = 0.3
    end
    return add
end


RegisterCommand("doc", function(source, args, rawCommand)
	if args[1] == nil then
		return false
	end
	for i=1, tonumber(args[1]) do
		TriggerServerEvent('3ddoc:shareDisplay', ""..i.."/"..args[1].."")
		Citizen.Wait(1000)
	end
end)

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoord())  
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local scale = (2/dist)*1.1
		
	local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
	local fov = (2/GetGameplayCamFov())*100
    local scale = scale*fov
	if onScreen then
		SetTextScale(0.18*scale, 0.18*scale)
		SetTextFontForCurrentCommand(1)
		SetTextColor(180, 180, 240, 205)
		SetTextCentre(1)
		DisplayText(str,_x,_y)
		local factor = (string.len(text)) / 355
		-- DrawSprite("generic_textures", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.1, 0.1, 35, 35, 35, 220, 0)
		DrawSprite("feeds", "toast_bg", _x+0.01*(scale/2), _y+0.0115*(scale/2), (0.0155+factor)*scale, 0.02*scale, 0.1, 1, 1, 1, 190, 0)
	end
end

function DrawText3D_do(x, y, z, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoord())  
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
	local scale = (2/dist)*1.1
	local fov = (2/GetGameplayCamFov())*100
    local scale = scale*fov
	if onScreen then
		SetTextScale(0.18*scale, 0.18*scale)
		SetTextFontForCurrentCommand(1)
		SetTextColor(240, 180, 180, 205)
		SetTextCentre(1)
		DisplayText(str,_x,_y)
		local factor = (string.len(text)) / 355
		-- DrawSprite("generic_textures", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.1, 0.1, 35, 35, 35, 220, 0)
		DrawSprite("feeds", "toast_bg", _x+0.01*(scale/2), _y+0.0115*(scale/2), (0.0155+factor)*scale, 0.02*scale, 0.1, 1, 1, 1, 190, 0)
	end
end

function DrawText3D_stav(x, y, z, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoord())  
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
	local scale = (2/dist)*1.1
	local fov = (2/GetGameplayCamFov())*100
    local scale = scale*fov
	if onScreen then
		SetTextScale(0.17*scale, 0.17*scale)
		SetTextFontForCurrentCommand(1)
		SetTextColor(180, 180, 180, 205)
		SetTextCentre(1)
		DisplayText(str,_x,_y)
		local factor = (string.len(text)) / 355
		-- DrawSprite("generic_textures", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.1, 0.1, 35, 35, 35, 220, 0)
		DrawSprite("feeds", "toast_bg", _x+0.01*(scale/2), _y+0.0115*(scale/2), (0.0155+factor)*scale, 0.02*scale, 0.1, 1, 1, 1, 190, 0)
	end
end
