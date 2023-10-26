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
    local playerPed
    local playerCoords
    local distancia
    local marker
    local idle = 0
    while true do
        playerPed = PlayerPedId()
        playerCoords = GetEntityCoords(playerPed)
        for k,v in pairs(bancos) do 
            marker = vector3(v.x,v.y,v.z)
            distancia = #(playerCoords-marker)
            if distancia <= 7 then
                idle = 0
                if distancia <= 1 then
                    if IsControlJustReleased(0, 46) then
                        TriggerServerEvent('arcadia:startroubo',playerPed,v.type,k)
                    end
                else
                    if distancia > 1 and distancia <= 5  then
                        if IsControlJustReleased(0, 46) then
                            TriggerEvent('ARCADIACLIENT:NOTIFICACAO', "Você está muito distante do " .. v.type)
                        end
                    end
                end
            else
                idle = 50
            end
        end
        Citizen.Wait(idle)
    end
end)

Citizen.CreateThread(function()
    local playerPed
    local marker
    local playerCoords
    local distancia
    local idle = 0
    while true do
        playerPed = PlayerPedId()
        playerCoords = GetEntityCoords(playerPed)
        for k,v in pairs(bancos) do
            marker = vector3(v.x,v.y,v.z)
            distancia = #(playerCoords-marker)
            if distancia <= 5 then
                DrawMarker(27, v.x, v.y, v.z-0.99, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 0, 0, 255, false, false, 0, false, nil, nil, 0)
                idle = 0
            else
                idle = 100
            end
        end
        Citizen.Wait(idle)
    end
end)