local LoadedUsers = {}
local AllCharacters = {}
local gumCore = {}
local Character = {}
local User = {}
local CanSaveCoords = {}
local PlayerTable = {}

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
		print("^0")
		print("^2MMMMMMMMMMMMNmmmmmNMMMMMMNNNMMMMMMNNNMMMNNNNNMMMMMNNNNNMMMMMMMMMMMMMNmmmmNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM")
		print("^5MMMMMMMMMNh/-.````.:sNMMM..:MMMMMM/..MMM/....sMMMm.....NMMMMMMMMMmo:.````-/hMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM")
		print("^5MMMMMMMMm:  :oydyo-  :NMM  .MMMMMM-  NMM-    .NMM/     NMMMMMMMMs. .+ydyo.  +MMMMMNmmmNMMMMMMMMMNmNMMMMNmmNMMMMMMMMMMMMM")
		print("^5MMMMMMMM-  sMMMMMMNosyNMM  .MMMMMM-  NMM-  .  yMm` .   NMMMMMMMm  `mMMMMMmoyhMMMy/...../yNMMs--+-..hNy-....:yNMMMMMMMMMM")
		print("^5MMMMMMMN  .MMMMdssssssNMM  .MMMMMM-  NMM-  o  .N+  o   NMMMMMMMy  +MMMMMMMMMMMM+  :ydh:  /NM+  `/o+N:  oddo  /MMMMMMMMMM")
		print("^5MMMMMMMN  `NMMMs---`  mMM  .MMMMMM-  NMM-  y/  o` .m   NMMMMMMMy  :MMMMMMNdmMMm  .MMMMM-  dM+  /MMMd  `++++`  mMMMMMMMMM")
		print("^5MMMMMMMM/  +mMMMNNm-  mMM   dMMMMm`  NMM-  yd  `  oN   NMMMMMMMN. `yNMMMN+`./Mm  .NMMMN.  dM+  yMMMd  `yyyyoosNMMMMMMMMM")
		print("^5MMMMMMMMN/` ./oyo/-  `mMM+  .+ss+-  /MMM-  mM:   `NM.  NMMMMMMMMd/``-:+:.  -dMM+` -shs: `oMM+  hMMMN:  /yh/..oMMMMMMMMMM")
		print("^5MMMMMMMMMMds:-....:+ydMMMMh/-....-/yNMMM+::NMh:::oMM+::NMMMMMMMMMMdo/::::+hMMMMMh+-...-+dMMMs::dMMMMNs:-...:sNMMMMMMMMMM")
		print("^2MMMMMMMMMMMMMNNNNNMMMMMMMMMMMNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNNNMMMMMMMMMMMMMMMMMNNNNMMMMMMMMMMMMM")
		print("^0")
		exports.ghmattimysql:execute('SELECT * FROM characters' , {}, function(result2)
			if result2 ~= nil then
				for k,v in pairs(result2) do
					table.insert(AllCharacters, {
						setJob=Character.setJob,
						setMeta=Character.setMeta,
						addCurrency=Character.addCurrency,
						removeCurrency=Character.removeCurrency,
						buySkin=Character.buySkin,
						changeSkin=Character.changeSkin,
						buySkinPlayer=Character.buySkinPlayer,
						identifier=v.identifier,
						charIdentifier=v.charidentifier,
						firstname=v.firstname,
						lastname=v.lastname,
						skin=v.skinPlayer,
						comp=v.compPlayer,
						inventory=v.inventory,
						meta=v.meta,
						money=v.money,
						gold=v.gold,
						rol=v.rol,
						xp=v.xp,
						job=v.job,
						jobgrade=v.jobgrade,
						coords=v.coords
						}
					)
				end
			else
				table.insert(AllCharacters, {
					setJob=Character.setJob,
					setMeta=Character.setMeta,
					addCurrency=Character.addCurrency,
					removeCurrency=Character.removeCurrency,
					buySkin=Character.buySkin,
					changeSkin=Character.changeSkin,
					buySkinPlayer=Character.buySkinPlayer,
					identifier='steam:00000000',
					charIdentifier='0',
					firstname='clean',
					lastname='clean',
					skin=json.encode('{}'),
					comp=json.encode('{}'),
					inventory=json.encode('{}'),
					meta=json.encode('{}'),
					money=0.0,
					gold=0.0,
					rol=0.0,
					xp=0,
					job='Unemploeyed',
					jobgrade=0,
					coords=json.encode('{}')
					}
				)
			end
		end)
		exports.ghmattimysql:execute('SELECT * FROM users' , {}, function(result)
			if result ~= nil then
				for k,v in pairs(result) do
					LoadedUsers[v.identifier] = {
						identifier=v.identifier,
						group=v.group,
						chars=v.chars,
						warnings=v.warnings,
						banned=v.banned,
						setUsedCharacter=User.setUsedCharacter,
						addCharacter=User.addCharacter,
						setGroup=User.setGroup
					}
				end
			else
				LoadedUsers['steam:00000000'] = {
					identifier='steam:00000000',
					group='admin',
					chars=0,
					warnings=0,
					banned=0,
					setUsedCharacter=User.setUsedCharacter,
					addCharacter=User.addCharacter,
					setGroup=User.setGroup
				}
			end
		end)
	end
end)

RegisterCommand("addwl", function(source, args)
	if args[1] ~= nil then
		if source == 0 then
			local identifier_news =  "steam:"..args[1]
			local Parameters = { ['identifier'] = identifier_news}
			exports.ghmattimysql:execute("INSERT INTO whitelist (`identifier`) VALUES (@identifier)", Parameters)
			if Config.Info_print then
				gumCore.Debug("Added on Whitelist : "..identifier_news)
			end
		else
			if args ~= nil then
				local User = gumCore.getUser(source)
				local Character = User.getUsedCharacter
				local group = User.group
				if group == "admin" then
					local identifier_news =  "steam:"..args[1]
					local Parameters = { ['identifier'] = identifier_news}
					exports.ghmattimysql:execute("INSERT INTO whitelist (`identifier`) VALUES (@identifier)", Parameters)

					if Config.Info_print then
						gumCore.Debug("Added on Whitelist : "..identifier_news)
					end
				else return false
				end
			end
		end
	else
		gumCore.Error("No selected hex")
	end
end)

RegisterCommand("setjob", function(source, args)
	local _source = source
	if _source == 0 then
		local player_id = args[1]
		local job_name = args[2]
		local job_grade = args[3]
		if args[1] ~= nil and args[2] ~= nil and args[3] ~= nil then
			local User2 = gumCore.getUser(player_id)
			if User2 ~= nil then
				local Character2 = User2.getUsedCharacter
				Character2.setJob(player_id, job_name, job_grade)
				if Config.Info_print then
					gumCore.Debug("Player with ID get "..player_id.." : "..job_name.." : "..job_grade.."")
				end
			end
		else
			gumCore.Error("Bad syntax : use example : /setjob ID Police 1")
		end
	else
		local player_id = args[1]
		local job_name = args[2]
		local job_grade = args[3]
		if player_id ~= nil and job_name ~= nil and job_grade ~= nil then
			local User = gumCore.getUser(source)
			local group = User.group

			local User2 = gumCore.getUser(player_id)
			if User2 ~= nil then
				local Character2 = User2.getUsedCharacter
				if group == "admin" then
					Character2.setJob(player_id, job_name, job_grade)
					if Config.Info_print then
						gumCore.Debug("Player with ID get "..player_id.." : "..job_name.." : "..job_grade.."")
					end
				else return false
				end
			else
				gumCore.Error("This user not found.")
			end
		else
			gumCore.Error("Bad syntax : use example : /setjob ID Police 1")
		end
	end
end)

RegisterCommand("setchar", function(source, args)
	local _source = source
	if _source == 0 then
		local steam_hex = "steam:"..args[1]
		local char_count = args[2]
		if args[1] ~= nil and args[2] ~= nil then
			LoadedUsers[steam_hex].chars = char_count
			exports.ghmattimysql:execute("UPDATE users SET `chars`=@chars WHERE identifier = @identifier", {['identifier'] = steam_hex,['chars'] = char_count},
			function (result)
			end)
			if Config.Info_print then
				gumCore.Debug("Player "..steam_hex.." get "..char_count.." Count")
			end
		else
			gumCore.Error("Bad syntax : use example : /setchar 1100010fffd026 2")
		end
	else
		local User = gumCore.getUser(source)
		local group = User.group
		local steam_hex = "steam:"..args[1]
		local char_count = args[2]
		if group == "admin" then
			if args[1] ~= nil and args[2] ~= nil then
				LoadedUsers[steam_hex].chars = char_count
				exports.ghmattimysql:execute("UPDATE users SET `chars`=@chars WHERE identifier = @identifier", {['identifier'] = steam_hex,['chars'] = char_count},
				function (result)
				end)
				if Config.Info_print then
					gumCore.Debug("Player "..steam_hex.." get  "..char_count.." Count")
				end
			else
				gumCore.Error("Bad syntax : use example : /setchar 1100010fffd026 2")
			end
		end
	end
end)

RegisterCommand("delchar", function(source, args)
	local _source = source
	if _source == 0 then
		local charid = args[1]
		if charid ~= nil then
			local char_for_del = 0
			local hex_for_del = ""
			for k,v in pairs(AllCharacters) do
				if tonumber(charid) == v.charIdentifier then
					char_for_del = k
					hex_for_del = v.identifier
				end
			end
			table.remove(AllCharacters, char_for_del)
			exports.ghmattimysql:execute("DELETE FROM characters WHERE charidentifier = @charidentifier", {["@charidentifier"] = charid}, function(result)
				LoadedUsers[hex_for_del].setUsedCharacter = User.setUsedCharacter
				if Config.Info_print then
					gumCore.Debug("Character "..char_for_del.." deleted on steam  "..hex_for_del.."")
				end
			end)
		else
			gumCore.Error("Bad syntax : use example : /delchar 727")
		end
	else
		local User = gumCore.getUser(source)
		local group = User.group
		local charid = args[1]
		if charid ~= nil then
			if group == "admin" then
				local char_for_del = 0
				local hex_for_del = ""
				for k,v in pairs(AllCharacters) do
					if tonumber(charid) == v.charIdentifier then
						char_for_del = k
						hex_for_del = v.identifier
					end
				end
				table.remove(AllCharacters, char_for_del)
				exports.ghmattimysql:execute("DELETE FROM characters WHERE charidentifier = @charidentifier", {["@charidentifier"] = charid}, function(result)
					LoadedUsers[hex_for_del].setUsedCharacter = User.setUsedCharacter
				end)
				if Config.Info_print then
					gumCore.Debug("Character "..char_for_del.." deleted on steam  "..hex_for_del.."")
				end
			else
				gumCore.Error("Bad syntax : use example : /delchar 727")
			end
		end
	end
end)

RegisterCommand("setgroup", function(source, args)
	local _source = source
	if _source == 0 then
		local player_id = args[1]
		local group_name = args[2]
		if player_id ~= nil and group_name ~= nil then
			local User = gumCore.getUser(player_id)
			if User ~= nil then
				User.setGroup(source, player_id, group_name)
				if Config.Info_print then
					gumCore.Debug("Player with ID : "..player_id.." get group "..group_name.."")
				end
			else
				gumCore.Error("This user not found.")
			end
		else
			gumCore.Error("Bad syntax : use example : /setgroup ID admin")
		end
	else
		local player_id = args[1]
		local group_name = args[2]
		if player_id ~= nil and group_name ~= nil then
			local User = gumCore.getUser(_source)
			local group = User.group

			local User2 = gumCore.getUser(player_id)
			if User2 ~= nil then
				local Character2 = User2.getUsedCharacter
				if group == "admin" then
					User2.setGroup(source, player_id, group_name)
					if Config.Info_print then
						gumCore.Debug("Player with ID : "..player_id.." get group "..group_name.."")
					end
				else return false
				end
			else
				gumCore.Error("This user not found.")
			end
		else
			gumCore.Error("Bad syntax : use example : /givegroup ID admin")
		end
	end
end)

RegisterCommand("getplayers", function(source, args)
	local _source = source
	if _source == 0 then
		for k, v in pairs(GetPlayers()) do
			print("ID : "..v.."       Player hex : "..GetPlayerIdentifier(v).."       Player name : "..GetPlayerName(v).."")
		end
	end
end)


function User.setGroup(source, id, group)
	local _source = source
	if source ~= nil and id ~= nil and group ~= nil then
		local User = gumCore.getUser(tonumber(id))
		User.group = group
		if Config.Info_print then
			gumCore.Debug("Identifier : "..User.identifier.." Get group : "..group.."")
		end

		exports.ghmattimysql:execute("UPDATE users SET `group`=@group WHERE identifier = @identifier", {['identifier'] = User.identifier, ['group'] = group},
		function (result)
		end)
	else
		gumCore.Error("Someting is wrong, check function\nUser.setGroup(target, 'admin')\nArgs : Target, Rank")
	end
end


RegisterServerEvent('gum:setGroup')
AddEventHandler('gum:setGroup', function(source, group)
	local _source = source
	if _source ~= nil and group ~= nil then
		local User = gumCore.getUser(tonumber(_source))
		User.group = group
		if Config.Info_print then
			gumCore.Debug("Identifier : "..User.identifier.." Get group : "..group.."")
		end

		exports.ghmattimysql:execute("UPDATE users SET `group`=@group WHERE identifier = @identifier", {['identifier'] = User.identifier, ['group'] = group},
		function (result)
		end)
	else
		gumCore.Error("Someting is wrong, check function\nUser.setGroup(source, 'admin')\nArgs : Target, Rank")
	end
end)

RegisterServerEvent('gum:addNewCallBack')
AddEventHandler('gum:addNewCallBack', function(callbackName, fn)
	print("GUM Core : "..callbackName.." Callback registered!")
	addCallbackHandler(callbackName, function(cb, source, ...)
		cb(fn(source, ...))
	end)
end)

RegisterServerEvent('getCore')
AddEventHandler('getCore', function(cb)
	cb(gumCore)
end)

function gumCore.getUser(source)
	local _source = source
	if source ~= nil then
		local searched = false
		local identifiers = GetPlayerIdentifier(_source)
		if LoadedUsers[identifiers] ~= nil then
			for k,v in pairs(AllCharacters) do
				if identifiers == v.identifier then
					if LoadedUsers[v.identifier].getUsedCharacter == nil then
						LoadedUsers[v.identifier].getUsedCharacter = v
					end
					return LoadedUsers[v.identifier]
				end
			end
		else
			return gumCore.Error("User not found.")
		end
	else
		return gumCore.Error("User not found")
	end
end

function Character.setJob(source, job, grade)
	local _source = source
	if _source ~= nil and job ~= nil and grade ~= nil then
		local User = gumCore.getUser(tonumber(_source))
		local Character = User.getUsedCharacter
		local Identifier = Character.identifier
		local CharIdentifier = Character.charIdentifier
		Character.job = job
		Character.jobgrade = grade
		if Config.Info_print then
			gumCore.Debug("CharIdentifier : "..CharIdentifier.." \nGet job "..job.." with grade "..grade.."")
		end

		exports.ghmattimysql:execute("UPDATE characters SET job = @job,jobgrade=@jobgrade WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['job'] = job, ['jobgrade'] = grade},
		function (result)
		end)
	else
		gumCore.Error("Someting is wrong, check function\nCharacter.setJob(source, 'example', 1)\nArgs : Target, JobName, JobGrade")
	end
end

function Character.setMeta(source, meta_table)
	local _source = source
	if _source ~= nil and meta_table ~= nil then
		local User = gumCore.getUser(tonumber(_source))
		local Character = User.getUsedCharacter
		local Identifier = Character.identifier
		local CharIdentifier = Character.charIdentifier
		Character.meta = json.encode(meta_table)
		exports.ghmattimysql:execute("UPDATE characters SET meta=@meta WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['meta'] = Character.meta},
		function (result)
		end)
	else
		gumCore.Error("Someting is wrong, check function\nCharacter.setMeta(source, meta_table)\nArgs : Target, Table")
	end
end

RegisterServerEvent('gum:setJob')
AddEventHandler('gum:setJob', function(source, job, grade)
	local _source = source
	if _source ~= nil and job ~= nil and grade ~= nil then
		local User = gumCore.getUser(tonumber(_source))
		if User ~= nil then
			local Character = User.getUsedCharacter
			local Identifier = Character.identifier
			local CharIdentifier = Character.charIdentifier
			Character.job = job
			Character.jobgrade = grade
			if Config.Info_print then
				gumCore.Debug("CharIdentifier : "..CharIdentifier.." Get job "..job.." with grade "..grade.."")
			end

			exports.ghmattimysql:execute("UPDATE characters SET job = @job,jobgrade=@jobgrade WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['job'] = job, ['jobgrade'] = grade},
			function (result)
			end)
		end
	else
		gumCore.Error("Someting is wrong, check function\nCharacter.setJob(source, 'example', 1)\nArgs : Target, JobName, JobGrade")
	end
end)

RegisterServerEvent('gum:setJobGrade')
AddEventHandler('gum:setJobGrade', function(source, charid, grade)
	local _source = source
	if charid ~= nil and grade ~= nil then
		local identifier = ""
		for k,v in pairs(AllCharacters) do
			if tonumber(v.charIdentifier) == tonumber(charid) then
				identifier = v.identifier
				v.jobgrade = tonumber(grade)
				exports.ghmattimysql:execute("UPDATE characters SET jobgrade=@jobgrade WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = identifier, ['charidentifier'] = charid, ['jobgrade'] = tonumber(grade)},
				function (result)
				end)
			end
		end
	else
		gumCore.Error("Someting is wrong, check function\nTriggerEvent('gum:setJobGrade', source, charid, grade);")
	end
end)

RegisterServerEvent('gum:addMoney')
AddEventHandler('gum:addMoney', function(source, curr, much)
	local _source = source
	if _source ~= nil and curr ~= nil and much ~= nil then
		local User = gumCore.getUser(tonumber(_source))
		local Character = User.getUsedCharacter
		local Identifier = Character.identifier
		local CharIdentifier = Character.charIdentifier
		if much ~= nil then
			if tonumber(curr) == 0 then
				local Money = Character.money
				Character.money = Character.money+much
				if Config.Info_print then
					gumCore.Debug("CharIdentifier : "..CharIdentifier.." Had "..Money.."$, got "..much.."$ and has "..Character.money.."$")
				end

				exports.ghmattimysql:execute("UPDATE characters SET money = @money WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['money'] = Character.money},
				function (result)
					TriggerEvent("gum_inventory:get_money_sec", tonumber(_source))
				end)
			elseif tonumber(curr) == 1 then
				local Gold = Character.gold
				Character.gold = Character.gold+much
				if Config.Info_print then
					gumCore.Debug("CharIdentifier : "..CharIdentifier.." Had "..Gold.."G, got "..much.."G and has "..Character.gold.."G")
				end

				exports.ghmattimysql:execute("UPDATE characters SET gold = @gold WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['gold'] = Character.gold},
				function (result)
					TriggerEvent("gum_inventory:get_money_sec", tonumber(_source))
				end)
			elseif tonumber(curr) == 2 then
				local Rol = Character.rol
				Character.rol = Character.rol+much
				if Config.Info_print then
					gumCore.Debug("CharIdentifier : "..CharIdentifier.." Had "..Rol.."R, got "..much.."R and has "..Character.rol.."R")
				end
				exports.ghmattimysql:execute("UPDATE characters SET rol = @rol WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['rol'] = Character.rol},
				function (result)
					TriggerEvent("gum_inventory:get_money_sec", tonumber(_source))
				end)
			else
				gumCore.Error("This currency does exist")
			end
		else
			gumCore.Error("You dont have selected how much")
		end
	else
		gumCore.Error("Someting is wrong, check function\nCharacter.addCurrency(source, 0, 10)\nArgs : Target, Type, HowMuch")
	end
end)

function Character.addCurrency(source, type, much)
	local _source = source
	if _source ~= nil and type ~= nil and much ~= nil then
		local User = gumCore.getUser(tonumber(_source))
		local Character = User.getUsedCharacter
		local Identifier = Character.identifier
		local CharIdentifier = Character.charIdentifier
		if much ~= nil then
			if tonumber(type) == 0 then
				local Money = Character.money
				Character.money = Character.money+much
				if Config.Info_print then
					gumCore.Debug("CharIdentifier : "..CharIdentifier.." Had "..Money.."$, got "..much.."$ and has "..Character.money.."$")
				end

				exports.ghmattimysql:execute("UPDATE characters SET money = @money WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['money'] = Character.money},
				function (result)
					TriggerEvent("gum_inventory:get_money_sec", tonumber(_source))
				end)
			elseif tonumber(type) == 1 then
				local Gold = Character.gold
				Character.gold = Character.gold+much
				if Config.Info_print then
					gumCore.Debug("CharIdentifier : "..CharIdentifier.." Had "..Gold.."G, got "..much.."G and has "..Character.gold.."G")
				end

				exports.ghmattimysql:execute("UPDATE characters SET gold = @gold WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['gold'] = Character.gold},
				function (result)
					TriggerEvent("gum_inventory:get_money_sec", tonumber(_source))
				end)
			elseif tonumber(type) == 2 then
				local Rol = Character.rol
				Character.rol = Character.rol+much
				if Config.Info_print then
					gumCore.Debug("CharIdentifier : "..CharIdentifier.." Had "..Rol.."R, got "..much.."R and has "..Character.rol.."R")
				end
				exports.ghmattimysql:execute("UPDATE characters SET rol = @rol WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['rol'] = Character.rol},
				function (result)
					TriggerEvent("gum_inventory:get_money_sec", tonumber(_source))
				end)
			else
				gumCore.Error("This currency does exist")
			end
		else
			gumCore.Error("You dont have selected how much")
		end
	else
		gumCore.Error("Someting is wrong, check function\nCharacter.addCurrency(source, 0, 10)\nArgs : Target, Type, HowMuch")
	end
end

if Config.Onesync == true then
	AddEventHandler('playerDropped', function(reason)
		local _source = source
		local User = gumCore.getUser(tonumber(_source))
		local Ident = GetPlayerIdentifier(tonumber(_source))
		PlayerTable[_source] = nil
		if User ~= nil then
			if CanSaveCoords[tonumber(_source)] ~= nil then
				local Character = User.getUsedCharacter
				local Identifier = Character.identifier
				local CharIdentifier = Character.charIdentifier
				local playerCoords = GetEntityCoords(GetPlayerPed(_source))
				if playerCoords.x ~= 0 then
					local coords_table = {x=playerCoords.x, y=playerCoords.y, z=playerCoords.z}

					local Parameters = { ['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['meta'] = Character.meta }
					exports.ghmattimysql:execute("UPDATE characters SET meta = @meta WHERE identifier = @identifier AND charidentifier = @charidentifier", Parameters)

					exports.ghmattimysql:execute("UPDATE characters SET coords = @coords WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['coords'] = json.encode(coords_table)},
					function (result)
						if Config.Info_print then
							gumCore.Debug("CharIdentifier : "..CharIdentifier.." Dropped with safe coordinations "..playerCoords.x..", "..playerCoords.y..", "..playerCoords.z.."")
						end
					end)
				else
					gumCore.Error("CharIdentifier : "..CharIdentifier.."\n Dropped without safe coordination becouse 0.0,0.0,0.0")
				end
			else
				if Config.Info_print then
					gumCore.Error(Ident.." dropped without safe coordination")
				end
			end
		else
			if Config.Info_print then
				gumCore.Error(Ident.." dropped without safe coordination")
			end
		end
	end)
else
	AddEventHandler('playerDropped', function(reason)
		local _source = source
		if _source ~= nil then
			PlayerTable[_source] = nil
		end
	end)
end


function gumCore.getPlayers(source)
	return (PlayerTable) 
end


RegisterServerEvent('gumCore:save_coords')
AddEventHandler('gumCore:save_coords', function(coord_send)
	local _source = source
	local User = gumCore.getUser(_source)
	if User ~= nil then
		local Character = User.getUsedCharacter
		local u_identifier = Character.identifier
		local u_charid = Character.charIdentifier

		if coord_send.x ~= 0 then
			local Parameters = { ['identifier'] = u_identifier, ['charidentifier'] = u_charid, ['coords'] = json.encode({x=coord_send.x, y=coord_send.y, z=coord_send.z}) }
			exports.ghmattimysql:execute("UPDATE characters SET coords = @coords WHERE identifier = @identifier AND charidentifier = @charidentifier", Parameters)
			if Config.Info_print then
				gumCore.Debug("CharIdentifier : "..u_charid.." coords safe : "..coord_send.x..", "..coord_send.y..", "..coord_send.z.."")
			end
		end
	end
end)

function Character.removeCurrency(source, type, much)
	local _source = source
	if _source ~= nil and type ~= nil and much ~= nil then
		local User = gumCore.getUser(tonumber(_source))
		local Character = User.getUsedCharacter
		local Identifier = Character.identifier
		local CharIdentifier = Character.charIdentifier
		if much ~= nil then
			if tonumber(type) == 0 then
				local Money = Character.money
				Character.money = Character.money-much
				if Config.Info_print then
					gumCore.Debug("CharIdentifier : "..CharIdentifier.." Had "..Money.."$, got "..much.."$ and has "..Character.money.."$")
				end

				exports.ghmattimysql:execute("UPDATE characters SET money = @money WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['money'] = Character.money},
				function (result)
					TriggerEvent("gum_inventory:get_money_sec", tonumber(_source))
				end)
			elseif tonumber(type) == 1 then
				local Gold = Character.gold
				Character.gold = Character.gold-much
				if Config.Info_print then
					gumCore.Debug("CharIdentifier : "..CharIdentifier.." Had "..Gold.."$, got "..much.."$ and has "..Character.gold.."$")
				end

				exports.ghmattimysql:execute("UPDATE characters SET gold = @gold WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['gold'] = Character.gold},
				function (result)
					TriggerEvent("gum_inventory:get_money_sec", tonumber(_source))
				end)
			elseif tonumber(type) == 2 then
				local Rol = Character.rol
				Character.rol = Character.rol-much
				if Config.Info_print then
					gumCore.Debug("CharIdentifier : "..CharIdentifier.." Had "..Rol.."$, got "..much.."$ and has "..Character.rol.."$")
				end
				exports.ghmattimysql:execute("UPDATE characters SET rol = @rol WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['rol'] = Character.rol},
				function (result)
					TriggerEvent("gum_inventory:get_money_sec", tonumber(_source))
				end)
			else
				gumCore.Error("This currency does exist")
			end
		else
			gumCore.Error("You dont have selected how much")
		end
	else
		gumCore.Error("Someting is wrong, check function\nCharacter.removeCurrency(source, 0, 10)\nArgs : Target, Type, HowMuch")
	end
end


function Character.buySkin(source, name, clothetable)
	local _source = source
	if _source ~= nil and name ~= nil and clothetable ~= nil then
		local User = gumCore.getUser(tonumber(_source))
		local Character = User.getUsedCharacter
		local Identifier = Character.identifier
		local CharIdentifier = Character.charIdentifier
		if Config.Info_print then
			gumCore.Debug("CharIdentifier : "..CharIdentifier.." Buy or change clothing with name "..name.."")
		end

		Character.comp = json.encode(clothetable)

		exports.ghmattimysql:execute("UPDATE characters SET compPlayer = @compPlayer WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['compPlayer'] = json.encode(clothetable)},
		function (result)
			TriggerClientEvent("gum_clothes:send_to_client", _source, clothetable, true)
		end)
	else
		gumCore.Error("Someting is wrong, check function\nCharacter.buySkin(source, name, Clothetable)\nArgs : Target, Name, Clothetable")
	end
end

function Character.buySkinPlayer(source, skinplayer)
	local _source = source
	if _source ~= nil and skinplayer ~= nil then
		local User = gumCore.getUser(tonumber(_source))
		local Character = User.getUsedCharacter
		local Identifier = Character.identifier
		local CharIdentifier = Character.charIdentifier
		if Config.Info_print then
			gumCore.Debug("CharIdentifier : "..CharIdentifier.." Buy skin on character")
		end

		Character.skin = json.encode(skinplayer)

		exports.ghmattimysql:execute("UPDATE characters SET skinPlayer = @skinPlayer WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['skinPlayer'] = json.encode(skinplayer)},
		function (result)
		end)
	else
		gumCore.Error("Someting is wrong, check function\nCharacter.buySkinPlayer(source, SkinPlayer)\nArgs : Target, SkinPlayer")
	end
end

Citizen.CreateThread(function()
	while true do
		local count = 0
		for k,v in pairs(GetPlayers()) do
			count = count+1
			Citizen.Wait(100)
		end
		TriggerClientEvent("gum_core:sendBack", -1, count)
		Citizen.Wait(5*60000)
	end
end)
RegisterServerEvent('gumCore:GetPlayerIds')
AddEventHandler('gumCore:GetPlayerIds', function(source, charid, firstname, lastname, cb)
	local id_player = 0
	if tonumber(charid) == 0 then
		for k,v in pairs(PlayerTable) do
			if firstname == v.firstname and lastname == v.lastname then
				id_player = k
			end
		end
		if id_player == 0 then
			cb(false)
		else
			cb(id_player)
		end
	else
		for k,v in pairs(PlayerTable) do
			if tonumber(charid) == v.charid then
				id_player = k
			end
		end
		if id_player == 0 then
			cb(false)
		else
			cb(id_player)
		end
	end
end)

function Character.changeSkin(source, clothetable)
	local _source = source
	if _source ~= nil and clothetable ~= nil then
		local User = gumCore.getUser(tonumber(_source))
		local Character = User.getUsedCharacter
		local Identifier = Character.identifier
		local CharIdentifier = Character.charIdentifier
		if Config.Info_print then
			gumCore.Debug("CharIdentifier : "..CharIdentifier.." Change clothing")
		end

		Character.comp = json.encode(clothetable)

		exports.ghmattimysql:execute("UPDATE characters SET compPlayer = @compPlayer WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['compPlayer'] = json.encode(clothetable)},
		function (result)
		end)
		TriggerClientEvent("gum_clothes:send_to_client", _source, clothetable, true)
	else
		gumCore.Error("Someting is wrong, check function\nCharacter.changeSkin(source, Clothetable)\nArgs : Target, Clothetable")
	end
end

RegisterServerEvent('gum:removeMoney')
AddEventHandler('gum:removeMoney', function(source, type, much)
	local _source = source
	if _source ~= nil and type ~= nil and much ~= nil then
		local User = gumCore.getUser(tonumber(_source))
		local Character = User.getUsedCharacter
		local Identifier = Character.identifier
		local CharIdentifier = Character.charIdentifier
		if much ~= nil then
			if tonumber(type) == 0 then
				local Money = Character.money
				Character.money = Character.money-much
				if Config.Info_print then
					gumCore.Debug("CharIdentifier : "..CharIdentifier.." Had "..Money.."$, got "..much.."$ and has "..Character.money.."$")
				end

				exports.ghmattimysql:execute("UPDATE characters SET money = @money WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['money'] = Character.money},
				function (result)
					TriggerEvent("gum_inventory:get_money_sec", tonumber(_source))
				end)
			elseif tonumber(type) == 1 then
				local Gold = Character.gold
				Character.gold = Character.gold-much
				if Config.Info_print then
					gumCore.Debug("CharIdentifier : "..CharIdentifier.." Had "..Gold.."$, got "..much.."$ and has "..Character.gold.."$")
				end

				exports.ghmattimysql:execute("UPDATE characters SET gold = @gold WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['gold'] = Character.gold},
				function (result)
					TriggerEvent("gum_inventory:get_money_sec", tonumber(_source))
				end)
			elseif tonumber(type) == 2 then
				local Rol = Character.rol
				Character.rol = Character.rol-much
				if Config.Info_print then
					gumCore.Debug("CharIdentifier : "..CharIdentifier.." Had "..Rol.."$, got "..much.."$ and has "..Character.rol.."$")
				end
				exports.ghmattimysql:execute("UPDATE characters SET rol = @rol WHERE identifier = @identifier AND charidentifier = @charidentifier", {['identifier'] = Identifier, ['charidentifier'] = CharIdentifier, ['rol'] = Character.rol},
				function (result)
					TriggerEvent("gum_inventory:get_money_sec", tonumber(_source))
				end)
			else
				gumCore.Error("This currency does exist")
			end
		else
			gumCore.Error("You dont have selected how much")
		end
	else
		gumCore.Error("Someting is wrong, check function\nCharacter.removeCurrency(source, 0, 10)\nArgs : Target, Type, HowMuch")
	end
end)




function gumCore.addCharacter(source, firstname, lastname, skintable, clothetable)
	local _source = source
    local identifier = GetPlayerIdentifier(tonumber(_source))
	local coords_start = {x=1240.63, y=-1282.88, z=75.94}
	local items_start = {}
	for k,v in pairs(Config.StartItems) do
		local mathRandom = math.random(1,76062001718755)
		table.insert(items_start, {itemId=mathRandom, item=k, count=v, metadata={}})
	end
	local status = '{"Hunger":100.0, "Thirst":100.0}'
	exports.ghmattimysql:execute("INSERT INTO characters (`identifier`,`firstname`,`lastname`,`skinPlayer`,`compPlayer`,`inventory`,`coords`,`meta`,`money`) VALUES (@identifier,@firstname,@lastname,@skinPlayer,@compPlayer,@inventory,@coords,@meta,@money)", {['identifier'] = identifier,['firstname'] = firstname,['lastname'] = lastname,['skinPlayer'] = skintable,['money']=Config.StartMoney,['compPlayer'] = clothetable,['inventory']=json.encode(items_start), ['coords']=json.encode(coords_start),['meta']=status},
	function (result)
		exports.ghmattimysql:execute('SELECT * FROM characters WHERE identifier=@identifier' , {['identifier']=identifier}, function(result2)
			if result2 ~= nil then
				for k,v in pairs(result2) do
					if identifier == v.identifier then
						table.insert(AllCharacters, {setJob=Character.setJob,setMeta=Character.setMeta,addCurrency=Character.addCurrency,removeCurrency=Character.removeCurrency,buySkin=Character.buySkin,changeSkin=Character.changeSkin,buySkinPlayer=Character.buySkinPlayer,identifier=v.identifier,charIdentifier=v.charidentifier,firstname=v.firstname,lastname=v.lastname,skin=v.skinPlayer,comp=v.compPlayer,money=v.money,meta=v.meta,gold=v.gold,rol=v.rol,xp=v.xp,inventory=v.inventory,job=v.job,jobgrade=v.jobgrade,coords=coords_start})
						-- setUsedAfterCreate(source, v.charIdentifier)
					end
				end
			end
		end)	
	end)
end

AddEventHandler('playerDropped', function (reason)
	local _source = source
    local identifier = GetPlayerIdentifier(tonumber(_source))
	LoadedUsers[identifier].setUsedCharacter = User.setUsedCharacter
end)
function User.setUsedCharacter(source, charidentifier)
	local _source = source
	local trfirstname = ""
	local trlastname = ""
	local trcharid = 0
	for k,v in pairs(AllCharacters) do
		if v.charIdentifier == tonumber(charidentifier) then
			LoadedUsers[v.identifier].getUsedCharacter = v
			trfirstname = v.firstname
			trlastname = v.lastname
			trcharid = v.charIdentifier
			PlayerTable[tonumber(_source)] = {sourceData=_source, firstname=trfirstname, lastname=trlastname, charid=trcharid, steamid=v.identifier, playerName=GetPlayerName(tonumber(_source))}
		end
	end
	CanSaveCoords[_source] = true
	TriggerClientEvent("gum:SelectedCharacter", tonumber(_source), tonumber(charidentifier))
end

function setUsedAfterCreate(source,charidentifier)
	local _source = source
	local trfirstname = ""
	local trlastname = ""
	local trcharid = 0
	for k,v in pairs(AllCharacters) do
		if v.charIdentifier == tonumber(charidentifier) then
			LoadedUsers[v.identifier] = {group=v.group,warnings=v.warnings,banned=v.banned,getUsedCharacter=v,setUsedCharacter=User.setUsedCharacter,addCharacter=User.addCharacter}
			trfirstname = v.firstname
			trlastname = v.lastname
			trcharid = v.charidentifier
			PlayerTable[tonumber(_source)] = {sourceData=_source, firstname=trfirstname, lastname=trlastname, charid=trcharid, steamid=v.identifier, playerName=GetPlayerName(tonumber(_source))}
		end
	end
	CanSaveCoords[_source] = true
	TriggerClientEvent("gum:SelectedCharacter", tonumber(source), charidentifier)
end


local function OnPlayerConnecting(name, setKickReason, deferrals)
    local player = source
    local identifiers = GetPlayerIdentifier(source)
	local whitelisted = false
	local banned = false
    deferrals.defer()

    Wait(0)

    deferrals.update(string.format("Welcome on connecting too gum script server : %s. \n Checking your steam account.", name))

	Wait(2000)


	if string.match(identifiers, "licence") then
		deferrals.done("\n\n You dont have started steam \n ")
	end

	deferrals.update(string.format("Welcome on connecting too gum script server : %s. \n Checking ban account.", name))
	Wait(2000)

	exports.ghmattimysql:execute('SELECT reason,DATE_FORMAT(date,"%d.%m.%Y") AS date_convert FROM bans WHERE identifier = @identifier' , {['identifier'] = identifiers}, function(result)
		if result[1] ~= nil then
			deferrals.done("\n\n On this server you are blocked : \n "..result[1].reason.." \n \n Do datu : \n "..result[1].date_convert.." \n\n Pro více informací můžeš navštívit discord a založit ticket.")
		end
	end)

	Wait(1000)

	if Config.Whitelist == false then
        whitelisted = true
	else
		deferrals.update(string.format("Welcome on connecting too gum script server : %s. \n Checking whitelist.", name))
		exports.ghmattimysql:execute('SELECT * FROM whitelist WHERE identifier = @identifier' , {['identifier'] = identifiers}, function(result)
			if result[1] then
				whitelisted = true
			else
				whitelisted = false
			end
		end)
		Wait(3000)
	end

	if whitelisted then
		deferrals.done()
		exports.ghmattimysql:execute('SELECT * FROM users WHERE identifier = @identifier' , {['identifier'] = identifiers}, function(result)
			if result[1] == nil then
				exports.ghmattimysql:execute("INSERT INTO users (`identifier`) VALUES (@identifier)", {['identifier'] = identifiers})
				LoadedUsers[identifiers] = {
					identifier=identifiers,
					group="user",
					chars=Config.Char_Count,
					warnings=0,
					banned=0,
					setUsedCharacter=User.setUsedCharacter,
					addCharacter=User.addCharacter,
					setGroup=User.setGroup
				}
			else
			end
		end)
    else
		deferrals.done("\n\n You are not on whitelist.\n For access you must make this : . \n\n 1) Connect to discord : https://discord.com/invite/4ZZFgqtF8J \n 2) Fill form.\n 3) Wait for access \n 4) Call with admin. \n\n Good luck \n And have a nice day GF Team!")
    end
end

function gumCore.Error(text)
	print("^2GUM Core - ^8Error Message^0 - ^8"..text.."^0")
end

function gumCore.Debug(text)
	print("^2GUM Core - ^5"..text.."^0")
end

function gumCore.Report(id, title, text)
	print('^8!!REPORT ID : '..id..' !!^0')
	print("^2Title - ^5"..title.."^0")
	print("^2Text - ^5"..text.."^0")
end

AddEventHandler("playerConnecting", OnPlayerConnecting)


RegisterNetEvent("gum:triggercallback", function(callbackName, ticket, ...)
	local source = source
	local fn = getCallbackHandler(callbackName)

	if fn then
		fn(function(...)
			TriggerClientEvent("gum:endcallback", source, callbackName, ticket, ...)
		end, source, ...)
	end
end)
