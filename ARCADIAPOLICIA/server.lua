RegisterNetEvent('ARCADIA:SETARMAS')
AddEventHandler('ARCADIA:SETARMAS', function()
    local source = source
    local ped = GetPlayerPed(source)
    if ARCADIA.isJob(source, 'policia') then
        if ARCADIA.isCargo(source, 'soldado') then
            print('Armas Coletadas')
            --TriggerClientEvent('ARCADIA:SETARARMA', source, 'ARMA_DESEJADA', MUNICOES, DELAY)
            TriggerClientEvent('ARCADIA:SETARARMA', source, 'WEAPON_STUNGUN', 1, 10)
            TriggerClientEvent('ARCADIA:SETARARMA', source, 'WEAPON_PISTOL', 150, 10)
            TriggerClientEvent('ARCADIA:SETARARMA', source, 'WEAPON_NIGHTSTICK', 1, 10)
        elseif ARCADIA.isCargo(source, 'comandante') then
            print('Armas Coletadas')
            TriggerClientEvent('ARCADIA:SETARARMA', source, 'WEAPON_STUNGUN', 1, 10)
            TriggerClientEvent('ARCADIA:SETARARMA', source, 'WEAPON_PISTOL', 150, 10)
            TriggerClientEvent('ARCADIA:SETARARMA', source, 'WEAPON_NIGHTSTICK', 1, 10)
            TriggerClientEvent('ARCADIA:SETARARMA', source, 'WEAPON_SAWNOFFSHOTGUN', 40, 10)
            TriggerClientEvent('ARCADIA:SETARARMA', source, 'WEAPON_CARBINERIFLE', 300, 10)
        end
        local menssagem = "Você Recebeu Suas Armas"
        TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', -1, menssagem)
    else
        print('você não é policial')
    end
end)