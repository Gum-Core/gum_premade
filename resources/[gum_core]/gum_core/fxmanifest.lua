fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"
author "gum"
shared_script "cfg/shared.lua"
client_scripts {
	'cfg/config.lua',
	'client/client.lua',
}

server_scripts {
	'cfg/config.lua',
	'gumcore_luapi.lua',
	'server/server.lua',
}
server_exports {'gumAPI'}
