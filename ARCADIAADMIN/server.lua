RegisterCommand('ban', function(source,args)
    local playerSrc = source
    local firstArg = tonumber(args[1])
    local steamId = getSteamIdFromId(firstArg)
    table.remove(args[1])
    local tablecount = tableCounter(args)
    local motivo = table.concat( args, " ")
    if ARCADIA.hasPermission(playerSrc,'admin.permission') then
        banPlayer(firstArg)
        DropPlayer(steamId, motivo)
    end
end)

RegisterCommand('wl', function(source,args)
    local playerSrc = source
    if ARCADIA.hasPermission(playerSrc,'admin.permission') then
        wlPlayer(tonumber(args[1]))
    end
end)