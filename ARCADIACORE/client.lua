local playerSpawned = false

AddEventHandler('playerSpawned', function()
    Citizen.Wait(50)
    TriggerServerEvent('arcadia:serversetspawnpos')
    Citizen.Wait(2000)
    TriggerServerEvent('arcadia_server:setPlayerClothing')
    playerSpawned = true
    Citizen.Wait(1)
end)


RegisterNetEvent('arcadia:setspawnpos')
AddEventHandler('arcadia:setspawnpos', function(x,y,z,clothing)
    SetEntityCoords(PlayerPedId(), x, y, z, false, false, false, false)
    ARCADIA.setPlayerModel('mp_f_freemode_01')
    SetEntityVisible(PlayerPedId(), false, 0)
end)

RegisterNetEvent('arcadia_client:savePlayerOutfit')
AddEventHandler('arcadia_client:savePlayerOutfit',function()
    local clothes,textures,props = ARCADIA.getPlayerClothes()
    mascara = clothes[1]
    mascara_textures = textures[1]
    cabelo = clothes[2]
    cabelo_textures = textures[2]
    maos = clothes[3]
    maos_textures = textures[3]
    calcas = clothes[4]
    calcas_textures = textures[4]
    mochilas = clothes[5]
    mochilas_textures = textures[5]
    sapatos = clothes[6]
    sapatos_textures = textures[6]
    acessorios = clothes[7]
    acessorios_textures = textures[7]
    rasgos = clothes[8]
    rasgos_textures = textures[8]
    colete = clothes[9]
    colete_textures = textures[9]
    decals = clothes[10]
    decals_texture = textures[10]
    camisetas = clothes[11]
    camisetas_textures = textures[11]

        TriggerServerEvent
            (
                'arcadia_server:savePlayerClothes',
                    mascara,
                    cabelo,
                    maos,
                    calcas,
                    mochilas,
                    sapatos,
                    acessorios,
                    rasgos,
                    colete,
                    decals,
                    camisetas
            )
end)

RegisterNetEvent('arcadia_client:setPlayerClothing')
AddEventHandler('arcadia_client:setPlayerClothing', function(tipo,roupa)
    local roupa = roupa
    local tipo = tipo
    local playerPed = PlayerPedId()
    SetPedComponentVariation(playerPed, tipo, roupa, 0, 0)
    Citizen.Wait(600)
    SetEntityVisible(PlayerPedId(), true, 0)
end)

RegisterCommand('mycds',function()
    local x,y,z = ARCADIA.getPlayerCoords()
    print(x," ",y," ",z)
end)

RegisterCommand('nuioff',function()
    TriggerEvent("ARCADIABANKUI:OFF", false)
end)
