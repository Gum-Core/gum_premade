fx_version "adamant"

games { 'rdr3' }

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

-- UI
ui_page "ui/index.html"
files {
	"ui/index.html",
	"ui/script.js",
	"ui/style.css",
	"ui/crock.ttf",
	"ui/health.png",
	"ui/stamina.png",
	"ui/hunger.png",
	"ui/compas.png",
	"ui/alcohol.png",
	"ui/thirst.png",
	"ui/temp.png",
	"ui/microphone_active.png",
	"ui/microphone_inactive.png",
	"ui/horse_health.png",
	"ui/horse_stamina.png",
	"ui/progress.png",
}

-- Client Scripts
client_scripts {
	"client/client.lua",
}
server_scripts {
	"server/server.lua",
}