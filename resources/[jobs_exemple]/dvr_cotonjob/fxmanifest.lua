fx_version "adamant"

games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

ui_page "index.html"

files({
	"index.html",
	'cloche.mp3'
})

server_scripts {
	'server/*.lua'
}

client_scripts {
	'client/*.lua',
}


