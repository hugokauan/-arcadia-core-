-- Resource Metadata
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA CORE'
version '1.0.0'

files {'lib/imports.lua','config.lua'}

-- What to run
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'lib/functions.lua',
    'lib/events.lua',
    'lib/groups.lua',
    'server.lua'
}

client_scripts {
    'lib/functions.lua',
    'lib/events.lua',
    'lib/groups.lua',
    'client.lua'
}


dependencies {'oxmysql'}
