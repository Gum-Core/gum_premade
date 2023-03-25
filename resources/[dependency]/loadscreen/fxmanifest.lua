fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game 'rdr3'
lua54 'yes'

author 'Bytesizd'
description 'Customizable loadscreen'
loadscreen_manual_shutdown "yes"

server_script {
    'server.lua'
}

files {
    'client.lua',
    'ui/index.html',
    'ui/vendor/vue.js',
    'ui/vendor/vue-youtube/vue-youtube.js',
    'ui/*',
    'ui/assets/*',
    'ui/assets/fonts/*',
    'ui/assets/styles/*',
    'config.js'
}


loadscreen 'ui/index.html'
ui_page 'ui/index.html'

loadscreen_cursor 'yes'

version '1.1.0'

resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
