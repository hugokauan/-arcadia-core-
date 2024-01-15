-- Resource Metadata
fx_version 'cerulean'
game'gta5' 

author 'Carvalho'
description 'ARCADIA INDENTITY'
version '1.0.0'

shared_scripts {'@ARCADIACORE/lib/imports.lua'}

-- What to run
client_script {
    'client.lua',
    '@ARCADIACORE/lib/functions.lua',
    'nui/nui.lua',
}
server_script {
    'server.lua',
    '@ARCADIACORE/lib/functions.lua',
    '@oxmysql/lib/MySQL.lua'
}


ui_page "nui/nui.html"

files {
    "nui/*"
}

dependencies {
    'oxmysql',
    'ARCADIACORE'
}