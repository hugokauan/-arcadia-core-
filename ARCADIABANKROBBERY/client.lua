function startRoubo(banco)

end

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