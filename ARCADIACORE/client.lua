local playerSpawned = false

AddEventHandler('playerSpawned', function()
    Citizen.Wait(2000)
    TriggerServerEvent('arcadia:serversetspawnpos')
    TriggerServerEvent('arcadia_server:setPlayerClothing')
    playerSpawned = true
    Citizen.Wait(1)
end)


RegisterNetEvent('arcadia:setspawnpos')
AddEventHandler('arcadia:setspawnpos', function(x,y,z,clothing)
    SetEntityCoords(PlayerPedId(), x, y, z, false, false, false, false)
    --[[SetPedComponentVariation(playerPed, 2, 10, 1, 0)
    SetPedComponentVariation(playerPed, 3, 4, 0, 0)
    SetPedComponentVariation(playerPed, 4, 88, 0, 0)
    SetPedComponentVariation(playerPed, 8, 14, 0, 0)
    SetPedComponentVariation(playerPed, 6, 23, 0, 0)
    SetPedComponentVariation(playerPed, 11, 195, 0, 0)
    SetPedHeadBlendData(playerPed, 0, 0, 0, 0, 0, 0, 0, 0, 0, false)
    SetPedFaceFeature(playerPed, 13, -1.0)
    SetPedFaceFeature(playerPed, 14, -1.0)
    SetPedHairColor(playerPed, 20, 23)]]
end)

--[[RegisterNetEvent('arcadia_client:saveoutfit')
AddEventHandler('arcadia_client:saveoutfit', function ()
    local outfit = ARCADIA.getOutfit()
    TriggerServerEvent('arcadia_server:saveoutfit', outfit)
end)
]]

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
    TriggerServerEvent('arcadia_server:savePlayerClothes', mascara,cabelo,maos,calcas,mochilas,sapatos,acessorios,rasgos,colete,decals,camisetas)
end)

RegisterNetEvent('arcadia_client:setPlayerClothing')
AddEventHandler('arcadia_client:setPlayerClothing', function(tipo,roupa)
    local roupa = roupa
    local tipo = tipo
    ARCADIA.setPlayerModel('mp_f_freemode_01')
    local playerPed = PlayerPedId()
    print("evento executado")
    print(tipo,roupa)
    SetPedComponentVariation(playerPed, tipo, roupa, 0, 0)
end)

--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(15000)
        print("update")
        TriggerEvent('arcadia_client:savePlayerOutfit')
    end
end)]]


--[[RegisterCommand('tpcds', function(source,args,raw)
    local x,y,z = tonumber(args[1]),tonumber(args[2]),tonumber(args[3])
    teleportCDS(x,y,z)
end)]]

RegisterCommand('mycds',function()
    local x,y,z = ARCADIA.getPlayerCoords()
    print(x," ",y," ",z)
end)

RegisterCommand('nuioff',function()
    TriggerEvent("ARCADIABANKUI:OFF", false)
end)

RegisterCommand('setmodel', function(source,args) setPlayerModel(args[1]) end)


--[[Citizen.CreateThread(function()
        local segundo = 1000*60
        local minuto = segundo * 1
        local idle = minuto
        while true do
            local outfit = ARCADIA.getOutfit()
            --TriggerServerEvent('receive:outfit', outfit)
            Citizen.Wait(idle)
        end
end)]]


