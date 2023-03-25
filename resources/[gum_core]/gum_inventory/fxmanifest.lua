fx_version 'adamant'
game 'rdr3'
author "gum"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

files {
  'cfg/config.lua'
}

client_scripts {
  "@uiprompt/uiprompt.lua",
  'cfg/config.lua',
  'client/client.lua',
}
shared_scripts {
  "cfg/weapons.lua",
}
server_exports{'gum_inventoryApi'} 

server_scripts {
  'cfg/config.lua',
  'gumInventoryAPI.lua',
  'server/server.lua',
}
ui_page 'html/index.html'

files {
  'html/index.js',
  'html/config.js',
  'html/index.css',
  'html/index.html',
  'html/crock.ttf',
  'html/animation.min.css',
  'html/images/*.png',
  'html/images/filter/*.png',
  'html/images/items/*.png',
  'html/images/clothe/*.png',
}
