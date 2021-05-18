fx_version 'cerulean'
game 'gta5'

author 'mufty'
description 'MRP Character select'
version '0.0.1'

client_scripts {
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",

    "RageUI/components/Audio.lua",
    "RageUI/components/Enum.lua",
    "RageUI/components/Keys.lua",
    "RageUI/components/Rectangle.lua",
    "RageUI/components/Sprite.lua",
    "RageUI/components/Text.lua",
    "RageUI/components/Visual.lua",

    "RageUI/menu/elements/ItemsBadge.lua",
    "RageUI/menu/elements/ItemsColour.lua",
    "RageUI/menu/elements/PanelColour.lua",

    "RageUI/menu/items/UIButton.lua",
    "RageUI/menu/items/UIList.lua",
    'config.lua',
    'client/client.lua',
    'client/client.js',
}

server_scripts {
    'config.lua',
    'server/server.lua',
}
