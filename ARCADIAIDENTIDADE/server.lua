RegisterNetEvent('arcadia_NUI:serverOpenId')
AddEventHandler('arcadia_NUI:serverOpenId', function(value)
    local src = source
    local value = value
    local id = ARCADIA.getPlayerId(src)
    local nome = "teste"
    local sobrenome = "Teste2"
    local job = ARCADIA.getPlayerJob(src)
    local cargo = ARCADIA.getPlayerCargo(src)
    TriggerClientEvent('arcadia_NUI:openId',-1, value,id,nome,sobrenome,job,cargo)
end)

-- ,value,id,nome,sobrenome,job,cargo

RegisterCommand('tester', function (source,args)
        local job = ARCADIA.getPlayerJob(source)
        local cargo = ARCADIA.getPlayerCargo(source)
        print(job,cargo)
end)