local send_value = nil
local answer_value = nil

RegisterNetEvent('guminputs:getInput')
AddEventHandler('guminputs:getInput', function(title, subtext, cb)
	local transfer_value = nil
	SetNuiFocus(true, true);
	SendNUIMessage({type= "open_inputs", status = true, title = subtext, subtext = title})
	while (send_value == nil) do
		Citizen.Wait(0)
	end
	SendNUIMessage({type= "open_inputs", status = false})
	SetNuiFocus(false, false);
	transfer_value = send_value;
	send_value = nil
	cb(transfer_value)
end)

RegisterNetEvent('guminputs:getAnswer')
AddEventHandler('guminputs:getAnswer', function(title, first, second, cb)
	SetNuiFocus(true, true);
	SendNUIMessage({type= "open_answer", status = true, title = title, first=first, second=second})
	while (answer_value == nil) do
		Citizen.Wait(0)
	end
	SendNUIMessage({type= "open_answer", status = false})
	SetNuiFocus(false, false);
	transfer_ans_value = answer_value;
	answer_value = nil
	cb(transfer_ans_value)
end)

RegisterCommand("test", function()
	TriggerEvent("guminputs:getInput", "TEST", "TESTED", function(cb)
		local input = cb
		if input ~= 'close' then
			print(input)
		end
	end)
end)

RegisterCommand("test2", function()
	TriggerEvent("guminputs:getAnswer", "Are you OK", "Yes", "No", function(cb)
		local input = cb
		if input == true then
			print("YES")
			print("ALL IS OK")
			print("WORK GOOD")
			return true
		else
			print("STOP")
			print("DONT GO MORE")
			return false
		end
		print("TEST WORK")
	end)
end)

RegisterNUICallback('button_1', function(data, cb)
	send_value = "close"
end)

RegisterNUICallback('button_2', function(data, cb)
	send_value = data.text
end)

RegisterNUICallback('yes', function(data, cb)
	answer_value = true
end)
RegisterNUICallback('no', function(data, cb)
	answer_value = false
end)

