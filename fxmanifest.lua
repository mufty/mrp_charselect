fx_version 'cerulean'
game 'gta5'

author 'mufty'
description 'MRP Character select'
version '0.0.1'

ui_page 'html/index.html'

dependencies {
    "mrp_core"
}

files {
    'html/fonts/gobold-regular.otf',
    'html/config.js',
    'html/scripts/main.js',
    'html/styles/style.css',
    'html/index.html',
}

client_scripts {
    'NativeUI/NativeUI.lua',
    'config.lua',
    'client/client.lua',
    'client/client.js',
}
