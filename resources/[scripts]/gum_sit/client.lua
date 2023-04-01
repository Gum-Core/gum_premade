local baths = {
	[GetHashKey('p_bath02bx')] = 'p_bath02_bx',
	[GetHashKey('p_bath02x')] = 'p_bath02x',
	[GetHashKey('p_bath03x')] = 'p_bath03x',
}

local benchs = {
	[GetHashKey('p_bench03x')] = 'p_bench03x',
	[GetHashKey('p_bench06x')] = 'p_bench06x',
	[GetHashKey('p_bench08bx')] = 'p_bench08bx',
	[GetHashKey('p_bench09x')] = 'p_bench09x',
	[GetHashKey('p_bench15_mjr')] = 'p_bench15_mjr',
	[GetHashKey('p_bench15x')] = 'p_bench15x',
	[GetHashKey('p_bench18x')] = 'p_bench18x',
	[GetHashKey('p_benchch01x')] = 'p_benchch01x',
	[GetHashKey('p_benchironnbx01x')] = 'p_benchironnbx01x',
	[GetHashKey('p_bench_log01x')] = 'p_bench_log01x',
	[GetHashKey('p_bench_log02x')] = 'p_bench_log02x',
	[GetHashKey('p_bench_log03x')] = 'p_bench_log03x',
	[GetHashKey('p_bench_log04x')] = 'p_bench_log04x',
	[GetHashKey('p_bench_log05x')] = 'p_bench_log05x',
	[GetHashKey('p_bench_log06x')] = 'p_bench_log06x',
	[GetHashKey('p_bench_log07x')] = 'p_bench_log07x',
	[GetHashKey('p_bench_logsnow07x')] = 'p_bench_logsnow07x',
	[GetHashKey('p_benchnbx02x')] = 'p_benchnbx02x',
	[GetHashKey('p_benchnbx03x')] = 'p_benchnbx03x',
	[GetHashKey('p_couch01x')] = 'p_couch01x',
	[GetHashKey('p_couch02x')] = 'p_couch02x',
	[GetHashKey('p_couch05x')] = 'p_couch05x',
	[GetHashKey('p_couch06x')] = 'p_couch06x',
	[GetHashKey('p_couch08x')] = 'p_couch08x',
	[GetHashKey('p_couch09x')] = 'p_couch09x',
	[GetHashKey('p_couch10x')] = 'p_couch10x',
	[GetHashKey('p_couch11x')] = 'p_couch11x',
	[GetHashKey('p_couchwicker01x')] = 'p_couchwicker01x',
	[GetHashKey('p_hallbench01x')] = 'p_hallbench01x',
	[GetHashKey('p_loveseat01x')] = 'p_loveseat01x',
	[GetHashKey('p_settee_05x')] = 'p_settee_05x',
	[GetHashKey('p_sit_chairwicker01a')] = 'p_sit_chairwicker01a',
	[GetHashKey('p_sofa02x')] = 'p_sofa02x',
	[GetHashKey('p_windsorbench01x')] = 'p_windsorbench01x',
	[GetHashKey('p_victoriansofa01x')] = 'p_victoriansofa01x'
}

local oneBeds = {
	[GetHashKey('p_cs_ann_wrkr_bed01x')] = "p_cs_ann_wrkr_bed01x",
	[GetHashKey('p_cs_roc_hse_bed')] = "p_cs_roc_hse_bed",
	[GetHashKey('p_medbed01x')] = "p_medbed01x",
	[GetHashKey('p_bedrollopen01x')] = "p_bedrollopen01x",
	[GetHashKey('p_bedrollopen03x')] = "p_bedrollopen03x",
	[GetHashKey('p_re_bedrollopen01x')] = "p_re_bedrollopen01x",
	[GetHashKey('s_bedrollfurlined01x')] = "s_bedrollfurlined01x",
	[GetHashKey('s_bedrollopen01x')] = "s_bedrollopen01x",
	[GetHashKey('p_amb_mattress04x')] = "p_amb_mattress04x",
	[GetHashKey('p_mattress04x')] = "p_mattress04x",
	[GetHashKey('p_mattress07x')] = "p_mattress07x",
	[GetHashKey('p_mattresscombined01x')] = "p_mattresscombined01x",
	[GetHashKey('p_bed22x')] = "p_bed22x",
	[GetHashKey('p_bed05x')] = "p_bed05x",
	[GetHashKey('p_bed14x')] = "p_bed14x",
	[GetHashKey('p_bed17x')] = "p_bed17x",
	[GetHashKey('p_bed21x')] = "p_bed21x",
	[GetHashKey('p_bedindian02x')] = "p_bedindian02x",
	[GetHashKey('p_ambbed01x')] = "p_ambbed01x",
	[GetHashKey('p_bed03x')] = "p_bed03x",
	[GetHashKey('p_bed09x')] = "p_bed09x",
	[GetHashKey('p_bedindian01x')] = "p_bedindian01x",
}

local doubleBeds = {
	[GetHashKey('p_cs_bedsleptinbed08x')] = "p_cs_bedsleptinbed08x",
	[GetHashKey('p_bedking02x')] = "p_bedking02x",
	[GetHashKey('p_bed20x')] = "p_bed20x",
	[GetHashKey('p_bed10x')] = "p_bed10x",
	[GetHashKey('p_bed12x')] = "p_bed12x",
	[GetHashKey('p_bed13x')] = "p_bed13x",
	[GetHashKey('p_bed20madex')] = "p_bed20madex",
	[GetHashKey('p_cs_pro_bed_unmade')] = "p_cs_pro_bed_unmade",
	[GetHashKey('p_cs_bed20madex')] = "p_cs_bed20madex",
}

local chairs = {
	[GetHashKey('mp005_s_posse_col_chair01x')] = 'mp005_s_posse_col_chair01x',
	[GetHashKey('mp005_s_posse_foldingchair_01x')] = 'mp005_s_posse_foldingchair_01x',
	[GetHashKey('mp005_s_posse_trad_chair01x')] = 'mp005_s_posse_trad_chair01x',
	[GetHashKey('p_ambchair01x')] = 'p_ambchair01x',
	[GetHashKey('p_ambchair02x')] = 'p_ambchair02x',
	[GetHashKey('p_armchair01x')] = 'p_armchair01x',
	[GetHashKey('p_bistrochair01x')] = 'p_bistrochair01x',
	[GetHashKey('p_bench20x')] = 'p_bench20x',
	[GetHashKey('p_benchpiano02x')] = 'p_benchpiano02x',
	[GetHashKey('p_chair02x')] = 'p_chair02x',
	[GetHashKey('p_chair04x')] = 'p_chair04x',
	[GetHashKey('p_chair05x')] = 'p_chair05x',
	[GetHashKey('p_chair06x')] = 'p_chair06x',
	[GetHashKey('p_chair07x')] = 'p_chair07x',
	[GetHashKey('p_chair09x')] = 'p_chair09x',
	[GetHashKey('p_chair_10x')] = 'p_chair_10x',
	[GetHashKey('p_chair11x')] = 'p_chair11x',
	[GetHashKey('p_chair12bx')] = 'p_chair12bx',
	[GetHashKey('p_chair12x')] = 'p_chair12x',
	[GetHashKey('p_chair13x')] = 'p_chair13x',
	[GetHashKey('p_chair14x')] = 'p_chair14x',
	[GetHashKey('p_chair15x')] = 'p_chair15x',
	[GetHashKey('p_chair16x')] = 'p_chair16x',
	[GetHashKey('p_chair17x')] = 'p_chair17x',
	[GetHashKey('p_chair18x')] = 'p_chair18x',
	[GetHashKey('p_chair19x')] = 'p_chair19x',
	[GetHashKey('p_chair20x')] = 'p_chair20x',
	[GetHashKey('p_chair21x')] = 'p_chair21x',
	[GetHashKey('p_chair21x_fussar')] = 'p_chair21x_fussar',
	[GetHashKey('p_chair22x')] = 'p_chair22x',
	[GetHashKey('p_chair23x')] = 'p_chair23x',
	[GetHashKey('p_chair24x')] = 'p_chair24x',
	[GetHashKey('p_chair25x')] = 'p_chair25x',
	[GetHashKey('p_chair26x')] = 'p_chair26x',
	[GetHashKey('p_chair27x')] = 'p_chair27x',
	[GetHashKey('p_chair30x')] = 'p_chair30x',
	[GetHashKey('p_chair31x')] = 'p_chair31x',
	[GetHashKey('p_chair37x')] = 'p_chair37x',
	[GetHashKey('p_chair38x')] = 'p_chair38x',
	[GetHashKey('p_chair_barrel04b')] = 'p_chair_barrel04b',
	[GetHashKey('p_chaircomfy01x')] = 'p_chaircomfy01x',
	[GetHashKey('p_chaircomfy02')] = 'p_chaircomfy02',
	[GetHashKey('p_chaircomfy03x')] = 'p_chaircomfy03x',
	[GetHashKey('p_chaircomfy04x')] = 'p_chaircomfy04x',
	[GetHashKey('p_chaircomfy05x')] = 'p_chaircomfy05x',
	[GetHashKey('p_chaircomfy06x')] = 'p_chaircomfy06x',
	[GetHashKey('p_chaircomfy07x')] = 'p_chaircomfy07x',
	[GetHashKey('p_chaircomfy08x')] = 'p_chaircomfy08x',
	[GetHashKey('p_chaircomfy09x')] = 'p_chaircomfy09x',
	[GetHashKey('p_chaircomfy10x')] = 'p_chaircomfy10x',
	[GetHashKey('p_chaircomfy11x')] = 'p_chaircomfy11x',
	[GetHashKey('p_chaircomfy12x')] = 'p_chaircomfy12x',
	[GetHashKey('p_chaircomfy14x')] = 'p_chaircomfy14x',
	[GetHashKey('p_chaircomfy17x')] = 'p_chaircomfy17x',
	[GetHashKey('p_chaircomfy18x')] = 'p_chaircomfy18x',
	[GetHashKey('p_chaircomfy22x')] = 'p_chaircomfy22x',
	[GetHashKey('p_chaircomfy23x')] = 'p_chaircomfy23x',
	[GetHashKey('p_chairdoctor01x')] = 'p_chairdoctor01x',
	[GetHashKey('p_chair_crate02x')] = 'p_chair_crate02x',
	[GetHashKey('p_chair_crate15x')] = 'p_chair_crate15x',
	[GetHashKey('p_chair_cs05x')] = 'p_chair_cs05x',
	[GetHashKey('p_chairdesk01x')] = 'p_chairdesk01x',
	[GetHashKey('p_chairdesk02x')] = 'p_chairdesk02x',
	[GetHashKey('p_chairdining01x')] = 'p_chairdining01x',
	[GetHashKey('p_chairdining02x')] = 'p_chairdining02x',
	[GetHashKey('p_chairdining03x')] = 'p_chairdining03x',
	[GetHashKey('p_chaireagle01x')] = 'p_chaireagle01x',
	[GetHashKey('p_chairfolding02x')] = 'p_chairfolding02x',
	[GetHashKey('p_chairhob01x')] = 'p_chairhob01x',
	[GetHashKey('p_chairhob02x')] = 'p_chairhob02x',
	[GetHashKey('p_chairmed01x')] = 'p_chairmed01x',
	[GetHashKey('p_chairmed02x')] = 'p_chairmed02x',
	[GetHashKey('p_chairoffice02x')] = 'p_chairoffice02x',
	[GetHashKey('p_chairpokerfancy01x')] = 'p_chairpokerfancy01x',
	[GetHashKey('p_chairporch01x')] = 'p_chairporch01x',
	[GetHashKey('p_chair_privatedining01x')] = 'p_chair_privatedining01x',
	[GetHashKey('p_chairrocking02x')] = 'p_chairrocking02x',
	[GetHashKey('p_chairrocking03x')] = 'p_chairrocking03x',
	[GetHashKey('p_chairrocking04x')] = 'p_chairrocking04x',
	[GetHashKey('p_chairrocking05x')] = 'p_chairrocking05x',
	[GetHashKey('p_chairrocking06x')] = 'p_chairrocking06x',
	[GetHashKey('p_chairrustic01x')] = 'p_chairrustic01x',
	[GetHashKey('p_chairrustic02x')] = 'p_chairrustic02x',
	[GetHashKey('p_chairrustic03x')] = 'p_chairrustic03x',
	[GetHashKey('p_chairrustic04x')] = 'p_chairrustic04x',
	[GetHashKey('p_chairrustic05x')] = 'p_chairrustic05x',
	[GetHashKey('p_chairsalon01x')] = 'p_chairsalon01x',
	[GetHashKey('p_chairvictorian01x')] = 'p_chairvictorian01x',
	[GetHashKey('p_chairwhite01x')] = 'p_chairwhite01x',
	[GetHashKey('p_chairwicker01x')] = 'p_chairwicker01x',
	[GetHashKey('p_chairwicker02x')] = 'p_chairwicker02x',
	[GetHashKey('p_cs_electricchair01x')] = 'p_cs_electricchair01x',
	[GetHashKey('p_diningchairs01x')] = 'p_diningchairs01x',
	[GetHashKey('p_gen_chair07x')] = 'p_gen_chair07x',
	[GetHashKey('p_oldarmchair01x')] = 'p_oldarmchair01x',
	[GetHashKey('p_pianochair01x')] = 'p_pianochair01x',
	[GetHashKey('p_privatelounge_chair01x')] = 'p_privatelounge_chair01x',
	[GetHashKey('p_rockingchair01x')] = 'p_rockingchair01x',
	[GetHashKey('p_rockingchair02x')] = 'p_rockingchair02x',
	[GetHashKey('p_rockingchair03x')] = 'p_rockingchair03x',
	[GetHashKey('p_seatbench01x')] = 'p_seatbench01x',
	[GetHashKey('p_settee01x')] = 'p_settee01x',
	[GetHashKey('p_settee02bx')] = 'p_settee02bx',
	[GetHashKey('p_settee03x')] = 'p_settee03x',
	[GetHashKey('p_settee03bx')] = 'p_settee03bx',
	[GetHashKey('p_settee04x')] = 'p_settee04x',
	[GetHashKey('p_sit_chairwicker01b')] = 'p_sit_chairwicker01b',
	[GetHashKey('p_stool01x')] = 'p_stool01x',
	[GetHashKey('p_stool02x')] = 'p_stool02x',
	[GetHashKey('p_stool03x')] = 'p_stool03x',
	[GetHashKey('p_stool04x')] = 'p_stool04x',
	[GetHashKey('p_stool05x')] = 'p_stool05x',
	[GetHashKey('p_stool06x')] = 'p_stool06x',
	[GetHashKey('p_stool07x')] = 'p_stool07x',
	[GetHashKey('p_stool08x')] = 'p_stool08x',
	[GetHashKey('p_stool09x')] = 'p_stool09x',
	[GetHashKey('p_stool10x')] = 'p_stool10x',
	[GetHashKey('p_stool12x')] = 'p_stool12x',
	[GetHashKey('p_stool13x')] = 'p_stool13x',
	[GetHashKey('p_stool14x')] = 'p_stool14x',
	[GetHashKey('p_stoolcomfy01x')] = 'p_stoolcomfy01x',
	[GetHashKey('p_stoolcomfy02x')] = 'p_stoolcomfy02x',
	[GetHashKey('p_stoolfolding01bx')] = 'p_stoolfolding01bx',
	[GetHashKey('p_stoolfolding01x')] = 'p_stoolfolding01x',
	[GetHashKey('p_stoolwinter01x')] = 'p_stoolwinter01x',
	[GetHashKey('o_stoolfoldingstatic01x')] = 'o_stoolfoldingstatic01x',
	[GetHashKey('p_theaterchair01b01x')] = 'p_theaterchair01b01x',
	[GetHashKey('p_windsorchair01x')] = 'p_windsorchair01x',
	[GetHashKey('p_windsorchair02x')] = 'p_windsorchair02x',
	[GetHashKey('p_windsorchair03x')] = 'p_windsorchair03x',
	[GetHashKey('p_woodbench02x')] = 'p_woodbench02x',
	[GetHashKey('p_woodendeskchair01x')] = 'p_woodendeskchair01x',
	[GetHashKey('s_bench01x')] = 's_bench01x'
}


local entityEnumerator = {
    __gc = function(enum)
      if enum.destructor and enum.handle then
        enum.destructor(enum.handle)
      end
      enum.destructor = nil
      enum.handle = nil
end}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
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
  
function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

local bathScenarios = {
	{text_print = '&nbsp;Jenom ležení ve vaně', name="bath1", dict = 'mini_games@bathing@regular@arthur', anim="bathing_idle_02"},
	{text_print = '&nbsp;Omýt levou ruku', name="bath2", dict = 'mini_games@bathing@regular@arthur', anim="left_arm_scrub_medium"},
	{text_print = '&nbsp;Omýt pravou ruku', name="bath3", dict = 'mini_games@bathing@regular@arthur', anim="right_arm_scrub_medium"},
	{text_print = '&nbsp;Omýt levou nohu', name="bath4", dict = 'mini_games@bathing@regular@arthur', anim="left_leg_scrub_medium"},
	{text_print = '&nbsp;Omýt pravou nohu', name="bath5", dict = 'mini_games@bathing@regular@arthur', anim="right_leg_scrub_medium"},

}


local badScenarios = {
	{text_print = '&nbsp;1. Ležení', name = 'PROP_HUMAN_SLEEP_BED_PILLOW'},
	{text_print = '&nbsp;2. Ležení', name = 'PROP_HUMAN_SLEEP_BED_PILLOW_HIGH', isCompatible = "male"},
	{text_print = '&nbsp;3. Ležení', name = 'PROP_HUMAN_SLEEP_BED_PILLOW_LEFT'},
	{text_print = '&nbsp;4. Ležení', name = 'PROP_HUMAN_SLEEP_BED_PILLOW_RIGHT'},
	{text_print = '&nbsp;5. Ležení', name = 'WORLD_HUMAN_SLEEP_GROUND_ARM'},
	{text_print = '&nbsp;6. Ležení', name = 'WORLD_HUMAN_SLEEP_GROUND_PILLOW'},
	{text_print = '&nbsp;7. Ležení', name = 'WORLD_HUMAN_SLEEP_GROUND_PILLOW_NO_PILLOW'},
	{text_print = '&nbsp;8. Ležení', name = 'WORLD_HUMAN_SIT_FALL_ASLEEP'},
	{text_print = '&nbsp;9. Ležení', name = 'WORLD_PLAYER_SLEEP_BEDROLL'},
	{text_print = '&nbsp;10. Ležení', name = 'WORLD_PLAYER_SLEEP_GROUND'}
}

local scenarios = {
	{text_print = '&nbsp;1. Sezení', name = 'GENERIC_SEAT_BENCH_SCENARIO'},
	{text_print = '&nbsp;2. Sezení ', name = 'GENERIC_SEAT_CHAIR_SCENARIO', isCompatible = "male"},
	{text_print = '&nbsp;3. Sezení ', name = 'PROP_HUMAN_CAMP_FIRE_SEAT_BOX'},
	{text_print = '&nbsp;4. Sezení ', name = 'PROP_HUMAN_SEAT_CHAIR'},
	{text_print = '&nbsp;5. Sezení ', name = 'PROP_HUMAN_SEAT_CHAIR_CRAB_TRAP', isCompatible = "male"},
	{text_print = '&nbsp;6. Sezení ', name = 'PROP_HUMAN_SEAT_CHAIR_GROOMING_GROSS', isCompatible = "male"},
	{text_print = '&nbsp;7. Sezení ', name = 'PROP_HUMAN_SEAT_CHAIR_GROOMING_POSH', isCompatible = "female"},
	{text_print = 'Sezení s opřením o stůl', name = 'GENERIC_SEAT_CHAIR_TABLE_SCENARIO'},
	{text_print = 'Sezení s popíjením 1. ', name = 'MP_LOBBY_PROP_HUMAN_SEAT_BENCH_PORCH_DRINKING'},
	{text_print = 'Sezení s popíjením 2. ', name = 'PROP_HUMAN_SEAT_CHAIR_PORCH'},
	{text_print = 'Sezení s popíjením 3. ', name = 'PROP_HUMAN_SEAT_CHAIR_TABLE_DRINKING'},
	{text_print = 'Sezení s kouřením cigarety', name = 'MP_LOBBY_PROP_HUMAN_SEAT_BENCH_PORCH_SMOKING'},
	{text_print = 'Sezení s kouřením doutniku', name = 'PROP_HUMAN_SEAT_CHAIR_CIGAR', isCompatible = "male"},
	{text_print = 'Sezení s opřením o koleno', name = 'MP_LOBBY_PROP_HUMAN_SEAT_CHAIR'},
	{text_print = 'Sezení s broušením nože 1. ', name = 'MP_LOBBY_PROP_HUMAN_SEAT_CHAIR_KNIFE_BADASS'},
	{text_print = 'Sezení s broušením nože 2. ', name = 'PROP_HUMAN_SEAT_CHAIR_KNIFE_BADASS', isCompatible = "male"},
	{text_print = 'Sezení s vyřezáváním', name = 'MP_LOBBY_PROP_HUMAN_SEAT_CHAIR_WHITTLE'},
	{text_print = 'Sezení s klackem u ohně', name = 'PROP_CAMP_FIRE_SEAT_CHAIR'},
	{text_print = 'Sezení s hraním na Concertinu', name = 'PROP_HUMAN_SEAT_BENCH_CONCERTINA', isCompatible = "male"},
	{text_print = 'Sezení s hraním na Housle', name = 'PROP_HUMAN_SEAT_BENCH_FIDDLE', isCompatible = "female"},
	{text_print = 'Sezení s hraním na Jews Harp', name = 'PROP_HUMAN_SEAT_BENCH_JAW_HARP', isCompatible = "male"},
	{text_print = 'Sezení s hraním na Mandolínu', name = 'PROP_HUMAN_SEAT_BENCH_MANDOLIN', isCompatible = "male"},
	{text_print = 'Sezení s hraním na Banjo', name = 'PROP_HUMAN_SEAT_CHAIR_BANJO', isCompatible = "male"},
	{text_print = 'Sezení s hraním na Kytaru', name = 'PROP_HUMAN_SEAT_CHAIR_GUITAR', isCompatible = "male"},
	{text_print = 'Sezení s číštěním pušky', name = 'PROP_HUMAN_SEAT_CHAIR_CLEAN_RIFLE'},
	{text_print = 'Sezení s číštěním sedla', name = 'PROP_HUMAN_SEAT_CHAIR_CLEAN_SADDLE'},
	{text_print = 'Sezení s pletením', name = 'PROP_HUMAN_SEAT_CHAIR_KNITTING', isCompatible = "female"},
	{text_print = 'Sezení s čtením knihy', name = 'PROP_HUMAN_SEAT_CHAIR_READING', isCompatible = "female"}
}
local xRes, yRes = 0,0
local startMenu = false
local x,y,z,h = 0,0,0,0
local stopCheck = false
local sitEntity = 0
local bedEntity = 0
local bathEntity = 0
local buttonPrompts = GetRandomIntInRange(0, 0xffffff)

local pianos = {
	[GetHashKey("p_piano03x")] = "p_piano03x",
	[GetHashKey("p_piano02x")] = "p_piano02x",
	[GetHashKey("p_piano02x")] = "p_piano02x",
	[GetHashKey("p_nbmpiano01x")] = "p_nbmpiano01x",
	[GetHashKey("sha_man_piano01")] = "sha_man_piano01"
}
RegisterNUICallback('screen', function(data, cb)
    xRes,yRes = tonumber(data.x), tonumber(data.y)
end)

RegisterNUICallback('exit', function(data, cb)
    startMenu = false
	stopCheck = false
	SetNuiFocus(false, false)
	SendNUIMessage({type = "sitMenuClose", status=false})
end)

RegisterNUICallback('simulateClick', function(data, cb)
	if sitEntity ~= 0 then
		stopCheck = true
		local newTable = {}
		for pianosEntity in EnumerateObjects() do
			if pianos[GetEntityModel(pianosEntity)] ~= nil then
				local pianoCoords = GetEntityCoords(pianosEntity)
				local sitCoords = GetEntityCoords(sitEntity)
				if GetDistanceBetweenCoords(pianoCoords.x, pianoCoords.y, pianoCoords.z, sitCoords.x, sitCoords.y, sitCoords.z, false) < 1.0 then
					if IsPedMale(PlayerPedId()) then
						table.insert(newTable, {text_print="Hrát na piano", name="PROP_HUMAN_PIANO"})
					else
						table.insert(newTable, {text_print="Hrát na piano", name="PROP_HUMAN_ABIGAIL_PIANO"})
					end
				end
			end
		end
		for k,v in pairs(scenarios) do
			if IsPedMale(PlayerPedId()) then
				if v.isCompatible ~= "female" then 
					table.insert(newTable, {text_print=v.text_print, name=v.name})
				end
			else
				if v.isCompatible ~= "male" then 
					table.insert(newTable, {text_print=v.text_print,name=v.name})
				end
			end
		end
		SendNUIMessage({type = "sitMenu", status=true, anims = newTable})
		SendNUIMessage({type = "blockSimulate"})
	end
	if bedEntity ~= 0 then
		stopCheck = true
		local newTable = {}
		for k,v in pairs(badScenarios) do
			if IsPedMale(PlayerPedId()) then
				if v.isCompatible ~= "female" then 
					table.insert(newTable, {text_print=v.text_print, name=v.name})
				end
			else
				if v.isCompatible ~= "male" then 
					table.insert(newTable, {text_print=v.text_print,name=v.name})
				end
			end
		end
		SendNUIMessage({type = "sitMenu", status=true, anims = newTable})
		SendNUIMessage({type = "blockSimulate"})
	end
	if bathEntity ~= 0 then
		stopCheck = true
		local newTable = {}
		for k,v in pairs(bathScenarios) do
			if IsPedMale(PlayerPedId()) then
				if v.isCompatible ~= "female" then 
					table.insert(newTable, {text_print=v.text_print, name=v.name})
				end
			else
				if v.isCompatible ~= "male" then 
					table.insert(newTable, {text_print=v.text_print,name=v.name})
				end
			end
		end
		SendNUIMessage({type = "sitMenu", status=true, anims = newTable})
		SendNUIMessage({type = "blockSimulate"})
	end
end)

RegisterNUICallback('playAnim', function(data, cb)
	local cd = GetEntityCoords(PlayerPedId())
	if bx == nil then
		bx,by,bz = cd.x, cd.y, cd.z
	end
	FreezeEntityPosition(PlayerPedId(), true)
	SetEntityCollision(PlayerPedId(), false)
	playAnimIsNow = true
	ClearPedTasksImmediately(PlayerPedId())
	if bathEntity ~= 0 then
		if GetEntityModel(bathEntity) == GetHashKey("p_bath03x") then
			local entityWorld = GetOffsetFromEntityInWorldCoords(bathEntity, 0.5, 0.0, 0.0)
			SetEntityCoords(PlayerPedId(), entityWorld.x, entityWorld.y, entityWorld.z)
			SetEntityHeading(PlayerPedId(), h-90.0)
		elseif GetEntityModel(bathEntity) == GetHashKey("p_bath02x") then
			local entityWorld = GetOffsetFromEntityInWorldCoords(bathEntity, 0.0, 0.5, 0.0)
			SetEntityCoords(PlayerPedId(), entityWorld.x, entityWorld.y, entityWorld.z)
			SetEntityHeading(PlayerPedId(), h)
		elseif GetEntityModel(bathEntity) == GetHashKey("p_bath02bx") then
			local entityWorld = GetOffsetFromEntityInWorldCoords(bathEntity, 0.0, 0.2, 0.0)
			SetEntityCoords(PlayerPedId(), entityWorld.x, entityWorld.y, entityWorld.z)
			SetEntityHeading(PlayerPedId(), h)
		else
			local entityWorld = GetOffsetFromEntityInWorldCoords(bathEntity, 0.5, 0.0, 0.0)
			SetEntityCoords(PlayerPedId(), entityWorld.x, entityWorld.y, entityWorld.z)
			SetEntityHeading(PlayerPedId(), h)
		end
		for k,v in pairs(bathScenarios) do
			if v.name == data.anim then
				PlayAnimation(PlayerPedId(), v.dict, v.anim)
			end
		end
	else
		if data.anim == "PROP_HUMAN_PIANO" or data.anim == "PROP_HUMAN_ABIGAIL_PIANO" then
			TaskStartScenarioAtPosition(PlayerPedId(), GetHashKey(data.anim), x+0.1, y, z+0.5, h+180.0, -1, false, true)
		else
			local isChair = false
			local isBench = false
			for k,v in pairs(chairs) do
				if k == GetEntityModel(sitEntity) then
					isChair = true
				end
			end
			for k,v in pairs(benchs) do
				if k == GetEntityModel(sitEntity) then
					isBench = true
				end
			end

			if isChair == true then
				local entityWorld = GetOffsetFromEntityInWorldCoords(sitEntity, 0.0, 0.0, 0.5)
				TaskStartScenarioAtPosition(PlayerPedId(), GetHashKey(data.anim), entityWorld.x, entityWorld.y, entityWorld.z, h, -1, false, true)
				TriggerEvent("gum_play:sitOnChair", true)
			elseif isBench == true then
				TaskStartScenarioAtPosition(PlayerPedId(), GetHashKey(data.anim), x, y, z+0.5, h, -1, false, true)
			else
				TaskStartScenarioAtPosition(PlayerPedId(), GetHashKey(data.anim), x-0.1, y, z+0.2, h, -1, false, true)
			end
		end
	end
end)

function PlayAnimation(ped, dict, anim)
	if not DoesAnimDictExist(dict) then
		return
	end
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Wait(0)
	end
	TaskPlayAnim(ped, dict, anim, 0.0, 0.0, -1, 1, 1.0, false, false, false, '', false)
	RemoveAnimDict(dict)
end


Citizen.CreateThread(function()
	createPrompt("Zrušit sezení", 0x27D1C284, buttonPrompts)
end)

function createPrompt(text, key, promptHash)
	buttonPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
	PromptSetControlAction(buttonPrompt, key)
	PromptSetText(buttonPrompt, CreateVarString(10, 'LITERAL_STRING', text))
	PromptSetEnabled(buttonPrompt, true)
	PromptSetVisible(buttonPrompt, true)
	PromptSetStandardizedHoldMode(buttonPrompt, GetHashKey("LONG_TIMED_EVENT"))
	PromptSetGroup(buttonPrompt, buttonPrompts)
	PromptRegisterEnd(buttonPrompt)
end

local nearChair = false
Citizen.CreateThread(function()
	while true do
		nearChair = false
		for chairEntity in EnumerateObjects() do
			if chairs[GetEntityModel(chairEntity)] ~= nil or benchs[GetEntityModel(chairEntity)] or oneBeds[GetEntityModel(chairEntity)] or doubleBeds[GetEntityModel(chairEntity)] or baths[GetEntityModel(chairEntity)] then
				FreezeEntityPosition(chairEntity, true)
				local cdPlayer = GetEntityCoords(PlayerPedId())
				local cdForCheck = GetEntityCoords(chairEntity)
				if GetDistanceBetweenCoords(cdPlayer.x, cdPlayer.y, cdPlayer.z, cdForCheck.x, cdForCheck.y, cdForCheck.z, false) < 5.0 then
					nearChair = true
				end
			end
		end
		Citizen.Wait(3000)
	end
end)

Citizen.CreateThread(function()
    while true do
		local loop = 5
		local a,b,c,d = screenToWorld(-1, 0)
		local localCd = GetEntityCoords(c)
        local playerPed = GetEntityCoords(PlayerPedId())
        local offsetLeft = GetOffsetFromEntityInWorldCoords(c, 0.5, 0.0, 0.0);
        local offsetRight = GetOffsetFromEntityInWorldCoords(c, -0.5, 0.0, 0.0);
		local offsetOneBed = GetOffsetFromEntityInWorldCoords(c, -0.10, -0.2, 0.0);
		local offsetLeftBed = GetOffsetFromEntityInWorldCoords(c, 0.0, 0.2, 0.4);
        local offsetRightBed = GetOffsetFromEntityInWorldCoords(c, -0.5, 0.2, 0.4);
		if nearChair == false then
			loop = 500
		else
			loop = 5
			if playAnimIsNow == true then
				PromptSetActiveGroupThisFrame(buttonPrompts, CreateVarString(10, 'LITERAL_STRING', "Sezení,Ležení"))
				if Citizen.InvokeNative(0xE0F65F0640EF0617, buttonPrompt) then
					TriggerEvent("gum_play:sitOnChair", false)
					playAnimIsNow = false
					startMenu = false
					stopCheck = false
					SetEntityCoords(PlayerPedId(), bx,by,bz-1.0)
					bx,by,bz = nil, nil, nil
					ClearPedTasksImmediately(PlayerPedId())
					SetEntityCollision(PlayerPedId(), true)
					Citizen.Wait(0)
					sitEntity = 0
					bedEntity = 0
					bathEntity = 0
					FreezeEntityPosition(PlayerPedId(), false)
				end
			end
			if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x3D23549A) then
				startMenu = true
				SetNuiFocus(true, true)
			end
			isPiano = false
			if startMenu == true and stopCheck == false then
				local cdPlayer = GetEntityCoords(PlayerPedId())
				local entityPiano = GetEntityModel(c)
				if GetDistanceBetweenCoords(cdPlayer.x, cdPlayer.y, cdPlayer.z, offsetLeft.x, offsetLeft.y, offsetLeft.z, false) < 2.0 then
					if baths[GetEntityModel(c)] ~= nil then
						bathEntity = c
						x,y,z,h = localCd.x, localCd.y, localCd.z+0.9, GetEntityHeading(bathEntity)+180
						Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, localCd.x, localCd.y, localCd.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.4, 179, 166, 122, 155, 0, 0, 2, 0, 0, 0, 0)
					end
					if doubleBeds[GetEntityModel(c)] ~= nil then
						if GetDistanceBetweenCoords(b[1], b[2], b[3], offsetLeftBed.x, offsetLeftBed.y, offsetLeftBed.z, false) < 0.5 then
							bedEntity = c
							x,y,z,h = offsetLeftBed.x, offsetLeftBed.y, offsetLeftBed.z, (GetEntityHeading(bedEntity)+180)
							Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, offsetLeftBed.x, offsetLeftBed.y, offsetLeftBed.z+0.4, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.4, 255, 100, 122, 155, 0, 0, 2, 0, 0, 0, 0)
						end
						if GetDistanceBetweenCoords(b[1], b[2], b[3], offsetRightBed.x, offsetRightBed.y, offsetRightBed.z, false) < 0.5 then
							bedEntity = c
							x,y,z,h = offsetRightBed.x, offsetRightBed.y, offsetRightBed.z, (GetEntityHeading(bedEntity)+180)
							Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, offsetRightBed.x, offsetRightBed.y, offsetRightBed.z+0.4, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.4, 255, 100, 202, 155, 0, 0, 2, 0, 0, 0, 0)
						end
					end
					if oneBeds[GetEntityModel(c)] ~= nil then
						if GetDistanceBetweenCoords(b[1], b[2], b[3], offsetOneBed.x, offsetOneBed.y, offsetOneBed.z, false) < 0.5 then
							bedEntity = c
							x,y,z,h = offsetOneBed.x, offsetOneBed.y, offsetOneBed.z, (GetEntityHeading(bedEntity)+180)
							Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, offsetOneBed.x, offsetOneBed.y, offsetOneBed.z+0.5, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.4, 179, 166, 122, 155, 0, 0, 2, 0, 0, 0, 0)
						end
					end
					if benchs[GetEntityModel(c)] ~= nil then
						if GetDistanceBetweenCoords(b[1], b[2], b[3], offsetLeft.x, offsetLeft.y, offsetLeft.z, false) < 0.5 then
							sitEntity = c
							x,y,z,h = offsetLeft.x, offsetLeft.y, offsetLeft.z, (GetEntityHeading(sitEntity)+180)
							Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, offsetLeft.x, offsetLeft.y, offsetLeft.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.4, 255, 100, 122, 155, 0, 0, 2, 0, 0, 0, 0)
						end
						if GetDistanceBetweenCoords(b[1], b[2], b[3], offsetRight.x, offsetRight.y, offsetRight.z, false) < 0.5 then
							sitEntity = c
							x,y,z,h = offsetRight.x, offsetRight.y, offsetRight.z, (GetEntityHeading(sitEntity)+180)
							Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, offsetRight.x, offsetRight.y, offsetRight.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.4, 255, 100, 202, 155, 0, 0, 2, 0, 0, 0, 0)
						end
					end
					if chairs[GetEntityModel(c)] ~= nil then
						sitEntity = c
						x,y,z,h = localCd.x, localCd.y, localCd.z, (GetEntityHeading(sitEntity)+180)
						Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, localCd.x, localCd.y, localCd.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.4, 179, 166, 122, 155, 0, 0, 2, 0, 0, 0, 0)
					end
				end
			end
		end
        Citizen.Wait(loop)
    end
end)

function mulNumber(vector1, value)
    local result = {}
    result.x = vector1.x * value
    result.y = vector1.y * value
    result.z = vector1.z * value
    return result
end

function addVector3(vector1, vector2) 
    return {x = vector1.x + vector2.x, y = vector1.y + vector2.y, z = vector1.z + vector2.z}   
end

function subVector3(vector1, vector2) 
    return {x = vector1.x - vector2.x, y = vector1.y - vector2.y, z = vector1.z - vector2.z}
end

function rotationToDirection(rotation) 
    local z = degToRad(rotation.z)
    local x = degToRad(rotation.x)
    local num = math.abs(math.cos(x))

    local result = {}
    result.x = -math.sin(z) * num
    result.y = math.cos(z) * num
    result.z = math.sin(x)
    return result
end

function w2s(position)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(position.x, position.y, position.z)
    if not onScreen then
        return nil
    end

    local newPos = {}
    newPos.x = (_x - 0.5) * 2
    newPos.y = (_y - 0.5) * 2
    newPos.z = 0
    return newPos
end

function processCoordinates(x, y) 
    local screenX, screenY = xRes, yRes

    local relativeX = 1 - (x / screenX) * 1.0 * 2
    local relativeY = 1 - (y / screenY) * 1.0 * 2

    if relativeX > 0.0 then
        relativeX = -relativeX;
    else
        relativeX = math.abs(relativeX)
    end

    if relativeY > 0.0 then
        relativeY = -relativeY
    else
        relativeY = math.abs(relativeY)
    end

    return { x = relativeX, y = relativeY }
end

function s2w(camPos, relX, relY)
    local camRot = GetGameplayCamRot(0)
    local camForward = rotationToDirection(camRot)
    local rotUp = addVector3(camRot, { x = 10, y = 0, z = 0 })
    local rotDown = addVector3(camRot, { x = -10, y = 0, z = 0 })
    local rotLeft = addVector3(camRot, { x = 0, y = 0, z = -10 })
    local rotRight = addVector3(camRot, { x = 0, y = 0, z = 10 })

    local camRight = subVector3(rotationToDirection(rotRight), rotationToDirection(rotLeft))
    local camUp = subVector3(rotationToDirection(rotUp), rotationToDirection(rotDown))

    local rollRad = -degToRad(camRot.y)
    local camRightRoll = subVector3(mulNumber(camRight, math.cos(rollRad)), mulNumber(camUp, math.sin(rollRad)))
    local camUpRoll = addVector3(mulNumber(camRight, math.sin(rollRad)), mulNumber(camUp, math.cos(rollRad)))

    local point3D = addVector3(addVector3(addVector3(camPos, mulNumber(camForward, 10.0)), camRightRoll), camUpRoll)

    local point2D = w2s(point3D)

    if point2D == undefined then
        return addVector3(camPos, mulNumber(camForward, 10.0))
    end

    local point3DZero = addVector3(camPos, mulNumber(camForward, 10.0))
    local point2DZero = w2s(point3DZero)

    if point2DZero == nil then
        return addVector3(camPos, mulNumber(camForward, 10.0))
    end

    local eps = 0.001

    if math.abs(point2D.x - point2DZero.x) < eps or math.abs(point2D.y - point2DZero.y) < eps then
        return addVector3(camPos, mulNumber(camForward, 10.0))
    end

    local scaleX = (relX - point2DZero.x) / (point2D.x - point2DZero.x)
    local scaleY = (relY - point2DZero.y) / (point2D.y - point2DZero.y)
    local point3Dret = addVector3(addVector3(addVector3(camPos, mulNumber(camForward, 10.0)), mulNumber(camRightRoll, scaleX)), mulNumber(camUpRoll, scaleY))

    return point3Dret
end

function degToRad(deg)
    return (deg * math.pi) / 180.0
end

 -- Get entity, ground, etc. targeted by mouse position in 3D space.
function screenToWorld(flags, ignore)
    local x, y = GetNuiCursorPosition()

    local absoluteX = x
    local absoluteY = y

    local camPos = GetGameplayCamCoord()
    local processedCoords = processCoordinates(absoluteX, absoluteY)
    local target = s2w(camPos, processedCoords.x, processedCoords.y)

    local dir = subVector3(target, camPos)
    local from = addVector3(camPos, mulNumber(dir, 0.05))
    local to = addVector3(camPos, mulNumber(dir, 300))

    local ray = StartShapeTestRay(from.x, from.y, from.z, to.x, to.y, to.z, flags, ignore, 0)
	local a, b, c, d, e = GetShapeTestResult(ray)
    return b, c, e, to
end

Citizen.CreateThread(function()
    while true do
		if Citizen.InvokeNative(0x305C8DCD79DA8B0F, 0, 0x1F6D95E5) then
            openScenarios()
        end
		DisableControlAction(0, 0x1F6D95E5, true)
		Citizen.Wait(5)
    end
end)

function TaskStartScenarioInPlaceHash(ped, hash, p1, p2, p3, p4, p5)
    return Citizen.InvokeNative(0x524B54361229154F,ped, hash, p1, p2, p3, p4, p5)
end

function GetScenarioPointCoords(id, p1)
    return Citizen.InvokeNative(0xA8452DD321607029, id, p1)
end

function GetScenarioPointType(id)
    return Citizen.InvokeNative(0xA92450B5AE687AAF, id)
end

function openScenarios()
	local sitMenuData = {}
    local tableData = {}
    local DataStruct = DataView.ArrayBuffer(256 * 4)
    local is_data_exists = Citizen.InvokeNative(0x345EC3B7EBDE1CB5, GetEntityCoords(PlayerPedId()), 2.5,DataStruct:Buffer(), 10)
	if is_data_exists ~= false then
		for i = 1, is_data_exists, 1 do
			local scenario = DataStruct:GetInt32(8 * i)
			local hash = GetScenarioPointType(scenario)
			for c, v in pairs(Config.Scenarios) do
				if GetHashKey(v[1]) == hash then
					tableData[i] = {text_print=v, name=v, hash=scenario}
				end
			end
		end
	end
	tableData[#tableData+1] = {text_print= "Ukončit scénario", name= "finish", hash= "finish"}
	SendNUIMessage({type = "openScenario", status=true, scenarios = tableData})
	SetNuiFocus(true, true)
end

RegisterNUICallback('playAnimInteract', function(data, cb)
	if data.hash == "finish" then
		ClearPedTasks(PlayerPedId())
		SendNUIMessage({type = "sitMenuClose", status=false})
		SetNuiFocus(false, false)
	else
		print(data.hash)
		TaskUseScenarioPoint(PlayerPedId(), tonumber(data.hash), "" , -1.0, true, false, 0, false, -1.0, true)
		SetNuiFocus(false, false)
		SendNUIMessage({type = "sitMenuClose", status=false})
	end
end)

local _strblob = string.blob or function(length)
    return string.rep("\0", math.max(40 + 1, length))
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

        LuaInt = { code = "j", size = 8 }, 
        UluaInt = { code = "J", size = 8 }, 
        LuaNum = { code = "n", size = 8}, 
        Float32 = { code = "f", size = 4 },
        Float64 = { code = "d", size = 8 }, 
        String = { code = "z", size = -1, }, 
    },

    FixedTypes = {
        String = { code = "c", size = -1, },
        Int = { code = "i", size = -1, },
        Uint = { code = "I", size = -1, },
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
        return nil
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

DataStream = { }
DataStream.__index = DataStream

function DataStream.New(view)
    return setmetatable({ view = view, offset = 0, }, DataStream)
end

for label,datatype in pairs(DataView.Types) do
    DataStream[label] = function(self, endian, align)
        local o = self.offset + self.view.offset
        if not _ib(o, self.view.length, datatype) then
            return nil
        end
        local v,no = string.unpack(_ef(endian) .. datatype.code, self.view:Buffer(), o)
        if align then
            self.offset = self.offset + math.max(no - o, align)
        else
            self.offset = no - self.view.offset
        end
        return v
    end
end

