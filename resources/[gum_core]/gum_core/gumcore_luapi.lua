
exports('gumAPI',function()
    local self = {}

    self.getCharacter = function(source)
        local timeout = 200 -- 5 seconds
        local user = nil
        TriggerEvent("gum:getCharacter",source,function(result)
            user = result
        end)

        while user == nil and timeout ~= 0 do
            timeout = timeout - 1
            Wait(25)
        end

        if timeout == 0 then
            -- print("gum Core: Callback is nil or not loaded ERROR: Timeout")
        end

        return user
    end

    self.addMoney = function(source,currency,quantity)
        TriggerEvent("gum:addMoney",source, tonumber(currency), tonumber(quantity))
    end

    self.removeMoney = function(source,currency,quantity)
        TriggerEvent("gum:removeMoney",source,tonumber(currency),tonumber(quantity))
    end

    self.setJob = function(source,jobname,grade)
        TriggerEvent("gum:setJob",source,jobname,grade)
    end
    
    self.setGroup = function(source,groupname)
        TriggerEvent("gum:setGroup",source,groupname)
    end

    self.setInstancePlayer = function(source, active)
        TriggerClientEvent("gum:setInstancePlayer",source, active)
    end

    self.addNewCallBack = function(name, fn)
        TriggerEvent("gum:addNewCallBack", name, fn)
    end
    
    return self
end)