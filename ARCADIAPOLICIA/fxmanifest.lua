-- Resource Metadata
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA ANIMATIONS'
version '1.0.0'

-- What to run
client_script {
    'client.lua',
    '@ARCADIACORE/lib/functions.lua',
    'config.lua',
    '@ARCADIACORE/lib/events_C.lua'
}
server_script {
    '@oxmysql/lib/MySQL.lua',
    'server.lua',
    'config.lua',
    '@ARCADIACORE/lib/functions.lua',
    '@ARCADIACORE/lib/events_S.lua'
}

files {
    'ui/ui.css',
    'ui/ui.js',
    'ui/ui.html'
}

ui_page "ui/ui.html"

dependencies {'oxmysql'}