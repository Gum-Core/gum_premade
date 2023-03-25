fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

framework "Gum"
ui_page "html/shop.html"
files{
	'html/shop.html',
	'html/css/*.ttf',
	'html/*.png',
	'html/js/*.js',
	'html/css/*.css',
	'html/css/*.png',
}

client_scripts {
	'config.lua',
	'client/cl_main.lua',
}

server_scripts {
	'config.lua',
	'server/items.lua',
	'server/sv_main.lua',
}