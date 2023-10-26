--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        ARCADIA.getCars(1)
    end
end)]]


RegisterNetEvent('arcadia:getCars')
AddEventHandler('arcadia:getCars', function()
    local source = source
    local id = tonumber(ARCADIA.getPlayerId(source))
    local c = ARCADIA.getCars(id)
    print(c)
    TriggerClientEvent('arcadia:receiveCars', -1,c)
end)