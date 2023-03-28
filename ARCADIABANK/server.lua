--[[FUNÇÕES]]
function adddinheiro(id,quantidade)
    local dinheiro = MySQL.prepare.await('SELECT dinheiro FROM players_data WHERE id = ?', {id})
    local saldofinal = dinheiro+quantidade
    MySQL.Async.execute('UPDATE players_data SET dinheiro = ? WHERE id = ? ', {saldofinal, id}, function(affectedRows)
        if affectedRows then
            print(affectedRows)
        end
    end)
end

function remdinheiro(id,quantidade)
    local dinheiro = MySQL.prepare.await('SELECT dinheiro FROM players_data WHERE id = ?', {id})
    local saldofinal = dinheiro - quantidade
    MySQL.Async.execute('UPDATE players_data SET dinheiro = ? WHERE id = ? ', {saldofinal, id}, function(affectedRows)
        if affectedRows then
            print(affectedRows)
        end
    end)
end

function addbanco(id,quantidade)
    local bancosaldo = MySQL.prepare.await('SELECT banco FROM players_data WHERE id = ?', {id})
    local saldofinal = bancosaldo+quantidade
    MySQL.Async.execute('UPDATE players_data SET banco = ? WHERE id = ? ', {saldofinal, id}, function(affectedRows)
        if affectedRows then
            print(affectedRows)
        end
    end)
end

function rembanco(id,quantidade)
    local bancosaldo = MySQL.prepare.await('SELECT banco FROM players_data WHERE id = ?', {id})
    local saldofinal = bancosaldo-quantidade
    MySQL.Async.execute('UPDATE players_data SET banco = ? WHERE id = ? ', {saldofinal, id}, function(affectedRows)
        if affectedRows then
            print(affectedRows)
        end
    end)
end

function getPlayerMoney(id)
    local dinheiro = MySQL.prepare.await('SELECT dinheiro FROM players_data WHERE id = ?', {id})
    return dinheiro
end

function getPlayerBanco(id)
    local saldo = MySQL.prepare.await('SELECT banco FROM players_data WHERE id = ?', {id})
    return saldo
end

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