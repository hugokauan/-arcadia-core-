-- Resource Metadata
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA ANIMATIONS'
version '1.0.0'

--shared_scripts {'@ARCADIACORE/lib/imports.lua'}

-- What to run
client_script {'client.lua','@ARCADIACORE/lib/functions.lua','@ARCADIACORE/lib/groups.lua'}
server_script {'server.lua','@ARCADIACORE/lib/functions.lua', '@oxmysql/lib/MySQL.lua','@ARCADIACORE/lib/groups.lua'}

dependencies {
    'ARCADIACORE'
    


}
