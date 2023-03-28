
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA MISCELÂNIA'
version '1.0.0'

client_scripts {'client.lua','@ARCADIACORE/lib/functions.lua'}
server_scripts {
                'server.lua',
                '@ARCADIACORE/lib/functions.lua',
                '@ARCADIACORE/lib/groups.lua',
                '@oxmysql/lib/MySQL.lua'
}

dependencies {'ARCADIACORE','oxmysql'}