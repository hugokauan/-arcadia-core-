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
--[[
RegisterCommand('testarsteamid', function(source,args)
    local id = tonumber(args[1])
    print(ARCADIA.getSteamIdFromId(id))
end, false)

RegisterCommand('testarsource', function(source,args)
    local id = tonumber(args[1])
    local sID = ARCADIA.getSteamIdFromId(id)
    print(sID)
    local sourceplayer = ARCADIA.GetSource(sID)
    print("id " ..id)
    --print(sID)
    print("args " .. args[1])
    print("source do comando: " .. source)
    print("source id: " .. sourceplayer)
end)]]

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

--[[RegisterCommand('testeban', function(source,args)
    local playerSrc = source
    local fArg = tonumber(args[1])
    local sId = ARCADIA.getSteamIdFromId(fArg)
    if ARCADIA.hasPermission(playerSrc,'admin.permission') then
        ARCADIA.banPlayer(fArg)
        DropPlayer(player, "Banido")
    else
        print("Não tem permissão")
    end
end)]]

