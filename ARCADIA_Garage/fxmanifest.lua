-- Resource Metadata
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA GARAGE'
version '1.0.0'

files {
        'ui/*.lua',
        'ui/*.css',
        'ui/*.html',
        'ui/*.php',
        'ui/*.js'
}

ui_page "ui/index.html"

-- What to run
client_script { 
                'client.lua',
                '@ARCADIACORE/lib/functions.lua',
                '@ARCADIACORE/lib/groups.lua',
                'ui/nui.lua',
                'ui/garagens.lua'
}
server_script {
                'server.lua',
                '@ARCADIACORE/lib/functions.lua',
                '@oxmysql/lib/MySQL.lua',
                '@ARCADIACORE/lib/groups.lua'
}

dependencies {
    'ARCADIACORE',
    'oxmysql'
}
