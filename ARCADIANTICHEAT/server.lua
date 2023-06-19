RegisterNetEvent('arcadia:senddiscordmessage')
AddEventHandler('arcadia:senddiscordmessage', function(wh,msg)
    ARCADIA.sendwebhookmessage(wh,msg)
end)

RegisterNetEvent('anticheat:logger')
AddEventHandler('anticheat:logger', function (wh,msg)
    local playerSrc = source
    local id = ARCADIA.getPlayerId(playerSrc)
    local data = os.date("%c")
    ARCADIA.sendwebhookmessage(wh,"```yaml\n[O player id: " .. tostring(id) .. msg .. "] \n[Na data: ".. tostring(data).."]```")
end)