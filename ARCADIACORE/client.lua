

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
    setPlayerModel('mp_f_freemode_01')
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

RegisterCommand('tpcds', function(source,args,raw)
    local x,y,z = tonumber(args[1]),tonumber(args[2]),tonumber(args[3])
    teleportCDS(x,y,z)
end)


RegisterCommand('testtimer', function(source,args,raw)
    timer = tonumber(args[1])
    timer2 = GetGameTimer()
    print(timer2)
    settimer(timer)
end,false)

RegisterCommand('mycds',function()
    local x,y,z = getPlayerCoords()
    print(x," ",y," ",z)
end)

RegisterCommand('nuioff',function()
    TriggerEvent("ARCADIABANKUI:OFF", false)
end)

RegisterCommand('setmodel', function(source,args) setPlayerModel(args[1]) end)


Citizen.CreateThread(function()
    local idle = 500
    while true do
        Citizen.Wait(idle)
        if playerSpawned then
            --TriggerServerEvent('arcadia:updateplayerpos', getPlayerCoords())
            idle = 2000
        else
            idle = 5000
            Citizen.Wait(idle)
        end
    end
end)

