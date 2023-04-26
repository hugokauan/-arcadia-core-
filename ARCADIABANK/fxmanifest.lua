-- Resource Metadata
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA ANIMATIONS'
version '1.0.0'

shared_scripts {'lib/imports.lua'}

-- What to run
client_script {'client.lua','@ARCADIACORE/lib/functions.lua','ui/nui.lua','bancos.lua'}
server_script {
    'server.lua',
    '@ARCADIACORE/lib/functions.lua',
    '@oxmysql/lib/MySQL.lua'
}


ui_page "ui/index.html"

files {
    "ui/index.html",
    "ui/index.css",
    "ui/reset.css",
    "ui/pricedown_bl.otf",
    "ui/index.js"
}

dependencies {
    'oxmysql',
    'ARCADIACORE'
}