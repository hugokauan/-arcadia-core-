local keys = {['E'] = 38,['DELETE'] = 178,['ARUP'] = 188,['ARDOWN']= 187,['ARLEFT'] = 189,['ARRIGHT'] = 190}
local blockedVehs = {"voltic2","deluxo"}

function deleteAllBlockedVehs()
    local todosVeiculos = GetGamePool('CVehicle')
    for k,veiculo in pairs(todosVeiculos) do
        veiculoHash = GetHashKey(veiculo)
        for _,blockedVeh in pairs(blockedVehs) do
            blockedVehHash = GetHashKey(blockedVeh)
            if veiculo == blockedVehHash then
                DeleteVehicle(veiculo)
                TriggerServerEvent('arcadia:senddiscordmessage',"https://discord.com/api/webhooks/1086414747286654986/94Vv3nDp9uponoUSRCA36X6frJJwBpb247HVm9FlxM-HEqhIFCLlTi-h3nDIsyvD-KgM","um veículo proíbido foi detectado e deltado")
            end
        end
    end
end



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        deleteAllBlockedVehs()
    end
end)


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
end)