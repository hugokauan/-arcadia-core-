-- Resource Metadata
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA CORE'
version '1.0.0'

-- What to run
client_scripts {
    'lib/functions.lua',
    'lib/events.lua',
    'client.lua',
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'lib/functions.lua',
    'lib/events.lua',
    'server.lua',
}

files {'config.lua'}

dependencies {'oxmysql'}
