AddEventHandler('arcadia:senddiscordmessage', function(wh,message)
    local msg = message
    local webhook = wh
    enviarMsgDiscordWh(webhook,msg)
end)