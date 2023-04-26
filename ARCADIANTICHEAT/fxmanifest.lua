-- Resource Metadata
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA ANIMATIONS'
version '1.0.0'

-- What to run
client_script {'client.lua','@ARCADIACORE/lib/functions.lua','@ARCADIACORE/lib/events.lua'}
server_script {
    'server.lua',
    '@ARCADIACORE/lib/functions.lua',
    '@ARCADIACORE/lib/events.lua',
    '@oxmysql/lib/MySQL.lua',
    }

dependencies {
    'oxmysql',
    'ARCADIACORE'
    }
