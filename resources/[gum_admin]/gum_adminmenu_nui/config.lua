Config = {}
Config.OneSync = true

Config.Permissions = {
    admin = {
        supportSys=true,--Support system
        playerList=true,--Player list
        itemList=true,--Item list
        noClip=true,--No clip
        tpw=true,--Teleport to waypoint
        tpc=true,--Teleport to coords
        tpb=true,--Teleport back
        bringPlayer=true,--Bring player
        giveItem=true,--Give item
        giveMoney=true,--Give money
        giveWeapon=true,--Give weapon
        giveGold=true,--Give gold
        announce=true,--Announce text
        changePed=true,--Change to ped
        allowlist=true,--Add whitelist
        setChar=true,--Set count char
        setGroup=true,--Set group
        setJob=true,--Set job
        kickPlayer=true,--Kick player
        banPlayer=true,--Ban player
        delChar=true,--Delete char
        teleportPlayer=true,--Teleport on player
        spectate=true,--Spectate
    },
    moderator = {
        supportSys=true,--Support system
        playerList=true,--Player list
        itemList=false,--Item list
        noClip=true,--No clip
        tpw=true,--Teleport to waypoint
        tpc=true,--Teleport to coords
        tpb=true,--Teleport back
        bringPlayer=true,--Bring player
        giveItem=false,--Give item
        giveMoney=false,--Give money
        giveWeapon=false,--Give weapon
        giveGold=false,--Give gold
        announce=false,--Announce text
        changePed=true,--Change to ped
        allowlist=true,--Add whitelist
        setChar=false,--Set count char
        setGroup=false,--Set group
        setJob=true,--Set job
        kickPlayer=true,--Kick player
        banPlayer=false,--Ban player
        delChar=false,--Delete char
        teleportPlayer=true,--Teleport on player
        spectate=true,--Spectate
    }
}

