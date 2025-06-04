--[[CLIENT EVENTS]]

RegisterNetEvent('REGISTERCLOTHES')
AddEventHandler('REGISTERCLOTHES', function ()
    local clothes = ARCADIA.getOutfit()
    TriggerServerEvent('REGISTERCLOTHES_S', clothes)
end)
RegisterNetEvent('SETCLOTHES')
AddEventHandler('SETCLOTHES', function (cId,drawable,texture)
    print("ROUPAS SETADAS1")
    SetPedComponentVariation(PlayerPedId(),cId,drawable,texture,0)
    print("ROUPAS SETADAS2")
end)




--[[SERVER EVENTS]]

RegisterNetEvent('REGISTERCLOTHES_S')
AddEventHandler('REGISTERCLOTHES_S',function (clothes)
    local src = source
    local steamId = ARCADIA.getSteamId(src)
    local id = ARCADIA.getPlayerId(src)
    MySQL.insert('INSERT INTO `playerclothesjson` (steamid, clothing, id) VALUES (?, ?, ?)', {
        steamId, clothes,id
    }, function(id)
        print(id)
    end)
end)


RegisterNetEvent('SETCLOTHES_S')
AddEventHandler('SETCLOTHES_S',function ()
    local src = source
    local steamId = ARCADIA.getSteamId(src)
    local clothes = MySQL.prepare.await('SELECT `clothing` FROM `playerclothesjson` WHERE `steamid` = ?', {steamId})
    clothes = json.decode(clothes)
    for k,v in pairs(clothes) do
        TriggerClientEvent('SETCLOTHES', -1, tonumber(k),tonumber(v.drawable),tonumber(v.texture),0)
    end
    
end)