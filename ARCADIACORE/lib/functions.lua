ARCADIA = {}

exports('getData',function()
    return ARCADIA
end)
---------------------------------------------------- Essentials -------------------------------------------------

function ARCADIA.stringsplit (inputstr, sep)
	if sep == nil then
			sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			table.insert(t, str)
	end
	return t
end

function ARCADIA.tableCounter(table)
    local i = 0
    for k,v in pairs(table) do
        i = i + 1
    end
    return i
end

---------------------------------------------------- CLIENT FUNCTIONS -------------------------------------------------
function ARCADIA.getPlayerCoords()
    x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
    return x,y,z
end

function ARCADIA.createBlip(x,y,z,sprite,scale,color,name)
    local blip = AddBlipForCoord(x, y, z)
			SetBlipSprite(blip, sprite)
			SetBlipDisplay(blip, 4)
			SetBlipScale(blip,scale)
			SetBlipColour(blip,color)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(name)
			EndTextCommandSetBlipName(blip)
end

function ARCADIA.teleportCDS(x,y,z)
	local zC = GetGroundZFor_3dCoord(x, y, z, true)
	local player = PlayerPedId()
	print(x,y,z)
	SetEntityCoords(player, x, y, zC, false, false, false, false)
end

function ARCADIA.settimer(tempo)
	local segundo = 1000
	while tempo > 0 do 
		tempo = tempo - 1
		Citizen.Wait(segundo)
		print(tempo)
	end
end


---------------------------------------------------- Spawn Manager -------------------------------------------------
function ARCADIA.getPlayerLastPos()
	local x,y,z = ARCADIA.getPlayerCoords()
    return x,y,z
end


---------------------------------------------------- SERVER FUNCTIONS -------------------------------------------------
function ARCADIA.getSteamId(source)
    local playerSrc = source
    local ids = GetPlayerIdentifiers(playerSrc)
    local steamID
    for k,v in pairs(ids) do
        if string.match(v,'steam:') then
            steamID = v
        end
    end
    return steamID
end


function ARCADIA.getPlayerId(source)
    local id
    local playerSrc = source
    local steamId = ARCADIA.getSteamId(playerSrc)
    id =  MySQL.prepare.await('SELECT id FROM players WHERE steamid = ?', {steamId})
    return id
end

function ARCADIA.getSteamIdFromId(idReq)
    local sid
    local idR = tonumber(idReq)
    sid =  MySQL.prepare.await('SELECT steamid FROM players WHERE id = ?', {idR})
    if sid then 
        return sid
    else
        print("^2[ARCADIACORE]^3(AVISO) id [".. idR .."] requirido não existe em nossa base de dados")
    end
    return nil
end

function ARCADIA.GetAllPlayers()
    local players = GetPlayers()
    return players
end

function ARCADIA.GetSource(identifier)
    local players = {}
    players = ARCADIA.GetAllPlayers()
    if identifier then
        for j, src in pairs(players) do
            local idens = GetPlayerIdentifiers(src)
            for _, id in pairs(idens) do
                if identifier == id then
                    return src
                end
            end
        end
    end
    return 0
end



--[[function ARCADIA.GetPlayerSource(steamId)
    local players = {}
    local players = GetAllPlayers()
    for _, playerId in ipairs(players) do
        local identifiers = GetPlayerIdentifiers(playerId)

        for _, identifier in ipairs(identifiers) do
            if string.find(identifier, "steam:") and string.sub(identifier, 7) == steamId then
                return playerId
            end
        end
    end

    return 0
end]] --COMENTADO POIS NÃO FUNCIONA

---------------------------------------------------- ARCADIA GROUPS ------------------------------------------------


function ARCADIA.getPlayerGroup(player)
	local grupo
    local id = ARCADIA.getPlayerId(player)
	grupo = MySQL.scalar.await('SELECT grupo FROM players_data WHERE id = ?', {id})
	return grupo
end

function ARCADIA.getPlayerOrg(player)
	local org
    local id = ARCADIA.getPlayerId(player)
	org = MySQL.scalar.await('SELECT organizacao FROM players_data WHERE id = ?', {id})
	return org
end

function ARCADIA.hasPermission(source,permission)
    local temPermissao
    local permissao = tostring(permission)
    local pgroup = ARCADIA.getPlayerGroup(source)
    local groups = config.groups
    local grupo
    for k,v in pairs(config.groups) do
        if pgroup == k then
            for _,i in pairs(v) do
                if tostring(i) == tostring(permission) then
                    temPermissao = true
                else
                    temPermissao = false
                end
            end
        end
    end
    return temPermissao
end


---------------------------------------------------- ARCADIA GROUPS ------------------------------------------------







---------------------------------------------------- FUNÇÕES DE ENTIDADES ------------------------------------------------

-- Função para encontrar o veículo mais próximo
function ARCADIA.GetClosestVehicle()
    -- Armazena a posição atual do jogador
    local playerCoords = GetEntityCoords(PlayerPedId(), true)
    local vehicles = GetGamePool('CVehicle')

    -- Armazena a distância mínima encontrada até agora
    local minDistance = 100000.0

    -- Percorre todos os veículos na cena
    for _, vehicle in pairs(vehicles) do
        -- Armazena as coordenadas do veículo atual
        local vehicleCoords = GetEntityCoords(vehicle, true)

        -- Calcula a distância entre o jogador e o veículo
        local distance = #(playerCoords - vehicleCoords)

        -- Verifica se a distância atual é menor que a distância mínima encontrada até agora
        if distance < minDistance then
            -- Atualiza a distância mínima e o ID do veículo mais próximo
            minDistance = distance
            closestVehicle = vehicle
        end
    end

    -- Retorna o ID do veículo mais próximo
    return closestVehicle
end

-- Função para colocar o jogador no veículo mais próximo
function ARCADIA.PutPlayerInClosestVehicle()
    -- Chama a função para encontrar o veículo mais próximo
    closestVehicle = ARCADIA.GetClosestVehicle()

    -- Verifica se há um veículo próximo
    if closestVehicle ~= nil then
        -- Coloca o jogador no veículo mais próximo
        SetPedIntoVehicle(PlayerPedId(), closestVehicle, -1)
    else
        -- Exibe uma mensagem de erro caso não haja um veículo próximo
        ShowNotification("Não há nenhum veículo próximo.")
    end
end


-- CLIENT
function ARCADIA.setPlayerModel(model)
    local modelo = GetHashKey(model)
    local playerPed
    --if IsModelInCdimage(modelo) and IsModelValid(modelo) then
        RequestModel(modelo)
        while not HasModelLoaded(modelo) do
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), modelo)
        playerPed = PlayerPedId()
        SetPedDefaultComponentVariation(playerPed)
        SetModelAsNoLongerNeeded(modelo)
    --end
end

---------------------------------------------------- ARCADIA ADMIN ------------------------------------------------

function ARCADIA.banPlayer(id)
    local id = id
    local ban = 1
    MySQL.update('UPDATE players SET banned = ? WHERE id = ?', {ban, id}, function(affectedRows)
        if affectedRows then
            print(affectedRows)
        end
    end)
end

function ARCADIA.kickplayer(id)
    DropPlayer(id, "Você foi expulso do servidor")
end

function ARCADIA.isPlayerBanned(source)
    local isBanned
    local id = ARCADIA.getPlayerId(source)
    local banned = MySQL.prepare.await('SELECT banned FROM players WHERE id = ?', {id})
    if banned == 0 then
        isBanned = false
    else
        isBanned = true
    end
    return isBanned
end

function ARCADIA.wlPlayer(id)
    local id = id
    MySQL.Async.execute('UPDATE players SET whitelist = ? WHERE id = ? ', {1, id}, function(affectedRows)
        if affectedRows then
            print(affectedRows)
        end
    end)
end

function ARCADIA.unwlPlayer(id)
    local id = id
    MySQL.Async.execute('UPDATE players SET whitelist = ? WHERE id = ? ', {0, id}, function(affectedRows)
        if affectedRows then
            print(affectedRows)
        end
    end)
end

function ARCADIA.isPlayerWl(source)
    local isWl
    local id = ARCADIA.getPlayerId(source)
    local wl = MySQL.prepare.await('SELECT whitelist FROM players WHERE id = ?', {id})
    if wl == 0 then
        isWl = false
    else
        isWl = true
    end
    return isWl
end

function ARCADIA.teleportWay()
    --[[local ped = PlayerPedId()
    local blip = GetFirstBlipInfoId(8)
    print("função trigada")]]
    --[[if ped then
        print("ped encontrado")
        if blip then
            print("waypoint existe")
            local coords = GetBlipInfoIdCoord(blip)
            print(coords)
            local x,y,z = table.unpack(coords)
            local isGrounded,groundZ
            for i = 0, 1000,1 do
                Citizen.Wait(5)
                print(x,y,z, groundZ,i)
                if GetGroundZFor_3dCoord(x, y, ToFloat(i), false) then
                    print("ground found")
                    z = ToFloat(i)
                    print(z)
                    SetEntityCoords(ped, x, y, z, 0, 0, 0, false)
                    break
                end
                print("teleportado")
            end
        end
    end]]
    local waypointBlip = GetFirstBlipInfoId(GetWaypointBlipEnumId())
	local blipPos = GetBlipInfoIdCoord(waypointBlip) -- GetGpsWaypointRouteEnd(false, 0, 0)

	local z = GetHeightmapTopZForPosition(blipPos.x, blipPos.y)
	local _, gz = GetGroundZFor_3dCoord(blipPos.x, blipPos.y, z, true)

	SetEntityCoords(PlayerPedId(), blipPos.x, blipPos.y, z, true, false, false, false)
	FreezeEntityPosition(PlayerPedId(), true)

	repeat
		Citizen.Wait(50)
		_, gz = GetGroundZFor_3dCoord(blipPos.x, blipPos.y, z, true)
	until gz ~= 0

	SetEntityCoords(PlayerPedId(), blipPos.x, blipPos.y, gz, true, false, false, false)
	FreezeEntityPosition(PlayerPedId(), false)
end




---------- CLIENT

function ARCADIA.getOutfit()
    local playerPed = PlayerPedId()
    local playerOutfit = {}
    local savedOutfit
    for i = 0,11 do
        playerOutfit[i]= {
            drawable = GetPedDrawableVariation(playerPed, i),
            texture = GetPedTextureVariation(playerPed, i)
        }
    end
    savedOutfit = json.encode(playerOutfit)
    return savedOutfit
end

function ARCADIA.getPlayerClothes()
    local playerPed = PlayerPedId()
    local clothes = {}
    local textures = {}
    local props = {}

    for i = 0, 12 do
        clothes[i] = GetPedDrawableVariation(playerPed, i)
        textures[i] = GetPedTextureVariation(playerPed, i)
        props[i] = GetPedPropIndex(playerPed, i)
    end

    return clothes, textures, props
end

----------


--[[FUNÇÕES BANCO]]
function ARCADIA.adddinheiro(id,quantidade)
    local dinheiro = MySQL.prepare.await('SELECT dinheiro FROM players_data WHERE id = ?', {id})
    local saldofinal = dinheiro+quantidade
    MySQL.Async.execute('UPDATE players_data SET dinheiro = ? WHERE id = ? ', {saldofinal, id}, function(affectedRows)
        if affectedRows then
            print(affectedRows)
        end
    end)
end

function ARCADIA.remdinheiro(id,quantidade)
    local dinheiro = MySQL.prepare.await('SELECT dinheiro FROM players_data WHERE id = ?', {id})
    local saldofinal = dinheiro - quantidade
    MySQL.Async.execute('UPDATE players_data SET dinheiro = ? WHERE id = ? ', {saldofinal, id}, function(affectedRows)
        if affectedRows then
            print(affectedRows)
        end
    end)
end

function ARCADIA.addbanco(id,quantidade)
    local bancosaldo = MySQL.prepare.await('SELECT banco FROM players_data WHERE id = ?', {id})
    local saldofinal = bancosaldo+quantidade
    MySQL.Async.execute('UPDATE players_data SET banco = ? WHERE id = ? ', {saldofinal, id}, function(affectedRows)
        if affectedRows then
            print(affectedRows)
        end
    end)
end

function ARCADIA.rembanco(id,quantidade)
    local bancosaldo = MySQL.prepare.await('SELECT banco FROM players_data WHERE id = ?', {id})
    local saldofinal = bancosaldo-quantidade
    MySQL.Async.execute('UPDATE players_data SET banco = ? WHERE id = ? ', {saldofinal, id}, function(affectedRows)
        if affectedRows then
            print(affectedRows)
        end
    end)
end

function ARCADIA.getPlayerMoney(id)
    local dinheiro = MySQL.prepare.await('SELECT dinheiro FROM players_data WHERE id = ?', {id})
    return dinheiro
end

function ARCADIA.getPlayerBanco(id)
    local saldo = MySQL.prepare.await('SELECT banco FROM players_data WHERE id = ?', {id})
    return saldo
end

function ARCADIA.sendwebhookmessage(wh,msg)
    local whLink = wh
    local data = {
        username = "ARCADIACORE",
        content = msg,
        avatar_url = nil
    }
    PerformHttpRequest(whLink, function(err,text,headers)end, 'POST', json.encode(data), {['Content-Type']= 'application/json'})
end


--- GARAGE FUNCTIONS


function ARCADIA.getCars(id)
    local pId = id
    local cars
    local c
    cars = MySQL.prepare.await('SELECT veiculo FROM player_vehicles WHERE id = ?', {pId})
        --print(cars)
            for i=1, #cars do
                local car = cars[i]
                --print(car)
                for k,v in pairs(car) do
                    --print(v)
                    c = v
                    return car
                end
            end
            --print("^2[ARCADIACORE]^3(AVISO) Você não inseriu o player id na função")
end

function ARCADIA.isJob(source,job)
    local playerJob
    local id = ARCADIA.getPlayerId(source)
	playerJob = MySQL.scalar.await('SELECT trabalho FROM players_data WHERE id = ?', {id})
    if tostring(playerJob) == tostring(job) then
	    return true
    else
        return false
    end
end

function ARCADIA.isCargo(source, cargo)
    local playerCargo
    local id = ARCADIA.getPlayerId(source)
	playerCargo = MySQL.scalar.await('SELECT cargo FROM players_data WHERE id = ?', {id})
    if tostring(playerCargo) == tostring(cargo) then
	    return true
    else
        return false
    end
end