-- Resource Metadata
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA BARBERSHOP'
version '1.0.0'

-- What to run
client_script {
    'client.lua',
    '@ARCADIACORE/lib/functions.lua',
    '@ARCADIACORE/lib/events_C.lua',
    'data/config.lua'
}
server_script {
    '@oxmysql/lib/MySQL.lua',
    'server.lua',
    '@ARCADIACORE/lib/functions.lua',
    '@ARCADIACORE/lib/events_S.lua',
    'data/config.lua'
}

shared_scripts {'@ARCADIACORE/lib/imports.lua'}

dependencies {'oxmysql','ARCADIACORE'}