local lastrobbery = 0
RegisterNetEvent('arcadia:startroubo')
AddEventHandler('arcadia:startroubo', function(ped,tipo)
    local tipo = tipo
    local source = source
    local id = getPlayerId(source)
    local qtd,qtdmin,qtdmax
    if time - lastrobbery >= 60 then
        TriggerClientEvent('arcadia:endroubo', -1, ped)
        if tipo == "ATM" then
            qtdmin = cfg.atm.qtdmin
            qtdmax = cfg.atm.qtdmax
            qtd = math.random(qtdmin,qtdmax)
        elseif tipo == "Banco" then
            qtdmin = cfg.banco.qtdmin
            qtdmax = cfg.banco.qtdmax
            qtd = math.random(qtdmin,qtdmax)
        else
            print("Tipo invalido")
        end

        adddinheiro(id,qtd)
        lastrobbery = os.time()
        sendwebhookmessage("https://discord.com/api/webhooks/1097710175693049967/NN3elIMP98ofuNNji-sPeZXXdRcy7Blw5jySGCFrVZnoEa0T6TRa9348_T9oK0o2ecmR","```yaml\n[UM " .. tipo..  " FOI ROUBADO PELO JOGADOR DE ID: ".. id .. "]```")
    else
        local menssagem = "o " .. tipo .. " foi roubado recentemente"
        TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', -1, menssagem)
    end
end)

Citizen.CreateThread(function()
    while true do
        time = os.time()
        Citizen.Wait(100)
    end
end)