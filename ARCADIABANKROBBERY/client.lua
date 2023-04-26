RegisterNetEvent('arcadia:endroubo')
AddEventHandler('arcadia:endroubo', function(ped)
    local ped = ped
    local animDict = "anim@heists@ornate_bank@grab_cash_heels"
    local animToPlay = "grab"
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(1)
        RequestAnimDict(animDict)
    end
    if HasAnimDictLoaded(animDict) then
        TaskPlayAnim(ped, animDict, animToPlay, 8.0, -8.0, -1, 1, 0, false, false, false)
        Citizen.Wait(5000)
        ClearPedTasksImmediately(ped)
    end
end)

Citizen.CreateThread(function()
    local playerPed = PlayerPedId()
    local idle = 500
    local distancia
    while true do
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        for k,v in pairs(bancos) do 
            distancia = GetDistanceBetweenCoords(x,y,z, v.x, v.y, v.z, false)
            if distancia <= 5 then
                DrawMarker(27, v.x, v.y, v.z-0.99, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 0, 0, 255, false, false, 0, false, nil, nil, 0)
                idle = 0
                if distancia < 1 then
                    if IsControlJustReleased(0, 46) then
                        TriggerServerEvent('arcadia:startroubo',playerPed,v.type)
                    end
                end
            else
                idle = 500
            end
        end
        Citizen.Wait(idle)
    end
end)