fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"
author "gum"
exports {
	'loading',
}
client_scripts {
	'cfg/config.lua',
	'cfg/full_database.lua',
	'client/client.lua',
}

server_scripts {
	'cfg/full_database.lua',
	'server/server.lua',
}
ui_page 'html/index.html'

files {
	'html/*',
}
