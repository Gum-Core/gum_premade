Config = {}

Config.WalkFaceStyle = true

Config.TimeToRespawn = 300--Second
Config.SpawnCoords = {1240.63, -1282.88, 75.94, 312.0}

Config.RespawnCoords = {
        [1] = {x=-288.67, y=810.37, z=120.10},--Valentine
        [2] = {x=2722.40, y=-1233.59, z=51.14},--SaintDenise
        [3] = {x=2943.74, y=1334.19, z=43.19},--Annesburg
        [4] = {x=-1803.78, y=-430.77, z=159.72},--Strawberry
        [5] = {x=-870.71, y=-1283.67, z=45.24},--Blackwater
        [6] = {x=-3664.89, y=-2618.44, z=-14.00},--Armandillo
        [7] = {x=1370.02, y=-1310.32, z=78.31},--Rhodes
        [8] = {x=-1318.50, y=2463.07, z=310.48},--SnowLoc
        [9] = {x=1335.76, y=-7025.03, z=53.60},--Guarma
        [10] = {x=366.85, y=1464.64, z=179.61},--Fort Wallace
}

Config.Language = {
    [1] = {text = "Char creator",},
    [167] = {text = "Switch char",},
    [168] = {text = "Select char",},
    [169] = {text = "Left",},
    [170] = {text = "Right",},
    [171] = {text = "Down",},
    [172] = {text = "Up",},
    [173] = {text = "Zoom +",},
    [174] = {text = "Zoom -",},
    [175] = {text = "Male",},
    [176] = {text = "Female",},--
    [177] = {text = "Select char",},
    [183] = {text = "You dont have selected gender",},
    [184] = {text = "You dont have selected eyes",},
    [185] = {text = "You dont have selected body type.",},
    [186] = {text = "You dont have selected native.",},
    [187] = {text = "You dont have selected body texture",},
    [188] = {text = "You dont have selected legs texture",},
    [189] = {text = "You dont have selected firstname or lastname",},
    [190] = {text = "Character selection",},
    [191] = {text = "You switch character wait 10 second.",},
    [192] = {text = "You cant make character, becouse you have max limit."},

    [193] = {text = "You miss add name"},
    [194] = {text = "You miss edit nation"},
    [195] = {text = "You miss edit body texture"},
    [196] = {text = "You miss edit legs texture"},
    [197] = {text = "You miss edit body type"},
    [198] = {text = "You miss edit waist"},
    [199] = {text = "You miss edit eyes"},
    [200] = {text = "You miss edit head texture"},
}

--- DONT TOUCH HERE

Config.DefaultChar = {
	["Male"] = {
			{
                ["Heads"] = { "A0BE4A7B", "1E78F6D", "27A4DC22", "5E9A394D", "7BE9E352", "7D7AA347", "839997EF", "84F3E485", "876B1FAE", "4BCC286D", "8BC1469D", "9324DB9E", "970F3409", "A11747C5", "CA6DABEE", "D7506A9B", "D1B722DF", 
                "D7CDC6AE", "DC8DA4BA", "DFBFB8F4", "ED8EDA8E", "E79A7372", "E78826B1", "F0FB1DF0" },
				["Body"] = { "206061DB", "16E292A1", "206061DB", "4AEEDD87", "4BD8F4A1", "BA59624D", "F6496128" },
				["Legs"] = { "84BAA309", "8AD16414", "A615E02", "E4B584D5", "F11CF1FA", "F2EA7BDE" },
				["HeadTexture"] = {"mp_head_mr1_sc08_c0_000_ab"},
			},
			{
				["Heads"] = { "3625908B", "40365810", "613CF195", "66B5DE24", "7AFEF216", "8574F682", "91417D14", "93C69313", "9D604053", "A23ED555", "AC2963F2", "C1130197", "C55F46B9", "CF482B6A", "D89ED98E", "D879AA64", "E4FF6111",
                "F4696EBC", "F3CE707E" },
				["Body"] = { "3825D527", "5A929214", "82F14D87", "99E82863", "DF522C3A" },
				["Legs"] = { "15ACBB1D", "97596A2A", "EA27EDE2", "F91940A6", "9EE7070B", "D7F34979" },
				["HeadTexture"] = {"mp_head_mr1_sc02_c0_000_ab"},
			},
			{
				["Heads"] = { "158CB7F2", "36739C03", "48133466", "4E11220E", "68C7CDA8", "6DF5043C", "6EF1C97C", "771A7EE9", "7B035098", "89556A4D", "9DD7C74F", "A156BC1F", "AFCDE52E", "C6077794", "D3D6DD59", "DD95F0D7", "E718D713" },
				["Body"] = { "465F719A", "6D582255", "8CC97681", "B0D24F3F" },
				["Legs"] = { "47FE9FC0", "64F9856B", "B0F62B29", "ACAE409" },
				["HeadTexture"] = {"mp_head_mr1_sc03_c0_000_ab"},
			},
			{
				["Heads"] = { "4C5C14D1", "2BADE2F9", "32E0BD65", "51EE52F8", "53361205", "7150F35A", "7320223C", "8036DB0B", "8239BA1C", "4DAD06D9", "936FAFDE", "93C8CFE3", "B0B07238", "BC310F75", "B9C497C7", "C00E8CF7", "C2978B19" },
				["Body"] = { "34C3B131", "5C1686B", "8C9686C8", "BF787383" },
				["Legs"] = { "F5E0272A", "B897BFA0", "C17616E", "73710076", "B897BFA0" },
				["HeadTexture"] = {"MP_head_fr1_sc01_c0_000_ab"},
			},
			{ 
				["Heads"] = { "1EF1D4F5", "20BEAD17", "17E48A5C", "1D1391CB", "3E1D8D10", "41FB09E2", "421209B8", "44C938AE", "465D3511", "48531C43", "5A5A4569", "69A6DC4D", "87198A9F", "2BADE2F9", "8C099185", "89601857", "9AD0D9E0", 
                "9B593624", "A9918F1E", "AF4B1442", "E2BED257", "F769DA58", "FEC87D01", "FEB1F6D4" },
				["Body"] = { "4824ED39", "3B6F503", "5EA984F8", "B4485D23", "6BB6BC48" },
				["Legs"] = { "D3A7708B", "5B835093", "DDF48A5D", "35D1FB67", "364F2807" },
				["HeadTexture"] = {"mp_head_mr1_sc04_c0_000_ab"},
			},
			{
				["Heads"] = { "101E374E", "47A369D9", "48A3A1FC", "4C55A1AB", "5248AA25", "52CC549C", "54CED1F4", "6817A7D2", "6B50E776", "729570C7", "8B921D0F", "9BE9739A", "9CCAB601", "A0D12D3E", "A9A2BECB", "AC877D4D", "BB432C32",
                "B6316BD4", "BF97F8A1", "FAEAC26" },
				["Body"] = { "69B6305B", "BA09D8ED", "C8EA5978", "CD7F8895" },
				["Legs"] = { "52CC3F25", "6577142C", "6CBCE93C", "887C4C70", "EF9D2DAE" },
				["HeadTexture"] = {"mp_head_fr1_sc05_c0_000_ab"},
			},
		},
		["Female"] = {
			{
				["Heads"] = { "76ACA91E", "30378AB3", "478C7817", "6D06466A", "772F8047", "7C1A194E", "87311A4B", "18665C91", "1B15AE7A", "20F6540D", "F8332625", "ED123FBD", "EBCEE04E", "C28AB791", "BBD7BFC", "B3BA8C05", "A661B163",
                "AAC2D8A9", "9D251F06", "945686CF" },
				["Body"] = { "489AFE52", "64181923", "8DCF7A49", "928DAD43", "B1D3B3A", "D878696D" },
				["Legs"] = { "11A244CC", "3B653032", "41021120", "A0736DA7", "C3BFA017", "F0CD92EC" },
				["HeadTexture"] = {"mp_head_fr1_sc08_c0_000_ab"},
			},
			{
				["Heads"] = { "1C851DA8", "2E1791E1", "477D749A", "62534D55", "6D8686E8", "87371192", "886DB564", "8A1E0CED", "FEA98F74", "E64076CE", "E6377EEA", "E4EE32DC", "CDDA79D6", "C9677F2B", "BBF9DC7A", "C2E3978", "BB8088E4",
                "B240A051", "B00FC4DB", "A2B1D14C" },
				["Body"] = { "8002D0F8", "6C25B6F6", "8223BCC5", "2BE27CC4", "C1CF0BC1" },
				["Legs"] = { "18916A9B", "4D38CBC5", "98975DF3", "DC1AD9D2", "E74007F9" },
				["HeadTexture"] = {"mp_head_fr1_sc02_c0_000_ab"},
			},
			{
				["Heads"] = { "1E6FDDFB", "30B5C9FA", "43857351", "50A1A9F2", "5A274672", "6369FC85", "65A5CE70", "6DCBE781", "47BC4C6", "E23268F4", "D406DA89", "D47BD345", "DB4094A2", "DEE3A266", "D3949F79", "C93AA458", "C9D5F867",
                "C6B7F1F6", "AAB53384", "A4372E08", "98B8DD4C" },
				["Body"] = { "2C4FE0C5", "3708268F", "7145337D", "79D35251", "B2850A03" },
				["Legs"] = { "3E152D7E", "C9903FE8", "CC543A45", "24CF58B7", "1684BC22" },
				["HeadTexture"] = {"mp_head_fr1_sc03_c0_000_ab"},
			},
			{
				["Heads"] = { "11567C3", "1D896D8D", "24452D0B", "34FC0B13", "43F08B06", "53B5B98F", "5DC6A042", "5F192A74", "7F2AAA30", "89B0F7FE", "E8E50D99", "E72483EC", "CC66815D", "C65BEAD1", "B3F26095", "AB545F5A", "9D3F64C1",
                "9B4BDB4C", "9409E68", "93DA499" },
				["Body"] = { "5B4E1547", "58D8EA30", "87363366", "D0C5A9AE", "DC86C81" },
				["Legs"] = { "CEAB4EC0", "DBE4E491", "5B4E1547", "F9609455", "3DBEB4BD" },
				["HeadTexture"] = {"mp_head_fr1_sc05_c0_000_ab"},
			},
			{
				["Heads"] = { "11F10982", "2AE6E5C", "4A52F943", "50882CFA", "", "65F9F637", "6A0AB89D", "8E53BDC1", "F7AC67A8", "E6648288", "E25DCD6C", "CDC2BD9", "C71039E6", "C770CAA5", "BFAFA3EF", "B8F8F515", "B2155087", "ADD7ED93",
                "B059132E", "A6F0329C" },
				["Body"] = { "80DB09DE", "93925FA2", "94778799", "56617DB6", "E36416C" },
				["Legs"] = { "31BE7295", "71821457", "9D6CD26", "A29CE6D7", "A65CF97E" },
				["HeadTexture"] = {"mp_head_fr1_sc01_c0_000_ab"},
			},
			{
				["Heads"] = { "11F69034", "169B95C6", "16C5E95A", "1C32EE08", "22B4E685", "3129C6F1", "3C7D04E4", "40E72684", "75AF6E83", "8A7F3F41", "8CD1ABC6", "544D8D50", "F70CFFFC", "E6F8006B", "E1D23BF4", "D150CE67", "B57F73B0",
                "986F1565", "9C879729", "93F68D87" },
				["Body"] = { "35A7C9FB", "1B088705", "A1AEFBDB", "E28C4D3B", "C05A25AD" },
				["Legs"] = { "27B700C2", "4BA188D", "AAD70276", "EDE17D5F", "F4F5A364" },
				["HeadTexture"] = {"mp_head_fr1_sc04_c0_000_ab"},
			}
	}
}


Config.texture_types = {
    ["male"] = {
        albedo=GetHashKey("head_fr1_sc08_soft_c0_001_ab"),
        normal=GetHashKey("mp_head_mr1_000_nm"),
        material=0x50A4BBA9,
        color_type=1,
        texture_opacity=1.0,
        unk_arg=0,
    },
    ["female"] = {
        albedo=GetHashKey("mp_head_fr1_sc08_c0_000_ab"),
        normal=GetHashKey("head_fr1_mp_002_nm"),
        material=0x7FC5B1E1, 
        color_type=1,
        texture_opacity=1.0,
        unk_arg=0,
    }
}

Config.color_palettes = {
    {0x3F6E70FF,},
    {0x0105607B,},
    {0x17CBCC83,},
    {0x29F81B2A,},
    {0x3385C5DB,},
    {0x37CD36D4,},
    {0x4101ED87,},
    {0x63838A81,},
    {0x6765BC15,},
    {0x8BA18876,},
    {0x9AC34F34,},
    {0x9E4803A0,},
    {0xA4041CEF,},
    {0xA4CFABD0,},
    {0xAA65D8A3,},
    {0xB562025C,},
    {0xB9E7F722,},
    {0xBBF43EF8,},
    {0xD1476963,},
    {0xD799E1C2,},
    {0xDC6BC93B,},
    {0xDFB1F64C,},
    {0xF509C745,},
    {0xF93DB0C8,},
    {0xFB71527B,},
}


Config.overlay_all_layers = {
    {name="eyebrows",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,    },                                      
    {name="scars",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,       },                                      
    {name="eyeliners",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,   },                                      
    {name="lipsticks",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,   },                                      
    {name="acne",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,        },                                      
    {name="shadows",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,     },                                      
    {name="beardstabble",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,},                                      
    {name="paintedmasks",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,},                                      
    {name="ageing",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,      },                                      
    {name="blush",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,       },                                      
    {name="complex",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,     },                                      
    {name="disc",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,        },                                      
    {name="foundation",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,  },                                      
    {name="freckles",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,    },                                      
    {name="grime",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,       },                                      
    {name="hair",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,        },                                      
    {name="moles",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,       },                                      
    {name="spots",visibility=0,tx_id=1,tx_normal=0,tx_material=0,tx_color_type=0,tx_opacity=1.0,tx_unk=0,palette=0,palette_color_primary=0,palette_color_secondary=0,palette_color_tertiary=0,var=0,opacity=1.0,       },                                      
}

Config.overlays_info = {

    ["eyebrows"] = {
                    {id=0x07844317,albedo=0xF81B2E66,normal=0x7BC4288B,ma=0x202674A1,},    --   {albedo="mp_u_faov_eyebrow_m_012_ab",normal="mp_u_faov_eyebrow_m_012_nm",ma="mp_u_faov_eyebrow_m_012_ma",},
                    {id=0x0A83CA6E,albedo=0x8FA4286B,normal=0xBD811948,ma=0xB82C8FBB,},    --   {albedo="mp_u_faov_eyebrow_m_006_ab",normal="mp_u_faov_eyebrow_m_006_nm",ma="mp_u_faov_eyebrow_m_006_ma",},
                    {id=0x139A5CA3,albedo=0x487ABE5A,normal=0x22A9DDF9,ma=0x78AA9401,},    --   {albedo="mp_u_faov_eyebrow_m_003_ab",normal="mp_u_faov_eyebrow_m_003_nm",ma="mp_u_faov_eyebrow_m_003_ma",},
                    {id=0x1832E474,albedo=0x96FBB931,normal=0x32FA2683,ma=0xA1775B18,},    --   {albedo="mp_u_faov_eyebrow_m_011_ab",normal="mp_u_faov_eyebrow_m_011_nm",ma="mp_u_faov_eyebrow_m_011_ma",},
                    {id=0x216EF84C,albedo=0x269CD8F8,normal=0x2F54C727,ma=0xCCBD1939,},    --   {albedo="mp_u_faov_eyebrow_m_002_ab",normal="mp_u_faov_eyebrow_m_002_nm",ma="mp_u_faov_eyebrow_m_002_ma",},
                    {id=0x2594304D,albedo=0xA5A23CD1,normal=0x8611B42C,ma=0x0238302B,},    --   {albedo="mp_u_faov_eyebrow_f_004_ab",normal="mp_u_faov_eyebrow_f_004_nm",ma="mp_u_faov_eyebrow_f_004_ma",},
                    {id=0x33C39BC5,albedo=0xF928E29B,normal=0x46C268BD,ma=0x4B92F13E,},    --   {albedo="mp_u_faov_eyebrow_m_013_ab",normal="mp_u_faov_eyebrow_m_013_nm",ma="mp_u_faov_eyebrow_m_013_ma",},
                    {id=0x443E3CBA,albedo=0x6C83B571,normal=0x2B191070,ma=0xD551E623,},    --   {albedo="mp_u_faov_eyebrow_m_014_ab",normal="mp_u_faov_eyebrow_m_014_nm",ma="mp_u_faov_eyebrow_m_014_ma",},
                    {id=0x4F5052DE,albedo=0x827EEF46,normal=0x70E8C702,ma=0xD97518F9,},    --   {albedo="mp_u_faov_eyebrow_m_015_ab",normal="mp_u_faov_eyebrow_m_015_nm",ma="mp_u_faov_eyebrow_m_015_ma",},
                    {id=0x5C049D35,albedo=0x41E90506,normal=0x7E47D163,ma=0x54100288,},    --   {albedo="mp_u_faov_eyebrow_f_001_ab",normal="mp_u_faov_eyebrow_f_001_nm",ma="mp_u_faov_eyebrow_f_001_ma",},
                    {id=0x77A1546E,albedo=0x43C4AE44,normal=0x290FC7F7,ma=0xD8FC26A9,},    --   {albedo="mp_u_faov_eyebrow_f_003_ab",normal="mp_u_faov_eyebrow_f_003_nm",ma="mp_u_faov_eyebrow_f_003_ma",},
                    {id=0x8A4B79C2,albedo=0xAE6ED4E6,normal=0x89B29E5A,ma=0xFA0476E4,},    --   {albedo="mp_u_faov_eyebrow_f_002_ab",normal="mp_u_faov_eyebrow_f_002_nm",ma="mp_u_faov_eyebrow_f_002_ma",},
                    {id=0x9728137B,albedo=0x23E65D35,normal=0xEE39073F,ma=0x218DD4C8,},    --   {albedo="mp_u_faov_eyebrow_f_006_ab",normal="mp_u_faov_eyebrow_f_006_nm",ma="mp_u_faov_eyebrow_f_006_ma",},
                    {id=0xA6DE8325,albedo=0x7A93F649,normal=0x22B33B65,ma=0xEE6CCF11,},    --   {albedo="mp_u_faov_eyebrow_m_008_ab",normal="mp_u_faov_eyebrow_m_008_nm",ma="mp_u_faov_eyebrow_m_008_ma",},
                    {id=0xA8CCB6C4,albedo=0x29AD8BF9,normal=0x34ABB09D,ma=0xCF206860,},    --   {albedo="mp_u_faov_eyebrow_f_005_ab",normal="mp_u_faov_eyebrow_f_005_nm",ma="mp_u_faov_eyebrow_f_005_ma",},
                    {id=0xB3F74D19,albedo=0x3E2F71B1,normal=0xD4809D11,ma=0x9ABFA640,},    --   {albedo="mp_u_faov_eyebrow_f_007_ab",normal="mp_u_faov_eyebrow_f_007_nm",ma="mp_u_faov_eyebrow_f_007_ma",},
                    {id=0xBD38AFD9,albedo=0x058A698E,normal=0x9A732F86,ma=0x2EF1D769,},    --   {albedo="mp_u_faov_eyebrow_m_007_ab",normal="mp_u_faov_eyebrow_m_007_nm",ma="mp_u_faov_eyebrow_m_007_ma",},
                    {id=0xCD0A4F7C,albedo=0xED46998E,normal=0xB5B73A38,ma=0x15C5FB78,},    --   {albedo="mp_u_faov_eyebrow_m_009_ab",normal="mp_u_faov_eyebrow_m_009_nm",ma="mp_u_faov_eyebrow_m_009_ma",},
                    {id=0xD0EC86FF,albedo=0x81B462A2,normal=0x894F8744,ma=0x51551810,},    --   {albedo="mp_u_faov_eyebrow_f_000_ab",normal="mp_u_faov_eyebrow_f_000_nm",ma="mp_u_faov_eyebrow_f_000_ma",},
                    {id=0xEB088A20,albedo=0x0C6CDBDC,normal=0x91A2496E,ma=0xE639F138,},    --   {albedo="mp_u_faov_eyebrow_m_010_ab",normal="mp_u_faov_eyebrow_m_010_nm",ma="mp_u_faov_eyebrow_m_010_ma",},
                    {id=0xF0CA96FC,albedo=0xAC3BCA3F,normal=0x667FEFF8,ma=0xDD8E5EFF,},    --   {albedo="mp_u_faov_eyebrow_m_005_ab",normal="mp_u_faov_eyebrow_m_005_nm",ma="mp_u_faov_eyebrow_m_005_ma",},
                    {id=0xF3351BD9,albedo=0xC3286EA4,normal=0x8BB9158A,ma=0xFBBAE4D8,},    --   {albedo="mp_u_faov_eyebrow_m_001_ab",normal="mp_u_faov_eyebrow_m_001_nm",ma="mp_u_faov_eyebrow_m_001_ma",},
                    {id=0xF9052779,albedo=0x8AEADE78,normal=0x21BB2D97,ma=0x75A0B928,},    --   {albedo="mp_u_faov_eyebrow_m_000_ab",normal="mp_u_faov_eyebrow_m_000_nm",ma="mp_u_faov_eyebrow_m_000_ma",},
                    {id=0xFE183197,albedo=0x92B508CD,normal=0x6AA92A3E,ma=0xB4A436DB,},    --   {albedo="mp_u_faov_eyebrow_m_004_ab",normal="mp_u_faov_eyebrow_m_004_nm",ma="mp_u_faov_eyebrow_m_004_ma",},
                },
    ["scars"] =     {
                    {id=0xC8E45B5B,albedo=0x6245579F,normal=0xD53A336F,},       -- {albedo="mp_u_faov_scar_000_ab",normal="mp_u_faov_scar_000_nm",},
                    {id=0x90D86B44,albedo=0xA1538E6F,normal=0xDFCB1159,},       -- {albedo="mp_u_faov_scar_001_ab",normal="mp_u_faov_scar_001_nm",},
                    {id=0x23190FC3,albedo=0x39683ECE,normal=0x249C1A0A,},       -- {albedo="mp_u_faov_scar_002_ab",normal="mp_u_faov_scar_002_nm",},
                    {id=0x7574B47D,albedo=0x3AB2A0BB,normal=0x7A70886A,},       -- {albedo="mp_u_faov_scar_003_ab",normal="mp_u_faov_scar_003_nm",},
                    {id=0x7FE8C965,albedo=0xB81C8D16,normal=0x7210971B,},       -- {albedo="mp_u_faov_scar_004_ab",normal="mp_u_faov_scar_004_nm",},
                    {id=0x083059FE,albedo=0xC332710C,normal=0x860EE45E,},       -- {albedo="mp_u_faov_scar_005_ab",normal="mp_u_faov_scar_005_nm",},
                    {id=0x19E9FD71,albedo=0x40895310,normal=0xB753C5C7,},       -- {albedo="mp_u_faov_scar_006_ab",normal="mp_u_faov_scar_006_nm",},
                    {id=0x4CAF62FB,albedo=0xD80F2F64,normal=0x00BBF225,},       -- {albedo="mp_u_faov_scar_007_ab",normal="mp_u_faov_scar_007_nm",},
                    {id=0xDE650668,albedo=0x85F6BF71,normal=0x3DD0B0AE,},       -- {albedo="mp_u_faov_scar_008_ab",normal="mp_u_faov_scar_008_nm",},
                    {id=0xC648562B,albedo=0x6397E4D9,normal=0x2B59CDA1,},       -- {albedo="mp_u_faov_scar_009_ab",normal="mp_u_faov_scar_009_nm",},
                    {id=0x484BAEF8,albedo=0xBF2946DE,normal=0xD3F2F2F6,},       -- {albedo="mp_u_faov_scar_010_ab",normal="mp_u_faov_scar_010_nm",},
                    {id=0x190F5080,albedo=0xCBBDB741,normal=0x9518FA34,},       -- {albedo="mp_u_faov_scar_011_ab",normal="mp_u_faov_scar_011_nm",},
                    {id=0x2B5DF51D,albedo=0x0E05C415,normal=0x8B8C57AC,},       -- {albedo="mp_u_faov_scar_012_ab",normal="mp_u_faov_scar_012_nm",},
                    {id=0xE490E784,albedo=0x50853115,normal=0xDA7F2A1E,},       -- {albedo="mp_u_faov_scar_013_ab",normal="mp_u_faov_scar_013_nm",},
                    {id=0x0ED23C06,albedo=0xAEA45D76,normal=0x364DAAA6,},       -- {albedo="mp_u_faov_scar_014_ab",normal="mp_u_faov_scar_014_nm",},
                    {id=0x5712CCB6,albedo=0x9318AF61,normal=0x98104C8C,},       -- {albedo="mp_u_faov_scar_015_ab",normal="mp_u_faov_scar_015_nm",},
                },  

    ["eyeliners"] = {
                    {id=0x29A2E58F,albedo=0xA952BF75,ma=0xDD55AF2A,},                                                -- {albedo="mp_u_faov_eyeliner_000_ab",ma="mp_u_faov_eyeliner_000_ma",},
                },

    ["lipsticks"] = {
                    {id=0x887E11E0,albedo=0x96A5E4FB,normal=0x1C77591C,ma=0x4255A5F4,},                              -- {albedo="mp_u_faov_lipstick_000_ab",normal="mp_u_faov_lipstick_000_nm",ma="mp_u_faov_lipstick_000_ma",},  -- 7variantov
                },

    ["acne"] =  {
                    {id=0x96DD8F42,albedo=0x1BA4244B,normal=0xBA46CE92,},                                           -- {albedo="mp_u_faov_acne_000_ab",normal="mp_u_faov_acne_000_nm",},
                },

    ["shadows"] = {
                    {id=0x47BD7289,albedo=0x5C5C98FC,ma=0xE20345CC,},                                               -- {albedo="mp_u_faov_eyeshadow_000_ab",ma="mp_u_faov_eyeshadow_000_ma",},  -- 6 variantov
                },

    ["beardstabble"] = {
                    {id=0x375D4807,albedo=0xB5827817,normal=0x5041B648,ma=0x83F42340,},                              -- {albedo="mp_u_faov_beard_000_ab",normal="mp_u_faov_beard_000_nm",ma="mp_u_faov_beard_000_ma",},
                },

    ["paintedmasks"] = {
                    {id=0x5995AA6F,albedo=0x99BCB03F,},                                                              -- {albedo="mp_u_faov_masks_000_ab",},
                },

    ["ageing"]  = {
                    {id=0x96DD8F42,albedo=0x1BA4244B,normal=0xBA46CE92,},                                            -- {albedo="mp_u_faov_acne_000_ab",normal="mp_u_faov_acne_000_nm",},
                    {id=0x6D9DC405,albedo=0xAFE82F0C,normal=0x5CF8808E,},                                            -- {albedo="mp_u_faov_ageing_000_ab",normal="mp_u_faov_ageing_000_nm",},
                    {id=0x2761B792,albedo=0x4105C6B3,normal=0x8607CC56,},                                            -- {albedo="mp_u_faov_ageing_001_ab",normal="mp_u_faov_ageing_001_nm",},
                    {id=0x19009AD0,albedo=0xEBC18618,normal=0x9087AF96,},                                            -- {albedo="mp_u_faov_ageing_002_ab",normal="mp_u_faov_ageing_002_nm",},
                    {id=0xC29F6E07,albedo=0xF9887FA7,normal=0x1331C3C9,},                                            -- {albedo="mp_u_faov_ageing_003_ab",normal="mp_u_faov_ageing_003_nm",},
                    {id=0xA45F3187,albedo=0x1C30961A,normal=0x3CA2F3AE,},                                            -- {albedo="mp_u_faov_ageing_004_ab",normal="mp_u_faov_ageing_004_nm",},
                    {id=0x5E21250C,albedo=0x01E35044,normal=0x5A965FF0,},                                            -- {albedo="mp_u_faov_ageing_005_ab",normal="mp_u_faov_ageing_005_nm",},
                    {id=0x4FFE08C6,albedo=0xA65757F2,normal=0xC46CC005,},                                            -- {albedo="mp_u_faov_ageing_006_ab",normal="mp_u_faov_ageing_006_nm",},
                    {id=0x2DAD4485,albedo=0x358DEFDA,normal=0x55D317B4,},                                            -- {albedo="mp_u_faov_ageing_007_ab",normal="mp_u_faov_ageing_007_nm",},
                    {id=0x3F70680B,albedo=0x7073A58F,normal=0x33E73C5F,},                                            -- {albedo="mp_u_faov_ageing_008_ab",normal="mp_u_faov_ageing_008_nm",},
                    {id=0xD3310F8E,albedo=0xD9E8A605,normal=0x22297EA5,},                                            -- {albedo="mp_u_faov_ageing_009_ab",normal="mp_u_faov_ageing_009_nm",},
                    {id=0xF27A4C84,albedo=0xE0F0971B,normal=0x9F0E6718,},                                            -- {albedo="mp_u_faov_ageing_010_ab",normal="mp_u_faov_ageing_010_nm",},
                    {id=0x0044E819,albedo=0xFD844ADF,normal=0x315A6D56,},                                            -- {albedo="mp_u_faov_ageing_011_ab",normal="mp_u_faov_ageing_011_nm",},
                    {id=0xA648348D,albedo=0xC329F765,normal=0xE8CD7F20,},                                            -- {albedo="mp_u_faov_ageing_012_ab",normal="mp_u_faov_ageing_012_nm",},
                    {id=0x94F991F0,albedo=0x8586D19B,normal=0xCA334396,},                                            -- {albedo="mp_u_faov_ageing_013_ab",normal="mp_u_faov_ageing_013_nm",},
                    {id=0xCAACFD56,albedo=0xD2D0BF4F,normal=0xE0203BDA,},                                            -- {albedo="mp_u_faov_ageing_014_ab",normal="mp_u_faov_ageing_014_nm",},
                    {id=0xB9675ACB,albedo=0x2387AF71,normal=0x90A80AE1,},                                            -- {albedo="mp_u_faov_ageing_015_ab",normal="mp_u_faov_ageing_015_nm",},
                    {id=0x3C2CE03C,albedo=0xC6DCBCCA,normal=0x609B7EBD,},                                            -- {albedo="mp_u_faov_ageing_016_ab",normal="mp_u_faov_ageing_016_nm",},
                    {id=0xF2D64D90,albedo=0xC6DCBCCA,normal=0x609B7EBD,},                                            -- {albedo="mp_u_faov_ageing_016_ab",normal="mp_u_faov_ageing_016_nm",},
                    {id=0xE389AEF7,albedo=0xDF591FF2,normal=0x11D92A14,},                                            -- {albedo="mp_u_faov_ageing_018_ab",normal="mp_u_faov_ageing_018_nm",},
                    {id=0x89317A44,albedo=0xB4640D19,normal=0x2F56FDA5,},                                            -- {albedo="mp_u_faov_ageing_019_ab",normal="mp_u_faov_ageing_019_nm",},
                    {id=0x64B3347C,albedo=0xFF2E8F96,normal=0x45EE7B10,},                                            -- {albedo="mp_u_faov_ageing_020_ab",normal="mp_u_faov_ageing_020_nm",},
                    {id=0x9FFDAB10,albedo=0x8F2950D9,normal=0x85BDD7E8,},                                            -- {albedo="mp_u_faov_ageing_021_ab",normal="mp_u_faov_ageing_021_nm",},
                    {id=0x91D40EBD,albedo=0x5DCD1D4E,normal=0xA1B5F71F,},                                            -- {albedo="mp_u_faov_ageing_022_ab",normal="mp_u_faov_ageing_022_nm",},
                    {id=0x6B94C23F,albedo=0xF17FE41C,normal=0x0C480977,},                                            -- {albedo="mp_u_faov_ageing_023_ab",normal="mp_u_faov_ageing_023_nm",},
                },
    ["blush"] = {
                    {id=0x6DB440FA,albedo=0x43B1AACA,},                                                              -- {albedo="mp_u_faov_blush_000_ab",},
                    {id=0x47617455,albedo=0x9CAD2EF0,},                                                              -- {albedo="mp_u_faov_blush_001_ab",},
                    {id=0x114D082D,albedo=0xA52E3B98,},                                                              -- {albedo="mp_u_faov_blush_002_ab",},
                    {id=0xEC6F3E72,albedo=0xB5CED4CB,},                                                              -- {albedo="mp_u_faov_blush_003_ab",},
                },
    ["complex"] = {
                    {id=0xF679EDE7,albedo=0xFAAE9FF0,},                                                              -- {albedo="mp_u_faov_complex_000_ab",},
                    {id=0x3FFB80ED,albedo=0x1FDFD4A1,},                                                              -- {albedo="mp_u_faov_complex_001_ab",},
                    {id=0x31C0E478,albedo=0xC72D0698,},                                                              -- {albedo="mp_u_faov_complex_002_ab",},
                    {id=0x2457C9A6,albedo=0x98F1C76F,},                                                              -- {albedo="mp_u_faov_complex_003_ab",},
                    {id=0x16262D43,albedo=0xE0D03293,},                                                              -- {albedo="mp_u_faov_complex_004_ab",},
                    {id=0x88F312DB,albedo=0x2ECCC670,},                                                              -- {albedo="mp_u_faov_complex_005_ab",},
                    {id=0x785C71AE,albedo=0xAE1C329F,},                                                              -- {albedo="mp_u_faov_complex_006_ab",},
                    {id=0x6D7D5BF0,albedo=0x23201E55,},                                                              -- {albedo="mp_u_faov_complex_007_ab",},
                    {id=0x5F2FBF55,albedo=0x94503F97,},                                                              -- {albedo="mp_u_faov_complex_008_ab",},
                    {id=0xBF38FF6A,albedo=0x5F62F986,},                                                              -- {albedo="mp_u_faov_complex_009_ab",},
                    {id=0xF5656C26,albedo=0x83417009,},                                                              -- {albedo="mp_u_faov_complex_010_ab",},
                    {id=0x03A408A3,albedo=0x1BCC4185,},                                                              -- {albedo="mp_u_faov_complex_011_ab",},
                    {id=0x293453C3,albedo=0x6C556574,},                                                              -- {albedo="mp_u_faov_complex_012_ab",},
                    {id=0x43150800,albedo=0x1E486F85,},                                                              -- {albedo="mp_u_faov_complex_013_ab",},
                },
    ["disc"]  = {
                    {id=0xD44A5ABA,albedo=0x2D3AEB2F,},                                                              -- {albedo="mp_u_faov_disc_000_ab",},
                    {id=0xE2CF77C4,albedo=0xB8945AC0,},                                                              -- {albedo="mp_u_faov_disc_001_ab",},
                    {id=0xCF57D0E9,albedo=0xB15E4E47,},                                                              -- {albedo="mp_u_faov_disc_002_ab",},
                    {id=0xE0A8738A,albedo=0x25A711DD,},                                                              -- {albedo="mp_u_faov_disc_003_ab",},
                    {id=0xABD109DC,albedo=0xCEBED6D9,},                                                              -- {albedo="mp_u_faov_disc_004_ab",},
                    {id=0xB91C2472,albedo=0xFDD6C9AB,},                                                              -- {albedo="mp_u_faov_disc_005_ab",},
                    {id=0x894844B7,albedo=0x7E89B165,},                                                              -- {albedo="mp_u_faov_disc_006_ab",},
                    {id=0x96FAE01C,albedo=0x458799CD,},                                                              -- {albedo="mp_u_faov_disc_007_ab",},
                    {id=0x86D3BFCE,albedo=0x8F2F2826,},                                                              -- {albedo="mp_u_faov_disc_008_ab",},
                    {id=0x5488DB39,albedo=0xB49A0275,},                                                              -- {albedo="mp_u_faov_disc_009_ab",},
                    {id=0x7DA5A5AE,albedo=0x8200F51D,},                                                              -- {albedo="mp_u_faov_disc_010_ab",},
                    {id=0xE73778DC,albedo=0x8D35AC90,},                                                              -- {albedo="mp_u_faov_disc_011_ab",},
                    {id=0xD83EDADF,albedo=0x96B619CD,},                                                              -- {albedo="mp_u_faov_disc_012_ab",},
                    {id=0xE380F163,albedo=0xAB7309F7,},                                                              -- {albedo="mp_u_faov_disc_013_ab",},
                    {id=0xB4611324,albedo=0x26FEBDD4,},                                                              -- {albedo="mp_u_faov_disc_014_ab",},
                    {id=0xC6ABB7B9,albedo=0xC162C835,},                                                              -- {albedo="mp_u_faov_disc_015_ab",},
                },
    ["foundation"] = {
                    {id=0xEF5AB280,albedo=0xD9264247,ma=0x1535C7C9,},                                                -- {albedo="mp_u_faov_foundation_000_ab",ma="mp_u_faov_foundation_000_ma",},
                },
    ["freckles"] =  {
                    {id=0x1B794C51,albedo=0x59B8159A,},                                                              -- {albedo="mp_u_faov_freckles_000_ab",},
                    {id=0x29BFE8DE,albedo=0x03FCF67B,},                                                              -- {albedo="mp_u_faov_freckles_001_ab",},
                    {id=0x0EF6B34C,albedo=0x21E2FD82,},                                                              -- {albedo="mp_u_faov_freckles_002_ab",},
                    {id=0x64925E7E,albedo=0x3FD45844,},                                                              -- {albedo="mp_u_faov_freckles_003_ab",},
                    {id=0xF5F280FC,albedo=0xE372E00E,},                                                              -- {albedo="mp_u_faov_freckles_004_ab",},
                    {id=0x33B0FC78,albedo=0x288810E0,},                                                              -- {albedo="mp_u_faov_freckles_005_ab",},
                    {id=0x25675FE5,albedo=0xEB8C0B1D,},                                                              -- {albedo="mp_u_faov_freckles_006_ab",},
                    {id=0xD10F3736,albedo=0x3885AC2A,},                                                              -- {albedo="mp_u_faov_freckles_007_ab",},
                    {id=0x5126B75F,albedo=0xB061C984,},                                                              -- {albedo="mp_u_faov_freckles_008_ab",},
                    {id=0x6B8EEC2F,albedo=0xE1D1113E,},                                                              -- {albedo="mp_u_faov_freckles_009_ab",},
                    {id=0x0A9A26F7,albedo=0xA1EC1AEA,},                                                              -- {albedo="mp_u_faov_freckles_010_ab",},
                    {id=0xFDE40D8B,albedo=0x6DBC9203,},                                                              -- {albedo="mp_u_faov_freckles_011_ab",},
                    {id=0x7E338E44,albedo=0x097D1D0A,},                                                              -- {albedo="mp_u_faov_freckles_012_ab",},
                    {id=0x70F273C2,albedo=0x81A25BCE,},                                                              -- {albedo="mp_u_faov_freckles_013_ab",},
                    {id=0x61C7D56D,albedo=0x197A1335,},                                                              -- {albedo="mp_u_faov_freckles_014_ab",},  
    },
    ["grime"] =     {
                    {id=0xA2F30923,albedo=0x16CDD724,normal=0x136165B3,ma=0xF3DFA7AC,},                              -- {albedo="mp_u_faov_grime_000_ab",normal="mp_u_faov_grime_000_nm",ma="mp_u_faov_grime_000_ma",},
                    {id=0xD5B1EEA0,albedo=0x0E599D69,normal=0x5C67FB68,ma=0x40FEC59E,},                              -- {albedo="mp_u_faov_grime_001_ab",normal="mp_u_faov_grime_001_nm",ma="mp_u_faov_grime_001_ma",},
                    {id=0x7EC740CC,albedo=0x0FAE8DC6,normal=0x9E7A4B63,ma=0xB48BF65A,},                              -- {albedo="mp_u_faov_grime_002_ab",normal="mp_u_faov_grime_002_nm",ma="mp_u_faov_grime_002_ma",},
                    {id=0xB08F245B,albedo=0x98358521,normal=0x1FAA4A84,ma=0x81428E8F,},                              -- {albedo="mp_u_faov_grime_003_ab",normal="mp_u_faov_grime_003_nm",ma="mp_u_faov_grime_003_ma",},
                    {id=0x1A5E77F8,albedo=0x8D3D2563,normal=0x1FAA4A84,ma=0x81428E8F,},                              -- {albedo="mp_u_faov_grime_004_ab",normal="mp_u_faov_grime_003_nm",ma="mp_u_faov_grime_003_ma",},
                    {id=0xE81B9373,albedo=0xAE43378D,normal=0x0CBEEF9B,ma=0x92097B22,},                              -- {albedo="mp_u_faov_grime_005_ab",normal="mp_u_faov_grime_005_nm",ma="mp_u_faov_grime_005_ma",},
                    {id=0x3CFA3D2F,albedo=0x7499570E,normal=0xA27FF667,ma=0x24B49749,},                              -- {albedo="mp_u_faov_grime_006_ab",normal="mp_u_faov_grime_006_nm",ma="mp_u_faov_grime_006_ma",},
                    {id=0x0B865A48,albedo=0xB80F6B12,normal=0x377319E3,ma=0x3CDC25A9,},                              -- {albedo="mp_u_faov_grime_007_ab",normal="mp_u_faov_grime_007_nm",ma="mp_u_faov_grime_007_ma",},
                    {id=0x506DE416,albedo=0x537BA522,normal=0x006AF092,ma=0x5CCEA9F8,},                              -- {albedo="mp_u_faov_grime_008_ab",normal="mp_u_faov_grime_008_nm",ma="mp_u_faov_grime_008_ma",},
                    {id=0x1F250185,albedo=0x51BE975D,normal=0x3F718027,ma=0x5527ACCF,},                              -- {albedo="mp_u_faov_grime_009_ab",normal="mp_u_faov_grime_009_nm",ma="mp_u_faov_grime_009_ma",},
                    {id=0xE71930B0,albedo=0x595D09A3,normal=0xF4E08D43,ma=0x60B91CE7,},                              -- {albedo="mp_u_faov_grime_010_ab",normal="mp_u_faov_grime_010_nm",ma="mp_u_faov_grime_010_ma",},
                    {id=0xDE571F2C,albedo=0xE7FAFDFA,normal=0xE6A18BBF,ma=0xCB315A57,},                              -- {albedo="mp_u_faov_grime_011_ab",normal="mp_u_faov_grime_011_nm",ma="mp_u_faov_grime_011_ma",},
                    {id=0x0CA6FBCB,albedo=0x0E27372E,normal=0xD4894921,ma=0xBF339D56,},                              -- {albedo="mp_u_faov_grime_012_ab",normal="mp_u_faov_grime_012_nm",ma="mp_u_faov_grime_012_ma",},
                    {id=0x21F62669,albedo=0x693623F0,normal=0xDB95176C,ma=0xEA27B375,},                              -- {albedo="mp_u_faov_grime_013_ab",normal="mp_u_faov_grime_013_nm",ma="mp_u_faov_grime_013_ma",},
                    {id=0xFB09D881,albedo=0xC4A40DA0,normal=0xADD1DC3D,ma=0xFD797A87,},                              -- {albedo="mp_u_faov_grime_014_ab",normal="mp_u_faov_grime_014_nm",ma="mp_u_faov_grime_014_ma",},
                    {id=0x11530513,albedo=0x67C6D30F,normal=0x26AA38C3,ma=0x89C2FFE3,},                              -- {albedo="mp_u_faov_grime_015_ab",normal="mp_u_faov_grime_015_nm",ma="mp_u_faov_grime_015_ma",},
                },
    ["hair"] =  {
                    {id=0x39051515,albedo=0x60A4A360,normal=0x8D65EFF2,ma=0x62759D82,},                              -- {albedo="mp_u_faov_m_hair_000_ab",normal="mp_u_faov_m_hair_000_nm",ma="mp_u_faov_m_hair_000_ma",},
                    {id=0x5E71DFEE,albedo=0x71147B90,ma=0xD8EB57BC,},                                                -- {albedo="mp_u_faov_m_hair_002_ab",ma="mp_u_faov_m_hair_002_ma",},
                    {id=0xDD735DEF,albedo=0x493214E4,ma=0x6613D121,},                                                -- {albedo="mp_u_faov_m_hair_009_ab",ma="mp_u_faov_m_hair_009_ma",},
                    {id=0x69622EAD,albedo=0xA6E819C4,ma=0xE581D851,},                                                -- {albedo="mp_u_faov_m_hair_shared_000_ab",ma="mp_u_faov_m_hair_shared_000_ma",},
                },
    ["moles"] = {
                    {id=0x821FD077,albedo=0xDFDA0798,normal=0xE4E90C92,},                                            -- {albedo="mp_u_faov_moles_000_ab",normal="mp_u_faov_moles_000_nm",},
                    {id=0xCD38E6A8,albedo=0xE9CF623E,normal=0x43FAEA4B,},                                            -- {albedo="mp_u_faov_moles_001_ab",normal="mp_u_faov_moles_001_nm",},
                    {id=0x9F9D8B72,albedo=0x27450B2F,normal=0x0808DBFB,},                                            -- {albedo="mp_u_faov_moles_002_ab",normal="mp_u_faov_moles_002_nm",},
                    {id=0xE7179A39,albedo=0x38638E0B,normal=0x99346057,},                                            -- {albedo="mp_u_faov_moles_003_ab",normal="mp_u_faov_moles_003_nm",},
                    {id=0xBB094249,albedo=0x763F8624,normal=0x6975D6F9,},                                            -- {albedo="mp_u_faov_moles_004_ab",normal="mp_u_faov_moles_004_nm",},
                    {id=0x03AC5362,albedo=0xEF158115,normal=0xBA297751,},                                            -- {albedo="mp_u_faov_moles_005_ab",normal="mp_u_faov_moles_005_nm",},
                    {id=0x154FF6A9,albedo=0xEE28E6F7,normal=0xB7548307,},                                            -- {albedo="mp_u_faov_moles_006_ab",normal="mp_u_faov_moles_006_nm",},
                    {id=0x1E23084F,albedo=0x566ACE2F,normal=0x361237C6,},                                            -- {albedo="mp_u_faov_moles_007_ab",normal="mp_u_faov_moles_007_nm",},
                    {id=0x31DBAFC0,albedo=0x0AB0CC2B,normal=0xDBF55701,},                                            -- {albedo="mp_u_faov_moles_008_ab",normal="mp_u_faov_moles_008_nm",},
                    {id=0x3AC5C194,albedo=0xC940CC25,normal=0x41CB48FC,},                                            -- {albedo="mp_u_faov_moles_009_ab",normal="mp_u_faov_moles_009_nm",},
                    {id=0x4500D516,albedo=0x3A1EEDB1,normal=0x17BC19B0,},                                            -- {albedo="mp_u_faov_moles_010_ab",normal="mp_u_faov_moles_010_nm",},
                    {id=0x3695B840,albedo=0x1D30222E,normal=0xDA5FDF7E,},                                            -- {albedo="mp_u_faov_moles_011_ab",normal="mp_u_faov_moles_011_nm",},
                    {id=0x286C1BED,albedo=0x4F0B4FA8,normal=0x40333534,},                                            -- {albedo="mp_u_faov_moles_012_ab",normal="mp_u_faov_moles_012_nm",},
                    {id=0x934BF1AF,albedo=0x4540A8D7,normal=0x933ACF76,},                                            -- {albedo="mp_u_faov_moles_013_ab",normal="mp_u_faov_moles_013_nm",},
                    {id=0x84F55502,albedo=0x47BE6D32,normal=0xDCF7108E,},                                            -- {albedo="mp_u_faov_moles_014_ab",normal="mp_u_faov_moles_014_nm",},
                    {id=0xBD9A464B,albedo=0x9DABB1B9,normal=0x4A3B1739,},                                            -- {albedo="mp_u_faov_moles_015_ab",normal="mp_u_faov_moles_015_nm",},
                },
    ["spots"] = {
                    {id=0x5BBFF5F7,albedo=0x24968425,normal=0xA5D532AD,},                                            -- {albedo="mp_u_faov_spots_000_ab",normal="mp_u_faov_spots_000_nm",},
                    {id=0x65EC0A4F,albedo=0x326A7845,normal=0xC09B2354,},                                            -- {albedo="mp_u_faov_spots_001_ab",normal="mp_u_faov_spots_001_nm",},
                    {id=0x3F143CA0,albedo=0x91D7E39E,normal=0xD607DF75,},                                            -- {albedo="mp_u_faov_spots_002_ab",normal="mp_u_faov_spots_002_nm",},
                    {id=0x49675146,albedo=0x2E6C3769,normal=0xE6A21CD5,},                                            -- {albedo="mp_u_faov_spots_003_ab",normal="mp_u_faov_spots_003_nm",},
                    {id=0x07504D2D,albedo=0x39F16CE6,normal=0x5CB32D5C,},                                            -- {albedo="mp_u_faov_spots_004_ab",normal="mp_u_faov_spots_004_nm",},
                    {id=0xF161214F,albedo=0x47C60FBA,normal=0x19424C77,},                                            -- {albedo="mp_u_faov_spots_005_ab",normal="mp_u_faov_spots_005_nm",},
                    {id=0xE43286F2,albedo=0xA7E86379,normal=0x7C07E0B0,},                                            -- {albedo="mp_u_faov_spots_006_ab",normal="mp_u_faov_spots_006_nm",},
                    {id=0xDDDC7A46,albedo=0x26D3DA64,normal=0x5A69A9BB,},                                            -- {albedo="mp_u_faov_spots_007_ab",normal="mp_u_faov_spots_007_nm",},
                    {id=0xD086DF9B,albedo=0x7D6FF58C,normal=0x5A0D99C8,},                                            -- {albedo="mp_u_faov_spots_008_ab",normal="mp_u_faov_spots_008_nm",},
                    {id=0xBA51B331,albedo=0xCB23CA55,normal=0xA7720C6A,},                                            -- {albedo="mp_u_faov_spots_009_ab",normal="mp_u_faov_spots_009_nm",},
                    {id=0xE4CF097B,albedo=0x51D0FBDA,normal=0xB01F5202,},                                            -- {albedo="mp_u_faov_spots_010_ab",normal="mp_u_faov_spots_010_nm",},
                    {id=0xF70CADF6,albedo=0xD0858DFC,normal=0x7E067837,},                                            -- {albedo="mp_u_faov_spots_011_ab",normal="mp_u_faov_spots_011_nm",},
                    {id=0xC07F40DC,albedo=0x3BAF1008,normal=0x75030E1B,},                                            -- {albedo="mp_u_faov_spots_012_ab",normal="mp_u_faov_spots_012_nm",},
                    {id=0xD3B1E741,albedo=0x97091388,normal=0xA191AA56,},                                            -- {albedo="mp_u_faov_spots_013_ab",normal="mp_u_faov_spots_013_nm",},
                    {id=0xB494A903,albedo=0x18025AE1,normal=0x86F51AD1,},                                            -- {albedo="mp_u_faov_spots_014_ab",normal="mp_u_faov_spots_014_nm",},
                    {id=0xC6EE4DB6,albedo=0xC9F3EBA4,normal=0xE819AD33,},                                            -- {albedo="mp_u_faov_spots_015_ab",normal="mp_u_faov_spots_015_nm",},
                },
}

