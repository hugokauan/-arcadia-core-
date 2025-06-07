

Citizen.CreateThread(function()
    local idle = 100
    for k,v in pairs(babershops) do
        ARCADIA.createBlip(v.x,v.y,v.z,v.sprite,v.scale,v.color,v.name)
        Citizen.Wait(100)
    end
    while true do
        local x,y,z = ARCADIA.getPlayerCoords()
        for k,v in pairs(babershops) do
            local distancia = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, false)
            if distancia <= 12 then
                idle = 0
                if distancia <= 6 then
                    DrawMarker(23, v.x, v.y, v.z-0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 0, 0, 255, false, false, 0, false, nil, nil, 0)
                    if IsControlPressed(0, 46) then
                        
                    end
                end
            else
                idle = 100
            end
        end
        Citizen.Wait(idle)
    end
end)