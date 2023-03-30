local Skin_Table = {}
local Clothe_Table = {}
local HatsTable = {}
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
local heading = -83.32
local z_position = 239.35
local zoom = 50.0
local price = 0.0
local pricing_table = {}
local buttons_prompt = GetRandomIntInRange(0, 0xffffff)
local active = false
local buttons_prompt2 = GetRandomIntInRange(0, 0xffffff)
local active2 = false
local Clothe_Table_Backup = {}

RegisterNetEvent("gum:SelectedCharacter")
AddEventHandler("gum:SelectedCharacter", function(charid)
    Citizen.CreateThread(function()
        Citizen.Wait(10000)
        for k,v in pairs(Config.ClothingStore) do
            if v.BlipEnable == nil or v.BlipEnable == true then
                local blips = N_0x554d9d53f696d002(1664425300, v["ClothingStore"][1], v["ClothingStore"][2], v["ClothingStore"][3])
                SetBlipSprite(blips, 1195729388	, 1)
                SetBlipScale(blips, 1.5)
                Citizen.InvokeNative(0x9CB1A1623062F402, blips, v["ClothingBlip"])
            end
        end
        TriggerEvent('gum:ExecuteServerCallBack','gum_clothingstore:get_outfit', function(skintable, comptable)
            if skintable ~= 0 and skintable ~= nil and comptable ~= 0 and comptable ~= nil then
                Skin_Table = json.decode(skintable)
                Clothe_Table = json.decode(comptable)
            end
        end)
        if IsPedMale(PlayerPedId()) then
            for k,v in pairs(Config_2.Clothes) do
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "accessories" then
                    table.insert(AccesorieTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "gauntlets" then
                    table.insert(GauntletTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "skirts" then
                    table.insert(SkirtTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "boots" then
                    table.insert(BootTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "masks" then
                    table.insert(MaskTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "chaps" then
                    table.insert(ChapTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "pants" then
                    table.insert(PantTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "holsters_right" then
                    table.insert(RHolsterTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "holsters_left" then
                    table.insert(LHolsterTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "belt_buckles" then
                    table.insert(BucklesTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "belts" then
                    table.insert(BeltsTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "gunbelts" then
                    table.insert(GunbeltTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "jewelry_bracelets" then
                    table.insert(BraceletTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "jewelry_rings_left" then
                    table.insert(LRingTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "jewelry_rings_right" then
                    table.insert(RRingTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "gloves" then
                    table.insert(GloveTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "cloaks" then
                    table.insert(CloakTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "loadouts" then
                    table.insert(LoadoutsTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "ponchos" then
                    table.insert(PonchoTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "coats_closed" then
                    table.insert(ClosedCoatTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "coats" then
                    table.insert(CoatTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "vests" then
                    table.insert(VestTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "hats" then
                    table.insert(HatsTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "spats" then
                    table.insert(SpatsTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "eyewear" then
                    table.insert(EyewearTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hashsign, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "neckwear" then
                    table.insert(ScarftTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "neckties" then
                    table.insert(NecktieTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "shirts_full" then
                    table.insert(ShirtTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "suspenders" then
                    table.insert(SuspenderTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "boot_accessories" then
                    table.insert(SpurTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "satchels" then
                    table.insert(SatchelTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "gunbelt_accs" then
                    table.insert(GunbeltAcsTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
            end
        else
            for k,v in pairs(Config_2.Clothes) do
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "gauntlets" then
                    table.insert(GauntletTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "skirts" then
                    table.insert(SkirtTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "boots" then
                    table.insert(BootTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "masks" then
                    table.insert(MaskTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "chaps" then
                    table.insert(ChapTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "pants" then
                    table.insert(PantTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "holsters_right" then
                    table.insert(RHolsterTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "holsters_left" then
                    table.insert(LHolsterTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "belt_buckles" then
                    table.insert(BucklesTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "belts" then
                    table.insert(BeltsTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "gunbelts" then
                    table.insert(GunbeltTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "jewelry_bracelets" then
                    table.insert(BraceletTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "jewelry_rings_left" then
                    table.insert(LRingTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "jewelry_rings_right" then
                    table.insert(RRingTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "gloves" then
                    table.insert(GloveTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "cloaks" then
                    table.insert(CloakTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "loadouts" then
                    table.insert(LoadoutsTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "ponchos" then
                    table.insert(PonchoTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "coats_closed" then
                    table.insert(ClosedCoatTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "coats" then
                    table.insert(CoatTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "vests" then
                    table.insert(VestTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "hats" then
                    table.insert(HatsTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "spats" then
                    table.insert(SpatsTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "eyewear" then
                    table.insert(EyewearTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hashsign, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "neckwear" then
                    table.insert(ScarftTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "neckties" then
                    table.insert(NecktieTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "shirts_full" then
                    table.insert(ShirtTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "suspenders" then
                    table.insert(SuspenderTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "boot_accessories" then
                    table.insert(SpurTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "satchels" then
                    table.insert(SatchelTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "gunbelt_accs" then
                    table.insert(GunbeltAcsTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
                if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "accessories" then
                    table.insert(AccesorieTable, {hashname=v.hashname, hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
                end
            end
        end
    end)
end)

function Button_Prompt()
	Citizen.CreateThread(function()
        local str = Config.Language[1].text
        Open_Store = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(Open_Store, 0x27D1C284)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(Open_Store, str)
        PromptSetEnabled(Open_Store, true)
        PromptSetVisible(Open_Store, true)
        PromptSetHoldMode(Open_Store, true)
        PromptSetGroup(Open_Store, buttons_prompt)
        PromptRegisterEnd(Open_Store)
	end)
end

RegisterNetEvent('gum_clothes:send_to_client')
AddEventHandler('gum_clothes:send_to_client', function(clothing_table,can_save)
    Clothe_Table = clothing_table
    if can_save then
        local coords_save = GetEntityCoords(PlayerPedId())
        TriggerEvent("gum_character:send_data_back", Skin_Table, Clothe_Table, coords_save)
    end
end)

Citizen.CreateThread(function()
    Button_Prompt()
    Button_Prompt2()
    while true do
        local optimalize = 1000
        local coords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Config.ClothingStore) do
            if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v["ClothingStore"][1], v["ClothingStore"][2], v["ClothingStore"][3], false) < 15 then
                if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v["ClothingStore"][1], v["ClothingStore"][2], v["ClothingStore"][3], false) < 1.5 then
                    Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, v["ClothingStore"][1], v["ClothingStore"][2], v["ClothingStore"][3] - 1.8, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 0.5, 179, 166, 122, 155, 0, 0, 2, 0, 0, 0, 0)
                    optimalize = 5
                    if active == false then
                        local item_name = CreateVarString(10, 'LITERAL_STRING', Config.Language[3].text)
                        PromptSetActiveGroupThisFrame(buttons_prompt, item_name)
                    end
                    if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x27D1C284) then
                        pricing_table = {}
                        TriggerEvent('gum:ExecuteServerCallBack','gum_clothingstore:get_outfit', function(skintable, comptable)
                            if skintable ~= 0 and skintable ~= nil and comptable ~= 0 and comptable ~= nil then
                                Skin_Table = json.decode(skintable)
                                Clothe_Table = json.decode(comptable)
                                Clothe_Table_Backup = comptable
                                local hat = -1
                                local eyewear = -1
                                local scarf = -1
                                local skirt = -1
                                local mask = -1
                                local necktie = -1
                                local shirt = -1
                                local suspender = -1
                                local vest = -1
                                local coat = -1
                                local closedcoat = -1
                                local poncho = -1
                                local cloak = -1
                                local rring = -1
                                local lring = -1
                                local spats = -1
                                local glove = -1
                                local loadout = -1
                                local bracelet = -1
                                local gunbelt = -1
                                local belt = -1
                                local buckle = -1
                                local lholster = -1
                                local rholster = -1
                                local pant = -1
                                local chap = -1
                                local boot = -1
                                local spur = -1
                                local satchel = -1
                                local gauntlet = -1
                                local accesorie = -1
                                local gunbeltacs = -1

                                for k,v in pairs(HatsTable) do
                                    if tonumber(v.hash) == Clothe_Table['Hat'] then
                                        hat = k
                                    end
                                end
                                for k,v in pairs(EyewearTable) do
                                    if tonumber(v.hash) == Clothe_Table['EyeWear'] then
                                        eyewear = k
                                    end
                                end
                                for k,v in pairs(ScarftTable) do
                                    if tonumber(v.hash) == Clothe_Table['NeckWear'] then
                                        scarf = k
                                    end
                                end
                                for k,v in pairs(MaskTable) do
                                    if tonumber(v.hash) == Clothe_Table['Mask'] then
                                        mask = k
                                    end
                                end
                                for k,v in pairs(NecktieTable) do
                                    if tonumber(v.hash) == Clothe_Table['NeckTies'] then
                                        necktie = k
                                    end
                                end
                                for k,v in pairs(ShirtTable) do
                                    if tonumber(v.hash) == Clothe_Table['Shirt'] then
                                        shirt = k
                                    end
                                end
                                for k,v in pairs(SuspenderTable) do
                                    if tonumber(v.hash) == Clothe_Table['Suspender'] then
                                        suspender = k
                                    end
                                end
                                for k,v in pairs(VestTable) do
                                    if tonumber(v.hash) == Clothe_Table['Vest'] then
                                        vest = k
                                    end
                                end
                                for k,v in pairs(CoatTable) do
                                    if tonumber(v.hash) == Clothe_Table['Coat'] then
                                        coat = k
                                    end
                                end
                                for k,v in pairs(ClosedCoatTable) do
                                    if tonumber(v.hash) == Clothe_Table['CoatClosed'] then
                                        closedcoat = k
                                    end
                                end
                                for k,v in pairs(PonchoTable) do
                                    if tonumber(v.hash) == Clothe_Table['Poncho'] then
                                        poncho = k
                                    end
                                end
                                for k,v in pairs(CloakTable) do
                                    if tonumber(v.hash) == Clothe_Table['Cloak'] then
                                        cloak = k
                                    end
                                end
                                for k,v in pairs(GloveTable) do
                                    if tonumber(v.hash) == Clothe_Table['Glove'] then
                                        glove = k
                                    end
                                end
                                for k,v in pairs(RRingTable) do
                                    if tonumber(v.hash) == Clothe_Table['RingRh'] then
                                        rring = k
                                    end
                                end
                                for k,v in pairs(LRingTable) do
                                    if tonumber(v.hash) == Clothe_Table['RingLh'] then
                                        lring = k
                                    end
                                end
                                for k,v in pairs(SpatsTable) do
                                    if tonumber(v.hash) == Clothe_Table['Spats'] then
                                        spats = k
                                    end
                                end
                                for k,v in pairs(LoadoutsTable) do
                                    if tonumber(v.hash) == Clothe_Table['Loadouts'] then
                                        loadout = k
                                    end
                                end
                                for k,v in pairs(BraceletTable) do
                                    if tonumber(v.hash) == Clothe_Table['Bracelet'] then
                                        bracelet = k
                                    end
                                end
                                for k,v in pairs(GunbeltTable) do
                                    if tonumber(v.hash) == Clothe_Table['Gunbelt'] then
                                        gunbelt = k
                                    end
                                end
                                for k,v in pairs(BeltsTable) do
                                    if tonumber(v.hash) == Clothe_Table['Belt'] then
                                        belt = k
                                    end
                                end
                                for k,v in pairs(BucklesTable) do
                                    if tonumber(v.hash) == Clothe_Table['Buckle'] then
                                        buckle = k
                                    end
                                end
                                for k,v in pairs(LHolsterTable) do
                                    if tonumber(v.hash) == Clothe_Table['Holster'] then
                                        lholster = k
                                    end
                                end
                                for k,v in pairs(PantTable) do
                                    if tonumber(v.hash) == Clothe_Table['Pant'] then
                                        pant = k
                                    end
                                end
                                for k,v in pairs(ChapTable) do
                                    if tonumber(v.hash) == Clothe_Table['Chap'] then
                                        chap = k
                                    end
                                end
                                for k,v in pairs(BootTable) do
                                    if tonumber(v.hash) == Clothe_Table['Boots'] then
                                        boot = k
                                    end
                                end
                                for k,v in pairs(SkirtTable) do
                                    if tonumber(v.hash) == Clothe_Table['Skirt'] then
                                        skirt = k
                                    end
                                end
                                for k,v in pairs(SpurTable) do
                                    if tonumber(v.hash) == Clothe_Table['Spurs'] then
                                        spur = k
                                    end
                                end
                                for k,v in pairs(SatchelTable) do
                                    if tonumber(v.hash) == Clothe_Table['Satchel'] then
                                        satchel = k
                                    end
                                end
                                for k,v in pairs(GauntletTable) do
                                    if tonumber(v.hash) == Clothe_Table['Gauntlets'] then
                                        gauntlet = k
                                    end
                                end
                                for k,v in pairs(GunbeltAcsTable) do
                                    if tonumber(v.hash) == Clothe_Table['GunbeltAccs'] then
                                        gunbeltacs = k
                                    end
                                end
                                for k,v in pairs(AccesorieTable) do
                                    if tonumber(v.hash) == Clothe_Table['Accessories'] then
                                        accesorie = k
                                    end
                                end
                                SendNUIMessage({
                                    type = "clothing_data_now",
                                    status = true,
                                    hats = hat,
                                    eyewear = eyewear,
                                    scarf = scarf,
                                    mask = mask,
                                    necktie = necktie,
                                    shirt = shirt,
                                    suspender = suspender,
                                    vest = vest,
                                    coat  = coat,
                                    ccoat = closedcoat,
                                    poncho = poncho,
                                    cloak = cloak,
                                    glove = glove,
                                    rring = rring,
                                    lring = lring,
                                    bracelet = bracelet,
                                    gunbelt = gunbelt,
                                    gunbeltacs = gunbeltacs,
                                    belts = belt,
                                    buckles = buckle,
                                    lholster = lholster,
                                    pants = pant,
                                    spats = spats,
                                    skirt = skirt,
                                    chap = chap,
                                    boot = boot,
                                    spur = spur,
                                    gauntlet = gauntlet,
                                    accesorie = accesorie,
                                    satchel = satchel,
                                    loadouts = loadout,
                                })
                            end
                        end)
                        where_open = k
                        cam_pos = v["ClothingCamera"][4]
                        TaskGoToCoordAnyMeans(PlayerPedId(), v["ClothingSpott"][1], v["ClothingSpott"][2], v["ClothingSpott"][3], 1.0, 0, 0, 1, 0)
                        --Citizen.InvokeNative(0x322BFDEA666E2B0E, PlayerPedId(), 307.32, 813.41, 119.7, 2.0, -1, 1, 1, 1, 1)
                        SetEntityCoords(PlayerPedId(), v["ClothingSpott"][1], v["ClothingSpott"][2], v["ClothingSpott"][3])
                        SetEntityHeading(PlayerPedId(), heading)
                        FreezeEntityPosition(PlayerPedId(), true)
                        z_position = v["ClothingCamera"][3]
                        max_z_count = v["ClothingCamera"][3]
                        open_clothingstore()
                        in_clothe = true
                    end
                else
                    optimalize = 2000
                end
                if in_clothe == true then
                    DrawLightWithRange(tonumber(string.format("%.2f", v["Light"][1])), tonumber(string.format("%.2f", v["Light"][2])), tonumber(string.format("%.2f", v["Light"][3])), 255, 255, 255, tonumber(string.format("%.2f", 2.5)), tonumber(string.format("%.2f", 30.0)))
                    price = 0.0
                    for k,v in pairs(pricing_table) do
                        price = price+v
                    end
                    if active2 == false then
                        local item_name = CreateVarString(10, 'LITERAL_STRING', ""..Config.Language[3].text..""..price.."$")
                        PromptSetActiveGroupThisFrame(buttons_prompt2, item_name)
                    end
                    optimalize = 5
                    StartCamClothing(v["ClothingCamera"][1], v["ClothingCamera"][2], z_position, v["ClothingCamera"][4], zoom)
                    SetEntityHeading(PlayerPedId(), heading)
                end
            end
        end
        Citizen.Wait(optimalize)
    end
end)

function Button_Prompt2()
	Citizen.CreateThread(function()
		local str = Config.Language[5].text
		RotateLPrompt = PromptRegisterBegin()
		PromptSetControlAction(RotateLPrompt, 0x20190AB4)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(RotateLPrompt, str)
		PromptSetEnabled(RotateLPrompt, true)
		PromptSetVisible(RotateLPrompt, true)
		PromptSetHoldMode(RotateLPrompt, true)
        PromptSetGroup(RotateLPrompt, buttons_prompt2)
		PromptRegisterEnd(RotateLPrompt)
	end)
	Citizen.CreateThread(function()
		local str = Config.Language[6].text
		RotateRPrompt = PromptRegisterBegin()
		PromptSetControlAction(RotateRPrompt, 0xDEB34313)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(RotateRPrompt, str)
		PromptSetEnabled(RotateRPrompt, true)
		PromptSetVisible(RotateRPrompt, true)
		PromptSetHoldMode(RotateRPrompt, true)
        PromptSetGroup(RotateRPrompt, buttons_prompt2)
		PromptRegisterEnd(RotateRPrompt)
	end)
    Citizen.CreateThread(function()
		local str = Config.Language[7].text
		UpPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(UpPrompt, 0x05CA7C52)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(UpPrompt, str)
		PromptSetEnabled(UpPrompt, true)
		PromptSetVisible(UpPrompt, true)
		PromptSetHoldMode(UpPrompt, true)
		PromptSetGroup(UpPrompt, buttons_prompt2)
		PromptRegisterEnd(UpPrompt)
	end)
	Citizen.CreateThread(function()
		local str = Config.Language[8].text
		DownPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
		PromptSetControlAction(DownPrompt, 0x6319DB71)
		str = CreateVarString(10, 'LITERAL_STRING', str)
		PromptSetText(DownPrompt, str)
		PromptSetEnabled(DownPrompt, true)
		PromptSetVisible(DownPrompt, true)
		PromptSetHoldMode(DownPrompt, true)
		PromptSetGroup(DownPrompt, buttons_prompt2)
		PromptRegisterEnd(DownPrompt)
	end)
    Citizen.CreateThread(function()
        local str = Config.Language[9].text
        Zoom1Prompt = PromptRegisterBegin()
        PromptSetControlAction(Zoom1Prompt, 0xE885EF16)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(Zoom1Prompt, str)
        PromptSetEnabled(Zoom1Prompt, true)
        PromptSetVisible(Zoom1Prompt, true)
        PromptSetHoldMode(Zoom1Prompt, true)
        PromptSetGroup(Zoom1Prompt, buttons_prompt2)
        PromptRegisterEnd(Zoom1Prompt)
    end)
    Citizen.CreateThread(function()
        local str = Config.Language[10].text
        Zoom2Prompt = PromptRegisterBegin()
        PromptSetControlAction(Zoom2Prompt, 0x2277FAE9)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(Zoom2Prompt, str)
        PromptSetEnabled(Zoom2Prompt, true)
        PromptSetVisible(Zoom2Prompt, true)
        PromptSetHoldMode(Zoom2Prompt, true)
        PromptSetGroup(Zoom2Prompt, buttons_prompt2)
        PromptRegisterEnd(Zoom2Prompt)
    end)
end

function StartCamClothing(x,y,z, heading, zoom)
    Citizen.InvokeNative(0x17E0198B3882C2CB, PlayerPedId())
    DestroyAllCams(true)
    local camera_pos = GetObjectOffsetFromCoords(x,y,z ,0.0 ,1.0, 1.0, 1.0)
    camera = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", x,y,z, -10.0, 00.00, heading, zoom, true, 0)
    SetCamActive(camera,true)
    RenderScriptCams(true, true, 500, true, true)
end

RegisterNUICallback('up_key', function(data, cb)
    if z_position <= max_z_count+1.0 then
        z_position = z_position+0.05
    end
end)

RegisterNUICallback('down_key', function(data, cb)
    if z_position >= max_z_count-1.0 then
        z_position = z_position-0.05
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
end)
RegisterNUICallback('unzoom_key', function(data, cb)
    zoom = zoom+5.0
end)


function open_clothingstore()
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "clothing_maker",
        status = true,
        maxhats = #HatsTable,
        maxeyewear = #EyewearTable,
        maxscarf = #ScarftTable,
        maxmask = #MaskTable,
        maxnecktie = #NecktieTable,
        maxshirt = #ShirtTable,
        maxsuspender = #SuspenderTable,
        maxvest = #VestTable,
        maxcoat  = #CoatTable,
        maxccoat = #ClosedCoatTable,
        maxponcho = #PonchoTable,
        maxcloak = #CloakTable,
        maxglove = #GloveTable,
        maxrring = #RRingTable,
        maxlring = #LRingTable,
        maxbracelet = #BraceletTable,
        maxgunbelt = #GunbeltTable,
        maxgunbeltacs = #GunbeltAcsTable,
        maxbelts = #BeltsTable,
        maxbuckles = #BucklesTable,
        maxlholster = #LHolsterTable,
        maxpants = #PantTable,
        maxspats = #SpatsTable,
        maxskirt = #SkirtTable,
        maxchap = #ChapTable,
        maxboot = #BootTable,
        maxspur = #SpurTable,
        maxgauntlet = #GauntletTable,
        maxaccesorie = #AccesorieTable,
        maxsatchel = #SatchelTable,
        maxloadouts = #LoadoutsTable,
    })
end
function play_anim(dict, name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), dict, name, 1.0, 1.0, time, flag, 0, true, 0, false, 0, false)  
end
--Klobouk
RegisterCommand(''..Config.Language[200].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x9925C067) then
        play_anim('mech_loco_m@character@arthur@fidgets@weather@sunny_hot@unarmed@variations@hat', 'hat_cool_c', 1000, 25)
        Citizen.Wait(1000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9925C067, 0)
    else
        play_anim('mech_loco_m@character@arthur@fidgets@hat@normal@unarmed@normal@left_hand', 'hat_lhand_a', 2000, 25)
        Citizen.Wait(1500)
        for k,v in pairs(Clothe_Table) do
            if k == 'Hat' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
end)

--Brýle
RegisterCommand(''..Config.Language[201].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x5E47CA6) then
        play_anim('mech_inventory@binoculars', 'look', 600, 25)
        Citizen.Wait(600)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5E47CA6, 0)
    else
        play_anim('mech_inventory@binoculars', 'look', 600, 25)
        Citizen.Wait(600)
        for k,v in pairs(Clothe_Table) do
            if k == 'EyeWear' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Šátek
RegisterCommand(''..Config.Language[202].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x5FC29285) then
        play_anim('mech_inventory@clothing@bandana', 'neck_2_satchel', 3500, 25)
        Citizen.Wait(1500)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5FC29285, 0)
    else
        play_anim('mech_inventory@clothing@bandana', 'satchel_2_neck', 4000, 25)
        Citizen.Wait(2000)
        for k,v in pairs(Clothe_Table) do
            if k == 'NeckWear' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Maska
RegisterCommand(''..Config.Language[203].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x7505EF42) then
        play_anim('mech_loco_m@character@arthur@dehydrated@unarmed@idle@fidgets', 'idle_i', 1000, 25)
        Citizen.Wait(1000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7505EF42, 0)
    else
        play_anim('mech_loco_m@character@arthur@dehydrated@unarmed@idle@fidgets', 'idle_i', 1000, 25)
        Citizen.Wait(1000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Mask' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Kamaše
RegisterCommand(''..Config.Language[223].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x7505EF42) then
        play_anim('mech_loco_m@character@arthur@fidgets@insects@crouch@unarmed@idle', 'idle', 1000, 1)
        Citizen.Wait(1000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7505EF42, 0)
    else
        play_anim('mech_loco_m@character@arthur@fidgets@insects@crouch@unarmed@idle', 'idle', 1000, 1)
        Citizen.Wait(1000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Spats' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Kravata
RegisterCommand(''..Config.Language[204].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x7A96FACA) then
        play_anim('mech_loco_m@character@arthur@fancy@unarmed@idle@_variations', 'idle_a', 3000, 25)
        Citizen.Wait(3000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7A96FACA, 0)
    else
        play_anim('mech_loco_m@character@arthur@fancy@unarmed@idle@_variations', 'idle_a', 3000, 25)
        Citizen.Wait(3000)
        for k,v in pairs(Clothe_Table) do
            if k == 'NeckTies' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Košile
RegisterCommand(''..Config.Language[205].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x2026C46D) then
        play_anim('mech_loco_m@character@arthur@fancy@unarmed@idle@_variations', 'idle_b', 3000, 25)
        Citizen.Wait(3000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0)
    else
        play_anim('mech_loco_m@character@arthur@fancy@unarmed@idle@_variations', 'idle_b', 3000, 25)
        Citizen.Wait(3000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Shirt' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Sukně
RegisterCommand(''..Config.Language[224].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0xA0E3AB7F) then
        play_anim('script_re@burning_bodies', 'push_two_bodies_undertaker', 3000, 25)
        Citizen.Wait(3000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA0E3AB7F, 0)
    else
        play_anim('script_re@burning_bodies', 'push_two_bodies_undertaker', 3000, 25)
        Citizen.Wait(3000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Skirt' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Kšandy
RegisterCommand(''..Config.Language[206].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x877A2CF7) then
        play_anim('script_proc@loansharking@undertaker@female_mourner', 'idle_02', 1000, 25)
        Citizen.Wait(1000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x877A2CF7, 0)
    else
        play_anim('script_proc@loansharking@undertaker@female_mourner', 'idle_02', 1000, 25)
        Citizen.Wait(1000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Suspender' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Vesta
RegisterCommand(''..Config.Language[208].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x485EE834) then
        play_anim('mech_loco_m@character@arthur@fancy@unarmed@idle@_variations', 'idle_b', 5000, 25)
        Citizen.Wait(4500)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x485EE834, 0)
    else
        play_anim('mech_loco_m@character@arthur@fancy@unarmed@idle@_variations', 'idle_b', 5000, 25)
        Citizen.Wait(4500)
        for k,v in pairs(Clothe_Table) do
            if k == 'Vest' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Kabát
RegisterCommand(''..Config.Language[209].text..'', function(source, args, rawCommand)
    play_anim('mech_loco_m@character@arthur@fancy@unarmed@idle@_variations', 'idle_b', 5000, 25)
        Citizen.Wait(4500)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0xE06D30CE) then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xE06D30CE, 0)
    elseif Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x662AC34) then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x662AC34, 0)
    else
        for k,v in pairs(Clothe_Table) do
            if k == 'Coat' and tonumber(v) ~= -1 then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            elseif k == 'CoatClosed' and tonumber(v) ~= -1 then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Poncho
RegisterCommand(''..Config.Language[211].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0xAF14310B) then
        play_anim('script_proc@loansharking@undertaker@female_mourner', 'idle_01', 1000, 25)
        Citizen.Wait(1000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xAF14310B, 0)
    else
        play_anim('script_proc@loansharking@undertaker@female_mourner', 'idle_01', 1000, 25)
        Citizen.Wait(1000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Poncho' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Muniční pásy
RegisterCommand(''..Config.Language[231].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x83887E88) then
        play_anim('script_proc@loansharking@undertaker@female_mourner', 'idle_01', 1000, 25)
        Citizen.Wait(1000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x83887E88, 0)
    else
        play_anim('script_proc@loansharking@undertaker@female_mourner', 'idle_01', 1000, 25)
        Citizen.Wait(1000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Loadouts' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Plášť
RegisterCommand(''..Config.Language[212].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x3C1A74CD) then
        play_anim('script_proc@loansharking@undertaker@female_mourner', 'idle_01', 1000, 25)
        Citizen.Wait(1000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3C1A74CD, 0)
    else
        play_anim('script_proc@loansharking@undertaker@female_mourner', 'idle_01', 1000, 25)
        Citizen.Wait(1000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Cloak' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Rukavice
RegisterCommand(''..Config.Language[213].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0xEABE0032) then
        play_anim('mech_loco_m@character@arthur@fidgets@item_selection@gloves', 'gloves_b', 2000, 25)
        Citizen.Wait(2000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xEABE0032, 0)
    else
        play_anim('mech_loco_m@character@arthur@fidgets@item_selection@gloves', 'gloves_b', 2000, 25)
        Citizen.Wait(2000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Glove' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Prsteny
RegisterCommand(''..Config.Language[214].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x7A6BBD0B) then
        play_anim('mech_loco_m@character@arthur@fidgets@item_selection@gloves', 'gloves_a', 2000, 25)
        Citizen.Wait(2000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7A6BBD0B, 0)
    else
        play_anim('mech_loco_m@character@arthur@fidgets@item_selection@gloves', 'gloves_a', 2000, 25)
        Citizen.Wait(2000)
        for k,v in pairs(Clothe_Table) do
            if k == 'RingRh' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0xF16A1D23) then
        play_anim('mech_loco_m@character@arthur@fidgets@item_selection@gloves', 'gloves_a', 2000, 25)
        Citizen.Wait(2000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xF16A1D23, 0)
    else
        play_anim('mech_loco_m@character@arthur@fidgets@item_selection@gloves', 'gloves_a', 2000, 25)
        Citizen.Wait(2000)
        for k,v in pairs(Clothe_Table) do
            if k == 'RingLh' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Náramek
RegisterCommand(''..Config.Language[216].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x7BC10759) then
        play_anim('mech_loco_m@character@arthur@fidgets@item_selection@gloves', 'gloves_a', 2000, 25)
        Citizen.Wait(2000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7BC10759, 0)
    else
        play_anim('mech_loco_m@character@arthur@fidgets@item_selection@gloves', 'gloves_a', 2000, 25)
        Citizen.Wait(2000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Bracelet' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Natepniky
RegisterCommand(''..Config.Language[228].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x91CE9B20) then
        play_anim('mech_loco_m@character@arthur@fidgets@item_selection@gloves', 'gloves_b', 2000, 25)
        Citizen.Wait(2000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x91CE9B20, 0)
    else
        play_anim('mech_loco_m@character@arthur@fidgets@item_selection@gloves', 'gloves_b', 2000, 25)
        Citizen.Wait(2000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Gauntlets' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Opasek
RegisterCommand(''..Config.Language[219].text..'', function(source, args, rawCommand)
    play_anim('cnv_camp@rcdew@cnv@ccchr1', 'john_action_a', 1000, 25)
    Citizen.Wait(1000)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x9B2C8B89) then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9B2C8B89, 0)
    else
        for k,v in pairs(Clothe_Table) do
            if k == 'Gunbelt' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end

    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0xB6B6122D) then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB6B6122D, 0)
    else
        for k,v in pairs(Clothe_Table) do
            if k == 'Holster' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end

    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0xA6D134C6) then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA6D134C6, 0)
    else
        for k,v in pairs(Clothe_Table) do
            if k == 'Belt' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end

    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0xFAE9107F) then
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xFAE9107F, 0)
    else
        for k,v in pairs(Clothe_Table) do
            if k == 'Buckle' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end

    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)


--Brasny
RegisterCommand(''..Config.Language[230].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x94504D26) then
        play_anim('script_proc@loansharking@undertaker@female_mourner', 'idle_01', 1000, 25)
        Citizen.Wait(1000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x94504D26, 0)
    else
        play_anim('script_proc@loansharking@undertaker@female_mourner', 'idle_01', 1000, 25)
        Citizen.Wait(1000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Satchel' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Doplňky
RegisterCommand(''..Config.Language[229].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x79D7DF96) then
        play_anim('script_proc@loansharking@undertaker@female_mourner', 'idle_01', 1000, 25)
        Citizen.Wait(1000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x79D7DF96, 0)
    else
        play_anim('script_proc@loansharking@undertaker@female_mourner', 'idle_01', 1000, 25)
        Citizen.Wait(1000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Accessories' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Kalhoty
RegisterCommand(''..Config.Language[222].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x1D4C528A) then
        play_anim('script_re@burning_bodies', 'push_two_bodies_undertaker', 3000, 25)
        Citizen.Wait(1000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0)
    else
        play_anim('script_re@burning_bodies', 'push_two_bodies_undertaker', 3000, 25)
        Citizen.Wait(3000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Pant' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Chapsy
RegisterCommand(''..Config.Language[225].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x3107499B) then
        play_anim('script_re@burning_bodies', 'push_two_bodies_undertaker', 3000, 25)
        Citizen.Wait(3000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3107499B, 0)
    else
        play_anim('script_re@burning_bodies', 'push_two_bodies_undertaker', 3000, 25)
        Citizen.Wait(3000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Chap' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Boty
RegisterCommand(''..Config.Language[226].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x777EC6EF) then
        play_anim('mech_loco_m@character@arthur@fidgets@insects@crouch@unarmed@idle', 'idle', 1000, 1)
        Citizen.Wait(1000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x777EC6EF, 0)
    else
        play_anim('mech_loco_m@character@arthur@fidgets@insects@crouch@unarmed@idle', 'idle', 1000, 1)
        Citizen.Wait(1000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Boots' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)

--Ostruhy
RegisterCommand(''..Config.Language[227].text..'', function(source, args, rawCommand)
    if Citizen.InvokeNative(0xFB4891BD7578CDC1, PlayerPedId(), 0x18729F39) then
        play_anim('mech_loco_m@character@arthur@fidgets@insects@crouch@unarmed@idle', 'idle', 1000, 1)
        Citizen.Wait(1000)
        Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x18729F39, 0)
    else
        play_anim('mech_loco_m@character@arthur@fidgets@insects@crouch@unarmed@idle', 'idle', 1000, 1)
        Citizen.Wait(1000)
        for k,v in pairs(Clothe_Table) do
            if k == 'Spurs' then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
            end
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
end)
--Obleknout
RegisterCommand(''..Config.Language[232].text..'', function(source, args, rawCommand)
    play_anim('mech_loco_m@character@arthur@fancy@unarmed@idle@_variations', 'idle_b', 5000, 25)
        Citizen.Wait(4500)
    for k,v in pairs(Clothe_Table) do
        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), v, true, true, false);
    end
    Citizen.Wait(10)
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
end)
--Svleknout
RegisterCommand(''..Config.Language[233].text..'', function(source, args, rawCommand)
    play_anim('mech_loco_m@character@arthur@fancy@unarmed@idle@_variations', 'idle_b', 5000, 25)
    Citizen.Wait(4500)
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
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
    Citizen.Wait(200)
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), 3726847883, false, true, true);
    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), -94415063, false, true, true);
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
end)
--Bandana
local bandana = false
RegisterCommand(''..Config.Language[234].text..'', function(source, args, rawCommand)
	cache_comps = json.decode(comps)
	if not bandana then 
		Citizen.InvokeNative(0xAE72E7DF013AAA61, PlayerPedId(), Clothe_Table["NeckWear"], GetHashKey("BANDANA_ON_RIGHT_HAND"), 1, 0, -1082130432)
		Wait(700)
		Citizen.InvokeNative(0x66B957AAC2EAAEAB, PlayerPedId(), Clothe_Table["NeckWear"], -1829635046, 0, true, 1)
		Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false)
		bandana = true
	else
		Citizen.InvokeNative(0xAE72E7DF013AAA61, PlayerPedId(), Clothe_Table["NeckWear"], GetHashKey("BANDANA_OFF_RIGHT_HAND"), 1, 0, -1082130432)
		Wait(700)
		Citizen.InvokeNative(0x66B957AAC2EAAEAB, PlayerPedId(), Clothe_Table["NeckWear"], GetHashKey("base"), 0, true, 1)
		Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false)
		bandana = false
	end
end)
--Rukavy
local sleeves = false
RegisterCommand(''..Config.Language[235].text..'', function(source, args, rawCommand)
    play_anim('mech_loco_m@character@arthur@fidgets@item_selection@gloves', 'gloves_b', 2000, 25)
    Citizen.Wait(2000)
	if not sleeves then 
        Citizen.InvokeNative(0x66B957AAC2EAAEAB, PlayerPedId(), tonumber(Clothe_Table["Shirt"]), GetHashKey("Closed_Collar_Rolled_Sleeve"), 0, true, 1)
        Citizen.InvokeNative(0x704C908E9C405136, PlayerPedId())
        Citizen.InvokeNative(0xAAB86462966168CE, PlayerPedId(), 1)
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
		sleeves = true
	else
        Citizen.InvokeNative(0x66B957AAC2EAAEAB, PlayerPedId(), tonumber(Clothe_Table["Shirt"]), GetHashKey('BASE'), 0, true, 1)
        Citizen.InvokeNative(0x704C908E9C405136, PlayerPedId())
        Citizen.InvokeNative(0xAAB86462966168CE, PlayerPedId(), 1)
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
		sleeves = false
	end
end)

local sleeves2 = false
RegisterCommand("limec", function()
    play_anim('mech_inventory@clothing@bandana', 'neck_2_satchel', 3500, 25)
    Citizen.Wait(2000)
	if not sleeves2 then 
        sleeves2 = true
        Citizen.InvokeNative(0x66B957AAC2EAAEAB, PlayerPedId(), tonumber(Clothe_Table["Shirt"]), GetHashKey("open_collar_rolled_sleeve"), 0, true, 1)
        Citizen.InvokeNative(0x704C908E9C405136, PlayerPedId())
        Citizen.InvokeNative(0xAAB86462966168CE, PlayerPedId(), 1)
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
    else
        sleeves2 = false
        Citizen.InvokeNative(0x66B957AAC2EAAEAB, PlayerPedId(), tonumber(Clothe_Table["Shirt"]), GetHashKey('Closed_Collar_Rolled_Sleeve'), 0, true, 1)
        Citizen.InvokeNative(0x704C908E9C405136, PlayerPedId())
        Citizen.InvokeNative(0xAAB86462966168CE, PlayerPedId(), 1)
        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
    end
end)


RegisterNUICallback('close', function(data, cb)
    FreezeEntityPosition(PlayerPedId(),false)
    in_clothe = false
    EndCam()
    ExecuteCommand(Config.Language[2].text)
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "clothing_maker",
        status = false,
    })
    for k,v in pairs(Config.ClothingStore) do
        if k == where_open then
            SetEntityCoords(PlayerPedId(), v["ClothingEscape"][1], v["ClothingEscape"][2], v["ClothingEscape"][3])
        end
    end
end)

RegisterNUICallback('send_change', function(data, cb)
    if data.id == "HAT" then
        if tonumber(data.value) == 0 then
            pricing_table["Hat"] = 0.0

            Clothe_Table["Hat"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9925C067, 0)
        else
            pricing_table["Hat"] = Config.Pricing['Hat']

            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x864B03AE, 0)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
            Citizen.Wait(0)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(Skin_Table["Hair"]), true,true,true)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
            Clothe_Table["Hat"] = tonumber(HatsTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(HatsTable[tonumber(data.value)].hash), true,true,true)

        end
    elseif data.id == "EYEWEAR" then
        if tonumber(data.value) == 0 then
            pricing_table["EyeWear"] = 0.0

            Clothe_Table["EyeWear"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5E47CA6, 0)
        else
            pricing_table["EyeWear"] = Config.Pricing['EyeWear']

            Clothe_Table["EyeWear"] = tonumber(EyewearTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(EyewearTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "SCARF" then
        if tonumber(data.value) == 0 then
            pricing_table["NeckWear"] = 0.0

            Clothe_Table["NeckWear"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5FC29285, 0)
        else
            pricing_table["NeckWear"] = Config.Pricing['NeckWear']

            Clothe_Table["NeckWear"] = tonumber(ScarftTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(ScarftTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "MASK" then
        if tonumber(data.value) == 0 then
            pricing_table["Mask"] = 0.0

            Clothe_Table["Mask"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7505EF42, 0)
        else
            pricing_table["Mask"] = Config.Pricing['Mask']
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x864B03AE, 0)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
            Citizen.Wait(0)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(Skin_Table["Hair"]), true,true,true)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
            Clothe_Table["Mask"] = tonumber(MaskTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(MaskTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "NECKTIE" then
        if tonumber(data.value) == 0 then
            pricing_table["NeckTies"] = 0.0

            Clothe_Table["NeckTies"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7A96FACA, 0)
        else
            pricing_table["NeckTies"] = Config.Pricing['NeckTies']

            Clothe_Table["NeckTies"] = tonumber(NecktieTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(NecktieTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "SHIRT" then
        if tonumber(data.value) == 0 then
            pricing_table["Shirt"] = 0.0

            Clothe_Table["Shirt"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0)
        else
            pricing_table["Shirt"] = Config.Pricing['Shirt']

            Clothe_Table["Shirt"] = tonumber(ShirtTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(ShirtTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "SUSPENDER" then
        if tonumber(data.value) == 0 then
            pricing_table["Suspender"] = 0.0

            Clothe_Table["Suspender"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x877A2CF7, 0)
        else
            pricing_table["Suspender"] = Config.Pricing['Suspender']

            Clothe_Table["Suspender"] = tonumber(SuspenderTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(SuspenderTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "VEST" then
        if tonumber(data.value) == 0 then
            pricing_table["Vest"] = 0.0

            Clothe_Table["Vest"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x485EE834, 0)
        else
            pricing_table["Vest"] = Config.Pricing['Vest']

            Clothe_Table["Vest"] = tonumber(VestTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(VestTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "COAT" then
        if tonumber(data.value) == 0 then
            pricing_table["Coat"] = 0.0
            Clothe_Table["Coat"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xE06D30CE, 0)
        else
            Clothe_Table["CoatClosed"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x662AC34, 0)
            pricing_table["CoatClosed"] = 0.0
            pricing_table["Coat"] = Config.Pricing['Coat']

            Clothe_Table["Coat"] = tonumber(CoatTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(CoatTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "CCOAT" then
        if tonumber(data.value) == 0 then
            pricing_table["CoatClosed"] = 0.0
            Clothe_Table["CoatClosed"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x662AC34, 0)
        else
            Clothe_Table["Coat"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xE06D30CE, 0)
            pricing_table["Coat"] = 0.0
            pricing_table["CoatClosed"] = Config.Pricing['CoatClosed']

            Clothe_Table["CoatClosed"] = tonumber(ClosedCoatTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(ClosedCoatTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "PONCHO" then
        if tonumber(data.value) == 0 then
            pricing_table["Poncho"] = 0.0
            Clothe_Table["Poncho"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xAF14310B, 0)
        else
            pricing_table["Poncho"] = Config.Pricing['Poncho']
            Clothe_Table["Poncho"] = tonumber(PonchoTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(PonchoTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "CLOAK" then
        if tonumber(data.value) == 0 then
            pricing_table["Cloak"] = 0.0
            Clothe_Table["Cloak"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xAF14310B, 0)
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3C1A74CD, 0)
        else
            pricing_table["Cloak"] = Config.Pricing['Cloak']
            Clothe_Table["Cloak"] = tonumber(CloakTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(CloakTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "GLOVE" then
        if tonumber(data.value) == 0 then
            pricing_table["Glove"] = 0.0
            Clothe_Table["Glove"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xEABE0032, 0)
        else
            pricing_table["Glove"] = Config.Pricing['Glove']
            Clothe_Table["Glove"] = tonumber(GloveTable[tonumber(data.value)].hash)
           Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(GloveTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "RRING" then
        if tonumber(data.value) == 0 then
            pricing_table["RingRh"] = 0.0
            Clothe_Table["RingRh"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7A6BBD0B, 0)
        else
            pricing_table["RingRh"] = Config.Pricing['RingRh']
            Clothe_Table["RingRh"] = tonumber(RRingTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(RRingTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "LRING" then
        if tonumber(data.value) == 0 then
            pricing_table["RingLh"] = 0.0
            Clothe_Table["RingLh"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xF16A1D23, 0)
        else
            pricing_table["RingLh"] = Config.Pricing['RingLh']
            Clothe_Table["RingLh"] = tonumber(LRingTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(LRingTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "BRACELET" then
        if tonumber(data.value) == 0 then
            pricing_table["Bracelet"] = 0.0
            Clothe_Table["Bracelet"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7BC10759, 0)
        else
            pricing_table["Bracelet"] = Config.Pricing['Bracelet']
            Clothe_Table["Bracelet"] = tonumber(BraceletTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(BraceletTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "GUNBELT" then
        if tonumber(data.value) == 0 then
            pricing_table["Gunbelt"] = 0.0
            Clothe_Table["Gunbelt"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9B2C8B89, 0)
        else
            pricing_table["Gunbelt"] = Config.Pricing['Gunbelt']
            Clothe_Table["Gunbelt"] = tonumber(GunbeltTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(GunbeltTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "GUNBELTACS" then
        if tonumber(data.value) == 0 then
            pricing_table["GunbeltAccs"] = 0.0
            Clothe_Table["GunbeltAccs"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xF1542D11, 0)
        else
            pricing_table["GunbeltAccs"] = Config.Pricing['GunbeltAccs']
            Clothe_Table["GunbeltAccs"] = tonumber(GunbeltAcsTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(GunbeltAcsTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "BELT" then
        if tonumber(data.value) == 0 then
            pricing_table["Belt"] = 0.0
            Clothe_Table["Belt"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA6D134C6, 0)
        else
            pricing_table["Belt"] = Config.Pricing['Belt']
            Clothe_Table["Belt"] = tonumber(BeltsTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(BeltsTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "BUCKLE" then
        if tonumber(data.value) == 0 then
            pricing_table["Buckle"] = 0.0
            Clothe_Table["Buckle"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xFAE9107F, 0)
        else
            pricing_table["Buckle"] = Config.Pricing['Buckle']
            Clothe_Table["Buckle"] = tonumber(BucklesTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(BucklesTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "LHOLSTER" then
        if tonumber(data.value) == 0 then
            pricing_table["Holster"] = 0.0
            Clothe_Table["Holster"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB6B6122D, 0)
        else
            pricing_table["Holster"] = Config.Pricing['Holster']
            Clothe_Table["Holster"] = tonumber(LHolsterTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(LHolsterTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "PANT" then
        if tonumber(data.value) == 0 then
            pricing_table["Pant"] = 0.0
            Clothe_Table["Pant"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0)
        else
            pricing_table["Pant"] = Config.Pricing['Pant']
            pricing_table["Skirt"] = 0.0
            Clothe_Table["Skirt"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA0E3AB7F, 0)
            Clothe_Table["Pant"] = tonumber(PantTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(PantTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "SPAT" then
        if tonumber(data.value) == 0 then
            pricing_table["Spats"] = 0.0
            Clothe_Table["Spats"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x514ADCEA, 0)
        else
            pricing_table["Spats"] = Config.Pricing['Spats']
            Clothe_Table["Spats"] = tonumber(SpatsTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(SpatsTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "SKIRT" then
        if tonumber(data.value) == 0 then
            pricing_table["Skirt"] = 0.0
            Clothe_Table["Skirt"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA0E3AB7F, 0)
        else
            Clothe_Table["Pant"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0)
            pricing_table["Pant"] = 0.0
            pricing_table["Skirt"] = Config.Pricing['Skirt']

            Clothe_Table["Skirt"] = tonumber(SkirtTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(SkirtTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "CHAP" then
        if tonumber(data.value) == 0 then
            pricing_table["Chap"] = 0.0
            Clothe_Table["Chap"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3107499B, 0)
        else
            pricing_table["Chap"] = Config.Pricing['Chap']
            Clothe_Table["Chap"] = tonumber(ChapTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(ChapTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "BOOT" then
        if tonumber(data.value) == 0 then
            Clothe_Table["Boots"] = -1
            pricing_table["Boots"] = 0.0
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x777EC6EF, 0)
        else
            pricing_table["Boots"] = Config.Pricing['Boots']
            Clothe_Table["Boots"] = tonumber(BootTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(BootTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "SPUR" then
        if tonumber(data.value) == 0 then
            Clothe_Table["Spurs"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x18729F39, 0)
            pricing_table["Spurs"] = 0.0
        else
            pricing_table["Spurs"] = Config.Pricing['Spurs']
            Clothe_Table["Spurs"] = tonumber(SpurTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(SpurTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "GAUNTLET" then
        if tonumber(data.value) == 0 then
            pricing_table["Gauntlets"] = 0.0
            Clothe_Table["Gauntlets"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x91CE9B20, 0)
        else
            pricing_table["Gauntlets"] = Config.Pricing['Gauntlets']
            Clothe_Table["Gauntlets"] = tonumber(GauntletTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(GauntletTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "ACCESORIE" then
        if tonumber(data.value) == 0 then
            pricing_table["Accessories"] = 0.0
            Clothe_Table["Accessories"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x79D7DF96, 0)
        else
            pricing_table["Accessories"] = Config.Pricing['Accessories']
            Clothe_Table["Accessories"] = tonumber(AccesorieTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(AccesorieTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "SATCHEL" then
        if tonumber(data.value) == 0 then
            pricing_table["Satchel"] = 0.0
            Clothe_Table["Satchel"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x94504D26, 0)
        else
            pricing_table["Satchel"] = Config.Pricing['Satchel']
            Clothe_Table["Satchel"] = tonumber(SatchelTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(SatchelTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "LOADOUT" then
        if tonumber(data.value) == 0 then
            pricing_table["Loadouts"] = 0.0
            Clothe_Table["Loadouts"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x83887E88, 0)
        else
            pricing_table["Loadouts"] = Config.Pricing['Loadouts']
            Clothe_Table["Loadouts"] = tonumber(LoadoutsTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(LoadoutsTable[tonumber(data.value)].hash), true,true,true)
        end
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
end)

RegisterNUICallback('save_clothing', function(data, cb)
    price = 0.0
    for k,v in pairs(pricing_table) do
        price = price+v
    end
    TriggerEvent("guminputs:getInput", "Potvrdit", "Jméno outfitu za : "..price.."$", function(cb)
        local answer = tostring(cb)
        if answer ~= 'close' and answer ~= '' then
            TriggerServerEvent("gum_clothes:save_clothes", Clothe_Table, price, answer)
            in_clothe = false
            FreezeEntityPosition(PlayerPedId(),false)
            for k,v in pairs(Config.ClothingStore) do
                if k == where_open then
                    SetEntityCoords(PlayerPedId(), v["ClothingEscape"][1], v["ClothingEscape"][2], v["ClothingEscape"][3])
                end
            end
            FreezeEntityPosition(PlayerPedId(),false)
            EndCam()
            SetNuiFocus(false, false)
            SendNUIMessage({
                type = "clothing_maker",
                status = false,
            })
            pricing_table = {}
        else
            in_clothe = false
            FreezeEntityPosition(PlayerPedId(),false)
            for k,v in pairs(Config.ClothingStore) do
                if k == where_open then
                    SetEntityCoords(PlayerPedId(), v["ClothingEscape"][1], v["ClothingEscape"][2], v["ClothingEscape"][3])
                end
            end
            FreezeEntityPosition(PlayerPedId(),false)
            ExecuteCommand(Config.Language[2].text)
            EndCam()
            SetNuiFocus(false, false)
            SendNUIMessage({
                type = "clothing_maker",
                status = false,
            })
            pricing_table = {}
        end
    end)
end)

function EndCam()
    lx,ly,lz = 0,0,0
    RenderScriptCams(false, true, 1000, true, false)
    DestroyCam(camera, false)
    camera = nil
    DestroyAllCams(true)
    Citizen.InvokeNative(0xD0AFAFF5A51D72F7, PlayerPedId())
end
