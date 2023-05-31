Config = {}

Config.Framework = "GUM"
--GUM, VORP, REDEM, REDEMREBOOT, CUSTOM

-- If you use CUSTOM framework, open serverData/serverCompCustom.lua
-- And change natives for function

if Config.Framework == "GUM" then
    Config.FolderWithIcons = "gum_inventory/html/images/items/"
elseif Config.Framework == "VORP" then
    Config.FolderWithIcons = "vorp_inventory/html/img/items/"
elseif Config.Framework == "REDEM" then
    Config.FolderWithIcons = "redemrp_inventory/html/items/"
elseif Config.Framework == "REDEMREBOOT" then
    Config.FolderWithIcons = "redemrp_inventory/html/items/"
else
    Config.FolderWithIcons = "custom/traceToInventoryIcons/Items/"
end

--Discord hook language
Config.Language = {
    [1] = "**Info**",
    [2] = "**Name**",
    [3] = "**CharID** : ",
    [4] = "**Steam** : ",
    [5] = "**Firstname** : ",
    [6] = "**Lastname** : "
}