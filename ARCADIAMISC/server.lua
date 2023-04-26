RegisterCommand('c',function(source, args,rawCommand)
    local playerSrc = source
    if ARCADIA.hasPermission(playerSrc,'admin.permission') then
        TriggerClientEvent('arcadia:createvehicle',playerSrc, args[1])
    else
        TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', playerSrc, "Permissão Insuficiente")
    end
end)

RegisterCommand('dv',function(source,args)
    if args then
        args = nil
    end
    local playerSrc = source
    if ARCADIA.hasPermission(playerSrc,'admin.permission') then
        TriggerClientEvent('arcadia:deletevehicle',playerSrc) 
    else
        TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', playerSrc, "Permissão Insuficiente")
    end
end)

RegisterCommand('consertar',function(source,args)
    if args then
        args = nil
    end
    local playerSrc = source
    if ARCADIA.hasPermission(playerSrc,'admin.permission') then
        TriggerClientEvent('arcadia:fixvehicle', playerSrc)
    else
        TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', playerSrc, "Permissão Insuficiente")
    end
end)

RegisterCommand('alertall', function(source,args)
    local playerSrc = source
    if ARCADIA.hasPermission(playerSrc,'admin.permission') then
        TriggerEvent('ARCADIASERVER:NOTIFICACAO', args)
    else
        TriggerClientEvent('ARCADIACLIENT:NOTIFICACAO', playerSrc, "Permissão Insuficiente")
    end
end)