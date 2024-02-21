

RegisterNetEvent("ARCADIA:SETARARMA")
AddEventHandler("ARCADIA:SETARARMA", function(name, municao, delayTime)
    if delayTime == nil then
        delayTime = 0
    end

    Citizen.CreateThread(function()
        Wait(delayTime)
        local hash = GetHashKey(name)
        GiveWeaponToPed(GetPlayerPed(-1), hash, municao, 0, false)
    end)
end)

arsenal = {
    ["DP Principal"] = {
        ['x'] = 452.37,
        ['y'] = -980.17,
        ['z'] = 30.68
    }
}

vestiarios = {
    ['LS DP1'] = {
        ['x'] = 454.4,
        ['y'] = -988.4,
        ['z'] = 30.6
    }
}

--[[

[0] - cabeça
[1] - mascara
[2] - cabelo
[3] - maos
[4] - calças
[5] - mochilas
[6] - sapatos
[7] - acessórios
[8] - camiseta baixo/acessórios2
[9] - coletes
[10] - decals
[11] - camiseta 

]]

roupas = {
    female = {
        ["comandante"] = {
            [3] = 14,
            [4] = 77,
            [5] = 0,
            [6] = 24,
            [8] = 35,
            [9] = 13,
            [11] = 48
        }
    },
    male = {
        ["comandante"] = {

        }
    }
}

Citizen.CreateThread(function()
    local playerPed
    local marker
    local playerCoords
    local distancia
    local idle = 0
    while true do
        playerPed = PlayerPedId()
        playerCoords = GetEntityCoords(playerPed)
        for k,v in pairs(arsenal) do
            marker = vector3(v.x,v.y,v.z)
            distancia = #(playerCoords-marker)
            if distancia <= 5 then
                DrawMarker(23, v.x, v.y, v.z-0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 0, 0, 255, false, false, 0, false, nil, nil, 0)
                if IsControlJustReleased(0, 46) then
                    TriggerServerEvent('ARCADIA:SETARMAS')
                end
                idle = 0
            else
                idle = 100
            end
        end
        Citizen.Wait(idle)
    end
end)


Citizen.CreateThread(function()
    local playerPed
    local marker
    local playerCoords
    local distancia
    local playerOutfit, outfitTextures, props
    local oldClothes
    local oldTextures
    local idle = 0
    local gender
    local male
    local female
    local maleChar
    local femaleChar
    local isFardado = false
    while true do
        Citizen.Wait(idle)
        playerPed = PlayerPedId()
        playerCoords = GetEntityCoords(playerPed)
        for k,v in pairs(vestiarios) do
            marker = vector3(v.x, v.y, v.z)
            distancia = #(playerCoords-marker)
            if distancia <= 10 then
                if isFardado ~= true then
                    playerOutfit, outfitTextures, props = ARCADIA.getPlayerClothes()
                end
                if distancia <= 5 then
                    DrawMarker(23, v.x, v.y, v.z-0.9, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 0, 0, 255, false, false, 0, false, nil, nil, 0)
                    if IsControlJustReleased(0, 46) then
                        gender = IsPedMale(PlayerPedId())
                        
                        maleChar = GetHashKey("mp_m_freemode_01")
                        femaleChar = GetHashKey("mp_f_freemode_01")
                        --[[ IsPedModel(ped , modelHash )]]
                        if IsPedModel(playerPed, maleChar) then
                            male = true
                        elseif IsPedModel(playerPed, femaleChar) then
                            female = true
                        end
                        --[[if gender == true then
                            male = true
                        else
                            female = true
                        end]]
                        oldClothes = playerOutfit
                        oldTextures = outfitTextures
                        if isFardado then
                            for l,i in pairs(oldClothes) do
                            --for n,m in pairs(oldTextures) do
                                --print(oldTextures[l])
                                --playerPed = PlayerPedId()
                                SetEntityVisible(playerPed, false, 0)
                                SetPedComponentVariation(playerPed, l, i, oldTextures[l], 0)
                                Citizen.Wait(50)
                                SetEntityVisible(playerPed, true, 0)
                            --end
                            end
                            isFardado = false
                        else
                            isFardado = true
                            if male then
                                for _,i in pairs(roupas.male) do
                                    for h = 1,12 do
                                        if i[h] ~= 0 then
                                            
                                        end
                                    end
                                    --print(i)
                                end
                            elseif female then
                                for _,i in pairs(roupas.female) do
                                    for h = 1,12 do
                                        if i[h] then
                                            print(h ..":  "..i[h])
                                            SetPedComponentVariation(PlayerPedId(), h, i[h], 0, 0)
                                        end
                                    end
                                end
                            else
                                print("gênero não identificado")
                            end
                        end
                    end
                    idle = 0
                end
            else
                idle = 100
            end
        end
    end
end)