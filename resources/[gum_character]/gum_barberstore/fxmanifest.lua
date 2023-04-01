fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"
exports {
	'loading',
}

client_scripts {
	'locale.lua',
	'lang/*.lua',
	'config.lua',
	'full_database.lua',
	'client.lua',
}

server_scripts {
	'full_database.lua',
	'server.lua',
}

ui_page 'html/index.html'

files {
	'html/*',
}
