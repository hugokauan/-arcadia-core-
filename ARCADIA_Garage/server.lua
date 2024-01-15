RegisterNetEvent('arcadia:getCars')
AddEventHandler('arcadia:getCars', function()
    local source = source
    local id = tonumber(ARCADIA.getPlayerId(source))
    local c = ARCADIA.getCars(id)
    print(c)
    TriggerClientEvent('arcadia:receiveCars', -1,c)
end)