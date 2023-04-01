fx_version 'adamant'

game 'rdr3'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

files {
  'config.lua'
}

client_scripts {
  'locale.lua',
  'lang/*.lua',
  "@uiprompt/uiprompt.lua",
  'config.lua',
  'client.lua',
}

shared_scripts {
  "cfg/weapons.lua",
}

server_exports{'gum_inventoryApi'} 

server_scripts {
  'locale.lua',
  'lang/*.lua',
  'config.lua',
  'gumInventoryAPI.lua',
  'server.lua',
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
