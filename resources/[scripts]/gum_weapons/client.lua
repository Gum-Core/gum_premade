MenuData = {}
local buttons_prompt = GetRandomIntInRange(0, 0xffffff)
local buttons_prompt_2 = GetRandomIntInRange(0, 0xffffff)
local active = false
local active_2 = false
local _, wepHash
local wep
local globalhash
local comps = {}
local sum = 0
local wepobject
local createdobject = false
local pricing = {}
local cal = false
local inshop = false
local currentshop
local move_coords_x = 0.0
local move_coords_y = 0.0
local move_coords_zoom = 0.0
local weapon_type = ""
local Menu_Enabled = false
local loaded = false
local trans_price_table = {}
local global_buy_ammo = ""
local global_buy_weapon = ""
local last_category = ""
local table_comp_wep = {}
local ammoTableConfig = {}
local buyTable = {}

TriggerEvent("gum_menu:getData",function(call)
    MenuData = call
end)

function apply_weapon_component(weapon_component_hash)
  local weapon_component_model_hash = Citizen.InvokeNative(0x59DE03442B6C9598,GetHashKey(weapon_component_hash))  -- GetWeaponComponentTypeModel
  if weapon_component_model_hash and weapon_component_model_hash ~= 0 then
    RequestModel(weapon_component_model_hash)
    local i = 0
    while not HasModelLoaded(weapon_component_model_hash) and i <= 300 do
      i = i + 1
      Citizen.Wait(0)
    end
    if HasModelLoaded(weapon_component_model_hash) then
      Citizen.InvokeNative(0x74C9090FDD1BB48E,wepobject,GetHashKey(weapon_component_hash), -1, true)
      SetModelAsNoLongerNeeded(weapon_component_model_hash)
    end
  else
    Citizen.InvokeNative(0x74C9090FDD1BB48E,wepobject,GetHashKey(weapon_component_hash), -1, true)
  end	
end

function RemoveWeaponComponentFromPed(ped, componentHash, weaponHash)
	return Citizen.InvokeNative(0x19F70C4D80494FF8, ped, componentHash, weaponHash)
end
function GiveWeaponComponentToEntity(entity, componentHash, weaponHash, p3)
	return Citizen.InvokeNative(0x74C9090FDD1BB48E, entity, componentHash, weaponHash, p3)
end

RegisterNetEvent("gum_weapons:wep_components") 
AddEventHandler("gum_weapons:wep_components", function(component)
  wep_comps = component
end)
local allWeapons = {}
RegisterNetEvent("gum_weapons:sendAllHash") 
AddEventHandler("gum_weapons:sendAllHash", function(tblwpn)
  allWeapons = tblwpn
end)

RegisterNetEvent("gum_weapons:load_components") 
AddEventHandler("gum_weapons:load_components", function(component)
  local ped = PlayerPedId()
	local _, wepHash = GetCurrentPedWeapon(ped, true, 0, true)
  if GetHashKey('GROUP_REPEATER') == GetWeapontypeGroup(wepHash) then
    weapon_type = "LONGARM"
  elseif GetHashKey('GROUP_SHOTGUN') == GetWeapontypeGroup(wepHash) then
    weapon_type = "SHOTGUN"
  elseif GetHashKey('GROUP_HEAVY') == GetWeapontypeGroup(wepHash) then
    weapon_type = "LONGARM"
  elseif GetHashKey('GROUP_RIFLE') == GetWeapontypeGroup(wepHash) then
    weapon_type = "LONGARM"
  elseif GetHashKey('GROUP_SNIPER') == GetWeapontypeGroup(wepHash) then
    weapon_type = "LONGARM"
  elseif GetHashKey('GROUP_REVOLVER') == GetWeapontypeGroup(wepHash) then
    weapon_type = "SHORTARM"
  elseif GetHashKey('GROUP_PISTOL') == GetWeapontypeGroup(wepHash) then
    weapon_type = "SHORTARM"
  elseif GetHashKey('GROUP_BOW') == GetWeapontypeGroup(wepHash) then
    weapon_type = "GROUP_BOW"
  elseif GetHashKey('GROUP_MELEE') == GetWeapontypeGroup(wepHash) then
    weapon_type = "MELEE_BLADE"
  end
  Citizen.Wait(0)
  for k,v in pairs(Config.shared_components) do
    if k == weapon_type then
       for k2,v2 in pairs(v) do
        for i=1, 100 do
          if v2[i] ~= nil then
            RemoveWeaponComponentFromPed(ped, GetHashKey(v2[i]), wepHash)
          end
        end
       end
    end
  end
 applyAllComponentToWeapon(component)
end)

function engraveAply(weapon_component_hash)
  local ped = PlayerPedId()
	local _, wepHash = GetCurrentPedWeapon(ped, true, 0, true)
  local weapon_component_model_hash = Citizen.InvokeNative(0x59DE03442B6C9598,GetHashKey(weapon_component_hash))  -- GetWeaponComponentTypeModel
  if weapon_component_model_hash and weapon_component_model_hash ~= 0 then
    RequestModel(weapon_component_model_hash)
    local i = 0
    while not HasModelLoaded(weapon_component_model_hash) and i <= 300 do
      i = i + 1
      Citizen.Wait(0)
    end
    if HasModelLoaded(weapon_component_model_hash) then
      Citizen.InvokeNative(0x74C9090FDD1BB48E,ped, GetHashKey(weapon_component_hash), wepHash, true)
      SetModelAsNoLongerNeeded(weapon_component_model_hash)
    end
  else
    Citizen.InvokeNative(0x74C9090FDD1BB48E,ped, GetHashKey(weapon_component_hash), wepHash, true)
  end	
end


function applyAllComponentToWeapon(weaponComponents)
  local ped = PlayerPedId()
  local weaponText = ""
  baseMentHash = nil
  local barrelBaseHash = nil
  _, WeaponHash = GetCurrentPedWeapon(ped, true, 0, true)
  if WeaponHash ~= -1569615261 then
    for a,b in pairs(Config.model_specific_components) do
      if WeaponHash == GetHashKey(a) then
        weaponText = string.gsub(a,"WEAPON_", "")
        if b[Config.LanguageWeapons[7]] ~= nil then
          baseMentHash = b[Config.LanguageWeapons[7]][1]
        end
        if b[Config.LanguageWeapons[1]] ~= nil then
          barrelBaseHash = b[Config.LanguageWeapons[1]][1]
        end
      end
    end
    Citizen.CreateThread(function()
          
        local ped = PlayerPedId()
        -- RemoveAllPedWeapons(ped, true, true)
        local model = GetWeapontypeModel(WeaponHash)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
        end
        RequestWeaponAsset(WeaponHash)
        while not HasWeaponAssetLoaded(WeaponHash) do
            Wait(0)
        end
  
        -- GiveWeaponToPed_2(ped, WeaponHash, 100, true, false, 0, false, 0.5, 1.0, 0, false, 0.0, false)
        SetCurrentPedWeapon(ped, WeaponHash, true)
        RemoveAllWeaponComponents()
        local WeaponObject = GetCurrentPedWeaponEntityIndex(PlayerPedId(), 0)
        if baseMentHash ~= nil then
          Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey(baseMentHash), WeaponHash, true)
        end
        if barrelBaseHash ~= nil then
          Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey(barrelBaseHash), WeaponHash, true)
        end
        if baseMentHash ~= nil then
          ApplyWeaponComponent(WeaponObject, GetHashKey(baseMentHash), GetHashKey("egkzxeea_0x6c331a5f"))
        end
        for a,b in pairs(weaponComponents) do
          if string.find(b, "_WRAP") and not string.find(b, "_WRAP_TINT") then
            engraveAply(b, true)
          elseif string.find(b, "_WRAP1") and not string.find(b, "_WRAP_TINT") then
            engraveAply(b, true)
          elseif string.find(b, "_WRAP2") and not string.find(b, "_WRAP_TINT") then
            engraveAply(b, true)
          elseif string.find(b, "_WRAP3") and not string.find(b, "_WRAP_TINT") then
            engraveAply(b, true)
          end
        end
        Citizen.Wait(50)
        for a,b in pairs(weaponComponents) do
          if string.find(b, "STRAP")  then
            Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey("COMPONENT_REPEATER_STRAP01"), WeaponHash, true)
            Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey("COMPONENT_LEFTSHOULDER_STRAP01"), WeaponHash, true)
            Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey("COMPONENT_REPEATER_CLOTH_STRAP01"), WeaponHash, true)
            Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey("COMPONENT_RIFLE_CS_STRAP01"), WeaponHash, true)
          end
        end
        for a,b in pairs(weaponComponents) do
          if string.find(b, "STRAP_TINT")  then
            Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey(b), WeaponHash, true)
          end
        end
        for a,b in pairs(weaponComponents) do
          if string.find(b, "GRIPSTOCK_TINT") then
            ApplyWeaponComponent(WeaponObject, GetHashKey(b) , GetHashKey("hapviwga_0x57575690")) 
          end
        end
        for a,b in pairs(weaponComponents) do
          if string.find(b, "SIGHT") then
            Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey(b), WeaponHash, true)
          end
        end
        
  
        if not Citizen.InvokeNative(0xDDC64F5E31EEDAB6, WeaponHash) and not Citizen.InvokeNative(0xC212F1D05A8232BB, WeaponHash) and not Citizen.InvokeNative(0xC4DEC3CA8C365A5D, WeaponHash) then
          for a,b in pairs(weaponComponents) do
            if string.find(b, "FRAME_MATERIAL") then
              ApplyWeaponComponent(WeaponObject, GetHashKey(b) , GetHashKey("tcjzguba_0xa9d72b85")) 
            end
            if string.find(b, "BARREL_MATERIAL") then
              ApplyWeaponComponent(WeaponObject, GetHashKey(b) , GetHashKey("xwspsshc_0x3d351086")) 
            end
            if string.find(b, "SIGHT_MATERIAL") then
              ApplyWeaponComponent(WeaponObject, GetHashKey(b) , GetHashKey("syrtpvva_0xd426ea5a")) 
            end
            if string.find(b, "TRIGGER_MATERIAL") then
              ApplyWeaponComponent(WeaponObject, GetHashKey(b) , GetHashKey("vwctsoca_0xdc1a0de6")) 
            end
            if string.find(b, "HAMMER_MATERIAL") then
              ApplyWeaponComponent(WeaponObject, GetHashKey(b) , GetHashKey("tpjpnvga_0xe680ecdf")) 
            end
            if string.find(b, "CYLINDER_MATERIAL") then
              Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey(b), WeaponHash, true)
            end
          end
        else
          for a,b in pairs(weaponComponents) do
            if string.find(b, "FRAME_MATERIAL") then
              Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey(b), WeaponHash, true)
            end
            if string.find(b, "BARREL_MATERIAL") then
              Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey(b), WeaponHash, true)
            end
            if string.find(b, "SIGHT_MATERIAL") then
              Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey(b), WeaponHash, true)
            end
            if string.find(b, "TRIGGER_MATERIAL") then
              Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey(b), WeaponHash, true)
            end
            if string.find(b, "HAMMER_MATERIAL") then
              Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey(b), WeaponHash, true)
            end
            if string.find(b, "CYLINDER_MATERIAL") then
              Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey(b), WeaponHash, true)
            end
          end
        end
        if Citizen.InvokeNative(0xC4DEC3CA8C365A5D, WeaponHash) then
          for a,b in pairs(weaponComponents) do
            Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey(b), WeaponHash, true)
          end
        end
  
        if Citizen.InvokeNative(0x792E3EF76C911959, WeaponHash) then
          for k,v in pairs(weaponComponents) do
            if string.find(v, "MELEE_BLADE_MATERIAL")  then
              engraveAply(v, true)
            end
          end
        end
        for k,v in pairs(weaponComponents) do
          if string.find(v, "ENGRAVING")  then
            engraveAply(v, true)
          end
        end
        for k,v in pairs(weaponComponents) do
          if string.find(v, "BARREL")  then
            engraveAply(v, true)
          end
        end
        for k,v in pairs(weaponComponents) do
          if string.find(v, "ENGRAVING_MATERIAL")  then
            engraveAply(v, true)
          end
          if string.find(v, "SCOPE")  then
            engraveAply(v, true)
          end
        end
        for a,b in pairs(weaponComponents) do
          if string.find(b, "WRAP_TINT") then
            ApplyWeaponComponent(WeaponObject, GetHashKey(b), GetHashKey("eltbxawa_0x1d09a85c"))
            --engraveAply(b, true)
          end
        end
        for a,b in pairs(weaponComponents) do
          if string.find(b, "GRIP") then
            engraveAply(b, true)
         end
        end
        if Citizen.InvokeNative(0x49E40483948AF062, WeaponHash) then
          Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, GetHashKey("COMPONENT_FISHING_LINE"), WeaponHash, true)
        end
        Citizen.Wait(0)
        TriggerEvent("gum_inventory:sendOkLoading")
    end)
  else
    TriggerEvent("gum_inventory:sendOkLoading")
  end
end

function GetClosestPlayer()
    local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
    local playerPed, playerId = PlayerPedId(), PlayerId()
    local coords, usePlayerPed = coords, false
 
    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        usePlayerPed = true
        coords = GetEntityCoords(playerPed)
    end
 
    for i=1, #players, 1 do
        local tgt = GetPlayerPed(players[i])
        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then
 
            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)
 
            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
                playerid = GetPlayerServerId(players[i])
                tgt1 = GetPlayerPed(players[i])
            end
        end
    end
    return closestPlayer, closestDistance,  playerid, tgt1
end

AddEventHandler(
    "onResourceStop",
    function(resourceName)
		if GetCurrentResourceName() == resourceName then
			FreezeEntityPosition(PlayerPedId(),false)
			RemoveBlip(blip)
			if wepobject then
				DeleteEntity(wepobject)
			end
        end
    end)

function drawtext(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then 
        SetTextDropshadow(1, 0, 0, 0, 255)
    end
    Citizen.InvokeNative(0xADA9255D, 10);
    DisplayText(str, x, y)
end
function RemoveWeaponComponentFromPed(ped, componentHash, weaponHash)
	return Citizen.InvokeNative(0x19F70C4D80494FF8, ped, componentHash, weaponHash)
end

function GiveWeaponComponentToEntity(entity, componentHash, weaponHash, p3)
	return Citizen.InvokeNative(0x74C9090FDD1BB48E, entity, componentHash, weaponHash, p3)
end

RegisterNUICallback('ammo_price_weapons', function(data, cb)
  for k,v in pairs(Config.weaponShops) do
		if k == currentshop then 
			for l,m in pairs(v.ammo) do 
        for j,d in pairs(m) do
            if j == data.ammo_name then
              global_buy_ammo = d.itemId
              SendNUIMessage({type = "price_for_ammo",status = true, amm_name = j, price = d.price})
              if string.match(j,Config.LanguageFilter[1]) then
                createobjectammo(move_coords_x, move_coords_y, move_coords_z, GetHashKey('s_inv_highvlcty_revammo01x'))
              elseif string.match(j,Config.LanguageFilter[2]) then
                createobjectammo(move_coords_x, move_coords_y, move_coords_z, GetHashKey('s_inv_highvlcty_pstammo01x'))
              elseif string.match(j,Config.LanguageFilter[3]) then
                createobjectammo(move_coords_x, move_coords_y, move_coords_z, GetHashKey('s_inv_highvlcty_rifleammo01x'))
              elseif string.match(j,Config.LanguageFilter[4]) then
                createobjectammo(move_coords_x, move_coords_y, move_coords_z, GetHashKey('s_inv_hivlcty_snprammo01x001'))
              elseif string.match(j,Config.LanguageFilter[6]) then
                createobjectammo(move_coords_x, move_coords_y, move_coords_z, GetHashKey('s_inv_arrowammo02x'))
              elseif string.match(j,Config.LanguageFilter[5]) then
                createobjectammo(move_coords_x, move_coords_y, move_coords_z, GetHashKey('s_inv_slug_shotgunammo01x'))
              elseif string.match(j,Config.LanguageFilter[7]) then
                createobjectammo(move_coords_x, move_coords_y, move_coords_z, GetHashKey('s_inv_varmint_rifleammo01x'))
              else
                if wepobject ~= false and wepobject ~= nil then
                  DeleteEntity(wepobject)
                end
              end
            end
        end
			end
		end
    end
end)
RegisterNUICallback('show_store_weapons', function(data, cb)
  for k,v in pairs(Config.weaponShops) do
		if k == currentshop then 
			for l,m in pairs(v.weapons) do 
        for j,d in pairs(m) do
            if j == data.weapon_name then
              global_buy_weapon = d.hashname
              SendNUIMessage({type = "price_for_load",status = true, wep_name = data.weapon_name, price = d.price})
              createobjectstore(move_coords_x, move_coords_y, move_coords_z, GetHashKey(d.hashname))
            end
        end
			end
		end
    end
end)

RegisterNUICallback('buy_weapon', function(data, cb)
  for k,v in pairs(Config.weaponShops) do
    if k == currentshop then 
      for l,m in pairs(v.ammo) do 
        for j,d in pairs(m) do
          if d.itemId == global_buy_ammo then
            TriggerEvent("guminputs:getInput", ""..Config.Language[9].text.."", ""..Config.Language[10].text.."", function(cb)
              local count_number = tonumber(cb)
              if count_number ~= 'Close' and count_number ~= 'close' and count_number >= 1 then
                TriggerServerEvent("gum_weapons:buyammo", d.itemId,d.price,count_number)
              end
              close_store()
              return false
            end)
          end
        end
      end
    end
  end
end)

RegisterNUICallback('buy_ammo', function(data, cb)
  for k,v in pairs(Config.weaponShops) do
		if k == currentshop then 
			for l,m in pairs(v.weapons) do 
        for j,d in pairs(m) do
            if d.hashname == global_buy_weapon then
              local throwable = false
              local idThrowable = nil
              local countThrowable = 0
              if Citizen.InvokeNative(0x30E7C16B12DA8211, GetHashKey(d.hashname)) then
                throwable = true
              end

              for k,v in pairs(Config.ammo) do
                for l,m in pairs(v) do
                  if m.weaponItem ~= nil then
                     if m.weaponItem[1] == d.hashname then
                        idThrowable = m.ammoNameHash
                        countThrowable = m.maxAmmo
                      end
                    end
                end
              end

               TriggerServerEvent("gum_weapons:buy_weapon", d.hashname,d.price,j,throwable, idThrowable,countThrowable)
          end
        end
      end
    end
  end
end)

function createobjectammo(x, y, z, objecthash)
  if wepobject ~= false and wepobject ~= nil then
    DeleteEntity(wepobject)
  end
  Citizen.Wait(50)
  wepobject = CreateObject(objecthash, x, y, z, false, false, false)
  SetEntityCoords(wepobject, x, y, z)
  if objecthash == GetHashKey('s_inv_arrowammo02x') then
    SetEntityRotation(wepobject, 0.0, 0.0, 360.0, 1, true)
  else
    SetEntityRotation(wepobject, 90.0, 0.0, 360.0, 1, true)
  end
end  

function createobjectstore(x, y, z, objecthash)
  if wepobject ~= false then
    DeleteEntity(wepobject)
  end

  for k,v in pairs(Config.weapon_object_load_for_redner) do
    if GetHashKey(k) == objecthash then
      LoadModel(v)
    end
  end
  Citizen.Wait(50)
  wepobject = Citizen.InvokeNative(0x9888652B8BA77F73, objecthash, 0, x, y, z, false, 1.0)
  SetEntityCoords(wepobject, x, y, z)
  SetEntityRotation(wepobject, 90.0, 0.0, 360.0, 1, true)

  for k,v in pairs(Config.model_specific_components) do
    if GetHashKey(k) == objecthash then
      for k2,v2 in pairs(v) do
        if k2 == Config.LanguageWeapons[1] then
          apply_weapon_component(v2[1])
        end
        if k2 == Config.LanguageWeapons[7] then
          apply_weapon_component(v2[1])
        end
      end
    end
  end
end  

function createobject(x, y, z, objecthash)
	wepobject = Citizen.InvokeNative(0x9888652B8BA77F73, objecthash, 0, x, y, z, false, 1.0)
  SetEntityCoords(wepobject, x, y, z)

  SetEntityRotation(wepobject, 90.0, 0.0, 360.0, 1, true)
  for k,v in pairs(Config.model_specific_components) do
    if GetHashKey(k) == objecthash then
       for k2,v2 in pairs(v) do
        for i=1, 100 do
          if k2 == Config.LanguageWeapons[1] then
            apply_weapon_component(v2[1])
          end
          if k2 == Config.LanguageWeapons[7] then
            apply_weapon_component(v2[1])
          end
       end
      end
    end
  end
  if wep_comps ~= nil then
    for k,v in pairs(wep_comps) do
      apply_weapon_component(v)
    end
  end
end  


function Button_Prompt_2()
	Citizen.CreateThread(function()
		local str = ""..Config.Language[11].text..""
		EnterPrompt = PromptRegisterBegin()
		PromptSetControlAction(EnterPrompt, 0x27D1C284)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(EnterPrompt, str)
		PromptSetEnabled(EnterPrompt, true)
		PromptSetVisible(EnterPrompt, true)
		PromptSetHoldMode(EnterPrompt, true)
        PromptSetGroup(EnterPrompt, buttons_prompt_2)
		PromptRegisterEnd(EnterPrompt)
	end)
	Citizen.CreateThread(function()
		local str = ""..Config.Language[12].text..""
		EnterCusPrompt = PromptRegisterBegin()
		PromptSetControlAction(EnterCusPrompt, 0xA1ABB953)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(EnterCusPrompt, str)
		PromptSetEnabled(EnterCusPrompt, true)
		PromptSetVisible(EnterCusPrompt, true)
		PromptSetHoldMode(EnterCusPrompt, true)
        PromptSetGroup(EnterCusPrompt, buttons_prompt_2)
		PromptRegisterEnd(EnterCusPrompt)
	end)
end


Citizen.CreateThread(function()
  TriggerServerEvent("gum_weapons:getAllHash")
  for a,b in pairs(Config.ammo) do
    for c,d in pairs(b) do
      table.insert(ammoTableConfig, d.ammoNameHash)
    end
  end
  for k,v in pairs(Config.weaponShops) do 
    if v.showBlip then
      blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
      SetBlipSprite(blip, v.blipId, 1)
      SetBlipScale(blip, 0.2)
      Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.Name)
    end
  end
	Button_Prompt_2()
  while true do
    Citizen.Wait(10)
    if not createdobject and not inshop then
      local coords, letSleep = GetEntityCoords(PlayerPedId()), true
      for k, v in pairs(Config.weaponShops) do
      local dist = GetDistanceBetweenCoords(coords.x,coords.y,coords.z, v.Pos.x,v.Pos.y,v.Pos.z, 1)
      if dist < 1.0 then
        letSleep = false  
        if active_2 == false then
          local item_name = CreateVarString(10, 'LITERAL_STRING', ""..Config.Language[1].text.."")
          PromptSetActiveGroupThisFrame(buttons_prompt_2, item_name)
        end
        if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) then
          currentshop = k
          inshop = true
          Open_Store_Menu(true)

          FreezeEntityPosition(PlayerPedId(),true)
          StartCam(v.PosCus.x+0.2, v.PosCus.y, v.PosCus.z, 90.0)
          move_coords_x = v.PosCus.x
          move_coords_y = v.PosCus.y
          move_coords_z = v.PosCus.z
          is_zed = v.PosCus.z
        end
        if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0xA1ABB953) then
          local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
          if closestPlayer ~= -1 and closestDistance <= 1.5 then
            exports['gum_notify']:DisplayLeftNotification(Config.Language[1].text, ""..Config.Language[13].text.."", 'rifle', 2000)
          else
               local ped = PlayerPedId()
               _, wepHash = GetCurrentPedWeapon(ped, true, 0, true)
               wep = GetCurrentPedWeaponEntityIndex(ped, 0)
               globalhash = wepHash
              if GetHashKey('GROUP_REPEATER') == GetWeapontypeGroup(wepHash) then
                weapon_type = "LONGARM"
              elseif GetHashKey('GROUP_SHOTGUN') == GetWeapontypeGroup(wepHash) then
                weapon_type = "SHOTGUN"
              elseif GetHashKey('GROUP_HEAVY') == GetWeapontypeGroup(wepHash) then
                weapon_type = "LONGARM"
              elseif GetHashKey('GROUP_RIFLE') == GetWeapontypeGroup(wepHash) then
                weapon_type = "LONGARM"
              elseif GetHashKey('GROUP_SNIPER') == GetWeapontypeGroup(wepHash) then
                weapon_type = "LONGARM"
              elseif GetHashKey('GROUP_REVOLVER') == GetWeapontypeGroup(wepHash) then
                weapon_type = "SHORTARM"
              elseif GetHashKey('GROUP_PISTOL') == GetWeapontypeGroup(wepHash) then
                weapon_type = "SHORTARM"
              elseif GetHashKey('GROUP_BOW') == GetWeapontypeGroup(wepHash) then
                weapon_type = "GROUP_BOW"
              elseif GetHashKey('GROUP_MELEE') == GetWeapontypeGroup(wepHash) then
                weapon_type = "MELEE_BLADE"
              end
                if wep ~= nil and wep ~= 0 and globalhash ~= nil then
                   TriggerServerEvent("gum_weapons:check_comps", wepHash)
                   Citizen.Wait(2000)
                   -- Open_Main_Menu()
                  Customization_Menu(true)
                  buyTable = {}
                   FreezeEntityPosition(PlayerPedId(),true)
                   createobject(v.PosCus.x, v.PosCus.y, v.PosCus.z, wepHash)
                  StartCam(v.PosCus.x+0.2, v.PosCus.y, v.PosCus.z, 90.0)
                  move_coords_x = v.PosCus.x
                  move_coords_y = v.PosCus.y
                  move_coords_z = v.PosCus.z
                  is_zed = v.PosCus.z
               end
           end
        end
      end
      
    end
    if letSleep then
      Citizen.Wait(1000)
    end	
  end
end
end)
function Customization_Menu(bool)
  SetNuiFocus(bool, bool)
  Menu_Enabled = bool
  local shared_table = {}
  local global_table = {}
  for k,v in pairs(Config.shared_components) do
    if k == weapon_type then
      shared_table = v
    end
  end
  table.sort(shared_table)
  for k,v in pairs(Config.model_specific_components) do
    if GetHashKey(k) == globalhash then
      global_table = v
    end
  end
  table.sort(global_table)
  for k,v in pairs(Config.shared_components) do
    if k == weapon_type then
       for k2,v2 in pairs(v) do
        for k3,v3 in pairs(v2) do
          if wep_comps ~= nil then
            for a,b in pairs(wep_comps) do
              if v3 == b then
                if k2 == "MELEE_BLADE_MATERIAL" then
                  table_comp_wep["melee_blade_material"] = v3
                elseif k2 == "COMPONENT_FISHING_LINE" then
                  table_comp_wep["component_fishing_line"] = v3
                elseif k2 == "MELEE_BLADE_ENGRAVING" then
                  table_comp_wep["melee_blade_engraving"] = v3
                elseif k2 == "MELEE_BLADE_ENGRAVING_MATERIAL" then
                  table_comp_wep["melee_blade_engraving_material"] = v3
                elseif k2 == "BARREL" then
                  table_comp_wep["barrel"] = v3
                elseif k2 == "GRIP" then
                  table_comp_wep["grip"] = v3
                elseif k2 == "SIGHT" then
                  table_comp_wep["sight"] = v3
                elseif k2 == "CLIP" then
                  table_comp_wep["clip"] = v3
                elseif k2 == "TUBE" then
                  table_comp_wep["tube"] = v3
                elseif k2 == "WRAP" then
                  table_comp_wep["wrap"] = v3
                elseif k2 == "MAG" then
                  table_comp_wep["mag"] = v3
                elseif k2 == "CYLINDER_TINT" then
                  table_comp_wep["cylinder_tint"] = v3
                elseif k2 == "BARREL_TINT" then
                  table_comp_wep["barrel_tint"] = v3
                elseif k2 == "TRIGGER_TINT" then
                  table_comp_wep["trigger_tint"] = v3
                elseif k2 == "FRAME_DATA" then
                  table_comp_wep["frame_data"] = v3
                elseif k2 == "TORCH" then
                  table_comp_wep["torch"] = v3
                elseif k2 == "TRIGGER_MATERIAL" then
                  table_comp_wep["trigger_material"] = v3
                elseif k2 == "SIGHT_MATERIAL" then
                  table_comp_wep["sight_material"] = v3
                elseif k2 == "HAMMER_MATERIAL" then
                  table_comp_wep["hammer_material"] = v3
                elseif k2 == "FRAME_MATERIAL" then
                  table_comp_wep["frame_material"] = v3
                elseif k2 == "FRAME_ENGRAVING" then
                  table_comp_wep["frame_engraving"] = v3
                elseif k2 == "FRAME_ENGRAVING_MATERIAL" then
                  table_comp_wep["frame_engraving_material"] = v3
                elseif k2 == "BARREL_MATERIAL" then
                  table_comp_wep["barrel_material"] = v3
                elseif k2 == "BARREL_ENGRAVING" then
                  table_comp_wep["barrel_engraving"] = v3
                elseif k2 == "BARREL_ENGRAVING_MATERIAL" then
                  table_comp_wep["barrel_engraving_material"] = v3
                elseif k2 == "CYLINDER_MATERIAL" then
                  table_comp_wep["cylinder_material"] = v3
                elseif k2 == "CYLINDER_ENGRAVING" then
                  table_comp_wep["cylinder_engraving"] = v3
                elseif k2 == "CYLINDER_ENGRAVING_MATERIAL" then
                  table_comp_wep["cylinder_engraving_material"] = v3
                elseif k2 == "GRIP_MATERIAL" then
                  table_comp_wep["grip_material"] = v3
                elseif k2 == "GRIPSTOCK_ENGRAVING" then
                  table_comp_wep["gripstock_engraving"] = v3
                elseif k2 == "BARREL_RIFLING" then
                  table_comp_wep["barrel_rifling"] = v3
                elseif k2 == "WRAP_MATERIAL" then
                  table_comp_wep["wrap_material"] = v3
                elseif k2 == "WRAP_TINT" then
                  table_comp_wep["wrap_tint"] = v3
                elseif k2 == "STRAP" then
                  table_comp_wep["strap"] = v3
                elseif k2 == "STRAP_TINT" then
                  table_comp_wep["strap_tint"] = v3
                elseif k2 == "SCOPE" then
                  table_comp_wep["scope"] = v3
                elseif k2 == "GRIP_TINT" then
                  table_comp_wep["grip_tint"] = v3
                end
              end
            end
          end
        end
       end
    end
  end
  for k,v in pairs(Config.model_specific_components) do
    if GetHashKey(k) == wepHash then
      for k2,v2 in pairs(v) do
        for k3,v3 in pairs(v2) do
          for a,b in pairs(wep_comps) do
            if v3 == b then
              if k2 == "MELEE_BLADE_MATERIAL" then
                table_comp_wep["melee_blade_material"] = v3
              elseif k2 == "COMPONENT_FISHING_LINE" then
                table_comp_wep["component_fishing_line"] = v3
              elseif k2 == "MELEE_BLADE_ENGRAVING" then
                table_comp_wep["melee_blade_engraving"] = v3
              elseif k2 == "MELEE_BLADE_ENGRAVING_MATERIAL" then
                table_comp_wep["melee_blade_engraving_material"] = v3
              elseif k2 == "BARREL" then
                table_comp_wep["barrel"] = v3
              elseif k2 == "GRIP" then
                table_comp_wep["grip"] = v3
              elseif k2 == "SIGHT" then
                table_comp_wep["sight"] = v3
              elseif k2 == "CLIP" then
                table_comp_wep["clip"] = v3
              elseif k2 == "TUBE" then
                table_comp_wep["tube"] = v3
              elseif k2 == "WRAP" then
                table_comp_wep["wrap"] = v3
              elseif k2 == "MAG" then
                table_comp_wep["mag"] = v3
              elseif k2 == "CYLINDER_TINT" then
                table_comp_wep["cylinder_tint"] = v3
              elseif k2 == "BARREL_TINT" then
                table_comp_wep["barrel_tint"] = v3
              elseif k2 == "TRIGGER_TINT" then
                table_comp_wep["trigger_tint"] = v3
              elseif k2 == "FRAME_DATA" then
                table_comp_wep["frame_data"] = v3
              elseif k2 == "TORCH" then
                table_comp_wep["torch"] = v3
              elseif k2 == "TRIGGER_MATERIAL" then
                table_comp_wep["trigger_material"] = v3
              elseif k2 == "SIGHT_MATERIAL" then
                table_comp_wep["sight_material"] = v3
              elseif k2 == "HAMMER_MATERIAL" then
                table_comp_wep["hammer_material"] = v3
              elseif k2 == "FRAME_MATERIAL" then
                table_comp_wep["frame_material"] = v3
              elseif k2 == "FRAME_ENGRAVING" then
                table_comp_wep["frame_engraving"] = v3
              elseif k2 == "FRAME_ENGRAVING_MATERIAL" then
                table_comp_wep["frame_engraving_material"] = v3
              elseif k2 == "BARREL_MATERIAL" then
                table_comp_wep["barrel_material"] = v3
              elseif k2 == "BARREL_ENGRAVING" then
                table_comp_wep["barrel_engraving"] = v3
              elseif k2 == "BARREL_ENGRAVING_MATERIAL" then
                table_comp_wep["barrel_engraving_material"] = v3
              elseif k2 == "CYLINDER_MATERIAL" then
                table_comp_wep["cylinder_material"] = v3
              elseif k2 == "CYLINDER_ENGRAVING" then
                table_comp_wep["cylinder_engraving"] = v3
              elseif k2 == "CYLINDER_ENGRAVING_MATERIAL" then
                table_comp_wep["cylinder_engraving_material"] = v3
              elseif k2 == "GRIP_MATERIAL" then
                table_comp_wep["grip_material"] = v3
              elseif k2 == "GRIPSTOCK_ENGRAVING" then
                table_comp_wep["gripstock_engraving"] = v3
              elseif k2 == "BARREL_RIFLING" then
                table_comp_wep["barrel_rifling"] = v3
              elseif k2 == "WRAP_MATERIAL" then
                table_comp_wep["wrap_material"] = v3
              elseif k2 == "WRAP_TINT" then
                table_comp_wep["wrap_tint"] = v3
              elseif k2 == "STRAP" then
                table_comp_wep["strap"] = v3
              elseif k2 == "STRAP_TINT" then
                table_comp_wep["strap_tint"] = v3
              elseif k2 == "SCOPE" then
                table_comp_wep["scope"] = v3
              elseif k2 == "GRIP_TINT" then
                table_comp_wep["grip_tint"] = v3
              end
            end
          end
        end
      end
    end
  end

  SendNUIMessage({
    type = "customization_menu",
    status = bool,
    table_shared = shared_table,
    table_glob = global_table,
    table_comps = wep_comps,
    weapType = weapon_type,
    })
end

function Open_Store_Menu(bool)
  SetNuiFocus(bool, bool)
  Menu_Enabled = bool
  local shared_table = {}
  local global_table = {}
  for k,v in pairs(Config.weaponShops) do 
		if k == currentshop then 
      ammo_table = v.ammo
    end
  end
  for k,v in pairs(Config.weaponShops) do
    if k == currentshop then 
      weapon_table = v.weapons
    end
  end
  SendNUIMessage({
    type = "buying_menu",
    status = bool,
    weapon_table = weapon_table,
    ammo_table = ammo_table,
  })
end

 
Citizen.CreateThread(function() 
  SendNUIMessage({
    type = "language",
    Language = Config.LanguageWeapons
    })
    while true do 
        Citizen.Wait(10)
        local sleep = true
        if createdobject then
          if cal == true then
            sum = 0
            for k,v in pairs(pricing) do
              sum = sum + v.price
            end
            cal = false
          end
          DrawLightWithRange(tonumber(string.format("%.2f", -281.20)), tonumber(string.format("%.2f", 779.86)), tonumber(string.format("%.2f", 119.56+1.0)), 255, 255, 255, tonumber(string.format("%.2f", 10.0)), tonumber(string.format("%.2f", 30.0)))
        end
	end
end)

function StartCam(x,y,z,zoom)
	  DestroyAllCams(true)
    local camera_pos = GetObjectOffsetFromCoords(x, y, z ,0.0 ,1.0, 1.0, 1.0)
    camera = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", x, y, z+0.5, -90.00, 00.00, -180.0, zoom, true, 0)
    SetCamActive(camera ,true)
    RenderScriptCams(true, true, 2000, true, true)
end

function EndCam()
    RenderScriptCams(false, true, 2000, true, false)
    DestroyCam(camera, false)
    camera = nil
    DestroyAllCams(true)
end


RegisterNUICallback('exit', function(data, cb)
  Customization_Menu(false, false)
  Open_Store_Menu(false, false)
  SetNuiFocus(false, false)
  EndCam()
  FreezeEntityPosition(PlayerPedId(), false)
  if wepobject ~= false then
    DeleteEntity(wepobject)
  end
  if wepobject ~= false and wepobject ~= nil then
    DeleteEntity(wepobject)
  end
  active_2 = false
  inshop = false
  createdobject = false
  Menu_Enabled = false
end)

function close_store()
  Customization_Menu(false, false)
  Open_Store_Menu(false, false)
  SetNuiFocus(false, false)
  EndCam()
  FreezeEntityPosition(PlayerPedId(), false)
  if wepobject ~= false then
    DeleteEntity(wepobject)
  end
  if wepobject ~= false and wepobject ~= nil then
    DeleteEntity(wepobject)
  end
  active_2 = false
  inshop = false
  createdobject = false
  Menu_Enabled = false
end

RegisterNUICallback('delete_prop', function(data, cb)
  if wepobject ~= false then
    DeleteEntity(wepobject)
  end
  if wepobject ~= false and wepobject ~= nil then
    DeleteEntity(wepobject)
  end
end)



RegisterNUICallback('reset_skin', function(data, cb)
  trans_price_table[last_category] = nil
  local send_price = 0
  if data.sended == "global" then
    if string.match(last_component, "GRIP") then
    else
      if Citizen.InvokeNative(0x76A18844E743BF91, wepobject, GetHashKey(last_component) ) then
        Citizen.InvokeNative(0xF7D82B0D66777611, wepobject, GetHashKey(last_component) )
      end       
    end
  else
    if Citizen.InvokeNative(0x76A18844E743BF91, wepobject, GetHashKey(last_component) ) then
      Citizen.InvokeNative(0xF7D82B0D66777611, wepobject, GetHashKey(last_component) )
    end
  end

  for k,v in pairs(trans_price_table) do
    send_price = send_price+v
  end
  SendNUIMessage({type = "compo_price", comp_price = send_price})

end)


function category_check(data)
  local category_name = "NONE"
  local category_price = 0
  for k,v in pairs(Config.shared_components) do
    if k == weapon_type then
       for k2,v2 in pairs(v) do
        for k3,v3 in pairs(v2) do
          if v3 == data then
            category_name = k2
          end
        end
       end
    end
  end
  for k,v in pairs(Config.model_specific_components) do
    if GetHashKey(k) == wepHash then
      for k2,v2 in pairs(v) do
        for k3,v3 in pairs(v2) do
          if v3 == data then
            category_name = k2
          end
        end
      end
    end
  end
  for k,v in pairs(Config.priceTable) do
    if k == category_name then
      category_price = v
    end
  end
  return category_price, category_name
end

RegisterNUICallback('compData', function(data, cb)
  if data.comp == "cleanIt" then
    buyTable[lastCategory] = "none"
    if Citizen.InvokeNative(0x76A18844E743BF91, wepobject, GetHashKey(lastComp)) then
      Citizen.InvokeNative(0xF7D82B0D66777611, wepobject, GetHashKey(lastComp))
    end  
  else
    lastComp = data.comp
    lastCategory = data.category
    buyTable[data.category] = data.comp
    apply_weapon_component(data.comp)
  end


  local send_price = 0
  for k,v in pairs(buyTable) do
    if v ~= "none" then
      send_price = Config.priceTable[k]+send_price
    end
  end
  SendNUIMessage({type = "compo_price", comp_price = send_price})
end)

RegisterNUICallback('buy_components', function(data, cb)
  local table_comps = {}
  local send_price = 0
  for k,v in pairs(buyTable) do
    if v ~= "none" then
      send_price = Config.priceTable[k]+send_price
    end
  end
  for a,b in pairs(buyTable) do
    wep_comps[a] = b
  end
  Citizen.Wait(0)
  close_store()

  TriggerServerEvent("gum_weapons:save_comps", wep_comps, globalhash, send_price)
  buyTable = {}
end)

local geared = false
RegisterCommand(""..Config.Language[14].text.."", function(source)
  local wephash = Citizen.InvokeNative(0x8425C5F057012DAB,PlayerPedId())
  TriggerServerEvent("gum_weapons:check_comps", wephash)
  Citizen.Wait(1000)
  for a,b in pairs(wep_comps) do
    if string.match(b, "SCOPE") then
      if geared == false then
        geared = true
        RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(b), wephash)
        TriggerServerEvent("gum_weapons:scope_unequip")
      else
        geared = false
        Citizen.InvokeNative(0x74C9090FDD1BB48E, PlayerPedId(), GetHashKey(b), wephash, true)
        TriggerServerEvent("gum_weapons:scope_equip")
      end
    end
  end
end)

RegisterNUICallback('set_camera', function(data, cb)
  if weapon_type == "LONGARM" then
    if string.match(data.weapon_cam, "GRIP") then 
      StartCam(move_coords_x-0.15, move_coords_y+0.010, move_coords_z-0.10, 60.0-15.0)
    elseif string.match(data.weapon_cam, "CYLINDER") then
      StartCam(move_coords_x-0.010, move_coords_y+0.005, move_coords_z-0.20, 60.0-15.0)
    elseif string.match(data.weapon_cam, "BARREL") then
      StartCam(move_coords_x+0.400, move_coords_y-0.055, move_coords_z-0.20, 60.0)
    elseif string.match(data.weapon_cam, "SIGHT") then
      StartCam(move_coords_x+0.400, move_coords_y-0.055, move_coords_z-0.20, 60.0)
    elseif string.match(data.weapon_cam, "FRAME") then
      StartCam(move_coords_x+0.060, move_coords_y-0.045, move_coords_z-0.20, 60.0)
    elseif string.match(data.weapon_cam, "TRIGGER") then
      StartCam(move_coords_x-0.010, move_coords_y+0.005, move_coords_z-0.20, 60.0-15.0)
    elseif string.match(data.weapon_cam, "HAMMER") then
      StartCam(move_coords_x-0.010, move_coords_y-0.050, move_coords_z-0.20, 60.0-15.0)
 
    else
      StartCam(move_coords_x+0.2, move_coords_y, move_coords_z, 90.0)
    end
  elseif weapon_type == "SHORTARM" then
    if string.match(data.weapon_cam, "GRIP") then 
      StartCam(move_coords_x+0.00, move_coords_y+0.010, move_coords_z-0.10, 60.0-15.0)
    elseif string.match(data.weapon_cam, "CYLINDER") then
      StartCam(move_coords_x+0.050, move_coords_y-0.055, move_coords_z-0.20, 60.0-15.0)
    elseif string.match(data.weapon_cam, "BARREL") then
      StartCam(move_coords_x+0.120, move_coords_y-0.055, move_coords_z-0.20, 60.0)
    elseif string.match(data.weapon_cam, "SIGHT") then
      StartCam(move_coords_x+0.120, move_coords_y-0.055, move_coords_z-0.20, 60.0)
    elseif string.match(data.weapon_cam, "FRAME") then
      StartCam(move_coords_x+0.060, move_coords_y-0.045, move_coords_z-0.20, 60.0)
    elseif string.match(data.weapon_cam, "TRIGGER") then
      StartCam(move_coords_x-0.010, move_coords_y+0.005, move_coords_z-0.20, 60.0-15.0)
    elseif string.match(data.weapon_cam, "HAMMER") then
      StartCam(move_coords_x-0.010, move_coords_y-0.050, move_coords_z-0.20, 60.0-15.0)
 
    else
      StartCam(move_coords_x+0.2, move_coords_y, move_coords_z, 90.0)
    end
  elseif weapon_type == "MELEE_BLADE" then
    StartCam(move_coords_x-0.02, move_coords_y-0.1, move_coords_z, 90.0)
  end
end)

RegisterNetEvent("gum_weapons:getGun")
AddEventHandler("gum_weapons:getGun", function(ammoHash,boxCount,itemId)
  local ammoNameHash = GetHashKey(ammoHash)
  local weaponSearched = false
    for i=0, 30 do
      local _, wepHash = GetCurrentPedWeapon(PlayerPedId(), true, i, true)
      if wepHash ~= -1569615261 and wepHash ~= 0 then
        if Citizen.InvokeNative(0x7AA043F6C41D151E, ammoNameHash) == wepHash then
          weaponSearched = true
        else 
          for k,v in pairs(allWeapons) do
            if GetHashKey(v.item) == wepHash then
              weaponSearched = true
            end
          end
        end
      end
    end
    if weaponSearched == true then
      local maxAmmo = 0
      for a,b in pairs(Config.ammo) do
        for c,d in pairs(b) do
          if ammoHash == d.ammoNameHash then
            maxAmmo = d.maxAmmo
          end
        end
      end
      local currentAmmo = GetPedAmmoByType(PlayerPedId(), ammoNameHash)
      if currentAmmo+boxCount <= maxAmmo then
        SetPedAmmoByType(PlayerPedId(), ammoNameHash, boxCount);
      else
        if currentAmmo+(boxCount/2) <= maxAmmo then
          SetPedAmmoByType(PlayerPedId(), ammoNameHash, boxCount);
          exports['gum_notify']:DisplayLeftNotification(Config.Language[1].text, ""..Config.Language[17].text.."", 'rifle', 2000)
        else
          TriggerServerEvent("gum_weapons:givebackbox", itemId)
          exports['gum_notify']:DisplayLeftNotification(Config.Language[1].text, ""..Config.Language[6].text.."", 'rifle', 2000)
        end
      end
    else
      TriggerServerEvent("gum_weapons:givebackbox", itemId)
      exports['gum_notify']:DisplayLeftNotification(Config.Language[1].text, ""..Config.Language[8].text.."", 'rifle', 2000)
    end
end)


function LoadModel(model)
	if not IsModelInCdimage(model) then
		return false
	end
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(0)
	end
	return true
end

 
function ApplyWeaponComponent(WeaponObject, ComponentHash , slotHash)
    local ComponentModelHash = GetWeaponComponentTypeModel(ComponentHash)
 
    if not DoesEntityExist(WeaponObject) then
        while not DoesEntityExist(WeaponObject) do 
          Wait(0)
            WeaponObject = GetCurrentPedWeaponEntityIndex(PlayerPedId(), 0)
        end
    end
 
    local ItemInfoStruct = ItemdatabaseFilloutItemInfo(ComponentHash)
    local ModType = ItemInfoStruct:GetInt32(2 * 8)
    if ModType == GetHashKey("WEAPON_MOD") then
 
        if not IsModelValid(ComponentModelHash) then
            return
        end
 
        RequestModel(ComponentModelHash)
        while not HasModelLoaded(ComponentModelHash) do
          Wait(0)
        end
 
        if not ItemHaveTag(ComponentHash) and not HasWeaponGotWeaponComponent(WeaponObject, ComponentHash) then
 
            addWeaponInventoryItem(ComponentHash, slotHash)
        else
        end
 
    elseif ModType == GetHashKey("WEAPON_DECORATION") then
        if not ItemHaveTag(ComponentHash) and not HasWeaponGotWeaponComponent(WeaponObject, ComponentHash) then     
            addWeaponInventoryItem(ComponentHash, slotHash)
        else
        end
    end
end
 
function RemoveAllWeaponComponents()
    local WeaponObject = GetCurrentPedWeaponEntityIndex(PlayerPedId(), 0)
    local BoundleInfoStruct = DataView.ArrayBuffer(8 * 8)
    BoundleInfoStruct:SetInt32(0 * 8, 1)
    local WeaponComponentStruct = DataView.ArrayBuffer(8 * 8)
    local BoundleItemId = ItemdatabaseGetBundleId(WeaponHash)
    if BoundleItemId ~= 0 then
 
        local WeaponComponentsCount = ItemdatabaseGetBundleItemCount(BoundleItemId, BoundleInfoStruct:Buffer())
        local var0 = 0
        if WeaponComponentsCount ~= false then
          while var0 < WeaponComponentsCount do
            if ItemdatabaseGetBundleItemInfo(BoundleItemId, BoundleInfoStruct:Buffer(), var0,
                WeaponComponentStruct:Buffer()) then
 
                local ItemInfoStruct = ItemdatabaseFilloutItemInfo(WeaponComponentStruct:GetInt32(0 * 8))
                if not ItemInfoStruct then
                    return
                end
 
                local WeaponComponent = ItemInfoStruct:GetInt32(0 * 8)
                local WeaponModType = ItemInfoStruct:GetInt32(2 * 8)
 
                if WeaponModType == GetHashKey("WEAPON_MOD") or WeaponModType == GetHashKey("WEAPON_DECORATION") then
                    if HasWeaponGotWeaponComponent(WeaponObject, WeaponComponent) then
                        RemoveWeaponComponentFromPed(PlayerPedId(), WeaponComponent, WeaponHash)
                    end
                end
            end
            var0 = var0 + 1
          end
        end
    end
    Wait(200)
end
 
function ItemdatabaseFilloutItemInfo(ItemHash)
    local eventDataStruct = DataView.ArrayBuffer(8 * 8)
    local is_data_exists = Citizen.InvokeNative(0xFE90ABBCBFDC13B2, ItemHash, eventDataStruct:Buffer())
    if not is_data_exists then
        return false
    end
    return eventDataStruct
end
 
function ItemdatabaseGetBundleId(WeaponHash)
    return Citizen.InvokeNative(0x891A45960B6B768A, WeaponHash)
end
 
function ItemdatabaseGetBundleItemCount(BoundleItemId, BoundleInfo)
    return Citizen.InvokeNative(0x3332695B01015DF9, BoundleItemId, BoundleInfo)
end
 
function ItemdatabaseGetBundleItemInfo(BoundleItemId, BoundleInfoStruct, var0, WeaponComponentStruct)
    return Citizen.InvokeNative(0x5D48A77E4B668B57, BoundleItemId, BoundleInfoStruct, var0, WeaponComponentStruct)
end
 
function ItemHaveTag(ComponentHash)
    return Citizen.InvokeNative(0xFF5FB5605AD56856, ComponentHash, 1844906744, 1120943070)
end
 
function GetWeaponComponentTypeModel(componentHash)
    return Citizen.InvokeNative(0x59DE03442B6C9598, componentHash)
end
 
function GiveWeaponComponentToEntity(ped, componentHash, weaponHash, unk)
    return Citizen.InvokeNative(0x74C9090FDD1BB48E, ped, componentHash, weaponHash, unk)
end
 
function RemoveWeaponComponentFromPed(ped, componentHash, weaponHash)
    return Citizen.InvokeNative(0x19F70C4D80494FF8, ped, componentHash, weaponHash)
end
 
function RequestWeaponAsset(weaponHash)
    return Citizen.InvokeNative(0x72D4CB5DB927009C, weaponHash , -1 , 0)
end
 
function ItemdatabaseIsKeyValid(weaponHash, unk)
    return Citizen.InvokeNative(0x6D5D51B188333FD1, weaponHash , unk)
end
 
function HasWeaponAssetLoaded(weaponHash)
    return Citizen.InvokeNative(0xFF07CF465F48B830, WeaponHash)
end
 
function InventoryAddItemWithGuid(inventoryId, itemData, parentItem, itemHash, slotHash, amount, addReason)
    return Citizen.InvokeNative(0xCB5D11F9508A928D, inventoryId, itemData, parentItem, itemHash, slotHash, amount, addReason);
   
end
 
function InventoryEquipItemWithGuid(inventoryId , itemData , bEquipped)
    return Citizen.InvokeNative(0x734311E2852760D0, inventoryId , itemData , bEquipped)
end
 
function getGuidFromItemId(inventoryId, itemData, category, slotId)
    local outItem = DataView.ArrayBuffer(8 * 13)
    local success = Citizen.InvokeNative(0x886DFD3E185C8A89, inventoryId, itemData and itemData or 0, category, slotId, outItem:Buffer())
    return success and outItem or nil;
end
 
 
function addWeaponInventoryItem(itemHash, slotHash)
    local addReason = GetHashKey("ADD_REASON_DEFAULT");
    local inventoryId = 1; -- INVENTORY_SP_PLAYER
  
    local isValid = ItemdatabaseIsKeyValid(itemHash, 0)
    if not isValid then return false end
  
    local characterItem = getGuidFromItemId(inventoryId, nil, GetHashKey("CHARACTER"), 0xA1212100);
    if not characterItem then return false end
  
    local unkStruct = getGuidFromItemId(inventoryId, characterItem:Buffer(), 923904168, -740156546);
    if not unkStruct then return false end

    local weaponItem = getGuidFromItemId(inventoryId, unkStruct:Buffer(), WeaponHash, -1591664384);
    if not weaponItem then return false end
  
    -- WE CANT DO SAME FOR WRAP TINT IDK WHY BUT WORKS WITHOUT THIS 
    local gripItem;
    if slotHash == 0x57575690 then
      gripItem = getGuidFromItemId(inventoryId, weaponItem:Buffer(), GetHashKey(baseMentHash), -1591664384);
      if not gripItem then return false end
    end
 
    local itemData = DataView.ArrayBuffer(8 * 13)
 
    local isAdded = InventoryAddItemWithGuid(inventoryId, itemData:Buffer(), (slotHash == 0x57575690) and gripItem:Buffer() or weaponItem:Buffer(), itemHash, slotHash, 1, addReason);
    if not  isAdded then return false end
  
    local equipped = InventoryEquipItemWithGuid(inventoryId, itemData:Buffer(), true);
  
    return equipped
end
 
 

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local _strblob = string.blob or function(length)
  return string.rep("\0", math.max(40 + 1, length))
end
function delete_obj(obj)
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

DataView = {
  EndBig = ">",
  EndLittle = "<",
  Types = {
      Int8 = { code = "i1", size = 1 },
      Uint8 = { code = "I1", size = 1 },
      Int16 = { code = "i2", size = 2 },
      Uint16 = { code = "I2", size = 2 },
      Int32 = { code = "i4", size = 4 },
      Uint32 = { code = "I4", size = 4 },
      Int64 = { code = "i8", size = 8 },
      Uint64 = { code = "I8", size = 8 },

      LuaInt = { code = "j", size = 8 }, -- a lua_Integer
      UluaInt = { code = "J", size = 8 }, -- a lua_Unsigned
      LuaNum = { code = "n", size = 8}, -- a lua_Number
      Float32 = { code = "f", size = 4 }, -- a float (native size)
      Float64 = { code = "d", size = 8 }, -- a double (native size)
      String = { code = "z", size = -1, }, -- zero terminated string
  },

  FixedTypes = {
      String = { code = "c", size = -1, }, -- a fixed-sized string with n bytes
      Int = { code = "i", size = -1, }, -- a signed int with n bytes
      Uint = { code = "I", size = -1, }, -- an unsigned int with n bytes
  },
}
DataView.__index = DataView

local function _ib(o, l, t) return ((t.size < 0 and true) or (o + (t.size - 1) <= l)) end
local function _ef(big) return (big and DataView.EndBig) or DataView.EndLittle end

local SetFixed = nil

function DataView.ArrayBuffer(length)
  return setmetatable({
      offset = 1, length = length, blob = _strblob(length)
  }, DataView)
end

function DataView.Wrap(blob)
  return setmetatable({
      offset = 1, blob = blob, length = blob:len(),
  }, DataView)
end

function DataView:Buffer() return self.blob end
function DataView:ByteLength() return self.length end
function DataView:ByteOffset() return self.offset end
function DataView:SubView(offset)
  return setmetatable({
      offset = offset, blob = self.blob, length = self.length,
  }, DataView)
end

for label,datatype in pairs(DataView.Types) do
  DataView["Get" .. label] = function(self, offset, endian)
      local o = self.offset + offset
      if _ib(o, self.length, datatype) then
          local v,_ = string.unpack(_ef(endian) .. datatype.code, self.blob, o)
          return v
      end
      return nil
  end

  DataView["Set" .. label] = function(self, offset, value, endian)
      local o = self.offset + offset
      if _ib(o, self.length, datatype) then
          return SetFixed(self, o, value, _ef(endian) .. datatype.code)
      end
      return self
  end

  if datatype.size >= 0 and string.packsize(datatype.code) ~= datatype.size then
      local msg = "Pack size of %s (%d) does not match cached length: (%d)"
      error(msg:format(label, string.packsize(fmt[#fmt]), datatype.size))
      return nil
  end
end

for label,datatype in pairs(DataView.FixedTypes) do
  DataView["GetFixed" .. label] = function(self, offset, typelen, endian)
      local o = self.offset + offset
      if o + (typelen - 1) <= self.length then
          local code = _ef(endian) .. "c" .. tostring(typelen)
          local v,_ = string.unpack(code, self.blob, o)
          return v
      end
      return nil -- Out of bounds
  end

  DataView["SetFixed" .. label] = function(self, offset, typelen, value, endian)
      local o = self.offset + offset
      if o + (typelen - 1) <= self.length then
          local code = _ef(endian) .. "c" .. tostring(typelen)
          return SetFixed(self, o, value, code)
      end
      return self
  end
end

SetFixed = function(self, offset, value, code)
  local fmt = { }
  local values = { }
  if self.offset < offset then
      local size = offset - self.offset
      fmt[#fmt + 1] = "c" .. tostring(size)
      values[#values + 1] = self.blob:sub(self.offset, size)
  end

  fmt[#fmt + 1] = code
  values[#values + 1] = value
  local ps = string.packsize(fmt[#fmt])
  if (offset + ps) <= self.length then
      local newoff = offset + ps
      local size = self.length - newoff + 1

      fmt[#fmt + 1] = "c" .. tostring(size)
      values[#values + 1] = self.blob:sub(newoff, self.length)
  end

  self.blob = string.pack(table.concat(fmt, ""), table.unpack(values))
  self.length = self.blob:len()
  return self
end
