--[[CLIENT EVENTS]]
RegisterNetEvent('REGISTERCLOTHES')
AddEventHandler('REGISTERCLOTHES',function()
    local clothes = ARCADIA.getOutfit()
    TriggerServerEvent('REGISTERCLOTHES_S', clothes)
end)

RegisterNetEvent('SETCLOTHES')
AddEventHandler('SETCLOTHES',function(cId,drawable,texture)
    SetPedComponentVariation(PlayerPedId(),cId,drawable,texture,0)
end)
