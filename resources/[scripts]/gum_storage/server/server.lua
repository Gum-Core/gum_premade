local gumCore = {}

TriggerEvent("getCore",function(core)
	gumCore = core
end)

gum = exports.gum_core:gumAPI()

local storageData = {}
local bankData = {}

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
		exports.ghmattimysql:execute('SELECT * FROM storages WHERE prepay < now() - interval 7 DAY' , {}, function(result)
			for a,b in pairs(result) do
				print(b.id)
				local payMuch = 0
				for c,d in pairs(Config.StorageLevels) do
					if tonumber(c) == tonumber(b.upgrade) then
						payMuch = d[2]
					end
				end
				b.money = b.money-payMuch
				if b.money < 0 then
					exports.ghmattimysql:execute('UPDATE storages SET payed = @payed, prepay = now() WHERE id=@id', {['@id'] = b.id, ['@payed'] = 1})
				else
					exports.ghmattimysql:execute('UPDATE storages SET money = @money, prepay = now(), payed = @payed WHERE id = @id', {['@id'] = b.id, ['@money'] = b.money, ['@payed'] = 0})
				end
			end
		end)
		Citizen.Wait(2000)
		exports.ghmattimysql:execute("SELECT * FROM `storages`", {}, function(result)
			if result ~= nil then
				storageData = result
			else
				storageData = {}
			end
		end)
		exports.ghmattimysql:execute("SELECT * FROM `bank_users`", {}, function(result)
			if result ~= nil then
				bankData = result
			else
				bankData = {}
			end
		end)
	end
end)


RegisterServerEvent('gum_storage:borrowMoney')
AddEventHandler('gum_storage:borrowMoney', function(bankId, howMuch, city)
	local _source = source
	local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	local firstname = Character.firstname
	local lastname = Character.lastname
	local borrow = (howMuch/100*30)+howMuch
	local borrowMoney = borrow/100*5
	for a,b in pairs(bankData) do
		if tonumber(charid) == tonumber(b.charidentifier) then
			if b.borrow > 0 then
				TriggerClientEvent("gum_notify:notify", _source, "Bank", "You can only have one active loan.", "money", 1500)
				return false
			end
		end
	end
	Character.addCurrency(_source, 0, howMuch)
	exports.ghmattimysql:execute("UPDATE bank_users SET borrow=@borrow,borrow_pay=now(),borrow_money=@borrow_money WHERE id=@id", {["id"]=bankId, ["borrow"]=borrow, ["borrow_money"]=borrowMoney},
	function (result)
		exports.ghmattimysql:execute("SELECT * FROM `bank_users`", {}, function(result)
			if result ~= nil then
				bankData = result
				TriggerClientEvent("gum_storage:updateBank", _source, bankData, charid, city, firstname, lastname)
			else
				bankData = {}
			end
		end)
	end)
end)

RegisterServerEvent('gum_storage:payBorrow')
AddEventHandler('gum_storage:payBorrow', function()
	local _source = source
	local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	local firstname = Character.firstname
	local lastname = Character.lastname
	local money = Character.money
	for a,b in pairs(bankData) do
		if tonumber(charid) == tonumber(b.charidentifier) then
			if b.borrow > 0 then
				exports.ghmattimysql:execute('SELECT borrow_pay,id FROM bank_users WHERE borrow_pay < now() - interval 1 DAY and id=@id' , {['id']=b.id}, function(result)
					if result[1] ~= nil then
						Character.removeCurrency(_source, 0, b.borrow_money)
						b.borrow = b.borrow-b.borrow_money
						if b.borrow <= 0 then
							exports.ghmattimysql:execute("UPDATE bank_users SET borrow=@borrow,borrow_money=@borrow_money,borrow_pay=now() WHERE id=@id", {["id"]=b.id, ["borrow"]=0, ["borrow_money"]=0},
							function (result)
							end)
						else
							exports.ghmattimysql:execute("UPDATE bank_users SET borrow=@borrow,borrow_pay=now() WHERE id=@id", {["id"]=b.id, ["borrow"]=b.borrow},
							function (result)
							end)
						end
					end
				end)
			end
		end
	end
end)


RegisterServerEvent('gum_storage:openStorageCreator')
AddEventHandler('gum_storage:openStorageCreator', function()
	local _source = source
	local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local job = Character.job
	for k,v in pairs(Config.Jobs) do
		if job == v then
			TriggerClientEvent("gum_storage:openCreator", _source, storageData, 0)
		end
	end
end)


RegisterServerEvent('gum_storage:openStorage')
AddEventHandler('gum_storage:openStorage', function(city)
	local _source = source
	local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	TriggerClientEvent("gum_storage:openStorage", _source, storageData, charid, city)
end)

RegisterServerEvent('gum_storage:openBank')
AddEventHandler('gum_storage:openBank', function(city)
	local _source = source
	local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	local firstname = Character.firstname
	local lastname = Character.lastname
	TriggerClientEvent("gum_storage:openBank", _source, bankData, charid, city, firstname, lastname)
end)

RegisterServerEvent('gum_storage:addUserToShared')
AddEventHandler('gum_storage:addUserToShared', function(storageId, targetId)
	local _source = source
	local _target = targetId
	local User = gumCore.getUser(_target)
	if User ~= nil then
		local Character = User.getUsedCharacter
		local charid = Character.charIdentifier
		local firstname = Character.firstname
		local lastname = Character.lastname
		for a,b in pairs(storageData) do
			if tonumber(b.id) == tonumber(storageId) then
				local shared = json.decode(b.shared)
				table.insert(shared, {charid=charid, firstname=firstname, lastname=lastname})
				exports.ghmattimysql:execute("UPDATE `storages` SET `shared` = @shared WHERE `id` = @id", {['@shared'] = json.encode(shared), ['@id'] = storageId})
				b.shared = json.encode(shared)
				TriggerClientEvent("gum_storage:updateSharedTable", _source, b.shared, storageId)
			end
		end
	end
end)

RegisterServerEvent('gum_storage:removeUserFromShared')
AddEventHandler('gum_storage:removeUserFromShared', function(storageId, charid)
	local _source = source
	for a,b in pairs(storageData) do
		if tonumber(b.id) == tonumber(storageId) then
			local shared = json.decode(b.shared)
			for c,d in pairs(shared) do
				if tonumber(d.charid) == tonumber(charid) then
					table.remove(shared, c)
				end
			end
			exports.ghmattimysql:execute("UPDATE `storages` SET `shared` = @shared WHERE `id` = @id", {['@shared'] = json.encode(shared), ['@id'] = storageId})
			b.shared = json.encode(shared)
			TriggerClientEvent("gum_storage:updateSharedTable", _source, b.shared, storageId)
		end
	end
end)

RegisterServerEvent('gum_storage:prepayStorage')
AddEventHandler('gum_storage:prepayStorage', function(storageId, howMuch)
	local _source = source
	local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	local money = Character.money
	if howMuch <= money then
		Character.removeCurrency(_source, 0, howMuch)
		for a,b in pairs(storageData) do
			if tonumber(b.id) == tonumber(storageId) then
				b.money = b.money+howMuch
				exports.ghmattimysql:execute("UPDATE `storages` SET `money` = @money WHERE `id` = @id", {['@money'] = b.money, ['@id'] = storageId})
				TriggerClientEvent("gum_storage:updateStoragePrepare", _source, storageData, charid)
			end
		end
	end
end)

RegisterServerEvent('gum_storage:renameThisBank')
AddEventHandler('gum_storage:renameThisBank', function(bankId, newName, city)
	local _source = source
	local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	local firstname = Character.firstname
	local lastname = Character.lastname
	for a,b in pairs(bankData) do
		if tonumber(b.id) == tonumber(bankId) then
			exports.ghmattimysql:execute("UPDATE `bank_users` SET `identifier` = @identifier WHERE `id` = @id", {['@identifier'] = newName, ['@id'] = bankId})
			b.identifier = newName
			TriggerClientEvent("gum_storage:updateBank", _source, bankData, charid, city, firstname, lastname)
		end
	end
end)

RegisterServerEvent('gum_storage:editMoney')
AddEventHandler('gum_storage:editMoney', function(bankId, howMuch, what, city)
	local _source = source
	local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	local firstname = Character.firstname
	local lastname = Character.lastname
	local money = Character.money
	if what == "add" then
		if tonumber(howMuch) <= money then
			for a,b in pairs(bankData) do
				if tonumber(b.id) == tonumber(bankId) then
					b.money = b.money+tonumber(howMuch)-tonumber(howMuch)/100*3
					Character.removeCurrency(_source, 0, tonumber(howMuch))

					exports.ghmattimysql:execute("UPDATE `bank_users` SET `money` = @money WHERE `id` = @id", {['@money'] = b.money, ['@id'] = bankId})
					TriggerClientEvent("gum_storage:updateBank", _source, bankData, charid, city, firstname, lastname)
				end
			end
		end
	else
		for a,b in pairs(bankData) do
			if tonumber(b.id) == tonumber(bankId) then
				if tonumber(b.money) >= tonumber(howMuch) then
					b.money = b.money-tonumber(howMuch)
					Character.addCurrency(_source, 0, tonumber(howMuch)-tonumber(howMuch)/100*3)
					exports.ghmattimysql:execute("UPDATE `bank_users` SET `money` = @money WHERE `id` = @id", {['@money'] = b.money, ['@id'] = bankId})
					TriggerClientEvent("gum_storage:updateBank", _source, bankData, charid, city, firstname, lastname)
				end
			end
		end
	end
end)

RegisterServerEvent('gum_storage:createNew')
AddEventHandler('gum_storage:createNew', function(city, name)
	local _source = source
	local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	exports.ghmattimysql:execute("INSERT INTO `bank_users` (`charidentifier`, `identifier`, `name`) VALUES (@charidentifier, @identifier, @name)", {['@identifier'] = name, ['@charidentifier'] = charid, ['@name'] = city})
	Citizen.Wait(1000)
	exports.ghmattimysql:execute("SELECT * FROM `bank_users`", {}, function(result)
		if result ~= nil then
			bankData = result
		else
			bankData = {}
		end
	end)
end)

RegisterServerEvent('gum_storage:editGold')
AddEventHandler('gum_storage:editGold', function(bankId, howMuch, what, city)
	local _source = source
	local User = gumCore.getUser(_source)
	local Character = User.getUsedCharacter
	local charid = Character.charIdentifier
	local firstname = Character.firstname
	local lastname = Character.lastname
	local money = Character.gold

	if what == "add" then
		if tonumber(howMuch) <= money then
			for a,b in pairs(bankData) do
				if tonumber(b.id) == tonumber(bankId) then
					b.gold = b.gold+tonumber(howMuch)
					Character.removeCurrency(_source, 0, tonumber(howMuch))

					exports.ghmattimysql:execute("UPDATE `bank_users` SET `gold` = @gold WHERE `id` = @id", {['@gold'] = b.gold, ['@id'] = bankId})
					TriggerClientEvent("gum_storage:updateBank", _source, bankData, charid, city, firstname, lastname)
				end
			end
		end
	else
		for a,b in pairs(bankData) do
			if tonumber(b.id) == tonumber(bankId) then
				if b.gold >= tonumber(howMuch) then
					b.gold = b.gold-tonumber(howMuch)
					Character.addCurrency(_source, 0, tonumber(howMuch))
					exports.ghmattimysql:execute("UPDATE `bank_users` SET `gold` = @gold WHERE `id` = @id", {['@gold'] = b.gold, ['@id'] = bankId})
					TriggerClientEvent("gum_storage:updateBank", _source, bankData, charid, city, firstname, lastname)
				end
			end
		end
	end
end)


RegisterServerEvent('gum_storage:addUserToSharedBank')
AddEventHandler('gum_storage:addUserToSharedBank', function(bankId, targetId)
	local _source = source
	local _target = targetId
	local User = gumCore.getUser(_target)
	if User ~= nil then
		local Character = User.getUsedCharacter
		local charid = Character.charIdentifier
		local firstname = Character.firstname
		local lastname = Character.lastname
		for a,b in pairs(bankData) do
			if tonumber(b.id) == tonumber(bankId) then
				local shared = json.decode(b.shared)
				table.insert(shared, {charid=charid, firstname=firstname, lastname=lastname})
				exports.ghmattimysql:execute("UPDATE `bank_users` SET `shared` = @shared WHERE `id` = @id", {['@shared'] = json.encode(shared), ['@id'] = bankId})
				b.shared = json.encode(shared)
				TriggerClientEvent("gum_storage:updateSharedBankTable", _source, b.shared, bankId)
			end
		end
	end
end)

RegisterServerEvent('gum_storage:removeUserFromSharedBank')
AddEventHandler('gum_storage:removeUserFromSharedBank', function(bankId, charid)
	local _source = source
	for a,b in pairs(bankData) do
		if tonumber(b.id) == tonumber(bankId) then
			local shared = json.decode(b.shared)
			for c,d in pairs(shared) do
				if tonumber(d.charid) == tonumber(charid) then
					table.remove(shared, c)
				end
			end
			exports.ghmattimysql:execute("UPDATE `bank_users` SET `shared` = @shared WHERE `id` = @id", {['@shared'] = json.encode(shared), ['@id'] = bankId})
			b.shared = json.encode(shared)
			TriggerClientEvent("gum_storage:updateSharedBankTable", _source, b.shared, bankId)
		end
	end
end)


RegisterServerEvent('gum_storage:createStorage')
AddEventHandler('gum_storage:createStorage', function(name, charid, city, upgrade)
	exports.ghmattimysql:execute("INSERT INTO `storages` (`charid`, `name`, `city`, `upgrade`, `prepay`) VALUES (@charid, @name, @city, @upgrade, CURRENT_TIMESTAMP())", 
		{
			['@name'] = name,
			['@charid'] = charid,
			['@city'] = city,
			['@upgrade'] = upgrade,
		}
	)
	Citizen.Wait(1000)
	exports.ghmattimysql:execute("SELECT * FROM `storages`", {}, function(result)
		if result ~= nil then
			storageData = result
		else
			storageData = {}
		end
	end)
end)
