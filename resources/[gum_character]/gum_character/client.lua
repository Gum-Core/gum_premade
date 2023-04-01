local active_buttons_create_select = false
local active_buttons_create_make = true
local buttons_prompt = GetRandomIntInRange(0, 0xffffff)
local buttons_prompt_2 = GetRandomIntInRange(0, 0xffffff)
local heading = -83.32
local z_position = 239.35
local Skin_Table = {}
local Clothe_Table = {}
local Beard_Table = {}
local Hair_Table = {}
local zoom = 50.0
local hair_write = -1
local beard_write = -1
local HeadCategory = 1
local HeadTexture = 1
local BodyTexture = 1
local LegsTexture = 1
local Gauntlet_set = 0
local Accesori_set = 0
local HeadType = 0
local BodyType = 1
local LegsType = 0
local HeadSize = 0
local EyeBrowH = 0
local EyeBrowW = 0
local EyeBrowD = 0
local EarsH = 0
local EarsW = 0
local EarsD = 0
local EarsL = 0
local EyeLidH = 0
local EyeLidW = 0
local EyeD = 0
local EyeAng = 0
local EyeDis = 0
local EyeH = 0
local NoseW = 0
local NoseS = 0
local NoseH = 0
local NoseAng = 0
local NoseC = 0
local NoseDis = 0
local CheekBonesH = 0
local CheekBonesW = 0
local CheekBonesD = 0
local MouthW = 0
local MouthD = 0
local MouthX = 0
local MouthY = 0
local ULiphH = 0
local ULiphW = 0
local ULiphD = 0
local LLiphH = 0
local LLiphW = 0
local LLiphD = 0
local JawH = 0
local JawW = 0
local JawD = 0
local ChinH = 0
local ChinW = 0
local ChinD = 0
local Beard = -1
local Hair = -1
local Body = 1
local Waist = 1
local Eyes = 1
local Scale = 100
local current_texture_settings = Config.texture_types["male"]
local textureId = -1
local is_overlay_change_active = false
local scars_enable = 1
local scars_texture = 1
local scars_opacity = 10
local blush_enable = 1
local blush_texture = 1
local blush_opacity = 10
local blush_color_1 = 0.0
local shadow_enable = 1
local shadow_color_1 = 0
local shadow_color_2 = 0
local shadow_color_3 = 0
local shadow_texture = 1
local shadow_opacity = 10
local eyeliners_enable = 0
local eyeliners_color_1 = 0
local eyeliners_color_2 = 0
local eyeliners_color_3 = 0
local eyeliners_texture = 1
local eyeliners_opacity = 10
local lipsticks_enable = 0
local lipsticks_color_1 = 0
local lipsticks_color_2 = 0
local lipsticks_color_3 = 0
local lipsticks_texture = 1
local lipsticks_opacity = 10
local spots_enable = 0
local spots_texture = 1
local spots_opacity = 10
local disc_enable = 0
local disc_texture = 1
local disc_opacity = 10
local complex_enable = 0
local complex_texture = 1
local complex_opacity = 10
local acne_visibility = 0
local acne_texture = 1
local acne_opacity = 10
local ageing_enable = 0
local ageing_texture = 1
local ageing_opacity = 10
local freckles_enable = 0
local freckles_texture = 1
local freckles_opacity = 10
local moles_enable = 0
local moles_texture = 1
local moles_opacity = 10
local eyebrows_enable = 0
local eyebrows_texture = 1
local eyebrows_opacity = 10
local eyebrows_color_1 = 0
local beardstabble_enable = 0
local beardstabble_texture = 1
local beardstabble_opacity = 10
local beardstabble_color_1 = 0
local HatsTable= {}
local EyewearTable = {}
local ScarftTable = {}
local MaskTable = {}
local NecktieTable = {}
local ShirtTable = {}
local SuspenderTable = {}
local VestTable = {}
local CoatTable = {}
local ClosedCoatTable = {}
local PonchoTable = {}
local CloakTable = {}
local GloveTable = {}
local RRingTable = {}
local SpatsTable = {}
local LRingTable = {}
local LoadoutsTable = {}
local BraceletTable = {}
local GunbeltTable = {}
local GunbeltAcsTable = {}
local BeltsTable = {}
local BucklesTable = {}
local LHolsterTable = {}
local SkirtTable = {}
local RHolsterTable = {}
local PantTable = {}
local ChapTable = {}
local BootTable = {}
local SpurTable = {}
local SatchelTable = {}
local GauntletTable = {}
local AccesorieTable  = {}
local Coord_Table = {}
local Satchel_set = 0
local hats_set = 0
local eyewear_set = 0
local Scarf_set = 0
local GunbeltAcs_set = 0
local Mask_set = 0
local Spat_set = 0
local Necktie_set = 0
local Shirt_set = 0
local Skirt_set = 0
local Suspender_set = 0
local Vest_set = 0
local Coat_set = 0
local CCoat_set = 0
local Poncho_set = 0
local Loadouts_set = 0
local Cloak_set = 0
local Glove_set = 0
local RRing_set = 0
local LRing_set = 0
local Bracelet_set = 0
local Gunbelt_set = 0
local Belt_set = 0
local Buckles_set = 0
local LHolster_set = 0
local Pant_set = 0
local Chap_set = 0
local Boot_set = 0
local Spur_set = 0
local have_character = true
local firstname = ""
local lastname = ""
local isDead = false
local reload_data = 0
local is_loaded_character = false
TriggerEvent("gum_menu:getData",function(call)
    MenuData = call
end)

RegisterNetEvent('gum_character:check_char')
AddEventHandler('gum_character:check_char', function(have)
    have_character = have
end)
RegisterNetEvent('gum_character:hairPomade')
AddEventHandler('gum_character:hairPomade', function()
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), tonumber(0x9925C067)) then
        TaskItemInteraction(PlayerPedId(), 0, GetHashKey("APPLY_POMADE_WITH_HAT"), 1, 0, -1082130432)
    else
        TaskItemInteraction(PlayerPedId(), 0, GetHashKey("APPLY_POMADE_WITH_NO_HAT"), 1, 0, -1082130432)
    end
    Wait(1500)
    Citizen.InvokeNative(0x66B957AAC2EAAEAB, PlayerPedId(), Skin_Table["Hair"], GetHashKey("POMADE"), 0, true, 1)
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)  

RegisterNetEvent('gum_character:selected_char')
AddEventHandler('gum_character:selected_char', function()
    is_loaded_character = true
end)

function getMaleFromLang()
	return _U('175')
end
RegisterNetEvent('gum_character:saveBarberAction')
AddEventHandler('gum_character:saveBarberAction', function(skin_table_receive)
    Skin_Table = skin_table_receive
end)

RegisterNetEvent('gum_character:send_data_back')
AddEventHandler('gum_character:send_data_back', function(skin_table_receive, outfit_table_receive, coord_table_receive, isdeaded, update, new_char)
    Skin_Table = skin_table_receive
    Clothe_Table = outfit_table_receive
    Coord_Table = coord_table_receive
    isDead = isdeaded
    Citizen.Wait(0)
    if Config.Debug then
        TriggerEvent("gum_character:setToTrue")
        EndCam()
        FreezeEntityPosition(PlayerPedId(), true)
        Citizen.InvokeNative(0xF808475FA571D823, true)
        Citizen.InvokeNative(0xBF25EB89375A37AD, 5, GetHashKey("PLAYER"), GetHashKey("PLAYER"))
        FreezeEntityPosition(PlayerPedId(), false)
        exports['gum_character']:loading(false)
        SendNUIMessage({type = "volume_stop",status = true,})
        TriggerServerEvent("gum_character:send_save_func")
        TriggerEvent("gum_inventory:can_save")
        Citizen.Wait(500)
        SetEntityCoords(PlayerPedId(), Coord_Table.x, Coord_Table.y, Coord_Table.z-1.0)
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, 150.0)
        Citizen.Wait(2000)
        ReloadCloth()
    else
        if update == true then
            SetEntityCoords(PlayerPedId(), Coord_Table.x, Coord_Table.y, Coord_Table.z-1.0)
            FreezeEntityPosition(PlayerPedId(), true)
            SetEntityVisible(PlayerPedId(), false)
            ReloadCloth()
            Citizen.InvokeNative(0xF808475FA571D823, true)
            Citizen.InvokeNative(0xBF25EB89375A37AD, 5, GetHashKey("PLAYER"), GetHashKey("PLAYER"))
            FreezeEntityPosition(PlayerPedId(), false)
            Citizen.Wait(500)
            while is_loaded_character == false do
                Citizen.Wait(10)
            end
            startanim("script_rc@bch2@leadout@rsc_6", "wakeup_slow_charles", -1, 0)
            Citizen.Wait(200)
            exports['gum_character']:loading(false)
            SetEntityVisible(PlayerPedId(), true)
            SendNUIMessage({
                type = "volume_stop",
                status = true,
            })
            reload_scars()
            Citizen.Wait(200)
            local GetCoords = GetEntityCoords(PlayerPedId())
            if GetDistanceBetweenCoords(GetCoords.x, GetCoords.y, GetCoords.z, 2946.486328125, -2084.0859375, 49.65571594238281, false) < 50.0 then
                SetEntityCoords(PlayerPedId(), 1258.91, -1291.45, 75.66-1.0)
            end
            TriggerServerEvent("gum_character:send_save_func")
            TriggerEvent("gum_inventory:can_save")
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, 150.0)
        end
    end
end)


exports('loading', function(state)
    SendNUIMessage({
        type = "loading_info",
        status = state,
    })
end)


RegisterCommand('db', function()
    local stamina = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1) --health
    local health = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 0) --health
    if stamina ~= nil and stamina ~= false and health ~= nil and health ~= false then
        if tonumber(stamina) >= 49 and tonumber(health) >= 49 then
            ReloadCloth()
        end
    end
    DetachEntity(PlayerPedId(), 1, 1)
    ClearPedTasks(PlayerPedId())
end)

RegisterCommand('dbs', function()
    local stamina = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1) --health
    local health = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 0) --health
    if stamina ~= nil and stamina ~= false and health ~= nil and health ~= false then
        Data_Character_Load(nil)
    end
end)

function Make_Data(gender)
    if gender == _U('175') then
        Skin_Table["sex"] = "mp_male"
        for k,v in pairs(Config_2.Clothes) do
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "hair" then
                table.insert(Hair_Table, {hash = v.hash, category_hash = v.category_hash, cat = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and tonumber(v.category_hash) == tonumber('0xF8016BCA') then
                table.insert(Beard_Table, {hash = v.hash, category_hash = v.category_hash, cat = v.hash_dec_signed})
            end
        end
    else
        Skin_Table["sex"] = "mp_female"
        for k,v in pairs(Config_2.Clothes) do
            if v["ped_type"] == "female" and v["is_multiplayer"] == true and v.category_hashname == "hair" then
                table.insert(Hair_Table, {hash = v.hash, category_hash = v.category_hash, cat = v.hash_dec_signed})
            end
        end
    end

    Skin_Table["HeadType"] = 0
    Skin_Table["BodyType"] = 0
    Skin_Table["LegsType"] = 0
    Skin_Table["Nation"] = 0

    Skin_Table["HeadSize"] = 0.0

    Skin_Table["EyeBrowH"] = 0.0
    Skin_Table["EyeBrowW"] = 0.0
    Skin_Table["EyeBrowD"] = 0.0

    Skin_Table["EarsH"] = 0.0
    Skin_Table["EarsW"] = 0.0
    Skin_Table["EarsD"] = 0.0
    Skin_Table["EarsL"] = 0.0

    Skin_Table["EyeLidH"] = 0.0
    Skin_Table["EyeLidW"] = 0.0

    Skin_Table["EyeD"] = 0.0
    Skin_Table["EyeAng"] = 0.0
    Skin_Table["EyeDis"] = 0.0
    Skin_Table["EyeH"] = 0.0

    Skin_Table["NoseW"] = 0.0
    Skin_Table["NoseS"] = 0.0
    Skin_Table["NoseH"] = 0.0
    Skin_Table["NoseAng"] = 0.0
    Skin_Table["NoseC"] = 0.0
    Skin_Table["NoseDis"] = 0.0

    Skin_Table["CheekBonesH"] = 0.0
    Skin_Table["CheekBonesW"] = 0.0
    Skin_Table["CheekBonesD"] = 0.0

    Skin_Table["MouthW"] = 0.0
    Skin_Table["MouthD"] = 0.0
    Skin_Table["MouthX"] = 0.0
    Skin_Table["MouthY"] = 0.0

    Skin_Table["ULiphH"] = 0.0
    Skin_Table["ULiphW"] = 0.0
    Skin_Table["ULiphD"] = 0.0

    Skin_Table["LLiphH"] = 0.0
    Skin_Table["LLiphW"] = 0.0
    Skin_Table["LLiphD"] = 0.0

    Skin_Table["JawH"] = 0.0
    Skin_Table["JawW"] = 0.0
    Skin_Table["JawD"] = 0.0

    Skin_Table["ChinH"] = 0.0
    Skin_Table["ChinW"] = 0.0
    Skin_Table["ChinD"] = 0.0

    Skin_Table["Beard"] = -1
    Skin_Table["Hair"] = -1
    Skin_Table["Body"] = 0
    Skin_Table["Waist"] = 0
    Skin_Table["Eyes"] = 0
    Skin_Table["Scale"] = 1.0

    Skin_Table["scars_visibility"] = 1
    Skin_Table["scars_tx_id"] = 1
    Skin_Table["scars_opacity"] = 0

    Skin_Table["spots_visibility"] = 1
    Skin_Table["spots_tx_id"] = 1
    Skin_Table["spots_opacity"] = 0

    Skin_Table["disc_visibility"] = 1
    Skin_Table["disc_tx_id"] = 1
    Skin_Table["disc_opacity"] = 0

    Skin_Table["complex_visibility"] = 1
    Skin_Table["complex_tx_id"] = 1
    Skin_Table["complex_opacity"] = 0

    Skin_Table["acne_visibility"] = 1
    Skin_Table["acne_tx_id"] = 1
    Skin_Table["acne_opacity"] = 0

    Skin_Table["ageing_visibility"] = 1
    Skin_Table["ageing_tx_id"] = 1
    Skin_Table["ageing_opacity"] = 0

    Skin_Table["freckles_visibility"] = 1
    Skin_Table["freckles_tx_id"] = 1
    Skin_Table["freckles_opacity"] = 0

    Skin_Table["moles_visibility"] = 1
    Skin_Table["moles_tx_id"] = 1
    Skin_Table["moles_opacity"] = 0

    Skin_Table["eyebrows_visibility"] = 1
    Skin_Table["eyebrows_tx_id"] = 1
    Skin_Table["eyebrows_opacity"] = 0.0
    Skin_Table["eyebrows_color"] = 0

    Skin_Table["lipsticks_visibility"] = 1
    Skin_Table["lipsticks_tx_id"] = 1
    Skin_Table["lipsticks_opacity"] = 0.0
    Skin_Table["lipsticks_color_1"] = 0
    Skin_Table["lipsticks_color_2"] = 0
    Skin_Table["lipsticks_color_3"] = 0

    Skin_Table["shadows_visibility"] = 1
    Skin_Table["shadows_opacity"] = 0.0
    Skin_Table["shadows_tx_id"] = 1
    Skin_Table["shadows_color_1"] = 0
    Skin_Table["shadows_color_2"] = 0
    Skin_Table["shadows_color_3"] = 0

    Skin_Table["beardstabble_visibility"] = 1
    Skin_Table["beardstabble_opacity"] = 0.0
    Skin_Table["beardstabble_tx_id"] = 1
    Skin_Table["beardstabble_color_1"] = 0

    Skin_Table["eyeliners_visibility"] = 1
    Skin_Table["eyeliners_opacity"] = 0.0
    Skin_Table["eyeliners_tx_id"] = 1
    Skin_Table["eyeliners_color_1"] = 0
    Skin_Table["eyeliners_color_2"] = 0
    Skin_Table["eyeliners_color_3"] = 0

    Skin_Table["blush_visibility"] = 1
    Skin_Table["blush_opacity"] = 0.0
    Skin_Table["blush_tx_id"] = 1
    Skin_Table["blush_color_1"] = 0

    Clothe_Table["Hat"] = -1
    Clothe_Table["EyeWear"] = -1
    Clothe_Table["Mask"] = -1
    Clothe_Table["NeckWear"] = -1
    Clothe_Table["NeckTies"] = -1
    Clothe_Table["Shirt"] = -1
    Clothe_Table["Suspender"] = -1
    Clothe_Table["Vest"] = -1
    Clothe_Table["Coat"] = -1
    Clothe_Table["Poncho"] = -1
    Clothe_Table["Cloak"] = -1
    Clothe_Table["Glove"] = -1
    Clothe_Table["RingRh"] = -1
    Clothe_Table["RingLh"] = -1
    Clothe_Table["Bracelet"] = -1
    Clothe_Table["Gunbelt"] = -1
    Clothe_Table["Belt"] = -1
    Clothe_Table["Buckle"] = -1
    Clothe_Table["Holster"] = -1
    Clothe_Table["Pant"] = -1
    Clothe_Table["Skirt"] = -1
    Clothe_Table["Chap"] = -1
    Clothe_Table["Boots"] = -1
    Clothe_Table["Spurs"] = -1
    Clothe_Table["Spats"] = -1
    Clothe_Table["GunbeltAccs"] = -1
    Clothe_Table["Gauntlets"] = -1
    Clothe_Table["Loadouts"] = -1
    Clothe_Table["Accessories"] = -1
    Clothe_Table["Satchels"] = -1
    Clothe_Table["CoatClosed"] = -1
end

function Button_Prompt()
	Citizen.CreateThread(function()
        local str = ''.._U('167')..''
        ChangeCharPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(ChangeCharPrompt, 0x27D1C284)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(ChangeCharPrompt, str)
        PromptSetEnabled(ChangeCharPrompt, true)
        PromptSetVisible(ChangeCharPrompt, true)
        PromptSetHoldMode(ChangeCharPrompt, true)
        PromptSetGroup(ChangeCharPrompt, buttons_prompt)
        PromptRegisterEnd(ChangeCharPrompt)
	end)
    Citizen.CreateThread(function()
        local str = ''.._U('168')..''
        SelectPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(SelectPrompt, 0x0522B243)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(SelectPrompt, str)
        PromptSetEnabled(SelectPrompt, true)
        PromptSetVisible(SelectPrompt, true)
        PromptSetHoldMode(SelectPrompt, true)
        PromptSetGroup(SelectPrompt, buttons_prompt)
        PromptRegisterEnd(SelectPrompt)
	end)
end
function Button_Prompt_2()
	Citizen.CreateThread(function()
		local str = ''.._U('169')..''
		RotateLPrompt = PromptRegisterBegin()
		PromptSetControlAction(RotateLPrompt, 0x20190AB4)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(RotateLPrompt, str)
		PromptSetEnabled(RotateLPrompt, true)
		PromptSetVisible(RotateLPrompt, true)
		PromptSetHoldMode(RotateLPrompt, true)
        PromptSetGroup(RotateLPrompt, buttons_prompt_2)
		PromptRegisterEnd(RotateLPrompt)
	end)
	Citizen.CreateThread(function()
		local str = ''.._U('170')..''
		RotateRPrompt = PromptRegisterBegin()
		PromptSetControlAction(RotateRPrompt, 0xDEB34313)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(RotateRPrompt, str)
		PromptSetEnabled(RotateRPrompt, true)
		PromptSetVisible(RotateRPrompt, true)
		PromptSetHoldMode(RotateRPrompt, true)
        PromptSetGroup(RotateRPrompt, buttons_prompt_2)
		PromptRegisterEnd(RotateRPrompt)
	end)
    Citizen.CreateThread(function()
		local str = ''.._U('171')..''
		UpPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(UpPrompt, 0x05CA7C52)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(UpPrompt, str)
		PromptSetEnabled(UpPrompt, true)
		PromptSetVisible(UpPrompt, true)
		PromptSetHoldMode(UpPrompt, true)
		PromptSetGroup(UpPrompt, buttons_prompt_2)
		PromptRegisterEnd(UpPrompt)
	end)
	Citizen.CreateThread(function()
		local str = ''.._U('172')..''
		DownPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(DownPrompt, 0x6319DB71)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(DownPrompt, str)
		PromptSetEnabled(DownPrompt, true)
		PromptSetVisible(DownPrompt, true)
		PromptSetHoldMode(DownPrompt, true)
		PromptSetGroup(DownPrompt, buttons_prompt_2)
		PromptRegisterEnd(DownPrompt)
	end)
    Citizen.CreateThread(function()
        local str = ''.._U('173')..''
        Zoom1Prompt = PromptRegisterBegin()
        PromptSetControlAction(Zoom1Prompt, 0xE885EF16)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(Zoom1Prompt, str)
        PromptSetEnabled(Zoom1Prompt, true)
        PromptSetVisible(Zoom1Prompt, true)
        PromptSetHoldMode(Zoom1Prompt, true)
        PromptSetGroup(Zoom1Prompt, buttons_prompt_2)
        PromptRegisterEnd(Zoom1Prompt)
    end)
    Citizen.CreateThread(function()
        local str = ''.._U('174')..''
        Zoom2Prompt = PromptRegisterBegin()
        PromptSetControlAction(Zoom2Prompt, 0x2277FAE9)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(Zoom2Prompt, str)
        PromptSetEnabled(Zoom2Prompt, true)
        PromptSetVisible(Zoom2Prompt, true)
        PromptSetHoldMode(Zoom2Prompt, true)
        PromptSetGroup(Zoom2Prompt, buttons_prompt_2)
        PromptRegisterEnd(Zoom2Prompt)
    end)
end
RegisterNetEvent('gum_character:send_character')
AddEventHandler('gum_character:send_character', function()
    TriggerServerEvent("gum_character:check_character")
end)

RegisterNetEvent('gum_character:make_character')
AddEventHandler('gum_character:make_character', function()
    TriggerEvent("gum_character:del_old")
    Citizen.InvokeNative(0x17E0198B3882C2CB, PlayerPedId())
    Button_Prompt()
    Button_Prompt_2()
    Citizen.Wait(500)
    Citizen.InvokeNative(0x9E211A378F95C97C, 183712523)
    Citizen.InvokeNative(0x9E211A378F95C97C, -1699673416)
    Citizen.InvokeNative(0x9E211A378F95C97C, 1679934574)
    Citizen.Wait(1500)
    SetEntityCoords(PlayerPedId(), -563.77, -3776.49, 238.56)
    Citizen.Wait(1000)
    SelectChar()
    StartCam(-560.51, -3776.08, 239.35, -90.00, 50.0)
    SetClockTime(12, 00, 00)
    SetEntityCoords(PlayerPedId(), -563.77, -3776.49, 238.56)
    have_character = false
end)


Citizen.CreateThread(function()
    if Config.Debug == true then
        TriggerServerEvent("gum_character:check_character")
        exports['gum_character']:loading(false) 
    else
        Citizen.Wait(1000)
        exports['gum_character']:loading(true) 
        TriggerServerEvent("gum_character:check_character")
        Citizen.Wait(3000)
        if not have_character then
            Citizen.InvokeNative(0x17E0198B3882C2CB, PlayerPedId())
            Button_Prompt()
            Button_Prompt_2()
            Citizen.Wait(500)
            Citizen.InvokeNative(0x9E211A378F95C97C, 183712523)
            Citizen.InvokeNative(0x9E211A378F95C97C, -1699673416)
            Citizen.InvokeNative(0x9E211A378F95C97C, 1679934574)
            Citizen.Wait(1500)
            SelectChar()
            SetEntityCoords(PlayerPedId(), -563.77, -3776.49, 238.56)
            TriggerEvent("gum_inventory:reset_inventory")
            StartCam(-560.51, -3776.08, 239.35, -90.00, 50.0)
            SetClockTime(12, 00, 00)
            SetEntityCoords(PlayerPedId(), -563.77, -3776.49, 238.56)
            TriggerEvent("gum_character:setToTrue")
            exports['gum_character']:loading(false) 
        else
            SetEntityCoords(PlayerPedId(), 270.33380126953125, -4076.84521484375, 215.644775390625)
            -- SetEntityCoords(PlayerPedId(), Coord_Table.x, Coord_Table.y, Coord_Table.z-1.0)
            -- FreezeEntityPosition(PlayerPedId(), true)
            -- SetEntityVisible(PlayerPedId(), false)
            -- reloadCloth()
            -- Citizen.InvokeNative(0xF808475FA571D823, true)
            -- Citizen.InvokeNative(0xBF25EB89375A37AD, 5, GetHashKey("PLAYER"), GetHashKey("PLAYER"))
            -- if Config.WalkFaceStyle then
            --     TriggerEvent("gum_walkingfacestyle:active")
            -- end
            -- FreezeEntityPosition(PlayerPedId(), false)
            -- Citizen.Wait(1000)
            -- playAnim("script_rc@bch2@leadout@rsc_6", "wakeup_slow_charles", -1, 0)
            -- Citizen.Wait(200)
            -- exports['gum_character']:loading(false) 
            -- SetEntityVisible(PlayerPedId(), true)
            -- Citizen.Wait(500)
            -- if Config.WalkFaceStyle then
            --     TriggerEvent("gum_walkingfacestyle:active")
            -- end
            -- local GetCoords = GetEntityCoords(PlayerPedId())
            -- if GetDistanceBetweenCoords(GetCoords.x, GetCoords.y, GetCoords.z, 2946.486328125, -2084.0859375, 49.65571594238281, false) < 50.0 then
            --     SetEntityCoords(PlayerPedId(), 2723.339599609375, -1446.4417724609375, 46.32297897338867-1.0)
            -- end
            -- TriggerServerEvent("gum_character:send_save_func")
        end
    end
end)



function startanim(dict,name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(500)
    end
    TaskPlayAnim(PlayerPedId(), dict, name, 1.0, 1.0, time, flag, 0, true, 0, false, 0, false)  
end

local male_selected = false
local spawm_protect = false
local char_text = ""
local set_dead = false
local TimeToRespawn = Config.TimeToRespawn
local cam = nil
local angleY = 0.0
local angleZ = 0.0

RegisterNetEvent("gum:SelectedCharacter")
AddEventHandler("gum:SelectedCharacter", function(charid)
    Citizen.CreateThread(function()
        while true do 
            Citizen.Wait(1000)
            if IsEntityDead(PlayerPedId()) then
                if not set_dead then
                    set_dead = true
                    TimeToRespawn = Config.TimeToRespawn
                    Citizen.InvokeNative(0xD63FE3AF9FB3D53F, true)
                    Citizen.InvokeNative(0x1B3DA717B9AFF828, true)
                    ExecuteCommand("hud")
                    StartDeathCam()
                end
                if set_dead then
                    exports["spawnmanager"].setAutoSpawn(false)
                    TimeToRespawn = TimeToRespawn-1
                end
            else
                Citizen.InvokeNative(0x25ACFC650B65C538, PlayerPedId(), Skin_Table["Scale"])
                Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
            end
        end
    end)
end)
function StartDeathCam()
    Citizen.CreateThread(function()
        ClearFocus()
        local playerPed = PlayerPedId()
        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", GetEntityCoords(playerPed), 0, 0, 0, GetGameplayCamFov())
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 1000, true, false)
    end)
end

RegisterNetEvent("gum:SelectedCharacter")
AddEventHandler("gum:SelectedCharacter", function(charid)
    Citizen.CreateThread(function()
        while true do 
            optimalization = 1000
            if isDead then
                SetEntityHealth(PlayerPedId(), 0.0)
                isDead = true
            end
            if IsEntityDead(PlayerPedId()) then
                carrier = Citizen.InvokeNative(0x09B83E68DE004CD4, PlayerPedId());
                optimalization = 5 
                if (cam and IsEntityDead(PlayerPedId())) then
                    ProcessCamControls()
                end
                if isDead == false then
                    TriggerServerEvent("gum_character:dead_state", true)
                    isDead = true
                end
                local GetCoords = GetEntityCoords(PlayerPedId())
                if carrier then
                    DrawText3D(GetCoords.x,GetCoords.y,GetCoords.z+0.20, "Právě tě někdo nese. Nemůžeš vstát.")
                else
                    if TimeToRespawn <= 0 then
                        DrawText3D(GetCoords.x,GetCoords.y,GetCoords.z+0.20, "Stiskni [ R ] pro oživení a PK.")
                        if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x27D1C284) then
                            TriggerEvent("gum_character:revive_player", PlayerPedId(), 0)
                            TriggerServerEvent("gum_doctor:log_send")
                            Citizen.Wait(2000)
                        end
                    else
                        DrawText3D(GetCoords.x,GetCoords.y,GetCoords.z+0.20, "Oživit se můžeš za "..TimeToRespawn.." s \n [ W ][ A ][ S ][ D ] Pohyb kamerou")
                    end
                end
            else
                optimalization = 2000 
                spawned = false
            end
            Citizen.Wait(optimalization)
        end
    end)
end)

RegisterNetEvent('gum_character:revive_player')
AddEventHandler('gum_character:revive_player', function(id, where)
    TriggerEvent("gum_reviveMeta:toHalf")
    if tonumber(where) == 0 then
        for k,v in pairs(Config.RespawnCoords) do
            local GetCoords = GetEntityCoords(PlayerPedId())
            if GetDistanceBetweenCoords(GetCoords.x, GetCoords.y, GetCoords.z, v.x, v.y, v.z, false) < 1000.0 and set_dead == true then
                TriggerServerEvent("gum_character:dead_state", false)
                isDead = false
                set_dead = false
                SetEntityCoords(PlayerPedId(), v.x, v.y, v.z)
                FreezeEntityPosition(ped, true)
                EndDeathCam()
                NetworkSetInSpectatorMode(false, GetPlayerPed(PlayerPedId()))

                local pl = Citizen.InvokeNative(0x217E9DC48139933D)
                local ped = Citizen.InvokeNative(0x275F255ED201B937, pl)
                Citizen.InvokeNative(0x71BC8E838B9C6035, ped)
                Citizen.InvokeNative(0x0E3F4AF2D63491FB)
                TimeToRespawn = Config.TimeToRespawn
                ExecuteCommand("hud")
                Citizen.Wait(3000)
                FreezeEntityPosition(ped, false)
                Citizen.InvokeNative(0xF808475FA571D823, true)
                Citizen.InvokeNative(0xBF25EB89375A37AD, 5, GetHashKey("PLAYER"), GetHashKey("PLAYER"))
                spawned = true
            end
        end
        Citizen.Wait(500)
        for k,v in pairs(Config.RespawnCoords) do
            local GetCoords = GetEntityCoords(PlayerPedId())
            if GetDistanceBetweenCoords(GetCoords.x, GetCoords.y, GetCoords.z, v.x, v.y, v.z, false) < 3000.0 and set_dead == true and not spawned then
                TriggerServerEvent("gum_character:dead_state", false)
                isDead = false
                set_dead = false
                SetEntityCoords(PlayerPedId(), v.x, v.y, v.z)
                FreezeEntityPosition(ped, true)
                EndDeathCam()
                NetworkSetInSpectatorMode(false, GetPlayerPed(PlayerPedId()))

                local pl = Citizen.InvokeNative(0x217E9DC48139933D)
                local ped = Citizen.InvokeNative(0x275F255ED201B937, pl)
                Citizen.InvokeNative(0x71BC8E838B9C6035, ped)
                Citizen.InvokeNative(0x0E3F4AF2D63491FB)
                TimeToRespawn = Config.TimeToRespawn
                ExecuteCommand("hud")
                Citizen.Wait(3000)
                FreezeEntityPosition(ped, false)
                Citizen.InvokeNative(0xBF25EB89375A37AD, 5, GetHashKey("PLAYER"), GetHashKey("PLAYER"))
                spawned = true
            end
        end
    else
        TriggerServerEvent("gum_character:dead_state", false)
        isDead = false
        EndDeathCam()
        NetworkSetInSpectatorMode(false, GetPlayerPed(PlayerPedId()))
        local pl = Citizen.InvokeNative(0x217E9DC48139933D)
        local ped = Citizen.InvokeNative(0x275F255ED201B937, pl)
        FreezeEntityPosition(ped, false)
        Citizen.InvokeNative(0x71BC8E838B9C6035, ped)
        Citizen.InvokeNative(0x0E3F4AF2D63491FB)
        Citizen.InvokeNative(0xF808475FA571D823, true)
        set_dead = false
        TimeToRespawn = Config.TimeToRespawn
        ExecuteCommand("hud")
        Citizen.InvokeNative(0xBF25EB89375A37AD, 5, GetHashKey("PLAYER"), GetHashKey("PLAYER"))
    end
end)

function EndDeathCam()
    Citizen.CreateThread(function()
        NetworkSetInSpectatorMode(false, PlayerPedId())
        ClearFocus()
        RenderScriptCams(false, false, 0, true, false)
        DestroyCam(cam, false)
        cam = nil
    end)
end

function ProcessCamControls()
    Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local newPos = ProcessNewPosition()
        SetCamCoord(cam, newPos.x, newPos.y, newPos.z)
        PointCamAtCoord(cam, playerCoords.x, playerCoords.y, playerCoords.z + 0.5)
    end)
end

function ProcessNewPosition()
    local mouseX = 0.0
    local mouseY = 0.0
    if (IsInputDisabled(0)) then
        mouseX = GetDisabledControlNormal(1, 0x4D8FB4C1) * 1.5
        mouseY = GetDisabledControlNormal(1, 0xFDA83190) * 1.5
    else
        mouseX = GetDisabledControlNormal(1, 0x4D8FB4C1) * 0.5
        mouseY = GetDisabledControlNormal(1, 0xFDA83190) * 0.5
    end
    angleZ = angleZ - mouseX
    angleY = angleY + mouseY

    if (angleY > 89.0) then angleY = 89.0 elseif (angleY < -89.0) then angleY = -89.0 end
    local pCoords = GetEntityCoords(PlayerPedId())
    local behindCam = {
        x = pCoords.x + ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * (3.0 + 0.5),
        y = pCoords.y + ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * (3.0 + 0.5),
        z = pCoords.z + ((Sin(angleY))) * (3.0 + 0.5)
    }
    local rayHandle = StartShapeTestRay(pCoords.x, pCoords.y, pCoords.z + 0.5, behindCam.x, behindCam.y, behindCam.z, -1, PlayerPedId(), 0)
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


Citizen.CreateThread(function()
    while true do
        if not have_character then
            local UpScrollMouse = {`INPUT_CREATOR_LT`, `INPUT_PREV_WEAPON`}
            local DownScrollMouse = {`INPUT_CREATOR_RT`, `INPUT_NEXT_WEAPON`}
            if prop1 == nil then--
                prop1 = CreateObject(GetHashKey("p_lampfactory04x"), -562.7855834960938, -3782.244384765625, 240.480224609375, false, false, false)
            end
            if prop2 == nil then
                prop2 = CreateObject(GetHashKey("p_lamp35x"), -561.9463500976562, -3783.029541015625, 237.6020050048828, false, false, false)
            end
            if prop3 == nil then
                prop3 = CreateObject(GetHashKey("p_lamp35x"), -561.9929809570312, -3781.240966796875, 237.6020050048828, false, false, false)
            end
            if compareChar == nil then
                while not HasModelLoaded("re_prisonwagon_males_01") do
                    Wait(0)
                    Citizen.CreateThread(function()
                        RequestModel("re_prisonwagon_males_01")
                    end)
                end
                compareChar = CreatePed(GetHashKey("re_prisonwagon_males_01"), -563.4608764648438, -3783.357421875, 238.59747314453125, -92.6, false, false, false, false)
                while not DoesEntityExist(compareChar) do
                    Wait(0)
                end
            end
            DrawLightWithRange(tonumber(string.format("%.2f", -562.88)), tonumber(string.format("%.2f", -3782.36)), tonumber(string.format("%.2f", 240.49)), 255, 255, 255, tonumber(string.format("%.2f", 10.0)), tonumber(string.format("%.2f", 20.0)))
            DrawLightWithRange(tonumber(string.format("%.2f", -559.25)), tonumber(string.format("%.2f", -3776.16)), tonumber(string.format("%.2f", 240.49)), 255, 255, 255, tonumber(string.format("%.2f", 10.0)), tonumber(string.format("%.2f", 20.0)))
            opt = 5
            if active_buttons_create_select == false then
                local create_char = CreateVarString(10, 'LITERAL_STRING', "".._U('177').." "..char_text.."")
                PromptSetActiveGroupThisFrame(buttons_prompt, create_char)
            end
            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x27D1C284) then
                if not spawm_protect then
                    spawm_protect = true
                    if male_selected == false then
                        male_selected = true
                        char_text = _U('175')
                        StartCam(-560.05, -3775.77, 239.35, -90.00, 50.0)
                    else
                        male_selected = false
                        char_text = _U('176')
                        StartCam(-560.05, -3776.57, 239.35, -90.00, 50.0)
                    end
                    Citizen.Wait(500)
                    spawm_protect = false
                end
            end
            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x0522B243) then
                if not spawm_protect then
                    if char_text ~= "" then
                        spawm_protect = true
                        DeletePed(PedFemale)
                        DeletePed(PedMale)
                        TakeCharacter(char_text)
                        SetEntityCoords(PlayerPedId(), -563.77, -3776.49, 238.56)
                        active_buttons_create_select = true
                        active_buttons_create_make = false
                        Citizen.Wait(500)
                        Make_Data(char_text)
                        -- load_all_data_clothes(char_text)
                        Citizen.Wait(500)
                        --Open_Basic_Menu()
                        TriggerEvent("gum_creator:new_char", char_text)
                    else
                        exports['gum_notify']:DisplayLeftNotification("".._U('1').."", "".._U('183').."", 'character', 2000)
                    end
                end
            end
            ---MAKE CHARACTER
            DisableControlAction(0, 0x3076E97C, true)
            DisableControlAction(0, 0xCC1075A7, true)
            if active_buttons_create_make == false then
                local create_char = CreateVarString(10, 'LITERAL_STRING', _U('1'))
                PromptSetActiveGroupThisFrame(buttons_prompt_2, create_char)
            end
        else
            opt = 2000
        end
        Citizen.Wait(opt)
    end
end)

RegisterNUICallback('alert_to_notify', function(data, cb)
    if data.type == "name" then
        exports['gum_notify']:DisplayLeftNotification(_U('1'), _U('193'), 'character', 1000)
    elseif data.type == "nation" then
        exports['gum_notify']:DisplayLeftNotification(_U('1'), _U('194'), 'character', 1000)
    elseif data.type == "bodyTexture" then
        exports['gum_notify']:DisplayLeftNotification(_U('1'), _U('195'), 'character', 1000)
    elseif data.type == "legsTexture" then
        exports['gum_notify']:DisplayLeftNotification(_U('1'), _U('196'), 'character', 1000)
    elseif data.type == "bodyType" then
        exports['gum_notify']:DisplayLeftNotification(_U('1'), _U('197'), 'character', 1000)
    elseif data.type == "waist" then
        exports['gum_notify']:DisplayLeftNotification(_U('1'), _U('198'), 'character', 1000)
    elseif data.type == "eyes" then
        exports['gum_notify']:DisplayLeftNotification(_U('1'), _U('199'), 'character', 1000)
    elseif data.type == "headTexture" then
        exports['gum_notify']:DisplayLeftNotification(_U('1'), _U('200'), 'character', 1000)
    end
end)

RegisterNUICallback('up_key', function(data, cb)
    if z_position <= 240.0 then
        z_position = z_position+0.05
        StartCam(-561.86, -3782.36, z_position, 88.00, zoom)
    end
end)

RegisterNUICallback('down_key', function(data, cb)
    if z_position >= 237.70 then
        z_position = z_position-0.05
        StartCam(-561.86, -3782.36, z_position, 88.00, zoom)
    end
end)

RegisterNUICallback('left_key', function(data, cb)
    heading = heading-6.0
    SetEntityHeading(PlayerPedId(), heading)
end)
RegisterNUICallback('right_key', function(data, cb)
    heading = heading+6.0
    SetEntityHeading(PlayerPedId(), heading)
end)
RegisterNUICallback('zoom_key', function(data, cb)
    zoom = zoom-5.0
    StartCam(-561.86, -3782.36, z_position, 88.00, zoom)
end)
RegisterNUICallback('unzoom_key', function(data, cb)
    zoom = zoom+5.0
    StartCam(-561.86, -3782.36, z_position, 88.00, zoom)
end)

function check_hairs()
    if Skin_Table["sex"] == "mp_male" then
        for key,value in pairs(Skin_Table) do
            if key == "Beard" then
                for k,v in pairs(Beard_Table) do
                    if value == v.cat then
                        local hash_beard_c = '0x010D6AC7'--Male
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash_beard_c), true,true,true)
                        Citizen.Wait(5)
                        local hash_beard_m = v.hash
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash_beard_m), true,true,true)
                        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                    end
                end
            end
            if key == "Hair" then
                for k,v in pairs(Hair_Table) do
                    if value == v.cat then
                        local hash_hair_c = '0x24BC8E37'--Male
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash_hair_c), true,true,true)
                        Citizen.Wait(5)
                        local hash_hair_m = v.hash
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash_hair_m), true,true,true)
                        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                    end
                end
            end
        end
    else
        for key,value in pairs(Skin_Table) do
            if key == "Hair" then
                for k,v in pairs(Hair_Table) do
                    if value == v.cat then
                        local hash_hair_ch = '0x09977086'--Female
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash_hair_ch), true,true,true)
                        Citizen.Wait(50)
                        local hash_hair_fm = v.hash
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash_hair_fm), true,true,true)
                        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                    end
                end
            end
        end
    end
end

RegisterNetEvent("gum:SelectedCharacter")
AddEventHandler("gum:SelectedCharacter", function(charid)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(150)
            if is_overlay_change_active then  
                local ped = PlayerPedId()
                if Skin_Table["sex"] == "mp_male" then
                    current_texture_settings = Config.texture_types["male"]
                else
                    current_texture_settings = Config.texture_types["female"]
                end          
                if textureId ~= -1 then
                    Citizen.InvokeNative(0xB63B9178D0F58D82,textureId)  -- reset texture
                    Citizen.InvokeNative(0x6BEFAA907B076859,textureId)  -- remove texture
                end
                if Skin_Table["sex"] == "mp_male" then
                    if HeadCategory == 1 then
                        CharTypeWhat = GetHashKey("mp_head_mr1_sc08_c0_000_ab")
                    elseif HeadCategory == 2 then
                        CharTypeWhat = GetHashKey("mp_head_mr1_sc02_c0_000_ab")
                    elseif HeadCategory == 3 then
                        CharTypeWhat = GetHashKey("mp_head_mr1_sc03_c0_000_ab")
                    elseif HeadCategory == 4 then
                        CharTypeWhat = GetHashKey("MP_head_fr1_sc01_c0_000_ab")
                    elseif HeadCategory == 5 then
                        CharTypeWhat = GetHashKey("mp_head_mr1_sc04_c0_000_ab")
                    elseif HeadCategory == 6 then
                        CharTypeWhat = GetHashKey("mp_head_fr1_sc05_c0_000_ab")
                    end
                else
                    if HeadCategory == 1 then
                        CharTypeWhat = GetHashKey("mp_head_fr1_sc08_c0_000_ab")
                    elseif HeadCategory == 2 then
                        CharTypeWhat = GetHashKey("mp_head_fr1_sc02_c0_000_ab")
                    elseif HeadCategory == 3 then
                        CharTypeWhat = GetHashKey("mp_head_fr1_sc03_c0_000_ab")
                    elseif HeadCategory == 4 then
                        CharTypeWhat = GetHashKey("mp_head_fr1_sc05_c0_000_ab")
                    elseif HeadCategory == 5 then
                        CharTypeWhat = GetHashKey("mp_head_fr1_sc01_c0_000_ab")
                    elseif HeadCategory == 6 then
                        CharTypeWhat = GetHashKey("mp_head_fr1_sc04_c0_000_ab")
                    end
                end
                textureId = Citizen.InvokeNative(0xC5E7204F322E49EB, CharTypeWhat, current_texture_settings.normal, current_texture_settings.material)
                for k,v in pairs(Config.overlay_all_layers) do
                    if v.visibility ~= 0 then
                        local overlay_id = Citizen.InvokeNative(0x86BB5FF45F193A02,textureId, v.tx_id , v.tx_normal, v.tx_material, v.tx_color_type, v.tx_opacity,v.tx_unk)
                        if v.tx_color_type == 0 then
                            Citizen.InvokeNative(0x1ED8588524AC9BE1,textureId,overlay_id,v.palette);    -- apply palette
                            Citizen.InvokeNative(0x2DF59FFE6FFD6044,textureId,overlay_id,v.palette_color_primary,v.palette_color_secondary,v.palette_color_tertiary)  -- apply palette colours
                        end
                        Citizen.InvokeNative(0x3329AAE2882FC8E4,textureId,overlay_id, v.var);  -- apply overlay variant
                        Citizen.InvokeNative(0x6C76BC24F8BB709A,textureId,overlay_id, v.opacity); -- apply overlay opacity
                    end
                end
                while not Citizen.InvokeNative(0x31DC8D3F216D8509,textureId) do  -- wait till texture fully loaded
                    Citizen.Wait(0)
                end
                Citizen.InvokeNative(0x0B46E25761519058,ped,`heads`,textureId)  -- apply texture to current component in category "heads"
                Citizen.InvokeNative(0x92DAABA2C1C10B0E,textureId)      -- update texture
                Citizen.InvokeNative(0xCC8CA3E88256E58F,ped, 0, 1, 1, 1, false);  -- refresh ped components
                is_overlay_change_active = false
            end
        end
    end)
end)


RegisterNetEvent('gum_characters:colors')
AddEventHandler('gum_characters:colors', function(name,visibility,tx_id,tx_normal,tx_material,tx_color_type,tx_opacity,tx_unk,palette_id,palette_color_primary,palette_color_secondary,palette_color_tertiary,var,opacity)
    for k,v in pairs(Config.overlay_all_layers) do
        if v.name==name then
            v.visibility = visibility
            if visibility ~= 0 then
                v.tx_normal = tx_normal
                v.tx_material = tx_material
                v.tx_color_type = tx_color_type
                v.tx_opacity =  tx_opacity
                v.tx_unk =  tx_unk
                if tx_color_type == 0 then
                    v.palette = Config.color_palettes[palette_id][1]
                    v.palette_color_primary = palette_color_primary
                    v.palette_color_secondary = palette_color_secondary
                    v.palette_color_tertiary = palette_color_tertiary
                end
                if name == "shadows" or name == "eyeliners" or name == "lipsticks" then
                    v.var = var
                    v.tx_id = Config.overlays_info[name][1].id
                else
                    v.var = 0 
                    v.tx_id = Config.overlays_info[name][tx_id].id
                end
                v.opacity = opacity
            end
        end
    end
    is_overlay_change_active = true
end)


function Style_Head_Texture(what_type, number_val, gender, head_type) 
    if gender == _U('175') then
        for k,v in pairs(Config.DefaultChar["Male"][head_type]) do
            if k == what_type then
                for x,y in pairs(v) do
                    if x == number_val then
                        local hash = ("0x"..y)
                        Skin_Table["HeadType"] = tonumber(hash)
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)
                        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                    end
                end
            end
        end
    else
        for k,v in pairs(Config.DefaultChar["Female"][head_type]) do
            if k == what_type then
                for x,y in pairs(v) do
                    if x == number_val then
                        local hash_2 = ("0x"..y)
                        Skin_Table["HeadType"] = tonumber(hash_2)
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash_2), true, true, true)
                        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                    end
                end
            end
        end
    end
end


function Style_Body_Texture(what_type, number_val, gender, head_type) 
    if gender == _U('175') then
        for k,v in pairs(Config.DefaultChar["Male"][head_type]) do
            if k == what_type then
                for x,y in pairs(v) do
                    if x == number_val then
                        local hash = ("0x"..y)
                        Skin_Table["Body"] = tonumber(hash)
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)
                        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                    end
                end
            end
        end
    else
        for k,v in pairs(Config.DefaultChar["Female"][head_type]) do
            if k == what_type then
                for x,y in pairs(v) do
                    if x == number_val then
                        local hash = ("0x"..y)
                        Skin_Table["Body"] = tonumber(hash)
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)
                        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                    end
                end
            end
        end
    end
end

function Style_Legs_Texture(what_type, number_val, gender, head_type) 
    if gender == _U('175') then
        for k,v in pairs(Config.DefaultChar["Male"][head_type]) do
            if k == what_type then
                for x,y in pairs(v) do
                    if x == number_val then
                        local hash = ("0x"..y)
                        Skin_Table["LegsType"] = tonumber(hash)
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)
                        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                    end
                end
            end
        end
    else
        for k,v in pairs(Config.DefaultChar["Female"][head_type]) do
            if k == what_type then
                for x,y in pairs(v) do
                    if x == number_val then
                        local hash = ("0x"..y)
                        Skin_Table["LegsType"] = tonumber(hash)
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)
                        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                    end
                end
            end
        end
    end
end

function SelectChar()
    Citizen.CreateThread(function()
        local ModelFemale = "mp_female"
        while not HasModelLoaded( ModelFemale ) do
            Wait(10)
            Citizen.CreateThread(function()
                RequestModel( ModelFemale )
            end)
        end
        PedFemale = CreatePed(GetHashKey("mp_female"), -558.43, -3776.65, 237.7, 93.2, false, true, true, true)
        while not DoesEntityExist(PedFemale) do
            Wait(500)
        end
        local ModelMale = "mp_male"
        while not HasModelLoaded(ModelMale) do
            Wait(10)
            Citizen.CreateThread(function()
                RequestModel(ModelMale)
            end)
        end
        PedMale = CreatePed(GetHashKey("mp_male"), -558.52, -3775.6, 237.7, 93.2, false, true, true, true)
        while not DoesEntityExist(PedMale) do
            Wait(500)
        end

        Citizen.InvokeNative(0x283978A15512B2FE, PedFemale, true)
        ApplyDefaultSkinCanaryEdition(PedFemale)
        Citizen.InvokeNative(0x283978A15512B2FE, PedMale, true)
        ApplyDefaultSkinCanaryEdition(PedMale)
    end)
end
function SetModel(name)
	local model = GetHashKey(name)
	local player = PlayerId()
	
	if not IsModelValid(model) then
        return
    end
	PerformRequest(model)
	
	if HasModelLoaded(model) then
		Citizen.InvokeNative(0xED40380076A31506, player, model, false)
		Citizen.InvokeNative(0x283978A15512B2FE, PlayerPedId(), true)
		SetModelAsNoLongerNeeded(model)
	end
end

function SetClotheModel(name)
	local model = GetHashKey(name)
	local player = PlayerId()
	
	if not IsModelValid(model) then
        return
    end
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

function TakeCharacter(gender)
    Citizen.CreateThread(function()
        if gender == _U('175') then
            SetModel("mp_male")
            ApplyDefaultSkinCanaryEdition_2(PlayerPedId(), gender)
            Citizen.Wait(50)
            SetEntityCoords(PlayerPedId(), -563.37, -3782.20, 237.7)
            SetEntityHeading(PlayerPedId(), -89.36)
            StartCam(-561.86, -3782.36, 239.35, 88.00, 50.0)
            Citizen.InvokeNative(0x283978A15512B2FE, PlayerPedId(), true)
        else
            SetModel("mp_female")
            ApplyDefaultSkinCanaryEdition_2(PlayerPedId(), gender)
            Citizen.Wait(50)
            SetEntityCoords(PlayerPedId(), -563.37, -3782.20, 237.7)
            SetEntityHeading(PlayerPedId(), -89.36)
            StartCam(-561.86, -3782.36, 239.35, 88.00, 50.0)
            Citizen.InvokeNative(0x283978A15512B2FE, PlayerPedId(), true)
       end
    end)
end


function ApplyDefaultSkinCanaryEdition_2(ped, gender)
    DeletePed(PlayerPedId())
    if tostring(gender) == _U('175') then
        SetModel("mp_male")
        for k,v in pairs(Config.DefaultChar["Male"]) do
            if k == 1 then
                for x,y in pairs(v) do
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), 612262189, true, true, true);
                    if x == "Heads" then
                        local hash = ("0x"..y[1])
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)
                    end
                    if x == "Body" then
                        local hash = ("0x"..y[1])
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)

                    end
                    if x == "Legs" then
                        local hash = ("0x"..y[1])
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)

                    end
                    if x == "HeadTexture" then
                        local hash = ("0x"..y[1])
                        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), tonumber(hash), 0)

                    end
                    Citizen.Wait(10)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false)
                    while not Citizen.InvokeNative(0x31DC8D3F216D8509,tonumber(hash)) do
                        Citizen.Wait(0)
                    end
                end
            end
        end
        Citizen.Wait(100)
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false)
    else
        SetModel("mp_female")
        for k,v in pairs(Config.DefaultChar["Female"]) do
            if k == 1 then
                for x,y in pairs(v) do
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), 928002221, true, true, true);
                    if x == "Heads" then
                        local hash = ("0x"..y[1])
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true);
                    end
                    if x == "Body" then
                        local hash = ("0x"..y[1])
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true);
                    end
                    if x == "Legs" then
                        local hash = ("0x"..y[1])
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true);
                    end
                    if x == "HeadTexture" then
                        local hash = ("0x"..y[1])
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true);
                    end
                    Citizen.Wait(10)
                end
            end
        end
        Citizen.Wait(100)
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false)
    end
end


function ApplyDefaultSkinCanaryEdition(ped)
    if IsPedMale(ped) then
        for k,v in pairs(Config.DefaultChar["Male"]) do
            if k == 1 then
                for x,y in pairs(v) do
                    loadDataToPed(ped, tonumber(612262189))
                    if x == "Body" then
                        local hash = ("0x"..y[1])
                        loadDataToPed(ped, tonumber(hash))
                    end
                    if x == "Legs" then
                        local hash = ("0x"..y[1])
                        loadDataToPed(ped, tonumber(hash))
                    end
                    if x == "Heads" then
                        local hash = ("0x"..y[1])
                        loadDataToPed(ped, tonumber(hash))
                    end
                    if x == "HeadTexture" then
                        local hash = ("0x"..y[1])
                        loadDataToPed(ped, tonumber(hash))
                    end
                end
            end
        end
        Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, 0, 1, 1, 1, false)
        clothesLoadToPed(ped, true)
    else
        for k,v in pairs(Config.DefaultChar["Female"]) do
            if k == 1 then
                for x,y in pairs(v) do
                    loadDataToPed(ped, tonumber(928002221))
                    if x == "Body" then
                        local hash = ("0x"..y[1])
                        loadDataToPed(ped, tonumber(hash))
                    end
                    if x == "Legs" then
                        local hash = ("0x"..y[1])
                        loadDataToPed(ped, tonumber(hash))
                    end
                    if x == "Heads" then
                        local hash = ("0x"..y[1])
                        loadDataToPed(ped, tonumber(hash))
                    end
                    if x == "HeadTexture" then
                        local hash = ("0x"..y[1])
                        loadDataToPed(ped, tonumber(hash))
                    end
                end
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, 0, 1, 1, 1, false)
    clothesLoadToPed(ped, false)
end

function clothesLoadToPed(ped, male)
    if male == true then
        loadDataToPed(ped, 2629379040)
        loadDataToPed(ped, 1067738423)
        loadDataToPed(ped, 1295288978)
        loadDataToPed(ped, 4076107613)
        loadDataToPed(ped, 2120703472)
    else
        loadDataToPed(ped, 396308894)
        loadDataToPed(ped, 4045806460)
        loadDataToPed(ped, 3580604438)
        loadDataToPed(ped, 2857028536)
        loadDataToPed(ped, 3497438724)
    end
end

function loadDataToPed(ped, hash)
    local readyLoad = false
    while readyLoad == false do
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, tonumber(hash), false, true, true)
        Wait(100)
        Citizen.InvokeNative(0x704C908E9C405136, ped)
        Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, 0, 1, 1, 1, 0)
        Wait(0)
        readyLoad = Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, ped)
    end
end

function StartCam(x,y,z, heading, zoom)
    Citizen.InvokeNative(0x17E0198B3882C2CB, PlayerPedId())
    DestroyAllCams(true)
    local camera_pos = GetObjectOffsetFromCoords(x,y,z ,0.0 ,1.0, 1.0, 1.0)
    camera = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", x,y,z, -10.0, 00.00, heading, zoom, true, 0)
    SetCamActive(camera,true)
    RenderScriptCams(true, true, 500, true, true)
end

function EndCam()
    RenderScriptCams(false, true, 1000, true, false)
    DestroyCam(camera, false)
    camera = nil
    DestroyAllCams(true)
    Citizen.InvokeNative(0xD0AFAFF5A51D72F7, PlayerPedId())
end

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
        DeletePed(PedFemale)
        DeletePed(PedMale)
        MenuData.CloseAll()
        Citizen.InvokeNative(0x431E3AB760629B34, 183712523)
        Citizen.InvokeNative(0x431E3AB760629B34, -1699673416)
        Citizen.InvokeNative(0x431E3AB760629B34, 1679934574)
	end
end)

function CheckControls(func, pad, controls)
	if type(controls) == 'number' then
		return func(pad, controls)
	end

	for _, control in ipairs(controls) do
		if func(pad, control) then
			return true
		end
	end

	return false
end

Eyes_Male = {
    {
        612262189,
        1864171073,
        1552505114,
        46507404,
        4030267507,
        642477207,
        329402181,
        2501331517,
        2195072443,
        3096645940,
        3983864603,
        2739887825,
        2432743988,
        3065185688,
    }
}

Eyes_Female = {
    {
        928002221,
        3117725108,
        2273169671,
        2489772761,
        1647937151,
        3773694950,
        3450854762,
        3703470983,
        2836599857,
        625380794,
        869083847,
        3045109292,
        2210319017,
        2451302243,
    }
}

Body_Type = {
    {
        61606861,
        -1241887289,
        -369348190,
        32611963,
        -20262001,
        -369348190,
    }
}

Waist_Type = {
    {
        -2045421226,
        -1745814259,
        -325933489,
        -1065791927,
        -844699484,
        -1273449080,
        927185840,
        149872391,
        399015098,
        -644349862,
        1745919061,
        1004225511,
        1278600348,
        502499352,
        -2093198664,
        -1837436619,
        1736416063,
        2040610690,
        -1173634986,
        -867801909,
        1960266524,
    }
}


RegisterNetEvent("gum:SelectedCharacter")
AddEventHandler("gum:SelectedCharacter", function(charid)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5)
            DisableControlAction(0, 0x580C4473, true)
            DisableControlAction(0, 0xCF8A4ECA, true)
            Citizen.InvokeNative(0x8BC7C1F929D07BF3, 474191950)
            Citizen.InvokeNative(0xFEDFA97638D61D4A, 0.2)--NPCS
            Citizen.InvokeNative(0x1F91D44490E1EA0C, 0.0)--Vehicle
            Citizen.InvokeNative(0x606374EBFC27B133, 0.0)--Vehicle Npcs
            Mount_States()
        end
    end)
end)

function Mount_States()
    local pped = PlayerPedId()
    local playerHash = GetHashKey("PLAYER")

    if (IsControlPressed(0, 0xCEFD9220)) then
        Citizen.InvokeNative(0xBF25EB89375A37AD, 1, playerHash, playerHash);
        active_block = true
        Citizen.Wait(4000)
    end
    if (IsPedOnMount(pped) and IsPedInAnyVehicle(pped, false) and active_block == true) then
        Citizen.InvokeNative(0xBF25EB89375A37AD, 5, playerHash, playerHash)
        active_block = false
    elseif (active_block == true and (IsPedOnMount(pped) or IsPedInAnyVehicle(pped, false))) then
        if (IsPedInAnyVehicle(pped, false)) then
        elseif (GetPedInVehicleSeat(GetMount(pped), -1) == pped) then
            Citizen.InvokeNative(0xBF25EB89375A37AD, 5, playerHash, playerHash);
            active_block = false
        end
    else
        if active_block == true and not IsPedOnMount(pped) then
            Citizen.InvokeNative(0xBF25EB89375A37AD, 5, playerHash, playerHash)
            active_block = false
        end
    end
end

-- function HasBodyComponentsLoaded(type, hash_for_load, text)
--     -- local readyLoad = false
--     -- while readyLoad == false do
--     --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), hash_for_load, false, true, true)
--     --     Wait(0)
--     --     Citizen.InvokeNative(0x704C908E9C405136, PlayerPedId())
--     --     Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
--     --     Wait(0)
--     --     readyLoad = Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, PlayerPedId())
--     -- end

--     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), hash_for_load, false, true, true)
--     Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
--     return true
-- end
function HasBodyComponentsLoaded(ped, hash_for_load, text)
    local readyLoad = false
    local timeout = 0
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), hash_for_load, true, true, true)
    while readyLoad == false do
        readyLoad = Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, PlayerPedId())
        Wait(0)
    end
    Citizen.InvokeNative(0x704C908E9C405136, PlayerPedId())
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
    return true
end

function LoadModel(model)
	if IsModelInCdimage(model) then
		RequestModel(model)

		while not HasModelLoaded(model) do
			Wait(0)
		end

		return true
	else
		return false
	end
end

function SetModelPed(pped, name)
	local model = GetHashKey(name)

	if not IsModelValid(model) then
        return
    end
	PerformRequest(model)

	if HasModelLoaded(model) then
		Citizen.InvokeNative(0x283978A15512B2FE, pped, true)
		SetModelAsNoLongerNeeded(model)
	end
end

function Data_Character_Load(state)
    local model = GetHashKey(Skin_Table["sex"])
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
 
    -- SetModelPed(PlayerPedId(), Skin_Table["sex"])
    Citizen.Wait(0)
    HasBodyComponentsLoaded(0xB3966C9, Skin_Table["Body"], "Body")
    HasBodyComponentsLoaded(0x378AD10C, Skin_Table["HeadType"], "Head")
    HasBodyComponentsLoaded(0x823687F5, Skin_Table["LegsType"], "Legs")
    Citizen.Wait(0)
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.Wait(0)
    for i=1,6 do
        if Skin_Table["Nation"] == i then
            for k,v in pairs(Config.DefaultChar["Male"][i]) do
                if k == "Heads" then
                    for x,y in pairs(v) do
                        if x == 1 then
                            local hash = ("0x"..y)
                            HeadCategory = i
                            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)
                        end
                    end
                end
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), Skin_Table["Body"], false, true, true)
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), Skin_Table["HeadType"], false, true, true)
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), Skin_Table["BodyType"], false, true, true);
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), Skin_Table["Waist"], false, true, true);
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.Wait(50)
    if Skin_Table["Eyes"] ~= -1 then
        HasBodyComponentsLoaded(0xEA24B45E, Skin_Table["Eyes"], "EYES")
    end
    if Skin_Table["Hair"] ~= -1 then
        HasBodyComponentsLoaded(0x864B03AE, Skin_Table["Hair"], "HAIR")
    end
    if Skin_Table["Beard"] ~= -1 then
        HasBodyComponentsLoaded(0xF8016BCA, Skin_Table["Beard"], "BEARD")
    end
    Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), Skin_Table["BodyType"], false, true, true);
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), Skin_Table["Waist"], false, true, true);
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    if Clothe_Table["Hat"] ~= -1 then
        HasBodyComponentsLoaded(0x9925C067, Clothe_Table["Hat"], "HAT")
    end
    if Clothe_Table["EyeWear"] ~= -1 then
        HasBodyComponentsLoaded(0x5E47CA6, Clothe_Table["EyeWear"], "EyeWear")
    end
    if Clothe_Table["Mask"] ~= -1 then
        HasBodyComponentsLoaded(0x7505EF42, Clothe_Table["Mask"], "Mask")
    end
    if Clothe_Table["NeckWear"] ~= -1 then
        HasBodyComponentsLoaded(0x5FC29285, Clothe_Table["NeckWear"], "NeckWear")
    end
    if Clothe_Table["Suspender"] ~= -1 then
        HasBodyComponentsLoaded(0x877A2CF7, Clothe_Table["Suspender"], "Suspender")
    end
    if Clothe_Table["NeckTies"] ~= -1 then
        HasBodyComponentsLoaded(0x7A96FACA, Clothe_Table["NeckTies"], "NeckTies")
    end
    if Clothe_Table["Shirt"] ~= -1 then
        HasBodyComponentsLoaded(0x2026C46D, Clothe_Table["Shirt"], "Shirt")
    end
    if Clothe_Table["Vest"] ~= -1 then
        HasBodyComponentsLoaded(0x485EE834, Clothe_Table["Vest"], "Vest")
    end
    if Clothe_Table["Coat"] ~= -1 then
        HasBodyComponentsLoaded(0xE06D30CE, Clothe_Table["Coat"], "Coat")
    end
    if Clothe_Table["CoatClosed"] ~= -1 then
        HasBodyComponentsLoaded(0x662AC34, Clothe_Table["CoatClosed"], "CoatClosed")
    end
    if Clothe_Table["Poncho"] ~= -1 then
        HasBodyComponentsLoaded(0xAF14310B, Clothe_Table["Poncho"], "Poncho")
    end
    if Clothe_Table["Cloak"] ~= -1 then
        HasBodyComponentsLoaded(0x3C1A74CD, Clothe_Table["Cloak"], "Cloak")
    end
    if Clothe_Table["Glove"] ~= -1 then
        HasBodyComponentsLoaded(0xEABE0032, Clothe_Table["Glove"], "Glove")
    end
    if Clothe_Table["RingRh"] ~= -1 then
        HasBodyComponentsLoaded(0x7A6BBD0B, Clothe_Table["RingRh"], "RingRh")
    end
    if Clothe_Table["RingLh"] ~= -1 then
        HasBodyComponentsLoaded(0xF16A1D23, Clothe_Table["RingLh"], "RingLh")
    end
    if Clothe_Table["Bracelet"] ~= -1 then
        HasBodyComponentsLoaded(0x7BC10759, Clothe_Table["Bracelet"], "Bracelet")
    end
    if Clothe_Table["Buckle"] ~= -1 then
        HasBodyComponentsLoaded(0xFAE9107F, Clothe_Table["Buckle"], "Buckle")
    end
    if Clothe_Table["Chap"] ~= -1 then
        HasBodyComponentsLoaded(0x3107499B, Clothe_Table["Chap"], "Chap")
    end
    if Clothe_Table["Skirt"] ~= -1 then
        HasBodyComponentsLoaded(0xA0E3AB7F, Clothe_Table["Skirt"], "Skirt")
    end
    if Clothe_Table["Pant"] == -1 then
        HasBodyComponentsLoaded(0x823687F5, Skin_Table["LegsType"], "Legs")
    else
        HasBodyComponentsLoaded(0x1D4C528A, Clothe_Table["Pant"], "Pant")
    end
    if Clothe_Table["Boots"] ~= -1 then
        HasBodyComponentsLoaded(0x777EC6EF, Clothe_Table["Boots"], "Boots")
    end 
    if Clothe_Table["Spurs"] ~= -1 then
        HasBodyComponentsLoaded(0x18729F39, Clothe_Table["Spurs"], "Spurs")
    end
    if Clothe_Table["Spats"] ~= -1 then
        HasBodyComponentsLoaded(0x514ADCEA, Clothe_Table["Spats"], "Spats")
    end
    if Clothe_Table["Gauntlets"] ~= -1 then
        HasBodyComponentsLoaded(0x91CE9B20, Clothe_Table["Gauntlets"], "Gauntlets")
    end
    if Clothe_Table["Loadouts"] ~= -1 then
        HasBodyComponentsLoaded(0x83887E88, Clothe_Table["Loadouts"], "Loadouts")
    end
    if Clothe_Table["Accessories"] ~= -1 then
        HasBodyComponentsLoaded(0x79D7DF96, Clothe_Table["Accessories"], "Accessories")
    end
    if Clothe_Table["Belt"] ~= -1 then
        HasBodyComponentsLoaded(0xA6D134C6, Clothe_Table["Belt"], "Belt")
    end
    if Clothe_Table["Gunbelt"] ~= -1 then
        HasBodyComponentsLoaded(0x9B2C8B89, Clothe_Table["Gunbelt"], "Gunbelt")
    end
    if Clothe_Table["GunbeltAccs"] ~= -1 then
        HasBodyComponentsLoaded(0xF1542D11, Clothe_Table["GunbeltAccs"], "GunbeltAccs")
    end
    if Clothe_Table["Satchels"] ~= -1 then
        HasBodyComponentsLoaded(0x94504D26, Clothe_Table["Satchels"], "Satchels")
    end
    if Clothe_Table["Holster"] ~= -1 then
        HasBodyComponentsLoaded(0xB6B6122D, Clothe_Table["Holster"], "Holster")
    end
    if Skin_Table["Teeth"] ~= -1 and Skin_Table["Teeth"] ~= nil then
        HasBodyComponentsLoaded(0x96EDAE5C, Skin_Table["Teeth"], "Teeth")
    end
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3F1F01E5, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xDA0E2C55, 0)
    Citizen.InvokeNative(0x704C908E9C405136, PlayerPedId())
    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.Wait(0)
    Citizen.InvokeNative(0x25ACFC650B65C538, PlayerPedId(), Skin_Table["Scale"])
    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.Wait(0)
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x84D6, Skin_Table["HeadSize"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x3303, Skin_Table["EyeBrowH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x2FF9, Skin_Table["EyeBrowW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x4AD1, Skin_Table["EyeBrowD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xC04F, Skin_Table["EarsH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xB6CE, Skin_Table["EarsW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x2844, Skin_Table["EarsD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xED30, Skin_Table["EarsL"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x8B2B, Skin_Table["EyeLidH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x1B6B, Skin_Table["EyeLidW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xEE44, Skin_Table["EyeD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xD266, Skin_Table["EyeAng"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xA54E, Skin_Table["EyeDis"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xDDFB, Skin_Table["EyeH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x6E7F, Skin_Table["NoseW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x3471, Skin_Table["NoseS"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x03F5, Skin_Table["NoseH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x34B1, Skin_Table["NoseAng"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xF156, Skin_Table["NoseC"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x561E, Skin_Table["NoseDis"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x6A0B, Skin_Table["CheekBonesH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xABCF, Skin_Table["CheekBonesW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x358D, Skin_Table["CheekBonesD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xF065, Skin_Table["MouthW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xAA69, Skin_Table["MouthD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x7AC3, Skin_Table["MouthX"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x410D, Skin_Table["MouthY"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x1A00, Skin_Table["ULiphH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x91C1, Skin_Table["ULiphW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xC375, Skin_Table["ULiphD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xBB4D, Skin_Table["LLiphH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xB0B0, Skin_Table["LLiphW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x5D16, Skin_Table["LLiphD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x8D0A, Skin_Table["JawH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xEBAE, Skin_Table["JawW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x1DF6, Skin_Table["JawD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x3C0F, Skin_Table["ChinH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xC3B2, Skin_Table["ChinW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xE323, Skin_Table["ChinD"]);
    Citizen.Wait(0)
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false)
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), Skin_Table["HeadType"], false, true, true)
    Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), Skin_Table["BodyType"], false, true, true);
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), Skin_Table["Waist"], false, true, true);
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.Wait(0)
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xEA24B45E, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x864B03AE, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xF8016BCA, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9925C067, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5E47CA6, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x662AC34, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5FC29285, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7A96FACA, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x877A2CF7, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x485EE834, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xE06D30CE, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xAF14310B, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3C1A74CD, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xEABE0032, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7A6BBD0B, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xF16A1D23, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7BC10759, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9B2C8B89, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA6D134C6, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xFAE9107F, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB6B6122D, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA0E3AB7F, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3107499B, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x777EC6EF, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x18729F39, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xF1542D11, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x514ADCEA, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x91CE9B20, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x83887E88, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x79D7DF96, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x94504D26, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x96EDAE5C, 0);

    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB3966C9, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x378AD10C, 0);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x823687F5, 0);
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
    Citizen.Wait(0)
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["Body"],       true, true, false);
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["HeadType"],       true, true, false);
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["LegsType"],       true, true, false);
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["Eyes"],       true, true, false);
    if Skin_Table["Teeth"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["Teeth"],       true, true, false);
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
    Citizen.Wait(500)
    if Skin_Table["Beard"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["Beard"],       true, true, false);
    end
    if Skin_Table["Hair"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["Hair"],       true, true, false);
    end
    if Clothe_Table["Hat"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Hat"],       true, true, false);
    end
    if Clothe_Table["EyeWear"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["EyeWear"],   true, true, false);
    end
    if Clothe_Table["Mask"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Mask"],      true, true, false);
    end
    if Clothe_Table["NeckWear"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["NeckWear"],  true, true, false);
    end
    if Clothe_Table["Suspender"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Suspender"], true, true, false);
    end
    if Clothe_Table["NeckTies"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["NeckTies"],  true, true, false);
    end
    if Clothe_Table["Shirt"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Shirt"],     true, true, false);
    end
    if Clothe_Table["Vest"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Vest"],      true, true, false);
    end
    if Clothe_Table["Coat"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Coat"],      true, true, false);
    end
    if Clothe_Table["CoatClosed"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["CoatClosed"],true, true, false);
    end
    if Clothe_Table["Poncho"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Poncho"],    true, true, false);
    end
    if Clothe_Table["Cloak"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Cloak"],     true, true, false);
    end
    if Clothe_Table["Glove"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Glove"],    true, true, false);
    end
    if Clothe_Table["RingRh"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["RingRh"],   true, true, false);
    end
    if Clothe_Table["RingLh"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["RingLh"],   true, true, false);
    end
    if Clothe_Table["Bracelet"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Bracelet"], true, true, false);
    end
    if Clothe_Table["Buckle"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Buckle"],   true, true, false);
    end
    if Clothe_Table["Chap"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Chap"],     true, true, false);
    end
    if Clothe_Table["Skirt"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Skirt"],    true, true, false);
    end
    if Clothe_Table["Pant"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Pant"],     true, true, false);
    end
    if Clothe_Table["Boots"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Boots"],    true, true, false);
    end
    if Clothe_Table["Spurs"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Spurs"],    true, true, false);
    end
    if Clothe_Table["Spats"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Spats"],   true, true, false);
    end
    if Clothe_Table["Gauntlets"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Gauntlets"],true, true, false);
    end
    if Clothe_Table["Loadouts"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Loadouts"], true, true, false);
    end
    if Clothe_Table["Accessories"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Accessories"],true, true, false);
    end
    if Clothe_Table["Belt"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Belt"], true, true, false);
    end
    if Clothe_Table["Gunbelt"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Gunbelt"], true, true, false);
    end
    if Clothe_Table["GunbeltAccs"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["GunbeltAccs"], true, true, false);
    end
    if Clothe_Table["Satchels"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Satchels"], true, true, false);
    end
    if Clothe_Table["Holster"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Holster"], true, true, false);
    end
    if Clothe_Table["Teeth"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["Teeth"], true, true, false);
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);

    Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), Skin_Table["Waist"])
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), Skin_Table["Waist"], false, true, true);
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    reload_scars()
    if Skin_Table["HairAccesorie"] ~= -1 and Skin_Table["HairAccesorie"] ~= nil then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["HairAccesorie"], true, true, false);
    end
    Citizen.InvokeNative(0x25ACFC650B65C538, PlayerPedId(), Skin_Table["Scale"])
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.Wait(0)
    -- if state == true then
    --     TriggerEvent("gum_inventory:reload_weap")
    -- end
    -- if Config.WalkFaceStyle then
    --     TriggerEvent("gum_walkingfacestyle:active")
    -- end
    Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, 150.0)
end

function ReloadCloth()
    local model = GetHashKey(Skin_Table["sex"])
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
 
    Citizen.Wait(50)
    HasBodyComponentsLoaded(0xB3966C9, Skin_Table["Body"], "Body")
    HasBodyComponentsLoaded(0x378AD10C, Skin_Table["HeadType"], "Head")
    HasBodyComponentsLoaded(0x823687F5, Skin_Table["LegsType"], "Legs")
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    for i=1,6 do
        if Skin_Table["Nation"] == i then
            for k,v in pairs(Config.DefaultChar["Male"][i]) do
                if k == "Heads" then
                    for x,y in pairs(v) do
                        if x == 1 then
                            local hash = ("0x"..y)
                            HeadCategory = i
                            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)
                        end
                    end
                end
            end
        end
    end
    -- Citizen.Wait(0)
    -- HasBodyComponentsLoaded(0xB3966C9, Skin_Table["Body"], "Body")
    -- HasBodyComponentsLoaded(0x378AD10C, Skin_Table["HeadType"], "Head")
    -- HasBodyComponentsLoaded(0x823687F5, Skin_Table["LegsType"], "Legs")
    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    for i=1,6 do
        if Skin_Table["Nation"] == i then
            for k,v in pairs(Config.DefaultChar["Male"][i]) do
                if k == "Heads" then
                    for x,y in pairs(v) do
                        if x == 1 then
                            local hash = ("0x"..y)
                            HeadCategory = i
                            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)
                        end
                    end
                end
            end
        end
    end
    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), Skin_Table["Body"], false, true, true)
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), Skin_Table["HeadType"], false, true, true)
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), Skin_Table["BodyType"], false, true, true);
    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), Skin_Table["Waist"], false, true, true);
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3F1F01E5, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xDA0E2C55, 0)
    -- Citizen.InvokeNative(0x704C908E9C405136, PlayerPedId())
    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    -- Citizen.Wait(0)
    -- Citizen.InvokeNative(0x25ACFC650B65C538, PlayerPedId(), Skin_Table["Scale"])
    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    -- Citizen.Wait(0)
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x84D6, Skin_Table["HeadSize"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x3303, Skin_Table["EyeBrowH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x2FF9, Skin_Table["EyeBrowW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x4AD1, Skin_Table["EyeBrowD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xC04F, Skin_Table["EarsH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xB6CE, Skin_Table["EarsW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x2844, Skin_Table["EarsD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xED30, Skin_Table["EarsL"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x8B2B, Skin_Table["EyeLidH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x1B6B, Skin_Table["EyeLidW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xEE44, Skin_Table["EyeD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xD266, Skin_Table["EyeAng"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xA54E, Skin_Table["EyeDis"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xDDFB, Skin_Table["EyeH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x6E7F, Skin_Table["NoseW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x3471, Skin_Table["NoseS"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x03F5, Skin_Table["NoseH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x34B1, Skin_Table["NoseAng"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xF156, Skin_Table["NoseC"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x561E, Skin_Table["NoseDis"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x6A0B, Skin_Table["CheekBonesH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xABCF, Skin_Table["CheekBonesW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x358D, Skin_Table["CheekBonesD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xF065, Skin_Table["MouthW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xAA69, Skin_Table["MouthD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x7AC3, Skin_Table["MouthX"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x410D, Skin_Table["MouthY"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x1A00, Skin_Table["ULiphH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x91C1, Skin_Table["ULiphW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xC375, Skin_Table["ULiphD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xBB4D, Skin_Table["LLiphH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xB0B0, Skin_Table["LLiphW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x5D16, Skin_Table["LLiphD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x8D0A, Skin_Table["JawH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xEBAE, Skin_Table["JawW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x1DF6, Skin_Table["JawD"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0x3C0F, Skin_Table["ChinH"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xC3B2, Skin_Table["ChinW"]);
    Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), 0xE323, Skin_Table["ChinD"]);
    Citizen.Wait(0)
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    local readyLoad = false
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), Skin_Table["HeadType"], false, true, true)
    while readyLoad == false do
        readyLoad = Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, PlayerPedId())
        Wait(0)
    end

    local readyLoad = false
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), Skin_Table["BodyType"], false, true, true)
    while readyLoad == false do
        readyLoad = Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, PlayerPedId())
        Wait(0)
    end
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), Skin_Table["HeadType"], false, true, true)
    Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), Skin_Table["BodyType"], false, true, true);
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), Skin_Table["Waist"], false, true, true);
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.Wait(0)
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xEA24B45E, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x864B03AE, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xF8016BCA, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9925C067, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5E47CA6, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x662AC34, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5FC29285, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7A96FACA, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x877A2CF7, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x485EE834, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xE06D30CE, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xAF14310B, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3C1A74CD, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xEABE0032, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7A6BBD0B, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xF16A1D23, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7BC10759, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9B2C8B89, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA6D134C6, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xFAE9107F, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB6B6122D, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA0E3AB7F, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3107499B, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x777EC6EF, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x18729F39, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xF1542D11, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x514ADCEA, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x91CE9B20, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x83887E88, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x79D7DF96, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x94504D26, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x96EDAE5C, 0);

    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB3966C9, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x378AD10C, 0);
    -- Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x823687F5, 0);
    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
    -- Citizen.Wait(0)
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["Body"],       true, true, false);
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["HeadType"],       true, true, false);
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["LegsType"],       true, true, false);
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["Eyes"],       true, true, false);
    if Skin_Table["Teeth"] ~= -1 then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["Teeth"],       true, true, false);
    end
    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
    -- Citizen.Wait(0)
    -- if Skin_Table["Beard"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["Beard"],       true, true, false);
    -- end
    -- if Skin_Table["Hair"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["Hair"],       true, true, false);
    -- end
    -- if Clothe_Table["Hat"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Hat"],       true, true, false);
    -- end
    -- if Clothe_Table["EyeWear"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["EyeWear"],   true, true, false);
    -- end
    -- if Clothe_Table["Mask"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Mask"],      true, true, false);
    -- end
    -- if Clothe_Table["NeckWear"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["NeckWear"],  true, true, false);
    -- end
    -- if Clothe_Table["Suspender"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Suspender"], true, true, false);
    -- end
    -- if Clothe_Table["NeckTies"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["NeckTies"],  true, true, false);
    -- end
    -- if Clothe_Table["Shirt"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Shirt"],     true, true, false);
    -- end
    -- if Clothe_Table["Vest"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Vest"],      true, true, false);
    -- end
    -- if Clothe_Table["Coat"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Coat"],      true, true, false);
    -- end
    -- if Clothe_Table["CoatClosed"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["CoatClosed"],true, true, false);
    -- end
    -- if Clothe_Table["Poncho"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Poncho"],    true, true, false);
    -- end
    -- if Clothe_Table["Cloak"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Cloak"],     true, true, false);
    -- end
    -- if Clothe_Table["Glove"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Glove"],    true, true, false);
    -- end
    -- if Clothe_Table["RingRh"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["RingRh"],   true, true, false);
    -- end
    -- if Clothe_Table["RingLh"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["RingLh"],   true, true, false);
    -- end
    -- if Clothe_Table["Bracelet"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Bracelet"], true, true, false);
    -- end
    -- if Clothe_Table["Buckle"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Buckle"],   true, true, false);
    -- end
    -- if Clothe_Table["Chap"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Chap"],     true, true, false);
    -- end
    -- if Clothe_Table["Skirt"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Skirt"],    true, true, false);
    -- end
    -- if Clothe_Table["Pant"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Pant"],     true, true, false);
    -- end
    -- if Clothe_Table["Boots"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Boots"],    true, true, false);
    -- end
    -- if Clothe_Table["Spurs"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Spurs"],    true, true, false);
    -- end
    -- if Clothe_Table["Spats"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Spats"],   true, true, false);
    -- end
    -- if Clothe_Table["Gauntlets"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Gauntlets"],true, true, false);
    -- end
    -- if Clothe_Table["Loadouts"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Loadouts"], true, true, false);
    -- end
    -- if Clothe_Table["Accessories"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Accessories"],true, true, false);
    -- end
    -- if Clothe_Table["Belt"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Belt"], true, true, false);
    -- end
    -- if Clothe_Table["Gunbelt"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Gunbelt"], true, true, false);
    -- end
    -- if Clothe_Table["GunbeltAccs"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["GunbeltAccs"], true, true, false);
    -- end
    -- if Clothe_Table["Satchels"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Satchels"], true, true, false);
    -- end
    -- if Clothe_Table["Holster"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Clothe_Table["Holster"], true, true, false);
    -- end
    -- if Clothe_Table["Teeth"] ~= -1 then
    --     Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["Teeth"], true, true, false);
    -- end
    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    if Skin_Table["Eyes"] ~= -1 then
        HasBodyComponentsLoaded(0xEA24B45E, Skin_Table["Eyes"], "EYES")
    end
    if Skin_Table["Hair"] ~= -1 then
        HasBodyComponentsLoaded(0x864B03AE, Skin_Table["Hair"], "HAIR")
    end
    if Skin_Table["Beard"] ~= -1 then
        HasBodyComponentsLoaded(0xF8016BCA, Skin_Table["Beard"], "BEARD")
    end
    -- Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), Skin_Table["BodyType"], false, true, true);
    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), Skin_Table["Waist"], false, true, true);
    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.Wait(100)
    if Clothe_Table["Hat"] ~= -1 then
        HasBodyComponentsLoaded(0x9925C067, Clothe_Table["Hat"], "HAT")
    end
    if Clothe_Table["EyeWear"] ~= -1 then
        HasBodyComponentsLoaded(0x5E47CA6, Clothe_Table["EyeWear"], "EyeWear")
    end
    if Clothe_Table["Mask"] ~= -1 then
        HasBodyComponentsLoaded(0x7505EF42, Clothe_Table["Mask"], "Mask")
    end
    if Clothe_Table["Shirt"] ~= -1 then
        HasBodyComponentsLoaded(0x2026C46D, Clothe_Table["Shirt"], "Shirt")
    end
    Citizen.Wait(0)
    if Clothe_Table["Vest"] ~= -1 then
        HasBodyComponentsLoaded(0x485EE834, Clothe_Table["Vest"], "Vest")
    end
    if Clothe_Table["NeckWear"] ~= -1 then
        HasBodyComponentsLoaded(0x5FC29285, Clothe_Table["NeckWear"], "NeckWear")
    end
    if Clothe_Table["Suspender"] ~= -1 then
        HasBodyComponentsLoaded(0x877A2CF7, Clothe_Table["Suspender"], "Suspender")
    end
    if Clothe_Table["NeckTies"] ~= -1 then
        HasBodyComponentsLoaded(0x7A96FACA, Clothe_Table["NeckTies"], "NeckTies")
    end
    if Clothe_Table["Coat"] ~= -1 then
        HasBodyComponentsLoaded(0xE06D30CE, Clothe_Table["Coat"], "Coat")
    end
    if Clothe_Table["CoatClosed"] ~= -1 then
        HasBodyComponentsLoaded(0x662AC34, Clothe_Table["CoatClosed"], "CoatClosed")
    end
    if Clothe_Table["Poncho"] ~= -1 then
        HasBodyComponentsLoaded(0xAF14310B, Clothe_Table["Poncho"], "Poncho")
    end
    if Clothe_Table["Cloak"] ~= -1 then
        HasBodyComponentsLoaded(0x3C1A74CD, Clothe_Table["Cloak"], "Cloak")
    end
    if Clothe_Table["Glove"] ~= -1 then
        HasBodyComponentsLoaded(0xEABE0032, Clothe_Table["Glove"], "Glove")
    end
    if Clothe_Table["RingRh"] ~= -1 then
        HasBodyComponentsLoaded(0x7A6BBD0B, Clothe_Table["RingRh"], "RingRh")
    end
    if Clothe_Table["RingLh"] ~= -1 then
        HasBodyComponentsLoaded(0xF16A1D23, Clothe_Table["RingLh"], "RingLh")
    end
    if Clothe_Table["Bracelet"] ~= -1 then
        HasBodyComponentsLoaded(0x7BC10759, Clothe_Table["Bracelet"], "Bracelet")
    end
    if Clothe_Table["Buckle"] ~= -1 then
        HasBodyComponentsLoaded(0xFAE9107F, Clothe_Table["Buckle"], "Buckle")
    end
    if Clothe_Table["Chap"] ~= -1 then
        HasBodyComponentsLoaded(0x3107499B, Clothe_Table["Chap"], "Chap")
    end
    if Clothe_Table["Skirt"] ~= -1 then
        HasBodyComponentsLoaded(0xA0E3AB7F, Clothe_Table["Skirt"], "Skirt")
    end
    if Clothe_Table["Pant"] == -1 then
        HasBodyComponentsLoaded(0x823687F5, Skin_Table["LegsType"], "Legs")
    else
        HasBodyComponentsLoaded(0x1D4C528A, Clothe_Table["Pant"], "Pant")
    end
    if Clothe_Table["Boots"] ~= -1 then
        HasBodyComponentsLoaded(0x777EC6EF, Clothe_Table["Boots"], "Boots")
    end 
    if Clothe_Table["Spurs"] ~= -1 then
        HasBodyComponentsLoaded(0x18729F39, Clothe_Table["Spurs"], "Spurs")
    end
    if Clothe_Table["Spats"] ~= -1 then
        HasBodyComponentsLoaded(0x514ADCEA, Clothe_Table["Spats"], "Spats")
    end
    if Clothe_Table["Gauntlets"] ~= -1 then
        HasBodyComponentsLoaded(0x91CE9B20, Clothe_Table["Gauntlets"], "Gauntlets")
    end
    if Clothe_Table["Loadouts"] ~= -1 then
        HasBodyComponentsLoaded(0x83887E88, Clothe_Table["Loadouts"], "Loadouts")
    end
    if Clothe_Table["Accessories"] ~= -1 then
        HasBodyComponentsLoaded(0x79D7DF96, Clothe_Table["Accessories"], "Accessories")
    end
    if Clothe_Table["Belt"] ~= -1 then
        HasBodyComponentsLoaded(0xA6D134C6, Clothe_Table["Belt"], "Belt")
    end
    if Clothe_Table["Gunbelt"] ~= -1 then
        HasBodyComponentsLoaded(0x9B2C8B89, Clothe_Table["Gunbelt"], "Gunbelt")
    end
    if Clothe_Table["GunbeltAccs"] ~= -1 then
        HasBodyComponentsLoaded(0xF1542D11, Clothe_Table["GunbeltAccs"], "GunbeltAccs")
    end
    if Clothe_Table["Satchels"] ~= -1 then
        HasBodyComponentsLoaded(0x94504D26, Clothe_Table["Satchels"], "Satchels")
    end
    if Clothe_Table["Holster"] ~= -1 then
        HasBodyComponentsLoaded(0xB6B6122D, Clothe_Table["Holster"], "Holster")
    end
    if Skin_Table["Teeth"] ~= -1 and Skin_Table["Teeth"] ~= nil then
        HasBodyComponentsLoaded(0x96EDAE5C, Skin_Table["Teeth"], "Teeth")
    end
    Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), Skin_Table["Waist"])
    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), Skin_Table["Waist"], false, true, true);
    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    reload_scars()
    Citizen.InvokeNative(0x25ACFC650B65C538, PlayerPedId(), Skin_Table["Scale"])
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
    Citizen.Wait(0)
    if Skin_Table["HairAccesorie"] ~= -1 and Skin_Table["HairAccesorie"] ~= nil then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  Skin_Table["HairAccesorie"], true, true, false);
    end
    Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, 150.0)
end

function reload_scars()
    if Skin_Table["scars_tx_id"] ~= nil  and Skin_Table["scars_opacity"] ~= nil then
        TriggerEvent("gum_characters:colors", "scars", Skin_Table["scars_visibility"], Skin_Table["scars_tx_id"], 0, 0, 1, 1.0, 0, 1, 0,0,0,1,Skin_Table["scars_opacity"])
    end
    if Skin_Table["spots_tx_id"] ~= nil  and Skin_Table["spots_opacity"] ~= nil then
        TriggerEvent("gum_characters:colors", "spots", Skin_Table["spots_visibility"], Skin_Table["spots_tx_id"], 0, 0, 1, 1.0, 0, 1, 0,0,0,1,Skin_Table["spots_opacity"])
    end
    if Skin_Table["disc_tx_id"] ~= nil  and Skin_Table["disc_opacity"] ~= nil then
        TriggerEvent("gum_characters:colors", "disc", Skin_Table["disc_visibility"], Skin_Table["disc_tx_id"], 0, 0, 1, 1.0, 0, 1, 0,0,0,1,Skin_Table["disc_opacity"])
    end
    if Skin_Table["complex_tx_id"] ~= nil  and Skin_Table["complex_opacity"] ~= nil then
        TriggerEvent("gum_characters:colors", "complex", Skin_Table["complex_visibility"], Skin_Table["complex_tx_id"], 0, 0, 1, 1.0, 0, 1, 0,0,0,1,Skin_Table["complex_opacity"])
    end
    if Skin_Table["acne_tx_id"] ~= nil  and Skin_Table["acne_opacity"] ~= nil then
        TriggerEvent("gum_characters:colors", "acne", Skin_Table["acne_visibility"], Skin_Table["acne_tx_id"], 0, 0, 1, 1.0, 0, 1, 0,0,0,1,Skin_Table["acne_opacity"])
    end
    if Skin_Table["ageing_tx_id"] ~= nil  and Skin_Table["ageing_opacity"] ~= nil then
        TriggerEvent("gum_characters:colors", "ageing", Skin_Table["ageing_visibility"], Skin_Table["ageing_tx_id"], 0, 0, 1, 1.0, 0, 1, 0,0,0,1,Skin_Table["ageing_opacity"])
    end
    if Skin_Table["freckles_tx_id"] ~= nil  and Skin_Table["freckles_opacity"] ~= nil then
        TriggerEvent("gum_characters:colors", "freckles", Skin_Table["freckles_visibility"], Skin_Table["freckles_tx_id"], 0, 0, 1, 1.0, 0, 1, 0,0,0,1,Skin_Table["freckles_opacity"])
    end
    if Skin_Table["moles_tx_id"] ~= nil  and Skin_Table["moles_opacity"] ~= nil then
        TriggerEvent("gum_characters:colors", "moles", Skin_Table["moles_visibility"], Skin_Table["moles_tx_id"], 0, 0, 1, 1.0, 0, 1, 0,0,0,1,Skin_Table["moles_opacity"])
    end
    if Skin_Table["eyebrows_tx_id"] ~= nil  and Skin_Table["eyebrows_opacity"] ~= nil then
        TriggerEvent("gum_characters:colors", "eyebrows", Skin_Table["eyebrows_visibility"], Skin_Table["eyebrows_tx_id"], 1, 0, 0, 1.0, 0, 1, Skin_Table["eyebrows_color"],0,0,1,Skin_Table["eyebrows_opacity"])
    end
    if Skin_Table["blush_tx_id"] ~= nil  and Skin_Table["blush_opacity"] ~= nil then
        TriggerEvent("gum_characters:colors", "blush", Skin_Table["blush_visibility"], Skin_Table["blush_tx_id"], 1, 0, 0, 1.0, 0, 1, Skin_Table["blush_color_1"],0,0,1,Skin_Table["blush_opacity"])
    end
    if Skin_Table["eyeliners_tx_id"] ~= nil  and Skin_Table["eyeliners_opacity"] ~= nil then
        TriggerEvent("gum_characters:colors", "eyeliners", Skin_Table["eyeliners_visibility"], 1, 1, 0, 0, 1.0, 0, 1, Skin_Table["eyeliners_color_1"],0,0,Skin_Table["eyeliners_tx_id"],Skin_Table["eyeliners_opacity"])
    end
    if Skin_Table["lipsticks_tx_id"] ~= nil  and Skin_Table["lipsticks_opacity"] ~= nil then
        TriggerEvent("gum_characters:colors", "lipsticks", Skin_Table["lipsticks_visibility"], 1, 1, 0, 0, 1.0, 0, 1, Skin_Table["lipsticks_color_1"],Skin_Table["lipsticks_color_2"],Skin_Table["lipsticks_color_3"], Skin_Table["lipsticks_tx_id"], Skin_Table["lipsticks_opacity"])
    end
    if Skin_Table["shadows_tx_id"] ~= nil  and Skin_Table["shadows_opacity"] ~= nil then
        TriggerEvent("gum_characters:colors", "shadows", Skin_Table["shadows_visibility"], 1, 1, 0, 0, 1.0, 0, 1, Skin_Table["shadows_color_1"],Skin_Table["shadows_color_2"],Skin_Table["shadows_color_3"],Skin_Table["shadows_tx_id"],Skin_Table["shadows_opacity"])
    end
    if Skin_Table["beardstabble_tx_id"] ~= nil  and Skin_Table["beardstabble_opacity"] ~= nil then
        TriggerEvent("gum_characters:colors", "beardstabble", Skin_Table["beardstabble_visibility"], 1, 1, 0, 0, 1.0, 0, 1, Skin_Table["beardstabble_color_1"],Skin_Table["beardstabble_color_2"],Skin_Table["beardstabble_color_3"],Skin_Table["beardstabble_tx_id"],Skin_Table["beardstabble_opacity"])
    end
    if Skin_Table["hairstable_opacity"] ~= nil then
        TriggerEvent("gum_characters:colors", "hair",1, 1,1,0,0,1.0,0,1,Skin_Table["hairstable_color"],0,0,1,Skin_Table["hairstable_opacity"])
    end
end

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoord())  
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
	if onScreen then
		SetTextScale(0.30, 0.30)
		SetTextFontForCurrentCommand(6)
		SetTextColor(255, 255, 255, 255)
		SetTextCentre(1)
		SetTextDropshadow(1, 1, 0, 0, 200)
		DisplayText(str,_x,_y)
		local factor = (string.len(text)) / 225
		--DrawSprite("generic_textures", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 35, 35, 35, 190, 0)
		--DrawSprite("feeds", "toast_bg", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 100, 1, 1, 190, 0)
	end
end