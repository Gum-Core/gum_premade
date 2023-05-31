
-- local gum
-- TriggerEvent("getApi",function(gumApi)
--     gum = gumApi
-- end)

exports('gumApi',function()
    local self = {}
    self.getTarget = function()
		return gumApi.getTarget()
	end
	self.getPromptButtonData = function(promptHash, text)
		return gumApi.getPromptButtonData(x, y, z, dist, mark)
	end
    self.getPrompt = function(promptHash, text)
		gumApi.getPrompt(promptHash, text)
	end
    self.drawMe = function(x, y, z, text, dist, marker)
		gumApi.drawMe(x, y, z, text, dist, marker)
	end
    self.createPrompt = function(text, key, promptHash, holdMode)
		gumApi.createPrompt(text, key, promptHash, holdMode)
	end
    self.getPromptButton = function(text, promptHash, hold)
		return gumApi.getPromptButton(text, promptHash, hold)
	end
    self.playerNearCoords = function(x, y, z, dist, mark)
		return gumApi.playerNearCoords(x, y, z, dist, mark)
	end
    self.checkPlayersNearEntity = function(entity, distance)
		return gumApi.checkPlayersNearEntity(entity, distance)
	end
    self.createPed = function(model,x,y,z,h,dist,scenario)
        gumApi.createPed(model,x,y,z,h,dist,scenario)
    end
	self.getLastPed = function()
		return gumApi.getLastPed()
	end
	self.createBlip = function(text, x, y, z, sprite)
		gumApi.createBlip(text, x, y, z, sprite)
	end
	self.notify = function(title, text, time, img)
		gumApi.notify(title, text, time, img)
	end
	self.createVehicle = function(model, x, y, z, h)
		gumApi.createVehicle(model, x, y, z, h)
	end
    self.getLastVehicle = function()
		return gumApi.getLastVehicle()
	end
	self.getAllPeds = function()
		return gumApi.getAllPeds()
	end
	self.getAllEntities = function()
		return gumApi.getAllEntities()
	end
	self.getAllVehicles = function()
		return gumApi.getAllVehicles()
	end
	self.playAnim = function(entity, dict, anim, flag, time)
		gumApi.playAnim(entity, dict, anim, flag, time)
	end
	self.deleteObj = function(obj)
		gumApi.deleteObj(obj)
	end
	self.groundCheck = function(x, y)
		return gumApi.groundCheck(x, y)
	end
	self.getTime = function()
		return gumApi.getTime()
	end
    return self
end)