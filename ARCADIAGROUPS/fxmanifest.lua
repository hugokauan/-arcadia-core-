-- Resource Metadata
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA GROUPS'
version '1.0.0'

-- What to run
client_scripts {'client.lua'--'config.lua','@ARCADIACORE/lib/functions.lua','@ARCADIACORE/lib/events.lua'
}

server_scripts {'server.lua',
                --'config.lua',
                '@ARCADIACORE/lib/functions.lua',
                '@ARCADIACORE/lib/events.lua',
                '@oxmysql/lib/MySQL.lua'
}

dependencies {'ARCADIACORE','oxmysql'}

