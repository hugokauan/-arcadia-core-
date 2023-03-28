-- Resource Metadata
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA LOGIN'
version '1.0.0'

-- What to run
client_scripts {'client.lua','@ARCADIACORE/lib/functions.lua'}
server_script {'server.lua','@oxmysql/lib/MySQL.lua','@ARCADIACORE/lib/functions.lua'}

dependencies {'mysql-async'}
