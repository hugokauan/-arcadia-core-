RegisterNetEvent('arcadia:startroubo')
AddEventHandler('arcadia:startroubo', function()
    local ped = PlayerPedId()
    local animDict = "anim@heists@fleeca_bank@scope_out@return_wallet"
    local animToPlay = "grab_cash_from_trolly"
    while not HasAnimDictLoaded(animDict) and DoesAnimDictExist(animDict) then
        Citizen.Wait(1)
        RequestAnimDict(animDict)
    end
    if HasAnimDictLoaded(animDict) then
        TaskPlayAnim(ped, animDict, animToPlay, 8.0, 8.0, -1, 2, 0.0, 0, 0, 1)
    end
end)

Citizen.CreateThread(function()
    local playerPosition
    local playerPed = PlayerPedId()
    idle = 500
    local distancia
    while true do
        Citizen.Wait(idle)
        playerPosition = GetEntityCoords(playerPed)
        for k,v in pairs(bancos) do 
            distancia = GetDistanceBetweenCoords(playerPosition, v.x, v.y, v.z, false)
            if distancia >= 5 then
                idle = 1
                startRoubo(v)
            else
                idle = 500
            end
        end
    end
end)