RegisterNetEvent('arcadia:senddiscordmessage')
AddEventHandler('arcadia:senddiscordmessage', function(wh,msg)
    sendwebhookmessage(wh,msg)
end)

RegisterNetEvent('anticheat:logger')
AddEventHandler('anticheat:logger', function (wh,msg)
    local playerSrc = source
    local id = getPlayerId(playerSrc)
    local data = os.date("%c")
    sendwebhookmessage(wh,"```yaml\n[O player id: " .. tostring(id) .. msg .. "] \n[Na data: ".. tostring(data).."]```")
end)