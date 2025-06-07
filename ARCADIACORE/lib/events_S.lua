
--[[SERVER EVENTS]]

RegisterNetEvent('REGISTERCLOTHES_S')
AddEventHandler('REGISTERCLOTHES_S',function (clothes)
    local src = source
    local steamId = ARCADIA.getSteamId(src)
    local pId = ARCADIA.getPlayerId(src)
    local pClothing = MySQL.prepare.await('SELECT `clothing` FROM `players_data` WHERE `id` = ?', {pId})
    if pClothing then
        TriggerEvent("CONSOLE_WARNING",GetCurrentResourceName,"SERVER","ROUPA JÁ REGISTRADA")
    else
        MySQL.insert('INSERT INTO `players_data` (id, clothing) VALUES (?, ?)', {pId, clothes}, function(id)
            print(id)
        end)
    end
end)


RegisterNetEvent('SETCLOTHES_S')
AddEventHandler('SETCLOTHES_S',function ()
    local src = source
    --local steamId = ARCADIA.getSteamId(src)
    local pId = ARCADIA.getPlayerId(src)
    local jsonClothes = MySQL.prepare.await('SELECT `clothing` FROM `players_data` WHERE `id` = ?', {pId})
    local decodedClothes = json.decode(jsonClothes)
    for k,v in pairs(decodedClothes) do
        TriggerClientEvent('SETCLOTHES', -1, tonumber(k),tonumber(v.drawable),tonumber(v.texture),0)
    end
end)

RegisterNetEvent('CONSOLE_WARNING')
AddEventHandler('CONSOLE_WARNING', function(resourceName,isClientOrServer,message)
    print("["+ tostring(resourceName) + tostring(isClientOrServer) "]: " + tostring(message))
end)