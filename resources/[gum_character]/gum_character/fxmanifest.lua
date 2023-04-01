fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"
exports {
	'loading',
}
client_scripts {
    'locale.lua',
    'lang/*.lua',
	'full_database.lua',
	'config.lua',
	'client.lua',
	'client_select.lua',
}

server_scripts {
	'full_database.lua',
	'config.lua',
	'server.lua',
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
