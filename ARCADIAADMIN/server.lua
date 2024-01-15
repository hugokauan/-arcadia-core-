RegisterCommand('ban', function(source,args)
    local playerSrc = source
    local firstArg = tonumber(args[1])
    local steamId = ARCADIA.getSteamIdFromId(firstArg)
    local tablecount = ARCADIA.tableCounter(args)
    local motivo = table.concat(args, " ",2)
    local bid
    if tablecount > 1 then
        if ARCADIA.hasPermission(playerSrc,'admin.permission') then
            if ARCADIA.GetSource(steamId) ~= 0 then
                ARCADIA.banPlayer(firstArg)
                bid = ARCADIA.GetSource(steamId)
                print("banned id: "..bid)
                print("jogador kickado")
                print("jogador online")
                DropPlayer(bid, motivo)
                print("tem permissão")
            else
                ARCADIA.banPlayer(firstArg)
                print("jogador offline")
                print("banned id: "..bid)
                print("tem permissão")
            end
        else
            print("Não tem permissão")
        end
    else
        if ARCADIA.hasPermission(playerSrc,'admin.permission') then
            if ARCADIA.GetSource(steamId) ~= 0 then
                ARCADIA.banPlayer(firstArg)
                bid = ARCADIA.GetSource(steamId)
                print("banned id: "..bid)
                print("jogador kickado")
                print("jogador online")
                DropPlayer(bid, "Motivo não informado")
                print("no source found")
                print("tem permissão")
            else
                ARCADIA.banPlayer(firstArg)
                print("jogador offline")
                print("banned id: "..bid)
                print("tem permissão")
            end
        else
            print("Não tem permissão")
        end
    end
end)

RegisterCommand('kick', function(source,args)
    local playerSrc = source
    local id = tonumber(args[1])
    local sId = ARCADIA.getSteamIdFromId(id)
    local kSource
    if ARCADIA.hasPermission(playerSrc,'admin.permission') then
        if ARCADIA.GetSource(sId) ~= 0 then
            kSource = ARCADIA.GetSource(sId)
            ARCADIA.kickplayer(kSource)
        else
            print("jogador offline")
        end
    else
        print('Você não tem permissão')
    end
end)

RegisterCommand('players', function(source,args)
    local players = GetPlayers()
    for k,v in ipairs(players) do
        print(k,v)
    end
end)

RegisterCommand('wl', function(source,args)
    local playerSrc = source
    if ARCADIA.hasPermission(playerSrc,'admin.permission') then
        ARCADIA.wlPlayer(tonumber(args[1]))
    else
        print("Não tem permissão")
    end
end)
RegisterCommand('unwl', function(source,args)
    local playerSrc = source
    if ARCADIA.hasPermission(playerSrc,'admin.permission') then
        ARCADIA.unwlPlayer(tonumber(args[1]))
    else
        print("Não tem permissão")
    end
end)

RegisterCommand('god', function(source,args)
    local playerSrc = source
    local id
    local sId
    local pSource
    local ped
    if ARCADIA.hasPermission(playerSrc,'admin.permission') then
        if args[1] ~= nil then
            id = tonumber(args[1])
            sId = ARCADIA.getSteamIdFromId(id)
            pSource = ARCADIA.GetSource(sId)
            if pSource ~= 0 then
                ped = GetPlayerPed(pSource)
                TriggerClientEvent('arcadia:setentityhealth', pSource)
            else
                print("jogador offline")
            end
        else
            if playerSrc then
                ped = GetPlayerPed(playerSrc)
                TriggerClientEvent('arcadia:setentityhealth', playerSrc)
            end
        end
    else
        print("sem permissão")
    end
end)

RegisterCommand('tpto', function(source,args)
    local playerSrc = source
    local idToTp
    local targetSId
    local targetSource
    if args then
        if args[1] then
            idToTp = tonumber(args[1])
            targetSId = ARCADIA.getSteamIdFromId(idToTp)
            if targetSId then
                print("tSid: "..targetSId)
                targetSource = ARCADIA.GetSource(targetSId)
                print("tSource: "..targetSource)
                if targetSource then
                    if ARCADIA.hasPermission(playerSrc,'admin.permission') then
                        print("teve permissão")
                        TriggerClientEvent('arcadia:teleportTo', playerSrc, targetSource)
                        TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', playerSrc, "Você se teleportou para o ID: [".. idToTp .. "]")
                        print("evento trigado")
                    end
                else
                    print("jogador offline")
                end
            else
                TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', playerSrc, "O id em que você tentou se teleportar não existe")
                print("jogador inexistente")
            end
        else
            TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', playerSrc, "Para teleportar ao jogador que deseja digite o id em frente ao comando")
        end
    end
end)

RegisterCommand('tpway', function(source,args)
    print('comando executado')
    local playerSrc = source
    if ARCADIA.hasPermission(playerSrc,'admin.permission') then
        print("teleported")
        TriggerClientEvent('arcadia:teleportWaypoint', playerSrc)
    else
        print("sem permissão")
    end
end)