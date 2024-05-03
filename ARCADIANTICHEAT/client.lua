local keys = {['E'] = 38,['DELETE'] = 178,['ARUP'] = 188,['ARDOWN']= 187,['ARLEFT'] = 189,['ARRIGHT'] = 190}
local blockedVehs = {"voltic2","deluxo"}

-- DISABLE PEDS
Citizen.CreateThread(function()
    SetPedPopulationBudget(0)
    while true do
        SetScenarioPedDensityMultiplierThisFrame(0, 0)
        SetVehicleDensityMultiplierThisFrame(0)
        SetParkedVehicleDensityMultiplierThisFrame(0)
        SetRandomVehicleDensityMultiplierThisFrame(0)
        Citizen.Wait(0)
    end
end)

-- DISABLE WANTED LEVEL
Citizen.CreateThread(function()
    local player = PlayerId()
    local playerPed = PlayerPedId()
    while true do
        Citizen.Wait(1000)
        if GetPlayerWantedLevel(player) ~= 0 then
            SetPlayerWantedLevel(player, 0, false)
            SetPlayerWantedLevelNow(player, false)
            SetMaxWantedLevel(0)
            SetPoliceIgnorePlayer(playerPed, true)
            SetDispatchCopsForPlayer(playerPed, false)
        end
    end
end)

--[[-- KEY LOGGER
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, 38) then
            TriggerServerEvent('anticheat:logger',"https://discord.com/api/webhooks/1097710175693049967/NN3elIMP98ofuNNji-sPeZXXdRcy7Blw5jySGCFrVZnoEa0T6TRa9348_T9oK0o2ecmR"," presionou a tecla ['E']")
        elseif IsControlJustReleased(0, 178) then
            TriggerServerEvent('anticheat:logger',"https://discord.com/api/webhooks/1097710175693049967/NN3elIMP98ofuNNji-sPeZXXdRcy7Blw5jySGCFrVZnoEa0T6TRa9348_T9oK0o2ecmR"," presionou a tecla ['Del']")
        elseif IsControlJustReleased(0, 188) then
            TriggerServerEvent('anticheat:logger',"https://discord.com/api/webhooks/1097710175693049967/NN3elIMP98ofuNNji-sPeZXXdRcy7Blw5jySGCFrVZnoEa0T6TRa9348_T9oK0o2ecmR"," presionou a tecla ['ArUp']")
        elseif IsControlJustReleased(0, 187) then
            TriggerServerEvent('anticheat:logger',"https://discord.com/api/webhooks/1097710175693049967/NN3elIMP98ofuNNji-sPeZXXdRcy7Blw5jySGCFrVZnoEa0T6TRa9348_T9oK0o2ecmR"," presionou a tecla ['ArDown']")
        elseif IsControlJustReleased(0, 189) then
            TriggerServerEvent('anticheat:logger',"https://discord.com/api/webhooks/1097710175693049967/NN3elIMP98ofuNNji-sPeZXXdRcy7Blw5jySGCFrVZnoEa0T6TRa9348_T9oK0o2ecmR"," presionou a tecla ['ArLeft']")
        elseif IsControlJustReleased(0, 190) then
            TriggerServerEvent('anticheat:logger',"https://discord.com/api/webhooks/1097710175693049967/NN3elIMP98ofuNNji-sPeZXXdRcy7Blw5jySGCFrVZnoEa0T6TRa9348_T9oK0o2ecmR"," presionou a tecla ['ArRight']")
        end
    end
end)]]