-- Resource Metadata
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA TESTE'
version '1.0.0'

-- What to run
client_script {
    'client.lua',
    '@ARCADIACORE/lib/functions.lua',
    '@ARCADIACORE/lib/events.lua'
}
server_script {
    '@oxmysql/lib/MySQL.lua',
    'server.lua',
    '@ARCADIACORE/lib/functions.lua',
    '@ARCADIACORE/lib/events.lua'
}

dependencies {'oxmysql','ARCADIACORE'}