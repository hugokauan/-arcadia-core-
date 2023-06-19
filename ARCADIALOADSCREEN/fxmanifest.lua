-- Resource Metadata
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA ANIMATIONS'
version '1.0.0'

-- What to run
loadscreen 'arcadia.html'

loadscreen_cursor 'yes'

files {
    'arcadia.html',
    'arcadia.css',
    'assets/**/*.*',
    'assets/*.*'
}
client_script 'client.lua'

server_script 'server.lua'


