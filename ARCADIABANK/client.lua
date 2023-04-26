Citizen.CreateThread(function()
    local idle = 100
    for k,v in pairs(bancos) do
        ARCADIA.createBlip(v.x,v.y,v.z,v.sprite,v.scale,v.color,v.name)
    end
    while true do 
        local x,y,z = ARCADIA.getPlayerCoords()
            for k,v in pairs(bancos) do
                local distancia = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, false)
                if distancia <= 12 then
                    idle = 0
                    if distancia <= 6 then
                        if IsControlPressed(0, 46) then
                            TriggerEvent("ARCADIABANKUI:ON",true)
                        end
                    end
                else
                    idle = 100
                end
            end
        Citizen.Wait(idle)
    end
end)
