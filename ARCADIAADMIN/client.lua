RegisterNetEvent('arcadia:setentityhealth')
AddEventHandler('arcadia:setentityhealth', function ()
    local ped = PlayerPedId()
    SetEntityHealth(ped,200)
end)

RegisterNetEvent('arcadia:teleportTo')
AddEventHandler('arcadia:teleportTo', function(pedSource)
    local pPed = PlayerPedId(source)
    local tPed = PlayerPedId(pedSource)
    local targetPedLocalization = GetEntityCoords(tPed)
    local x,y,z = table.unpack(targetPedLocalization)
    if pPed then
        SetEntityCoords(pPed, x, y, z, 0, 0, 0, false)
        print("teleportado")
    end
end)

RegisterNetEvent('arcadia:teleportWaypoint')
AddEventHandler('arcadia:teleportWaypoint', function()
    ARCADIA.teleportWay()
end)