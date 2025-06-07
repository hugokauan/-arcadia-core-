AddEventHandler('playerConnecting', function(playerName,setKickReason,deferrals)
    local source = source
    local players
    local steamid
    local discordid
    local fivemid
    local xboxliveid
    local licenseid
    local ip
    local playerName = GetPlayerName(source)
    local identifiers = GetPlayerIdentifiers(source)
    deferrals.defer()
    Citizen.Wait(1)

    deferrals.update(string.format( "Seja bem-vindo a rede de servidores NBC,Aguarde enquanto seu SteamID é checado",playerName))

    for k,v in pairs(identifiers) do
        if string.match(v, 'steam:') then
            steamid = v
        elseif string.match(v,'license:') then
            licenseid = v
        elseif string.match(v,'xbl:') then
            xboxliveid = v
        elseif string.match(v,'fivem:') then
            fivemid = v
        elseif string.match(v,'discord:') then
            discordid = v
        elseif string.match(v,'ip:') then
            ip = v
        end
    end

    local id = steamid
    local did = discordid
    local pId
    -- checando se o dado id foi capturado
    if id then
        --checando se o steamid ja foi registrado
        MySQL.scalar('SELECT steamid FROM players WHERE steamid = ?', {id}, function(idreturn)
            if not idreturn then
                
                --inserindo o steamid
                MySQL.insert('INSERT INTO players (steamid, discordid, ip) VALUES (?, ?, ?) ', {steamid, discordid, ip}, function(id)
                end)
            end
        end)
        pId = ARCADIA.getPlayerId(source)
        Citizen.Wait(1000)
        if pId then
            MySQL.scalar('SELECT id FROM players_data WHERE id = ?', {pId}, function(idreturndata)
                if not idreturndata then
                    MySQL.insert('INSERT INTO players_data (id, grupo, dinheiro ,banco) VALUES (?, ?, ?, ?) ', {pId, 'jogador', 500, 0}, function(id)    
                    end)
                end
            end)
        else 
            print('id não identificado')
        end

    end


    if steamid == nil or not steamid then
        deferrals.done('Você deve estar com sua conta steam aberta para conectar-se ao nosso servidor')
        print("erro ao conectar com o steamid")
    else
        local isBanned = ARCADIA.isPlayerBanned(source)
        local isWl = ARCADIA.isPlayerWl(source)
        if isWl then
            if not isBanned then
                deferrals.done()
                print("steamid: ",steamid," license: ",licenseid," xbox: ",xboxliveid," fivem: ",fivemid," discord: ",discordid," nome:",playerName)              
            else
                deferrals.done("Você Está Banido")
            end
        else
            deferrals.done("Você Não Está Listado Na Whitelist, Envie seu id em nosso discord: discord.gg/cyber-arcadia" .. id)
        end
    end
end)

RegisterNetEvent('arcadia:getdata')
AddEventHandler('arcadia:getdata', function()
    local id = ARCADIA.getPlayerId(source)
    Citizen.Wait(10)
    ARCADIA.player.money = ARCADIA.getPlayerMoney(id)
    ARCADIA.player.banco = ARCADIA.getPlayerBanco(id)
    ARCADIA.player.group = ARCADIA.getPlayerGroup(id)
    ARCADIA.player.org = ARCADIA.getPlayerOrg(id)
    TriggerClientEvent('arcadia:receivedata', -1, ARCADIA)
end)

RegisterNetEvent('arcadia:updatedata')
AddEventHandler('arcadia:updatedata', function()
    local id = ARCADIA.getPlayerId(source)
    ARCADIA.player.money = ARCADIA.getPlayerMoney(id)
    ARCADIA.player.banco = ARCADIA.getPlayerBanco(id)
    TriggerClientEvent('arcadia:receivedata', -1, ARCADIA)
end)

RegisterNetEvent('arcadia:updateplayerpos')
AddEventHandler('arcadia:updateplayerpos',function(pcoords,id)
    local playerSrc = source
    local x,y,z = table.unpack(pcoords)
    local packedCoords = table.pack(x,y,z)
    local coords = table.concat(packedCoords, ",")
    MySQL.Async.execute('UPDATE players_data SET lastposition = ? WHERE id = ? ', {coords,id}, function(affectedRows)
        if affectedRows then
            --print(affectedRows)
        end
    end)
    TriggerClientEvent('REGISTERCLOTHES', -1)
    --TriggerClientEvent('arcadia_client:savePlayerOutfit', -1)
end)



RegisterNetEvent('arcadia:serversetspawnpos')
AddEventHandler('arcadia:serversetspawnpos', function()
    local playerSrc = source
    local coords
    local id = ARCADIA.getPlayerId(source)
    local playerpos = MySQL.prepare.await('SELECT lastposition FROM players_data WHERE id = ?', {id})
    if playerpos then
        coords = ARCADIA.stringsplit(playerpos,",")
        local sx,sy,sz = table.unpack(coords)
        local x,y,z = tonumber(sx),tonumber(sy),tonumber(sz)
        if x and y and z then
            TriggerClientEvent('arcadia:setspawnpos', playerSrc, x,y,z+2)
        end
    else
        TriggerClientEvent('arcadia:setspawnpos', playerSrc, -1035.13,-2734.10,20.16+2.0)
    end
end)

--[[RegisterNetEvent('arcadia_server:savePlayerClothes')
AddEventHandler('arcadia_server:savePlayerClothes',function(mascara,cabelo,maos,calcas,mochilas,sapatos,acessorios,rasgos,colete,decals,camisetas)
    local id = ARCADIA.getPlayerId(source)
    local response = MySQL.prepare.await('SELECT id FROM players_clothing WHERE id = ?', {id})
    print(response)
    if response ~= nil then
        -- MASCARA
        MySQL.Async.execute('UPDATE players_clothing SET mascara = ? WHERE id = ? ', {mascara,id}, function(affectedRows)
            if affectedRows then
                --print(affectedRows)
            end
        end)
        -- CABELO
        MySQL.Async.execute('UPDATE players_clothing SET cabelo = ? WHERE id = ? ', {cabelo,id}, function(affectedRows)
            if affectedRows then
                --print(affectedRows)
            end
        end)
        -- MAOS
        MySQL.Async.execute('UPDATE players_clothing SET maos = ? WHERE id = ? ', {maos,id}, function(affectedRows)
            if affectedRows then
                --print(affectedRows)
            end
        end)
        -- CALCAS
        MySQL.Async.execute('UPDATE players_clothing SET calcas = ? WHERE id = ? ', {calcas,id}, function(affectedRows)
            if affectedRows then
                --print(affectedRows)
            end
        end)
        -- MOCHILAS
        MySQL.Async.execute('UPDATE players_clothing SET mochilas = ? WHERE id = ? ', {mochilas,id}, function(affectedRows)
            if affectedRows then
                --print(affectedRows)
            end
        end)
        -- SAPATOS
        MySQL.Async.execute('UPDATE players_clothing SET sapatos = ? WHERE id = ? ', {sapatos,id}, function(affectedRows)
            if affectedRows then
                --print(affectedRows)
            end
        end)
        -- ACESSORIOS
        MySQL.Async.execute('UPDATE players_clothing SET acessorios = ? WHERE id = ? ', {acessorios,id}, function(affectedRows)
            if affectedRows then
                --print(affectedRows)
            end
        end)
        -- RASGOS
        MySQL.Async.execute('UPDATE players_clothing SET camisetabug = ? WHERE id = ? ', {rasgos,id}, function(affectedRows)
            if affectedRows then
                --print(affectedRows)
            end
        end)
        -- COLETE
        MySQL.Async.execute('UPDATE players_clothing SET coletes = ? WHERE id = ? ', {colete,id}, function(affectedRows)
            if affectedRows then
                --print(affectedRows)
            end
        end)
        -- DECALS
        MySQL.Async.execute('UPDATE players_clothing SET decals = ? WHERE id = ? ', {decals,id}, function(affectedRows)
            if affectedRows then
                --print(affectedRows)
            end
        end)
        MySQL.Async.execute('UPDATE players_clothing SET camiseta = ? WHERE id = ? ', {camisetas,id}, function(affectedRows)
            if affectedRows then
                --print(affectedRows)
            end
        end)
    else
        MySQL.Async.insert('INSERT INTO players_clothing (id) VALUES (?) ', {id}, function(id)
        end)
    end
end)

RegisterNetEvent('arcadia_server:setPlayerClothing')
AddEventHandler('arcadia_server:setPlayerClothing', function()
    local id = ARCADIA.getPlayerId(source)
    local clothes = MySQL.query.await('SELECT mascara,cabelo,maos,calcas,mochilas,sapatos,acessorios,camisetabug,coletes,decals,camiseta FROM players_clothing WHERE id = ?', {id})
    if clothes then
        for i = 1, #clothes do
            local roupas = clothes[i]
            if roupas.mascara then
                TriggerClientEvent('arcadia_client:setPlayerClothing', -1, 1, roupas.mascara)
                Citizen.Wait(5)
            end
            if roupas.cabelo then
                TriggerClientEvent('arcadia_client:setPlayerClothing', -1, 2, roupas.cabelo)
                Citizen.Wait(5)
            end
            if roupas.maos then
                TriggerClientEvent('arcadia_client:setPlayerClothing', -1, 3, roupas.maos)
                Citizen.Wait(5)
            end
            if roupas.calcas then
                TriggerClientEvent('arcadia_client:setPlayerClothing', -1, 4, roupas.calcas)
                Citizen.Wait(5)
            end
            if roupas.mochilas then
                TriggerClientEvent('arcadia_client:setPlayerClothing', -1, 5, roupas.mochilas)
                Citizen.Wait(5)
            end
            if roupas.sapatos then
                TriggerClientEvent('arcadia_client:setPlayerClothing', -1, 6, roupas.sapatos)
                Citizen.Wait(5)
            end
            if roupas.acessorios then
                TriggerClientEvent('arcadia_client:setPlayerClothing', -1, 7, roupas.acessorios)
                Citizen.Wait(5)
            end
            if roupas.camisetabug then
                TriggerClientEvent('arcadia_client:setPlayerClothing', -1, 8, roupas.camisetabug)
                Citizen.Wait(5)
            end
            if roupas.coletes then
                TriggerClientEvent('arcadia_client:setPlayerClothing', -1, 9, roupas.coletes)
                Citizen.Wait(5)
            end
            if roupas.decals then
                TriggerClientEvent('arcadia_client:setPlayerClothing', -1, 10, roupas.decals)
                Citizen.Wait(5)
            end
            if roupas.camiseta then
                TriggerClientEvent('arcadia_client:setPlayerClothing', -1, 11, roupas.camiseta)
                Citizen.Wait(5)
            end
        end
    else
        for i = 1, 11 do
            TriggerClientEvent('arcadia_client:setPlayerClothing', source, i, 0)
            Citizen.Wait(5)
        end
    end
end)
--]]
AddEventHandler('playerDropped', function(reason) 
    local playerSrc = source
    local ped = GetPlayerPed(playerSrc)
    local x,y,z = table.unpack(GetEntityCoords(ped))
    local pcoords = GetEntityCoords(ped)
    local id = ARCADIA.getPlayerId(playerSrc)
    local playerCoords = table.pack(x,y,z)
    print("antes de salvar")
    TriggerEvent('arcadia:updateplayerpos',playerCoords,id) 
    print("informações salvas ", playerSrc)
end)