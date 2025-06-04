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
        elseif ARCADIA.isCargo(source, 'cabo') then
            print('Armas Coletadas')
            for k,v in pairs(config.policia.cabo) do
                print(v[1],v[2])
                TriggerClientEvent('ARCADIA:SETARARMA', source, v[1], v[2], 10)
            end
        elseif ARCADIA.isCargo(source, 'comandante') then
            print('Armas Coletadas')
            for k,v in pairs(config.policia.comandante) do
                print(v[1],v[2])
                TriggerClientEvent('ARCADIA:SETARARMA', source, v[1], v[2], 10)
            end
        end
        local menssagem = "Você Recebeu Suas Armas"
        TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', -1, menssagem)
    else
        TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', -1, 'Você não é policial')
    end
end)
--[[BLOCO 1 (CÓDIGO DO VESTIARIO DA POLICIA)]]
RegisterNetEvent('ARCADIA_SERVER:SETCLOTHES')
AddEventHandler('ARCADIA_SERVER:SETCLOTHES', function()
    local src = source
    local ped = GetPlayerPed(source)
    if ARCADIA.isJob(src, 'policia') then
        if ARCADIA.isCargo(src, 'soldado') then
            print('Fardamento Coletado')
            TriggerClientEvent('ARCADIA_CLIENT:SETCLOTHES', src)
        elseif ARCADIA.isCargo(src, 'cabo') then
            print('Fardamento Coletado')
            TriggerClientEvent('ARCADIA_CLIENT:SETCLOTHES', src)
        elseif ARCADIA.isCargo(src, 'comandante') then
            print('Fardamento Coletado')
            TriggerClientEvent('ARCADIA_CLIENT:SETCLOTHES', src)
        end
        local menssagem = "Você Recebeu Seu Fardamento"
        TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', -1, menssagem)
    else
        TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', -1, 'Você não é policial')
    end
end)
-----
RegisterNetEvent('ARCADIA_SERVER:SETGUNS')
AddEventHandler('ARCADIA_SERVER:SETGUNS', function (kit)
    local choiceKit = kit
    if choiceKit == "Kit-Soldado" then
        if ARCADIA.isCargo(source, 'soldado' or 'sargento' or 'tenente' or 'cabo' or 'comandante') then
            for k,v in pairs(config.policia.soldado) do
                print(v[1],v[2])
                TriggerClientEvent('ARCADIA:SETARARMA', -1, v[1], v[2], 10)
            end
        end
    elseif choiceKit == "Kit-Sargento" then
    elseif choiceKit == "Kit-Tenente" then
    elseif choiceKit == "Kit-Comandante" then
        if ARCADIA.isCargo(source, 'comandante') then
            for k,v in pairs(config.policia.comandante) do
                print(v[1],v[2])
                TriggerClientEvent('ARCADIA:SETARARMA', -1, v[1], v[2], 10)
            end
        end
    end
end)

local isArsenalAberto = false

RegisterNetEvent('ARCADIA:TRIGGERARSENALMENU')
AddEventHandler('ARCADIA:TRIGGERARSENALMENU', function ()
    src = source
    isArsenalAberto = isArsenalAberto
    print("1")
    if ARCADIA.isJob(src, "policia") then
        print("2")
        if isArsenalAberto then
            print("T")
            isArsenalAberto = false
        else
            print("F")
            isArsenalAberto = true
        end
        TriggerClientEvent("ARCADIA:OPENTABMENU", -1, isArsenalAberto)
        print("ET")
    end
end)

RegisterNetEvent('ARCADIA:ISARSENALABERTO')
AddEventHandler('ARCADIA:ISARSENALABERTO', function (isAberto)
    isArsenalAberto = isAberto
end)

--TriggerClientEvent('ARCADIA:SETARARMA', source, 'ARMA_DESEJADA', MUNICOES, DELAY)