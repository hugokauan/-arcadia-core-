-- Resource Metadata
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA ANIMATIONS'
version '1.0.0'

-- What to run
client_scripts {
    'client.lua',
    '@ARCADIACORE/lib/functions.lua',
    'bancos/bancos.lua'
}
server_scripts {
    'server.lua',
    '@ARCADIACORE/lib/functions.lua',
    '@oxmysql/lib/MySQL.lua',
    'bancos/bancos.lua'
}


dependencies {
    'oxmysql',
    'ARCADIACORE'
}