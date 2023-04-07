function deleteAllBlockedVehs()
    local blockedVehs = {"voltic2","deluxo"}
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
        Citizen.Wait(1000)
        deleteAllBlockedVehs()
    end
end)