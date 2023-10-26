

RegisterNetEvent("ARCADIA:SETARARMA")
AddEventHandler("ARCADIA:SETARARMA", function(name, municao, delayTime)
    if delayTime == nil then
        delayTime = 0
    end

    Citizen.CreateThread(function()
        Wait(delayTime)
        local hash = GetHashKey(name)
        GiveWeaponToPed(GetPlayerPed(-1), hash, municao, 0, false)
    end)
end)

arsenal = {
    ["DP Principal"] = {
        ['x'] = 452.37, 
        ['y'] = -980.17, 
        ['z'] = 30.68
    }
}

Citizen.CreateThread(function()
    local playerPed = PlayerPedId()
    local marker
    local playerCoords
    local distancia
    local idle = 0
    while true do
        playerCoords = GetEntityCoords(playerPed)
        for k,v in pairs(arsenal) do
            marker = vector3(v.x,v.y,v.z)
            distancia = #(playerCoords-marker)
            if distancia <= 5 then
                idle = 0
                DrawMarker(23, v.x, v.y, v.z-0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 0, 0, 255, false, false, 0, false, nil, nil, 0)
                if IsControlJustReleased(0, 46) then
                    TriggerServerEvent('ARCADIA:SETARMAS')
                end
            else
                idle = 100
            end
        end
        Citizen.Wait(idle)
    end
end)