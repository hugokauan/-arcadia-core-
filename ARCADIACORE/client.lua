local playerSpawned = false

AddEventHandler('playerSpawned', function()
    Citizen.Wait(1000)
    TriggerServerEvent('arcadia:serversetspawnpos')
    playerSpawned = true
    Citizen.Wait(1)
end)


RegisterNetEvent('arcadia:setspawnpos')
AddEventHandler('arcadia:setspawnpos', function(x,y,z)
    SetEntityCoords(PlayerPedId(), x, y, z, false, false, false, false)
    ARCADIA.setPlayerModel('mp_f_freemode_01')
    local playerPed = PlayerPedId()
    SetPedComponentVariation(playerPed, 2, 10, 1, 0)
    SetPedComponentVariation(playerPed, 3, 4, 0, 0)
    SetPedComponentVariation(playerPed, 4, 88, 0, 0)
    SetPedComponentVariation(playerPed, 8, 14, 0, 0)
    SetPedComponentVariation(playerPed, 6, 23, 0, 0)
    SetPedComponentVariation(playerPed, 11, 195, 0, 0)
    SetPedHeadBlendData(playerPed, 0, 0, 0, 0, 0, 0, 0, 0, 0, false)
    SetPedFaceFeature(playerPed, 13, -1.0)
    SetPedFaceFeature(playerPed, 14, -1.0)
    SetPedHairColor(playerPed, 20, 23)
end)

RegisterNetEvent('arcadia_client:saveoutfit')
AddEventHandler('arcadia_client:saveoutfit', function ()
    local outfit = ARCADIA.getOutfit()
    TriggerServerEvent('arcadia_server:saveoutfit', outfit)
end)

--[[RegisterCommand('tpcds', function(source,args,raw)
    local x,y,z = tonumber(args[1]),tonumber(args[2]),tonumber(args[3])
    teleportCDS(x,y,z)
end)]]

RegisterCommand('mycds',function()
    local x,y,z = ARCADIA.getPlayerCoords()
    print(x," ",y," ",z)
end)

RegisterCommand('nuioff',function()
    TriggerEvent("ARCADIABANKUI:OFF", false)
end)

RegisterCommand('setmodel', function(source,args) setPlayerModel(args[1]) end)


Citizen.CreateThread(function()
        local segundo = 1000*60
        local minuto = segundo * 1
        local idle = minuto
        while true do
            local outfit = ARCADIA.getOutfit()
            TriggerServerEvent('receive:outfit', outfit)
            Citizen.Wait(idle)
        end
end)


