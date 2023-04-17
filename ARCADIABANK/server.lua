

--[[EVENTOS]]

RegisterNetEvent('ARCADIASERVER:DEPOSITO')
RegisterNetEvent('ARCADIASERVER:SAQUE')
RegisterNetEvent('ARCADIASERVER:SALDO')


AddEventHandler('ARCADIASERVER:DEPOSITO', function(valor)
    local playerSrc = source
    local valordeposito = tonumber(valor)
    local id = getPlayerId(source)
    local dinheiro = MySQL.prepare.await('SELECT dinheiro FROM players_data WHERE id = ?', {id})
    if dinheiro >= valordeposito then
        remdinheiro(id,valordeposito)
        addbanco(id,valordeposito)
    else 
        TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', playerSrc, "Dinheiro Insuficiente")
    end
end)

AddEventHandler('ARCADIASERVER:SAQUE', function(valor)
    local playerSrc = source
    local valorsaque = tonumber(valor)
    local id = getPlayerId(source)
    local saldo = MySQL.prepare.await('SELECT banco FROM players_data WHERE id = ?', {id})
    if saldo >= valorsaque then
        rembanco(id,valorsaque)
        adddinheiro(id,valorsaque)
    else
        TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', playerSrc, "Saldo Insuficiente")
    end
end)

AddEventHandler('ARCADIASERVER:SALDO', function()
    local source = source
    local id = getPlayerId(source)
    local banco = getPlayerBanco(id)
    TriggerClientEvent('ARCADIABANK:SENDSALDO', source, banco)
end)