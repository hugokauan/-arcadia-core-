RegisterNetEvent('ARCADIA:SETARMAS')
AddEventHandler('ARCADIA:SETARMAS', function()
    local source = source
    local ped = GetPlayerPed(source)
    if ARCADIA.isJob(source, 'policia') then
        if ARCADIA.isCargo(source, 'soldado') then
            print('Armas Coletadas')
            for k,v in pairs(config.policia.soldado) do
                print(v[1],v[2])
                TriggerClientEvent('ARCADIA:SETARARMA', source, v[1], v[2], 10)
            end
        elseif ARCADIA.isCargo(source, 'comandante') then
            print('Armas Coletadas')
            for k,v in pairs(config.policia.soldado) do
                print(v[1],v[2])
                TriggerClientEvent('ARCADIA:SETARARMA', source, v[1], v[2], 10)
            end
        end
        local menssagem = "Você Recebeu Suas Armas"
        TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', -1, menssagem)
    else
        print('você não é policial')
    end
end)

--TriggerClientEvent('ARCADIA:SETARARMA', source, 'ARMA_DESEJADA', MUNICOES, DELAY)