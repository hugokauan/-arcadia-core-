RegisterNetEvent('arcadia:createvehicle')
RegisterNetEvent('arcadia:deletevehicle')
RegisterNetEvent('arcadia:fixvehicle')

AddEventHandler('arcadia:createvehicle', function(carroimport)
    local carro = GetHashKey(carroimport)
    local carroenter
    if carro ~= nil then
        RequestModel(carro)
        while not HasModelLoaded(carro) do
            Citizen.Wait(50)
        end
        if HasModelLoaded(carro) then
            x,y,z = ARCADIA.getPlayerCoords()
            heading = GetEntityHeading(GetPlayerPed(-1))
            CreateVehicle(carro, x-2, y-0.5, z, heading, false, false)
            Citizen.Wait(100)
            ARCADIA.PutPlayerInClosestVehicle()
        end
    end
end)

AddEventHandler('arcadia:deletevehicle', function()
    local carro = ARCADIA.GetClosestVehicle()
    if carro then
        Citizen.Wait(50)
        DeleteVehicle(carro)
    end 
end)

AddEventHandler('arcadia:fixvehicle', function()
    local carro = ARCADIA.GetClosestVehicle()
    if carro then
        SetVehicleFixed(carro)
        SetVehicleEngineHealth(carro, 1000.0)
        SetVehicleBodyHealth(carro, 1000.0)
        SetVehicleEngineOn(carro, true, true, false)
    end
end)

Citizen.CreateThread(function()
    local id = nil
    RegisterNetEvent('arcadia:receiveid')
    AddEventHandler('arcadia:receiveid', function(receive) id = receive end)
    TriggerServerEvent('teste')
    while true do
        --print(id)
        Citizen.Wait(1000)
    end
end)

