Citizen.CreateThread(function()
    local idle
    local coords
    for k,v in pairs(garagens) do
        ARCADIA.createBlip(v.x,v.y,v.z,v.sprite,v.scale,v.color,v.name)
    end
    while true do
        local x,y,z = ARCADIA.getPlayerCoords()
        Citizen.Wait(idle)
        for k,v in pairs(garagens) do
            coords = vector3(v.x,v.y,v.z)
            pcoords = vector3(x,y,z)
            distancia = #(coords-pcoords)
            if distancia < 5 then
                idle = 0    
                if distancia <= 1 then
                    if IsControlJustReleased(0,46) then
                        TriggerEvent('arcadia:openGarageUI')
                    end
                end
            else
                idle = 50
            end
        end
    end
end)

Citizen.CreateThread(function()
    local playerPed = PlayerPedId()
    local marker
    local playerCoords
    local distancia
    while true do
        Citizen.Wait(0)
        playerCoords = GetEntityCoords(playerPed)
        for k,v in pairs(garagens) do
            marker = vector3(v.x,v.y,v.z)
            distancia = #(playerCoords-marker)
            if distancia <= 5 then
                DrawMarker(27, v.x, v.y, v.z-0.99, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 0, 0, 255, false, false, 0, false, nil, nil, 0)
            end
        end
    end
end)