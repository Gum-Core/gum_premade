fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"
author "gum"
exports {
	'loading',
}
client_scripts {
	'cfg/full_database.lua',
	'cfg/config.lua',
	'client/client.lua',
	'client/client_select.lua',
}

server_scripts {
	'cfg/full_database.lua',
	'cfg/config.lua',
	'server/server.lua',
}
ui_page 'html/index.html'

files {
	'html/crock.ttf',
    'html/text.ttf',
    'html/kaola.ttf',
    'html/index.html',
    'html/index.css',
    'html/index.js',
    'html/select_char.png',
    'html/sbutton.png',
    'html/char_b.png',
    'html/char_bs.png',
	'html/r_arrow.png',
    'html/ar_arrow.png',
    'html/button.png',
    'html/screen.jpg',
}

export 'getMaleFromLang'
