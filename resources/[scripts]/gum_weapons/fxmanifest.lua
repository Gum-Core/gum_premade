fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"

client_scripts {
    'client.lua',
}
server_script {
    'server.lua'
}

shared_scripts {
    'config.lua',
}
ui_page 'html/index.html'

files {
    'html/index.js',
    'html/index.css',
    'html/index.html',
    'html/crock.ttf',
    'html/images/*.png',
    'html/images/MATERIAL_COLOR/*.png',
    'html/images/GRIPSTOCK_ENGRAVING_SHORTARM/*.png',
    'html/images/GRIPSTOCK_ENGRAVING_LONGARM/*.png',
    'html/images/MATERIAL_ENGRAVING_COLOR/*.png',
    'html/images/ENGRAVING/*.png',
    'html/images/BARREL/*.png',
    'html/images/WRAP_COLOR/*.png',
}
