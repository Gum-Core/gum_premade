fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"
author "gum"

client_scripts {
    'cfg/config.lua',
	'client/client.lua',
}
server_scripts {
    'cfg/config.lua',
    'server/server.lua',
}
ui_page 'html/index.html'

files {
    'html/index.js',
    'html/index.css',
    'html/index.html',
    'html/crock.ttf',
    'html/koala.ttf',
    'html/animation.min.css',
    'html/*.png',
    'html/*.gif',
}

