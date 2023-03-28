-- Resource Metadata
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA ANIMATIONS'
version '1.0.0'

-- What to run
client_scripts {'client.lua','config.lua','@ARCADIACORE/lib/functions.lua','@ARCADIACORE/lib/events.lua'}
server_scripts {'server.lua','config.lua','@ARCADIACORE/lib/functions.lua','@ARCADIACORE/lib/events.lua'}


dependencies {'ARCADIACORE'}
lua54 'yes'