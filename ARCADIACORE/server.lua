

AddEventHandler('playerConnecting', function(playerName,setKickReason,deferrals)
    local source = source
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
                    --print(id)
                end)
            end
        end)
        pId = getPlayerId(source)
        Citizen.Wait(1000)
        --[[while not pId do
            pId = getPlayerId(source)
                Citizen.Wait(1)
        end]]
        if pId then
            MySQL.scalar('SELECT id FROM players_data WHERE id = ?', {pId}, function(idreturndata)
                if not idreturndata then
                    MySQL.insert('INSERT INTO players_data (id, grupo, dinheiro ,banco) VALUES (?, ?, ?, ?) ', {pId, 'jogador', 500, 0}, function(id)
                        --print(id)     
                    end)
                end
            end)
        else 
            print('id não identificado')
        end

        -- check ban n wl  
    end


    if steamid == nil or not steamid then
        deferrals.done('Você deve estar com sua conta steam aberta para conectar-se ao nosso servidor')
        print("erro ao conectar com o steamid")
    else
        local isBanned = isPlayerBanned(source)
        local isWl = isPlayerWl(source)
        if isWl then
            if not isBanned then
                deferrals.done()
                print("steamid: ",steamid," license: ",licenseid," xbox: ",xboxliveid," fivem: ",fivemid," discord: ",discordid," nome:",playerName)            
            else
                deferrals.done("Você Está Banido")
            end
        else
            deferrals.done("Você Não Está Listado Na Whitelist")
        end
    end
end)


RegisterNetEvent('arcadia:updateplayerpos')
AddEventHandler('arcadia:updateplayerpos',function(x,y,z,id)
    local playerSrc = source
    local playerPosVec3 = table.pack(x,y,z)
    --local ids = GetPlayerIdentifiers(playerSrc)
    --local id = getPlayerId(playerSrc)
    local coords = table.concat(playerPosVec3, "," )
    MySQL.Async.execute('UPDATE players_data SET lastposition = ? WHERE id = ? ', {coords,id}, function(affectedRows)
        if affectedRows then
            --print(affectedRows)
        end
    end)
end)



RegisterNetEvent('arcadia:serversetspawnpos')
AddEventHandler('arcadia:serversetspawnpos', function()
    local playerSrc = source
    local coords
    local ids = GetPlayerIdentifiers(source)
    local id = getPlayerId(source)
    local playerpos = MySQL.scalar.await('SELECT lastposition FROM players_data WHERE id = ?', {id})
    if playerpos then
        coords = stringsplit(playerpos,",")
        local sx,sy,sz = table.unpack(coords)
        local x,y,z = tonumber(sx),tonumber(sy),tonumber(sz)
        TriggerClientEvent('arcadia:setspawnpos', playerSrc, x,y,z+2)
    else
        print('não há ultima posição do jogador: ', getPlayerId(source))
    end
end)

RegisterNetEvent('arcadia_server:saveoutfit')
AddEventHandler('arcadia_server:saveoutfit', function(outfit)
    local pOutfit = outfit
    local id = getPlayerId(source)
    MySQL.Async.execute('UPDATE players_data SET outfit = ? WHERE id = ? ', {pOutfit,id}, function(affectedRows)
        if affectedRows then
            print(affectedRows)
        end
    end)
end)

AddEventHandler('playerDropped', function(reason) 
    local playerSrc = source
    local ped = GetPlayerPed(playerSrc)
    local x,y,z = table.unpack(GetEntityCoords(ped))
    local id = getPlayerId(source)
    print("antes de salvar")
    TriggerClientEvent('arcadia_client:saveoutfit', -1)
    TriggerEvent('arcadia:updateplayerpos',x,y,z,id) 
    print("informações salvas ", playerSrc)
end)