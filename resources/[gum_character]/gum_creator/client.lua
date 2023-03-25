local Eyes_Male = {{612262189,1864171073,1552505114,46507404,4030267507,642477207,329402181,2501331517,2195072443,3096645940,3983864603,2739887825,2432743988,3065185688,}}
local Eyes_Female = {{928002221,3117725108,2273169671,2489772761,1647937151,3773694950,3450854762,3703470983,2836599857,625380794,869083847,3045109292,2210319017,2451302243,}}
local Body_Type = {{61606861,-1241887289,-369348190,32611963,-20262001,-369348190,}}
local Waist_Type = {{-2045421226,-1745814259,-325933489,-1065791927,-844699484,-1273449080,927185840,149872391,399015098,-644349862,1745919061,1004225511,1278600348,502499352,-2093198664,-1837436619,1736416063,2040610690,-1173634986,-867801909,1960266524,}}

local Skin_Table = {}
local Clothe_Table = {}
local Beard_Table = {}
local Hair_Table = {}
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
local complex_enable = 0
local complex_texture = 1
local complex_opacity = 10
local acne_visibility = 1
local acne_texture = 1
local acne_opacity = 10
local ageing_enable = 1
local ageing_texture = 1
local ageing_opacity = 10
local freckles_enable = 0
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

RegisterNetEvent('gum_creator:new_char')
AddEventHandler('gum_creator:new_char', function(char_text)
    if exports.gum_character:getMaleFromLang() == char_text then
        Skin_Table["sex"] = "mp_male"
    else
        Skin_Table["sex"] = "mp_female"
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
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "accessories" then
                table.insert(AccesorieTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "gauntlets" then
                table.insert(GauntletTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "skirts" then
                table.insert(SkirtTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "boots" then
                table.insert(BootTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "masks" then
                table.insert(MaskTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "chaps" then
                table.insert(ChapTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "pants" then
                table.insert(PantTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "holsters_right" then
                table.insert(RHolsterTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "holsters_left" then
                table.insert(LHolsterTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "belt_buckles" then
                table.insert(BucklesTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "belts" then
                table.insert(BeltsTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "gunbelts" then
                table.insert(GunbeltTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "jewelry_bracelets" then
                table.insert(BraceletTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "jewelry_rings_left" then
                table.insert(LRingTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "jewelry_rings_right" then
                table.insert(RRingTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "gloves" then
                table.insert(GloveTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "cloaks" then
                table.insert(CloakTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "loadouts" then
                table.insert(LoadoutsTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "ponchos" then
                table.insert(PonchoTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "coats_closed" then
                table.insert(ClosedCoatTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "coats" then
                table.insert(CoatTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "vests" then
                table.insert(VestTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "hats" then
                table.insert(HatsTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "spats" then
                table.insert(SpatsTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "eyewear" then
                table.insert(EyewearTable, {hash = v.hash, category_hash = v.category_hashsign, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "neckwear" then
                table.insert(ScarftTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "neckties" then
                table.insert(NecktieTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "shirts_full" then
                table.insert(ShirtTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "suspenders" then
                table.insert(SuspenderTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "boot_accessories" then
                table.insert(SpurTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "satchels" then
                table.insert(SatchelTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "male" and v.is_multiplayer == true and v.category_hashname == "gunbelt_accs" then
                table.insert(GunbeltAcsTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
        end
    else
        for k,v in pairs(Config_2.Clothes) do
            if v["ped_type"] == "female" and v["is_multiplayer"] == true and v.category_hashname == "hair" then
                table.insert(Hair_Table, {hash = v.hash, category_hash = v.category_hash, cat = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "accessories" then
                table.insert(AccesorieTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "teeth" then
                table.insert(TeethsTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "gauntlets" then
                table.insert(GauntletTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "skirts" then
                table.insert(SkirtTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "boots" then
                table.insert(BootTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "masks" then
                table.insert(MaskTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "chaps" then
                table.insert(ChapTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "pants" then
                table.insert(PantTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "holsters_right" then
                table.insert(RHolsterTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "holsters_left" then
                table.insert(LHolsterTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "belt_buckles" then
                table.insert(BucklesTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "belts" then
                table.insert(BeltsTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "gunbelts" then
                table.insert(GunbeltTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "jewelry_bracelets" then
                table.insert(BraceletTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "jewelry_rings_left" then
                table.insert(LRingTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "jewelry_rings_right" then
                table.insert(RRingTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "gloves" then
                table.insert(GloveTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "cloaks" then
                table.insert(CloakTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "loadouts" then
                table.insert(LoadoutsTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "ponchos" then
                table.insert(PonchoTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "coats_closed" then
                table.insert(ClosedCoatTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "coats" then
                table.insert(CoatTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "vests" then
                table.insert(VestTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "hats" then
                table.insert(HatsTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "spats" then
                table.insert(SpatsTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "eyewear" then
                table.insert(EyewearTable, {hash = v.hash, category_hash = v.category_hashsign, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "neckwear" then
                table.insert(ScarftTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "neckties" then
                table.insert(NecktieTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "shirts_full" then
                table.insert(ShirtTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "suspenders" then
                table.insert(SuspenderTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "boot_accessories" then
                table.insert(SpurTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "satchels" then
                table.insert(SatchelTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
            end
            if v.ped_type == "female" and v.is_multiplayer == true and v.category_hashname == "gunbelt_accs" then
                table.insert(GunbeltAcsTable, {hash = v.hash, category_hash = v.category_hash, sign = v.hash_dec_signed})
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

    Style_Head_Type("Heads", 1, char_text)
    Skin_Table["Nation"] = 1
    Style_Head_Texture("Heads", 1, char_text, 1)
    Style_Body_Texture("Body", 1, char_text, 1)
    Style_Legs_Texture("Legs", 1, char_text, 1)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "char_maker",
        status = true,
        maxhair = #Hair_Table,
        maxbeard = #Beard_Table,
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
        maxteeths = #TeethsTable,
    })
end)

RegisterNUICallback('send_change', function(data, cb)
    if data.id == "EYES" then
        ClearPedTasks(PlayerPedId())
        if IsPedMale(PlayerPedId()) then
            for k,v in pairs(Eyes_Male) do
                Skin_Table["Eyes"] = tonumber(v[tonumber(data.value)])
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(v[tonumber(data.value)]), true, true, true);
            end
        else
            for k,v in pairs(Eyes_Female) do
                Skin_Table["Eyes"] = tonumber(v[tonumber(data.value)])
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(v[tonumber(data.value)]), true, true, true);
            end
        end
    elseif data.id == "HeadCategory" then
        ClearPedTasks(PlayerPedId())
        Skin_Table["Nation"] = tonumber(data.value)
        head_type  = tonumber(data.value)
        HeadCategory = tonumber(data.value)
        Style_Head_Type("Heads", data.value, char_text)
        Style_Head_Texture("Heads", 1, char_text, data.value)
        Style_Body_Texture("Body", 1, char_text, data.value)
        Style_Legs_Texture("Legs", 1, char_text, data.value)
    elseif data.id == "HeadTexture" then
        ClearPedTasks(PlayerPedId())
        Style_Head_Texture("Heads", data.value, char_text, head_type)
    elseif data.id == "BodyTexture" then
        ClearPedTasks(PlayerPedId())
        Style_Body_Texture("Body", data.value, char_text, head_type)
    elseif data.id == "LegsTexture" then
        ClearPedTasks(PlayerPedId())
        Style_Legs_Texture("Legs", data.value, char_text, head_type)
    elseif data.id == "BodyType" then
        ClearPedTasks(PlayerPedId())
        for k,v in pairs(Body_Type) do
            Skin_Table["BodyType"] = tonumber(v[tonumber(data.value)])
            Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), tonumber(v[tonumber(data.value)]))
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false)
        end
    elseif data.id == "Waist" then
        ClearPedTasks(PlayerPedId())
        for k,v in pairs(Waist_Type) do
            Skin_Table["Waist"] = tonumber(v[tonumber(data.value)])
            Citizen.InvokeNative(0x1902C4CFCC5BE57C, PlayerPedId(), tonumber(v[tonumber(data.value)]))
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false)
        end
    elseif data.id == "Scale" then
        ClearPedTasks(PlayerPedId())
        Skin_Table["Scale"] = tonumber(data.value/100)
        Citizen.InvokeNative(0x25ACFC650B65C538, PlayerPedId(), tonumber(data.value/100))
    elseif data.id == "HAIRS" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x864B03AE, 0)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
        else
            for k,v in pairs(Hair_Table) do
                if k == tonumber(data.value) then
                    Skin_Table["Hair"] = tonumber(v.hash)
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(v.hash), true,true,true)
                    -- Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                end
            end
        end
    elseif data.id == "TEETHS" then
        if tonumber(data.value) == 0 then
            Skin_Table["Teeth"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x96EDAE5C, 0)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
        else
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
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xF8016BCA, 0)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
        else
            for k,v in pairs(Beard_Table) do
                if k == tonumber(data.value) then
                    Skin_Table["Beard"] = tonumber(v.hash)
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(v.hash), true,true,true)
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                end
            end
        end

    elseif data.id == "HAT" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Hat"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9925C067, 0)
        else
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x864B03AE, 0)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
            Citizen.Wait(0)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(Skin_Table["Hair"]), true,true,true)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);

            Clothe_Table["Hat"] = tonumber(HatsTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(HatsTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "EYEWEAR" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["EyeWear"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5E47CA6, 0)
        else
            Clothe_Table["EyeWear"] = tonumber(EyewearTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(EyewearTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "SCARF" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["NeckWear"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x5FC29285, 0)
        else
            Clothe_Table["NeckWear"] = tonumber(ScarftTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(ScarftTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "MASK" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Mask"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7505EF42, 0)
        else
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x864B03AE, 0)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
            Citizen.Wait(0)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(Skin_Table["Hair"]), true,true,true)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0);
            
            Clothe_Table["Mask"] = tonumber(MaskTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(MaskTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "NECKTIE" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["NeckTies"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7A96FACA, 0)
        else
            Clothe_Table["NeckTies"] = tonumber(NecktieTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(NecktieTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "SHIRT" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Shirt"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x2026C46D, 0)
        else
            Clothe_Table["Shirt"] = tonumber(ShirtTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(ShirtTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "SUSPENDER" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Suspender"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x877A2CF7, 0)
        else
            Clothe_Table["Suspender"] = tonumber(SuspenderTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(SuspenderTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "VEST" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Vest"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x485EE834, 0)
        else
            Clothe_Table["Vest"] = tonumber(VestTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(VestTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "COAT" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Coat"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xE06D30CE, 0)
        else
            Clothe_Table["CoatClosed"] = -1
            Clothe_Table["Coat"] = tonumber(CoatTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(CoatTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "CCOAT" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["CoatClosed"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x662AC34, 0)
        else
            Clothe_Table["Coat"] = -1
            Clothe_Table["CoatClosed"] = tonumber(ClosedCoatTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(ClosedCoatTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "PONCHO" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Poncho"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xAF14310B, 0)
        else
            Clothe_Table["Poncho"] = tonumber(PonchoTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(PonchoTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "CLOAK" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Cloak"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3C1A74CD, 0)
        else
            Clothe_Table["Cloak"] = tonumber(CloakTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(CloakTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "GLOVE" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Glove"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xEABE0032, 0)
        else
            Clothe_Table["Glove"] = tonumber(GloveTable[tonumber(data.value)].hash)
           Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(GloveTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "RRING" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["RingRh"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7A6BBD0B, 0)
        else
            Clothe_Table["RingRh"] = tonumber(RRingTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(RRingTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "LRING" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["RingLh"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xF16A1D23, 0)
        else
            Clothe_Table["RingLh"] = tonumber(LRingTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(LRingTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "BRACELET" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Bracelet"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x7BC10759, 0)
        else
            Clothe_Table["Bracelet"] = tonumber(BraceletTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(BraceletTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "GUNBELT" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Gunbelt"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x9B2C8B89, 0)
        else
            Clothe_Table["Gunbelt"] = tonumber(GunbeltTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(GunbeltTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "GUNBELTACS" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["GunbeltAccs"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xF1542D11, 0)
        else
            Clothe_Table["GunbeltAccs"] = tonumber(GunbeltAcsTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(GunbeltAcsTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "BELT" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Belt"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA6D134C6, 0)
        else
            Clothe_Table["Belt"] = tonumber(BeltsTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(BeltsTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "BUCKLE" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Buckle"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xFAE9107F, 0)
        else
            Clothe_Table["Buckle"] = tonumber(BucklesTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(BucklesTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "LHOLSTER" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Holster"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xB6B6122D, 0)
        else
            Clothe_Table["Holster"] = tonumber(LHolsterTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(LHolsterTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "PANT" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Pant"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x1D4C528A, 0)
        else
            Clothe_Table["Skirt"] = -1
            Clothe_Table["Pant"] = tonumber(PantTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(PantTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "SPAT" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Spats"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x514ADCEA, 0)
        else
            Clothe_Table["Spats"] = tonumber(SpatsTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(SpatsTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "SKIRT" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Skirt"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0xA0E3AB7F, 0)
        else
            Clothe_Table["Skirt"] = tonumber(SkirtTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(SkirtTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "CHAP" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Chap"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x3107499B, 0)
        else
            Clothe_Table["Chap"] = tonumber(ChapTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(ChapTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "BOOT" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Boots"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x777EC6EF, 0)
        else
            Clothe_Table["Boots"] = tonumber(BootTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(BootTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "SPUR" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Spurs"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x18729F39, 0)
        else
            Clothe_Table["Spurs"] = tonumber(SpurTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(SpurTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "GAUNTLET" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Gauntlets"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x91CE9B20, 0)
        else
            Clothe_Table["Gauntlets"] = tonumber(GauntletTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(GauntletTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "ACCESORIE" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Accessories"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x79D7DF96, 0)
        else
            Clothe_Table["Accessories"] = tonumber(AccesorieTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(AccesorieTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "SATCHEL" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Satchel"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x94504D26, 0)
        else
            Clothe_Table["Satchel"] = tonumber(SatchelTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(SatchelTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "LOADOUT" then
        ClearPedTasks(PlayerPedId())
        if tonumber(data.value) == 0 then
            Clothe_Table["Loadouts"] = -1
            Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), 0x83887E88, 0)
        else
            Clothe_Table["Loadouts"] = tonumber(LoadoutsTable[tonumber(data.value)].hash)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(LoadoutsTable[tonumber(data.value)].hash), true,true,true)
        end
    elseif data.id == "BEARDSSTABLE_COLOR" then
        ClearPedTasks(PlayerPedId())
        beardstabble_color_1 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "beardstabble",beardstabble_enable, beardstabble_texture,1,0,0,1.0,0,1,beardstabble_color_1,0,0,1,beardstabble_opacity/10)
        Skin_Table["beardstabble_color_1"] = beardstabble_color_1
    elseif data.id == "BEARDSSTABLE_OPACITY" then
        ClearPedTasks(PlayerPedId())
        beardstabble_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "beardstabble",beardstabble_enable, beardstabble_texture,1,0,0,1.0,0,1,beardstabble_color_1,0,0,1,beardstabble_opacity/10)
        Skin_Table["beardstabble_opacity"] = beardstabble_opacity/10
    elseif data.id == "SHADOWS_TYPE" then
        ClearPedTasks(PlayerPedId())
        shadow_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "shadows",shadow_enable,1,1,0,0,1.0,0,1,shadow_color_1,shadow_color_2,shadow_color_3,shadow_texture,shadow_opacity/10)
        Skin_Table["shadows_tx_id"] = shadow_texture
    elseif data.id == "SHADOWS_OPACITY" then
        ClearPedTasks(PlayerPedId())
        shadow_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "shadows",shadow_enable,1,1,0,0,1.0,0,1,shadow_color_1,shadow_color_2,shadow_color_3,shadow_texture,shadow_opacity/10)
        Skin_Table["shadows_opacity"] = shadow_opacity/10
    elseif data.id == "SHADOWS_COLOR1" then
        ClearPedTasks(PlayerPedId())
        shadow_color_1 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "shadows",shadow_enable,1,1,0,0,1.0,0,1,shadow_color_1,shadow_color_2,shadow_color_3,shadow_texture,shadow_opacity/10)
        Skin_Table["shadows_color_1"] = shadow_color_1
    elseif data.id == "SHADOWS_COLOR2" then
        ClearPedTasks(PlayerPedId())
        shadow_color_2 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "shadows",shadow_enable,1,1,0,0,1.0,0,1,shadow_color_1,shadow_color_2,shadow_color_3,shadow_texture,shadow_opacity/10)
        Skin_Table["shadows_color_2"] = shadow_color_2
    elseif data.id == "SHADOWS_COLOR3" then
        ClearPedTasks(PlayerPedId())
        shadow_color_3 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "shadows",shadow_enable,1,1,0,0,1.0,0,1,shadow_color_1,shadow_color_2,shadow_color_3,shadow_texture,shadow_opacity/10)
        Skin_Table["shadows_color_3"] = shadow_color_3
    elseif data.id == "SCARS_TYPE" then
        ClearPedTasks(PlayerPedId())
        scars_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "scars", scars_visibility, scars_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, scars_opacity/10);
        Skin_Table["scars_tx_id"] = scars_texture
    elseif data.id == "SCARS_OPACITY" then
        ClearPedTasks(PlayerPedId())
        scars_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "scars", scars_visibility, scars_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, scars_opacity/10);
        Skin_Table["scars_opacity"] = scars_opacity/10
    elseif data.id == "SPOTS_TYPE" then
        ClearPedTasks(PlayerPedId())
        spots_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "spots", spots_visibility, spots_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, spots_opacity/10);
        Skin_Table["spots_tx_id"] = spots_texture
    elseif data.id == "SPOTS_OPACITY" then
        ClearPedTasks(PlayerPedId())
        spots_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "spots", spots_visibility, spots_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, spots_opacity/10);
        Skin_Table["spots_opacity"] = spots_opacity/10
    elseif data.id == "DISC_TYPE" then
        ClearPedTasks(PlayerPedId())
        disc_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "disc", disc_visibility, disc_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, disc_opacity/10);
        Skin_Table["disc_tx_id"] = disc_texture
    elseif data.id == "DISC_OPACITY" then
        ClearPedTasks(PlayerPedId())
        disc_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "disc", disc_visibility, disc_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, disc_opacity/10);
        Skin_Table["disc_opacity"] = disc_opacity/10
    elseif data.id == "COMPLEX_TYPE" then
        ClearPedTasks(PlayerPedId())
        complex_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "complex", complex_visibility, complex_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, complex_opacity/10);
        Skin_Table["complex_tx_id"] = complex_texture
    elseif data.id == "COMPLEX_OPACITY" then
        ClearPedTasks(PlayerPedId())
        complex_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "complex", complex_visibility, complex_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, complex_opacity/10);
        Skin_Table["complex_opacity"] = complex_opacity/10
    elseif data.id == "ACNE_TYPE" then
        ClearPedTasks(PlayerPedId())
        acne_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "acne", acne_visibility, acne_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, acne_opacity/10);
        Skin_Table["acne_tx_id"] = acne_texture
    elseif data.id == "ACNE_OPACITY" then
        ClearPedTasks(PlayerPedId())
        acne_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "acne", acne_visibility, acne_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, acne_opacity/10);
        Skin_Table["acne_opacity"] = acne_opacity/10
    elseif data.id == "AGEING_TYPE" then
        ClearPedTasks(PlayerPedId())
        ageing_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "ageing", ageing_visibility, ageing_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, ageing_opacity/10);
        Skin_Table["ageing_tx_id"] = ageing_texture
    elseif data.id == "AGEING_OPACITY" then
        ClearPedTasks(PlayerPedId())
        ageing_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "ageing", ageing_visibility, ageing_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, ageing_opacity/10);
        Skin_Table["ageing_opacity"] = ageing_opacity/10
    elseif data.id == "FRECKLES_TYPE" then
        ClearPedTasks(PlayerPedId())
        freckles_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "freckles", freckles_visibility, freckles_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, freckles_opacity/10);
        Skin_Table["freckles_tx_id"] = freckles_texture
    elseif data.id == "FRECKLES_OPACITY" then
        ClearPedTasks(PlayerPedId())
        freckles_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "freckles", freckles_visibility, freckles_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, freckles_opacity/10);
        Skin_Table["freckles_opacity"] = freckles_opacity/10
    elseif data.id == "MOLES_TYPE" then
        ClearPedTasks(PlayerPedId())
        moles_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "moles", moles_visibility, moles_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, moles_opacity/10);
        Skin_Table["moles_tx_id"] = moles_texture
    elseif data.id == "MOLES_OPACITY" then
        ClearPedTasks(PlayerPedId())
        moles_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "moles", moles_visibility, moles_texture, 0, 0, 1, 1.0, 0, 0, 0, 0, 0, 1, moles_opacity/10);
        Skin_Table["moles_opacity"] = moles_opacity/10
    elseif data.id == "EYEBROWS_TYPE" then
        ClearPedTasks(PlayerPedId())
        eyebrows_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "eyebrows",eyebrows_enable, eyebrows_texture,1,0,0,1.0,0,1,eyebrows_color_1,0,0,1,eyebrows_opacity/10)
        Skin_Table["eyebrows_tx_id"] = eyebrows_texture
    elseif data.id == "EYEBROWS_OPACITY" then
        ClearPedTasks(PlayerPedId())
        eyebrows_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "eyebrows",eyebrows_enable, eyebrows_texture,1,0,0,1.0,0,1,eyebrows_color_1,0,0,1,eyebrows_opacity/10)
        Skin_Table["eyebrows_opacity"] = eyebrows_opacity/10
    elseif data.id == "EYEBROWS_COLOR1" then
        ClearPedTasks(PlayerPedId())
        eyebrows_color_1 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "eyebrows",eyebrows_enable, eyebrows_texture,1,0,0,1.0,0,1,eyebrows_color_1,0,0,1,eyebrows_opacity/10)
        Skin_Table["eyebrows_color"] = eyebrows_color_1
    elseif data.id == "EYELINNERS_TYPE" then
        ClearPedTasks(PlayerPedId())
        eyeliners_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "eyeliners",eyeliners_enable, 1,1,0,0,1.0,0,1,eyeliners_color_1,0,0,eyeliners_texture,eyeliners_opacity/10)
        Skin_Table["eyeliners_tx_id"] = eyeliners_texture
    elseif data.id == "EYELINNERS_OPACITY" then
        ClearPedTasks(PlayerPedId())
        eyeliners_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "eyeliners",eyeliners_enable, 1,1,0,0,1.0,0,1,eyeliners_color_1,0,0,eyeliners_texture,eyeliners_opacity/10)
        Skin_Table["eyeliners_opacity"] = eyeliners_opacity/10
    elseif data.id == "EYELINNERS_COLOR1" then
        ClearPedTasks(PlayerPedId())
        eyeliners_color_1 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "eyeliners",eyeliners_enable, 1,1,0,0,1.0,0,1,eyeliners_color_1,0,0,eyeliners_texture,eyeliners_opacity/10)
        Skin_Table["eyeliners_color_1"] = eyeliners_color_1
    elseif data.id == "BRUSH_TYPE" then
        ClearPedTasks(PlayerPedId())
        blush_enable = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "blush",blush_enable, blush_texture,1,0,0,1.0,0,1,blush_color_1,0,0,1,blush_opacity/10)
        Skin_Table["blush_tx_id"] = blush_texture
    elseif data.id == "BRUSH_OPACITY" then
        ClearPedTasks(PlayerPedId())
        blush_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "blush",blush_enable, blush_texture,1,0,0,1.0,0,1,blush_color_1,0,0,1,blush_opacity/10)
        Skin_Table["blush_opacity"] = blush_opacity/10
    elseif data.id == "BRUSH_COLOR1" then
        ClearPedTasks(PlayerPedId())
        blush_color_1 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "blush",blush_enable, blush_texture,1,0,0,1.0,0,1,blush_color_1,0,0,1,blush_opacity/10)
        Skin_Table["blush_color_1"] = blush_color_1
    elseif data.id == "LIPSTICKS_TYPE" then
        ClearPedTasks(PlayerPedId())
        lipsticks_texture = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "lipsticks",lipsticks_enable,1,1,0,0,1.0,0,1,lipsticks_color_1,lipsticks_color_2,lipsticks_color_3,lipsticks_texture,lipsticks_opacity/10)
        Skin_Table["lipsticks_tx_id"] = lipsticks_texture
    elseif data.id == "LIPSTICKS_OPACITY" then
        ClearPedTasks(PlayerPedId())
        lipsticks_opacity = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "lipsticks",lipsticks_enable,1,1,0,0,1.0,0,1,lipsticks_color_1,lipsticks_color_2,lipsticks_color_3,lipsticks_texture,lipsticks_opacity/10)
        Skin_Table["lipsticks_opacity"] = lipsticks_opacity/10
    elseif data.id == "LIPSTICKS_COLOR1" then
        ClearPedTasks(PlayerPedId())
        lipsticks_color_1 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "lipsticks",lipsticks_enable,1,1,0,0,1.0,0,1,lipsticks_color_1,lipsticks_color_2,lipsticks_color_3,lipsticks_texture,lipsticks_opacity/10)
        Skin_Table["lipsticks_color_1"] = lipsticks_color_1
    elseif data.id == "LIPSTICKS_COLOR2" then
        ClearPedTasks(PlayerPedId())
        lipsticks_color_2 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "lipsticks",lipsticks_enable,1,1,0,0,1.0,0,1,lipsticks_color_1,lipsticks_color_2,lipsticks_color_3,lipsticks_texture,lipsticks_opacity/10)
        Skin_Table["lipsticks_color_2"] = lipsticks_color_2
    elseif data.id == "LIPSTICKS_COLOR3" then
        ClearPedTasks(PlayerPedId())
        lipsticks_color_3 = tonumber(data.value)
        TriggerEvent("gum_characters:colors", "lipsticks",lipsticks_enable,1,1,0,0,1.0,0,1,lipsticks_color_1,lipsticks_color_2,lipsticks_color_3,lipsticks_texture,lipsticks_opacity/10)
        Skin_Table["lipsticks_color_3"] = lipsticks_color_3
    elseif data.id == '0x3C0F' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["ChinH"] = tonumber(data.value)/10
    elseif data.id == '0xC3B2' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["ChinW"] = tonumber(data.value)/10
    elseif data.id == '0xE323' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["ChinD"] = tonumber(data.value)/10
    elseif data.id == '0x8D0A' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["JawH"] = tonumber(data.value)/10
    elseif data.id == '0xEBAE' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["JawW"] = tonumber(data.value)/10
    elseif data.id == '0x1DF6' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["JawD"] = tonumber(data.value)/10
    elseif data.id == '0x1A00' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["ULiphH"] = tonumber(data.value)/10
    elseif data.id == '0x91C1' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["ULiphW"] = tonumber(data.value)/10
    elseif data.id == '0xC375' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["ULiphD"] = tonumber(data.value)/10
    elseif data.id == '0xBB4D' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["LLiphH"] = tonumber(data.value)/10
    elseif data.id == '0xB0B0' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["LLiphW"] = tonumber(data.value)/10
    elseif data.id == '0x5D16' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["LLiphD"] =tonumber(data.value)/10
    elseif data.id == '0xF065' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["MouthW"] = tonumber(data.value)/10
    elseif data.id == '0xAA69' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["MouthD"] =tonumber(data.value)/10
    elseif data.id == '0x7AC3' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["MouthX"] =tonumber(data.value)/10
    elseif data.id == '0x6A0B' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["CheekBonesH"] =tonumber(data.value)/10
    elseif data.id == '0xABCF' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["CheekBonesW"] =tonumber(data.value)/10
    elseif data.id == '0x358D' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["CheekBonesD"] =tonumber(data.value)/10
    elseif data.id == '0x6E7F' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["NoseW"] =tonumber(data.value)/10
    elseif data.id == '0x3471' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["NoseS"] =tonumber(data.value)/10
    elseif data.id == '0x03F5' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["NoseH"] = tonumber(data.value)/10
    elseif data.id == '0x34B1' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["NoseAng"] = tonumber(data.value)/10
    elseif data.id == '0xF156' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["NoseC"] = tonumber(data.value)/10
    elseif data.id == '0x561E' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["NoseDis"] =tonumber(data.value)/10
    elseif data.id == '0x84D6' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["HeadSize"] =tonumber(data.value)/10
    elseif data.id == '0x3303' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["EyeBrowH"] =tonumber(data.value)/10
    elseif data.id == '0x2FF9' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["EyeBrowW"] =tonumber(data.value)/10
    elseif data.id == '0x4AD1' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["EyeBrowD"] = tonumber(data.value)/10
    elseif data.id == '0x8B2B' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["EyeLidH"] = tonumber(data.value)/10
    elseif data.id == '0x1B6B' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["EyeLidW"] = tonumber(data.value)/10
    elseif data.id == '0xEE44' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["EyeD"] = tonumber(data.value)/10
    elseif data.id == '0xD266' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["EyeAng"] = tonumber(data.value)/10
    elseif data.id == '0xA54E' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["EyeDis"] = tonumber(data.value)/10
    elseif data.id == '0xDDFB' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["EyeH"] = tonumber(data.value)/10
    elseif data.id == '0xC04F' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["EarsH"] = tonumber(data.value)/10
    elseif data.id == '0xB6CE' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["EarsW"] = tonumber(data.value)/10
    elseif data.id == '0x2844' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["EarsD"] = tonumber(data.value)/10
    elseif data.id == '0xED30' then
        Citizen.InvokeNative(0x5653AB26C82938CF, PlayerPedId(), tonumber(data.id), data.value/10);
        Skin_Table["EarsL"] = tonumber(data.value)/10
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
end)

RegisterNUICallback('save_character', function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({type = "char_maker",status = false})
    have_character = true
    coords_table_save = {x=Config.SpawnCoords[1], y=Config.SpawnCoords[2], z=Config.SpawnCoords[3], heading=Config.SpawnCoords[4]}
    TriggerServerEvent("gum_character:save_character", data.firstname, data.lastname, Skin_Table, Clothe_Table, coords_table_save)
    exports['gum_character']:loading(true) 
    N_0x69d65e89ffd72313(false)
    TriggerEvent("gum_character:del_old")
    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityCoords(PlayerPedId(), Config.SpawnCoords[1], Config.SpawnCoords[2], Config.SpawnCoords[3])
    SetEntityHeading(PlayerPedId(), Config.SpawnCoords[4])
    Citizen.Wait(1000)
    FreezeEntityPosition(PlayerPedId(), false)
    EndCam()
    Citizen.InvokeNative(0xD0AFAFF5A51D72F7, PlayerPedId())
    Citizen.InvokeNative(0xF808475FA571D823, true)
    Citizen.InvokeNative(0xBF25EB89375A37AD, 5, GetHashKey("PLAYER"), GetHashKey("PLAYER"))
    TriggerEvent("gum_status:start_status")
    SetEntityCoords(PlayerPedId(), Config.SpawnCoords[1], Config.SpawnCoords[2], Config.SpawnCoords[3])
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


function Style_Head_Type(what_type, number_val, gender) 
    if IsPedMale(PlayerPedId()) then
        for k,v in pairs(Config.DefaultChar["Male"][tonumber(number_val)]) do
            if k == what_type then
                for x,y in pairs(v) do
                    if x == 1 then
                        local hash = ("0x"..y)
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)
                        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                    end
                end
            end
        end
    else
        for k,v in pairs(Config.DefaultChar["Female"][tonumber(number_val)]) do
            if k == what_type then
                for x,y in pairs(v) do
                    if x == 1 then
                        local hash = ("0x"..y)
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)
                        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                    end
                end
            end
        end
    end
end

function Style_Head_Texture(what_type, number_val, gender, head_type) 
    if IsPedMale(PlayerPedId()) then
        for k,v in pairs(Config.DefaultChar["Male"][tonumber(head_type)]) do
            if k == what_type then
                for x,y in pairs(v) do
                    if x == tonumber(number_val) then
                        local hash = ("0x"..y)
                        Skin_Table["HeadType"] = tonumber(hash)
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)
                        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                    end
                end
            end
        end
    else
        for k,v in pairs(Config.DefaultChar["Female"][tonumber(head_type)]) do
            if k == what_type then
                for x,y in pairs(v) do
                    if x == tonumber(number_val) then
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
    if IsPedMale(PlayerPedId()) then
        for k,v in pairs(Config.DefaultChar["Male"][tonumber(head_type)]) do
            if k == what_type then
                for x,y in pairs(v) do
                    if x == tonumber(number_val) then
                        local hash = ("0x"..y)
                        Skin_Table["Body"] = tonumber(hash)
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)
                        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                    end
                end
            end
        end
    else
        for k,v in pairs(Config.DefaultChar["Female"][tonumber(head_type)]) do
            if k == what_type then
                for x,y in pairs(v) do
                    if x == tonumber(number_val) then
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
    if IsPedMale(PlayerPedId()) then
        for k,v in pairs(Config.DefaultChar["Male"][tonumber(head_type)]) do
            if k == what_type then
                for x,y in pairs(v) do
                    if x == tonumber(number_val) then
                        local hash = ("0x"..y)
                        Skin_Table["LegsType"] = tonumber(hash)
                        Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(hash), true, true, true)
                        Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false);
                    end
                end
            end
        end
    else
        for k,v in pairs(Config.DefaultChar["Female"][tonumber(head_type)]) do
            if k == what_type then
                for x,y in pairs(v) do
                    if x == tonumber(number_val) then
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


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)
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
