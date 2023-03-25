local Skin_Table = {}
local Clothe_Table = {}
local Beard_Table = {}
local Hair_Table = {}
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
local eyeliners_enable = 1
local eyeliners_color_1 = 0
local eyeliners_color_2 = 0
local eyeliners_color_3 = 0
local eyeliners_texture = 1
local eyeliners_opacity = 10
local lipsticks_enable = 1
local lipsticks_color_1 = 0
local lipsticks_color_2 = 0
local lipsticks_color_3 = 0
local lipsticks_texture = 1
local lipsticks_opacity = 10
local spots_enable = 1
local spots_texture = 1
local spots_opacity = 10
local disc_enable = 1
local disc_texture = 1
local disc_opacity = 10
local complex_enable = 1
local complex_texture = 1
local complex_opacity = 10
local acne_visibility = 1
local acne_texture = 1
local acne_opacity = 10
local ageing_enable = 1
local ageing_texture = 1
local ageing_opacity = 10
local freckles_enable = 1
local freckles_texture = 1
local freckles_opacity = 10
local moles_enable = 1
local moles_texture = 1
local moles_opacity = 10
local eyebrows_enable = 1
local eyebrows_texture = 1
local eyebrows_opacity = 10
local eyebrows_color_1 = 0
local beardstabble_enable = 1
local beardstabble_texture = 1
local beardstabble_opacity = 10
local beardstabble_color_1 = 0
local TeethsTable = {}
local HairAccTable = {}
local Skin_Table_Backup = {}
local pricing_table = {}
local price = 0.0

RegisterNetEvent("gum:SelectedCharacter")
AddEventHandler("gum:SelectedCharacter", function(charid)
    Citizen.CreateThread(function()
        for k,v in pairs(Config.BarberStore) do
            local blips = N_0x554d9d53f696d002(1664425300, v["BarberSpot"][1], v["BarberSpot"][2], v["BarberSpot"][3])
            SetBlipSprite(blips, -2090472724, 1)
            SetBlipScale(blips, 1.5)
            Citizen.InvokeNative(0x9CB1A1623062F402, blips, v["BarberBlip"])
        end
        if IsPedMale(PlayerPedId()) then
            for k,v in pairs(Config_2.Clothes) do
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "hair" then
                    table.insert(Hair_Table, {hash = v.hash, category_hash = v.category_hash, cat = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and tonumber(v.category_hash) == tonumber('0xF8016BCA') then
                    table.insert(Beard_Table, {hash = v.hash, category_hash = v.category_hash, cat = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "teeth" then
                    table.insert(TeethsTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
            end
        else
            for k,v in pairs(Config_2.Clothes) do
                if v["ped_type"] == "female" and v["is_multiplayer"] == true and v.category_hashname == "hair" then
                    table.insert(Hair_Table, {hash = v.hash, category_hash = v.category_hash, cat = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "teeth" then
                    table.insert(TeethsTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "hair_accessories" then
                    table.insert(HairAccTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
            end
        end

        SendNUIMessage({
            type = "barber_maker",
            status = true,
            maxhair = #Hair_Table,
            maxbeard = #Beard_Table,
            maxteeths = #TeethsTable,
            maxhairacc = #HairAccTable,
        })
    end)
end)
local active = false
local buttons_prompt = GetRandomIntInRange(0, 0xffffff)
function Button_Prompt()
	Citizen.CreateThread(function()
        local str = Config.Language[1].text
        OpenBarberPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(OpenBarberPrompt, 0x27D1C284)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(OpenBarberPrompt, str)
        PromptSetEnabled(OpenBarberPrompt, true)
        PromptSetVisible(OpenBarberPrompt, true)
        PromptSetHoldMode(OpenBarberPrompt, true)
        PromptSetGroup(OpenBarberPrompt, buttons_prompt)
        PromptRegisterEnd(OpenBarberPrompt)
	end)
end


Citizen.CreateThread(function()
    Button_Prompt()
    while true do
        local coords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Config.BarberStore) do
            if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v["BarberSpot"][1], v["BarberSpot"][2], v["BarberSpot"][3], false) < 15 then
                if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v["BarberSpot"][1], v["BarberSpot"][2], v["BarberSpot"][3], false) < 1.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v["BarberSpot"][1], v["BarberSpot"][2], v["BarberSpot"][3]-1.1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.4, 179, 166, 122, 155, 0, 0, 2, 0, 0, 0, 0)
                    price = 0.0
                    for k,v in pairs(pricing_table) do
                        price = price+v
                    end
                    if active == false then
                        if price == 0.0 then
                            local item_name = CreateVarString(10, 'LITERAL_STRING', Config.Language[2].text)
                            PromptSetActiveGroupThisFrame(buttons_prompt, item_name)
                        else
                            local item_name = CreateVarString(10, 'LITERAL_STRING', Config.Language[2].text.." : "..price.."$")
                            PromptSetActiveGroupThisFrame(buttons_prompt, item_name)
                        end
                    end
                    if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) then
                        local closestPlayer, closestDistance = GetClosestPlayer()
                        if closestPlayer ~= -1 and closestDistance <= 1.5 then  
                            exports['gum_notify']:DisplayLeftNotification(Config.Language[1].text, Config.Language[3].text, 'character', 1500)
                        else
                            TriggerEvent('gum:ExecuteServerCallBack','gum_barberstore:get_outfit', function(skintable, comptable)
                                if skintable ~= 0 and skintable ~= nil and comptable ~= 0 and comptable ~= nil then
                                    Skin_Table = json.decode(skintable)
                                    Skin_Table_Backup = json.decode(skintable)
                                    Clothe_Table = json.decode(comptable)
                                    local hair = -1
                                    local beard = -1
                                    for k,v in pairs(Hair_Table) do
                                        if tonumber(v.hash) == Skin_Table['Hair'] then
                                            hair = k
                                        end
                                    end
                                    for k,v in pairs(Beard_Table) do
                                        if tonumber(v.hash) == Skin_Table['Beard'] then
                                            beard = k
                                        end
                                    end
        
                                    for k,v in pairs(TeethsTable) do
                                        if tonumber(v.hash) == Skin_Table['Teeth'] then
                                            teeth = k
                                        end
                                    end
                                    
                                    Citizen.InvokeNative(0x322BFDEA666E2B0E, PlayerPedId(), v["BarberSpot"][1], v["BarberSpot"][2], v["BarberSpot"][3], 2.0, -1, 1, 1, 1, 1)
                                    Citizen.Wait(8000)
                                    SetGameplayCamRelativeHeading(0.0, 1.0)
                                    SetGameplayCamRelativePitch(0.0, 1.0)
                                    
                                    SendNUIMessage({
                                        type = "barber_open",
                                        status = true,
                                        hair = hair,
                                        beard = beard,
                                        teeth = teeth,
        
                                        SCARS_TYPE=Skin_Table["scars_tx_id"],
                                        SCARS_OPACITY=Skin_Table["scars_opacity"],
        
                                        SPOTS_TYPE=Skin_Table["spots_tx_id"],
                                        SPOTS_OPACITY=Skin_Table["spots_opacity"],
        
                                        DISC_TYPE=Skin_Table["disc_tx_id"],
                                        DISC_OPACITY=Skin_Table["disc_opacity"],
        
                                        COMPLEX_TYPE=Skin_Table["complex_tx_id"],
                                        COMPLEX_OPACITY=Skin_Table["complex_opacity"],
        
                                        ACNE_TYPE=Skin_Table["acne_tx_id"],
                                        ACNE_OPACITY=Skin_Table["acne_opacity"],
        
                                        AGEING_TYPE=Skin_Table["ageing_tx_id"],
                                        AGEING_OPACITY=Skin_Table["ageing_opacity"],
        
                                        FRECKLES_TYPE=Skin_Table["freckles_tx_id"],
                                        FRECKLES_OPACITY=Skin_Table["freckles_opacity"],
        
                                        MOLES_TYPE=Skin_Table["moles_tx_id"],
                                        MOLES_OPACITY=Skin_Table["moles_opacity"],
        
                                        EYEBROWS_TYPE=Skin_Table["eyebrows_tx_id"],
                                        EYEBROWS_OPACITY=Skin_Table["eyebrows_opacity"],
                                        EYEBROWS_COLOR1=Skin_Table["eyebrows_color"],
        
                                        LIPSTICKS_TYPE=Skin_Table["lipsticks_tx_id"],
                                        LIPSTICKS_OPACITY=Skin_Table["lipsticks_opacity"],
                                        LIPSTICKS_COLOR1=Skin_Table["lipsticks_color_1"],
                                        LIPSTICKS_COLOR2=Skin_Table["lipsticks_color_2"],
                                        LIPSTICKS_COLOR3=Skin_Table["lipsticks_color_3"],
        
                                        SHADOWS_OPACITY=Skin_Table["shadows_opacity"],
                                        SHADOWS_TYPE=Skin_Table["shadows_tx_id"],
                                        SHADOWS_COLOR1=Skin_Table["shadows_color_1"],
                                        SHADOWS_COLOR2=Skin_Table["shadows_color_2"],
                                        SHADOWS_COLOR3=Skin_Table["shadows_color_3"],
        
                                        BEARDSSTABLE_OPACITY=Skin_Table["beardstabble_opacity"],
                                        BEARDSSTABLE_COLOR= Skin_Table["beardstabble_color_1"],
        
                                        EYELINNERS_OPACITY=Skin_Table["eyeliners_opacity"],
                                        EYELINNERS_TYPE=Skin_Table["eyeliners_tx_id"],
                                        EYELINNERS_COLOR1=Skin_Table["eyeliners_color_1"],
        
                                        BRUSH_OPACITY=Skin_Table["blush_opacity"],
                                        BRUSH_TYPE=Skin_Table["blush_tx_id"],
                                        BRUSH_COLOR1=Skin_Table["blush_color_1"],
                                    })
                                    SetNuiFocus(true, true)
                                end
                            end)
                        end
                    end
                    optimalize = 5
                else
                    optimalize = 2000
                end
            end
        end
        Citizen.Wait(optimalize)
    end
end)
RegisterNUICallback('left_key', function(data, cb)
    SetGameplayCamRelativeHeading(GetGameplayCamRelativeHeading()-6.0, 1.0)
end)
RegisterNUICallback('right_key', function(data, cb)
    SetGameplayCamRelativeHeading(GetGameplayCamRelativeHeading()+6.0, 1.0)
end)
RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({type = "barber_maker", status = false})
    ClearPedTasks(PlayerPedId())
    Skin_Table = Skin_Table_Backup
    ExecuteCommand('db')
    price = 0.0
    for k,v in pairs(pricing_table) do
        price = price+v
    end
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "barber_maker",
        status = false,
    })
    pricing_table = {}
    price = 0.0
end)

RegisterNUICallback('send_change', function(data, cb)
    if data.id == "HAIRS" then
        if tonumber(data.value) == 0 then
            pricing_table["Hair"] = 0.0
            Skin_Table["Hair"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x864B03AE, 0)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
        else
            pricing_table["Hair"] = 0.5
            for k,v in pairs(Hair_Table) do
                if k == tonumber(data.value) then
                    Skin_Table["Hair"] = tonumber(v.hash)
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(v.hash), true,true,true)
                    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                end
            end
        end
    elseif data.id == "HAIRSACCESSORIE" then
        if tonumber(data.value) == 0 then
            pricing_table["HairAccesorie"] = 0.0
            Skin_Table["HairAccesorie"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x8E84A2AA, 0)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
        else
            pricing_table["HairAccesorie"] = 0.5
            for k,v in pairs(HairAccTable) do
                if k == tonumber(data.value) then
                    Skin_Table["HairAccesorie"] = tonumber(v.hash)
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(v.hash), true,true,true)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                    Citizen.Wait(100)
                    Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x864B03AE, 0)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                    Citizen.Wait(100)
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(Skin_Table["Hair"]), true,true,true)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                end
            end
        end
    elseif data.id == "TEETHS" then
        if tonumber(data.value) == 0 then
            pricing_table["Teeth"] = 0.0
            Skin_Table["Teeth"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x96EDAE5C, 0)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
        else
            pricing_table["Teeth"] = 0.2
            for k,v in pairs(TeethsTable) do
                if k == tonumber(data.value) then
                    RequestAnimDict("FACE_HUMAN@GEN_MALE@BASE")
                    while not HasAnimDictLoaded("FACE_HUMAN@GEN_MALE@BASE") do
                        Citizen.Wait(100)
                    end
                    TaskPlayAnim(PlayerPedId(), "FACE_HUMAN@GEN_MALE@BASE", "Face_Dentistry_Loop", 1090519040, -4, -1, 17, 0, 0, 0, 0, 0, 0);

                    Skin_Table["Teeth"] = tonumber(v.hash)
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(v.hash), true,true,true)
                end
            end
        end
    elseif data.id == "BEARDS" then
        if tonumber(data.value) == 0 then
            Skin_Table["Beard"] = -1
            pricing_table["Beard"] = 0.0
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xF8016BCA, 0)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
        else
            pricing_table["Teeth"] = 0.25
            for k,v in pairs(Beard_Table) do
                if k == tonumber(data.value) then
                    Skin_Table["Beard"] = tonumber(v.hash)
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(v.hash), true,true,true)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                end
            end
        end
    elseif data.id == "BEARDSSTABLE_COLOR" then
        beardstabble_color_1 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "beardstabble",beardstabble_enable, beardstabble_texture,1,0,0,1.0,0,1,beardstabble_color_1,0,0,1,beardstabble_opacity/10)
        Skin_Table["beardstabble_color_1"] = beardstabble_color_1
    elseif data.id == "BEARDSSTABLE_OPACITY" then
        beardstabble_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "beardstabble",beardstabble_enable, beardstabble_texture,1,0,0,1.0,0,1,beardstabble_color_1,0,0,1,beardstabble_opacity/10)
        Skin_Table["beardstabble_opacity"] = beardstabble_opacity/10
    elseif data.id == "SHADOWS_TYPE" then
        shadow_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "shadows",shadow_enable,1,1,0,0,1.0,0,1,shadow_color_1,shadow_color_2,shadow_color_3,shadow_texture,shadow_opacity/10)
        Skin_Table["shadows_tx_id"] = shadow_texture
    elseif data.id == "SHADOWS_OPACITY" then
        shadow_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "shadows",shadow_enable,1,1,0,0,1.0,0,1,shadow_color_1,shadow_color_2,shadow_color_3,shadow_texture,shadow_opacity/10)
        Skin_Table["shadows_opacity"] = shadow_opacity/10
    elseif data.id == "SHADOWS_COLOR1" then
        shadow_color_1 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "shadows",shadow_enable,1,1,0,0,1.0,0,1,shadow_color_1,shadow_color_2,shadow_color_3,shadow_texture,shadow_opacity/10)
        Skin_Table["shadows_color_1"] = shadow_color_1
    elseif data.id == "SHADOWS_COLOR2" then
        shadow_color_2 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "shadows",shadow_enable,1,1,0,0,1.0,0,1,shadow_color_1,shadow_color_2,shadow_color_3,shadow_texture,shadow_opacity/10)
        Skin_Table["shadows_color_2"] = shadow_color_2
    elseif data.id == "SHADOWS_COLOR3" then
        shadow_color_3 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "shadows",shadow_enable,1,1,0,0,1.0,0,1,shadow_color_1,shadow_color_2,shadow_color_3,shadow_texture,shadow_opacity/10)
        Skin_Table["shadows_color_3"] = shadow_color_3
    elseif data.id == "SCARS_TYPE" then
        scars_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "scars", scars_visibility, scars_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, scars_opacity/10);
        Skin_Table["scars_tx_id"] = scars_texture
    elseif data.id == "SCARS_OPACITY" then
        scars_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "scars", scars_visibility, scars_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, scars_opacity/10);
        Skin_Table["scars_opacity"] = scars_opacity/10
    elseif data.id == "SPOTS_TYPE" then
        spots_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "spots", spots_visibility, spots_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, spots_opacity/10);
        Skin_Table["spots_tx_id"] = spots_texture
    elseif data.id == "SPOTS_OPACITY" then
        spots_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "spots", spots_visibility, spots_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, spots_opacity/10);
        Skin_Table["spots_opacity"] = spots_opacity/10
    elseif data.id == "DISC_TYPE" then
        disc_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "disc", disc_visibility, disc_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, disc_opacity/10);
        Skin_Table["disc_tx_id"] = disc_texture
    elseif data.id == "DISC_OPACITY" then
        disc_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "disc", disc_visibility, disc_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, disc_opacity/10);
        Skin_Table["disc_opacity"] = disc_opacity/10
    elseif data.id == "COMPLEX_TYPE" then
        complex_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "complex", complex_visibility, complex_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, complex_opacity/10);
        Skin_Table["complex_tx_id"] = complex_texture
    elseif data.id == "COMPLEX_OPACITY" then
        complex_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "complex", complex_visibility, complex_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, complex_opacity/10);
        Skin_Table["complex_opacity"] = complex_opacity/10
    elseif data.id == "ACNE_TYPE" then
        acne_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "acne", acne_visibility, acne_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, acne_opacity/10);
        Skin_Table["acne_tx_id"] = acne_texture
    elseif data.id == "ACNE_OPACITY" then
        acne_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "acne", acne_visibility, acne_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, acne_opacity/10);
        Skin_Table["acne_opacity"] = acne_opacity/10
    elseif data.id == "AGEING_TYPE" then
        ageing_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "ageing", ageing_visibility, ageing_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, ageing_opacity/10);
        Skin_Table["ageing_tx_id"] = ageing_texture
    elseif data.id == "AGEING_OPACITY" then
        ageing_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "ageing", ageing_visibility, ageing_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, ageing_opacity/10);
        Skin_Table["ageing_opacity"] = ageing_opacity/10
    elseif data.id == "FRECKLES_TYPE" then
        freckles_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "freckles", freckles_visibility, freckles_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, freckles_opacity/10);
        Skin_Table["freckles_tx_id"] = freckles_texture
    elseif data.id == "FRECKLES_OPACITY" then
        freckles_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "freckles", freckles_visibility, freckles_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, freckles_opacity/10);
        Skin_Table["freckles_opacity"] = freckles_opacity/10
    elseif data.id == "MOLES_TYPE" then
        moles_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "moles", moles_visibility, moles_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, moles_opacity/10);
        Skin_Table["moles_tx_id"] = moles_texture
    elseif data.id == "MOLES_OPACITY" then
        moles_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "moles", moles_visibility, moles_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, moles_opacity/10);
        Skin_Table["moles_opacity"] = moles_opacity/10
    elseif data.id == "EYEBROWS_TYPE" then
        eyebrows_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "eyebrows",eyebrows_enable, eyebrows_texture,1,0,0,1.0,0,1,eyebrows_color_1,0,0,1,eyebrows_opacity/10)
        Skin_Table["eyebrows_tx_id"] = eyebrows_texture
    elseif data.id == "EYEBROWS_OPACITY" then
        eyebrows_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "eyebrows",eyebrows_enable, eyebrows_texture,1,0,0,1.0,0,1,eyebrows_color_1,0,0,1,eyebrows_opacity/10)
        Skin_Table["eyebrows_opacity"] = eyebrows_opacity/10
    elseif data.id == "EYEBROWS_COLOR1" then
        eyebrows_color_1 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "eyebrows",eyebrows_enable, eyebrows_texture,1,0,0,1.0,0,1,eyebrows_color_1,0,0,1,eyebrows_opacity/10)
        Skin_Table["eyebrows_color"] = eyebrows_color_1
    elseif data.id == "EYELINNERS_TYPE" then
        eyeliners_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "eyeliners",eyeliners_enable, 1,1,0,0,1.0,0,1,eyeliners_color_1,0,0,eyeliners_texture,eyeliners_opacity/10)
        Skin_Table["eyeliners_tx_id"] = eyeliners_texture
    elseif data.id == "EYELINNERS_OPACITY" then
        eyeliners_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "eyeliners",eyeliners_enable, 1,1,0,0,1.0,0,1,eyeliners_color_1,0,0,eyeliners_texture,eyeliners_opacity/10)
        Skin_Table["eyeliners_opacity"] = eyeliners_opacity/10
    elseif data.id == "EYELINNERS_COLOR1" then
        eyeliners_color_1 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "eyeliners",eyeliners_enable, 1,1,0,0,1.0,0,1,eyeliners_color_1,0,0,eyeliners_texture,eyeliners_opacity/10)
        Skin_Table["eyeliners_color_1"] = eyeliners_color_1
    elseif data.id == "BRUSH_TYPE" then
        blush_enable = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "blush",blush_enable, blush_texture,1,0,0,1.0,0,1,blush_color_1,0,0,1,blush_opacity/10)
        Skin_Table["blush_tx_id"] = blush_texture
    elseif data.id == "BRUSH_OPACITY" then
        blush_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "blush",blush_enable, blush_texture,1,0,0,1.0,0,1,blush_color_1,0,0,1,blush_opacity/10)
        Skin_Table["blush_opacity"] = blush_opacity/10
    elseif data.id == "BRUSH_COLOR1" then
        blush_color_1 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "blush",blush_enable, blush_texture,1,0,0,1.0,0,1,blush_color_1,0,0,1,blush_opacity/10)
        Skin_Table["blush_color_1"] = blush_color_1
    elseif data.id == "LIPSTICKS_TYPE" then
        lipsticks_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "lipsticks",lipsticks_enable,1,1,0,0,1.0,0,1,lipsticks_color_1,lipsticks_color_2,lipsticks_color_3,lipsticks_texture,lipsticks_opacity/10)
        Skin_Table["lipsticks_tx_id"] = lipsticks_texture
    elseif data.id == "LIPSTICKS_OPACITY" then
        lipsticks_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "lipsticks",lipsticks_enable,1,1,0,0,1.0,0,1,lipsticks_color_1,lipsticks_color_2,lipsticks_color_3,lipsticks_texture,lipsticks_opacity/10)
        Skin_Table["lipsticks_opacity"] = lipsticks_opacity/10
    elseif data.id == "LIPSTICKS_COLOR1" then
        lipsticks_color_1 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "lipsticks",lipsticks_enable,1,1,0,0,1.0,0,1,lipsticks_color_1,lipsticks_color_2,lipsticks_color_3,lipsticks_texture,lipsticks_opacity/10)
        Skin_Table["lipsticks_color_1"] = lipsticks_color_1
    elseif data.id == "LIPSTICKS_COLOR2" then
        lipsticks_color_2 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "lipsticks",lipsticks_enable,1,1,0,0,1.0,0,1,lipsticks_color_1,lipsticks_color_2,lipsticks_color_3,lipsticks_texture,lipsticks_opacity/10)
        Skin_Table["lipsticks_color_2"] = lipsticks_color_2
    elseif data.id == "LIPSTICKS_COLOR3" then
        lipsticks_color_3 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "lipsticks",lipsticks_enable,1,1,0,0,1.0,0,1,lipsticks_color_1,lipsticks_color_2,lipsticks_color_3,lipsticks_texture,lipsticks_opacity/10)
        Skin_Table["lipsticks_color_3"] = lipsticks_color_3
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
end)

RegisterNUICallback('save_character', function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({type = "barber_maker",status = false})
    price = 0.0
    for k,v in pairs(pricing_table) do
        price = price+v
    end

    TriggerEvent("gum_character:send_data_back", Skin_Table, Clothe_Table)
    TriggerServerEvent("gum_barberstore:save_skin", Skin_Table, price)
    FreezeEntityPosition(PlayerPedId(),false)
    EndCam()
    ClearPedTasks(PlayerPedId())
    ExecuteCommand("db")
    pricing_table = {}
    price = 0.0
end)

function EndCam()
    RenderScriptCams(false, true, 1000, true, false)
    DestroyCam(camera, false)
    camera = nil
    DestroyAllCams(true)
    Citizen.InvokeNative(0xD0AFAFF5A51D72F7, PlayerPedId())
end

RegisterNUICallback('enable_disable', function(data, cb)
    if data.id == "BEARDSSTABLE_CHECK" then
        if data.check == false then
            beardstabble_enable = 0
            TriggerEvent("gum_characters:colors", "beardstabble",beardstabble_enable, 1,1,0,0,1.0,0,1,beardstabble_color_1,0,0,1,beardstabble_opacity/10)
            Skin_Table["beardstabble_visibility"] = beardstabble_enable
        else
            beardstabble_enable = 1
            TriggerEvent("gum_characters:colors", "beardstabble",beardstabble_enable, 1,1,0,0,1.0,0,1,beardstabble_color_1,0,0,1,beardstabble_opacity/10)
            Skin_Table["beardstabble_visibility"] = beardstabble_enable
        end
    elseif data.id == "SHADOWS_CHECK" then
        if data.check == false then
            shadow_enable = 0
            TriggerEvent("gum_characters:colors", "shadows",shadow_enable,1,1,0,0,1.0,0,1,shadow_color_1,shadow_color_2,shadow_color_3,shadow_texture,shadow_opacity/10)
            Skin_Table["shadows_visibility"] = shadow_enable
        else
            shadow_enable = 1
            TriggerEvent("gum_characters:colors", "shadows",shadow_enable,1,1,0,0,1.0,0,1,shadow_color_1,shadow_color_2,shadow_color_3,shadow_texture,shadow_opacity/10)
            Skin_Table["shadows_visibility"] = shadow_enable
        end
    elseif data.id == "SCARS_CHECK" then
        if data.check == false then
            scars_visibility = 0
            TriggerEvent("gum_characters:colors", "scars", scars_visibility, scars_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, scars_opacity/10);
            Skin_Table["scars_visibility"] = scars_visibility
        else
            scars_visibility = 1
            TriggerEvent("gum_characters:colors", "scars", scars_visibility, scars_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, scars_opacity/10);
            Skin_Table["scars_visibility"] = scars_visibility
        end
    elseif data.id == "SPOTS_CHECK" then
        if data.check == false then
            spots_visibility = 0
            TriggerEvent("gum_characters:colors", "spots", spots_visibility, spots_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, spots_opacity/10);
            Skin_Table["spots_visibility"] = spots_visibility
        else
            spots_visibility = 1
            TriggerEvent("gum_characters:colors", "spots", spots_visibility, spots_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, spots_opacity/10);
            Skin_Table["spots_visibility"] = spots_visibility
        end
    elseif data.id == "DISC_CHECK" then
        if data.check == false then
            disc_visibility = 0
            TriggerEvent("gum_characters:colors", "disc", disc_visibility, disc_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, disc_opacity/10);
            Skin_Table["disc_visibility"] = disc_visibility
        else
            disc_visibility = 1
            TriggerEvent("gum_characters:colors", "disc", disc_visibility, disc_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, disc_opacity/10);
            Skin_Table["disc_visibility"] = disc_visibility
        end
    elseif data.id == "COMPLEX_CHECK" then
        if data.check == false then
            complex_visibility = 0
            TriggerEvent("gum_characters:colors", "complex", complex_visibility, complex_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, complex_opacity/10);
            Skin_Table["complex_visibility"] = complex_visibility
        else
            complex_visibility = 1
            TriggerEvent("gum_characters:colors", "complex", complex_visibility, complex_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, complex_opacity/10);
            Skin_Table["complex_visibility"] = complex_visibility
        end
    elseif data.id == "ACNE_CHECK" then
        if data.check == false then
            acne_visibility = 0
            TriggerEvent("gum_characters:colors", "acne", acne_visibility, acne_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, acne_opacity/10);
            Skin_Table["acne_visibility"] = acne_visibility
        else
            acne_visibility = 1
            TriggerEvent("gum_characters:colors", "acne", acne_visibility, acne_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, acne_opacity/10);
            Skin_Table["acne_visibility"] = acne_visibility
        end
    elseif data.id == "AGEING_CHECK" then
        if data.check == false then
            ageing_visibility = 0
            TriggerEvent("gum_characters:colors", "ageing", ageing_visibility, ageing_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, ageing_opacity/10);
            Skin_Table["ageing_visibility"] = ageing_visibility
        else
            ageing_visibility = 1
            TriggerEvent("gum_characters:colors", "ageing", ageing_visibility, ageing_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, ageing_opacity/10);
            Skin_Table["ageing_visibility"] = ageing_visibility
        end
    elseif data.id == "FRECKLES_CHECK" then
        if data.check == false then
            freckles_visibility = 0
            TriggerEvent("gum_characters:colors", "freckles", freckles_visibility, freckles_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, freckles_opacity/10);
            Skin_Table["freckles_visibility"] = freckles_visibility
        else
            freckles_visibility = 1
            TriggerEvent("gum_characters:colors", "freckles", freckles_visibility, freckles_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, freckles_opacity/10);
            Skin_Table["freckles_visibility"] = freckles_visibility
        end
    elseif data.id == "MOLES_CHECK" then
        if data.check == false then
            moles_visibility = 0
            TriggerEvent("gum_characters:colors", "moles", moles_visibility, moles_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, moles_opacity/10);
            Skin_Table["moles_visibility"] = moles_visibility
        else
            moles_visibility = 1
            TriggerEvent("gum_characters:colors", "moles", moles_visibility, moles_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, moles_opacity/10);
            Skin_Table["moles_visibility"] = moles_visibility
        end
    elseif data.id == "EYEBROWS_CHECK" then
        if data.check == false then
            eyebrows_enable = 0
            TriggerEvent("gum_characters:colors", "shadows",shadow_enable,1,1,0,0,1.0,0,1,shadow_color_1,shadow_color_2,shadow_color_3,shadow_texture,shadow_opacity/10)
            Skin_Table["eyebrows_visibility"] = eyebrows_enable
        else
            eyebrows_enable = 1
            TriggerEvent("gum_characters:colors", "shadows",shadow_enable,1,1,0,0,1.0,0,1,shadow_color_1,shadow_color_2,shadow_color_3,shadow_texture,shadow_opacity/10)
            Skin_Table["eyebrows_visibility"] = eyebrows_enable
        end
    elseif data.id == "EYELINNERS_CHECK" then
        if data.check == false then
            eyeliners_enable = 0
            TriggerEvent("gum_characters:colors", "eyeliners",eyeliners_enable, 1,1,0,0,1.0,0,1,eyeliners_color_1,0,0,eyeliners_texture,eyeliners_opacity/10)
            Skin_Table["eyeliners_visibility"] = eyeliners_enable
        else
            eyeliners_enable = 1
            TriggerEvent("gum_characters:colors", "eyeliners",eyeliners_enable, 1,1,0,0,1.0,0,1,eyeliners_color_1,0,0,eyeliners_texture,eyeliners_opacity/10)
            Skin_Table["eyeliners_visibility"] = eyeliners_enable
        end
    elseif data.id == "BRUSH_CHECK" then
        if data.check == false then
            blush_enable = 0
            TriggerEvent("gum_characters:colors", "blush",blush_enable,blush_texture,1,0,0,1.0,0,1,blush_color_1,0,0,1,blush_opacity/10)
            Skin_Table["blush_visibility"] = blush_enable
        else
            blush_enable = 1
            TriggerEvent("gum_characters:colors", "blush",blush_enable,blush_texture,1,0,0,1.0,0,1,blush_color_1,0,0,1,blush_opacity/10)
            Skin_Table["blush_visibility"] = blush_enable
        end
    elseif data.id == "LIPSTICKS_CHECK" then
        if data.check == false then
            lipsticks_enable = 0
            TriggerEvent("gum_characters:colors", "lipsticks",lipsticks_enable,1,1,0,0,1.0,0,1,lipsticks_color_1,lipsticks_color_2,lipsticks_color_3,lipsticks_texture,lipsticks_opacity/10)
            Skin_Table["lipsticks_visibility"] = lipsticks_enable
        else
            lipsticks_enable = 1
            TriggerEvent("gum_characters:colors", "lipsticks",lipsticks_enable,1,1,0,0,1.0,0,1,lipsticks_color_1,lipsticks_color_2,lipsticks_color_3,lipsticks_texture,lipsticks_opacity/10)
            Skin_Table["lipsticks_visibility"] = lipsticks_enable
        end
    end
end)


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
            end
        end
    end
    return closestPlayer, closestDistance
end

