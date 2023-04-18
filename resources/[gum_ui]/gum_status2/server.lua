local gumCore = {}
TriggerEvent("getCore",function(core)
	gumCore = core
end)

Inventory = exports.gum_inventory:gum_inventoryApi()
Inventory.RegisterUsableItem("Compass", function(data)
	TriggerClientEvent("gum_status:enable_compass", tonumber(data.source))
end)