
---------------------------------------------------- Essentials -------------------------------------------------

function stringsplit (inputstr, sep)
	if sep == nil then
			sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			table.insert(t, str)
	end
	return t
end

function tableCounter(table)
    local i = 0
    for k,v in pairs(table) do
        i = i + 1
    end
    return i
end

---------------------------------------------------- CLIENT FUNCTIONS -------------------------------------------------
function getPlayerCoords()
    x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
    return x,y,z
end

function createBlip(x,y,z,sprite,scale,color,name)
    local blip = AddBlipForCoord(x, y, z)
			SetBlipSprite(blip, sprite)
			SetBlipDisplay(blip, 4)
			SetBlipScale(blip,scale)
			SetBlipColour(blip,color)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(name)
			EndTextCommandSetBlipName(blip)
end

function teleportCDS(x,y,z)
	local zC = GetGroundZFor_3dCoord(x, y, z, true)
	local player = PlayerPedId()
	print(x,y,z)
	SetEntityCoords(player, x, y, zC, false, false, false, false)
end

function settimer(tempo)
	local segundo = 1000
	while tempo > 0 do 
		tempo = tempo - 1
		Citizen.Wait(segundo)
		print(tempo)
	end
end


---------------------------------------------------- Spawn Manager -------------------------------------------------
function getPlayerLastPos()
	local x,y,z = getPlayerCoords()
    return x,y,z
end


---------------------------------------------------- SERVER FUNCTIONS -------------------------------------------------



function getSteamId(source)
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

function getSteamIdFromId(idReq)
    local idR = idReq
    local id
    id =  MySQL.scalar.await('SELECT steamid FROM players WHERE id = ?', {idR})
    return id
end

function getPlayerId(source)
    local id
    local playerSrc = source
    local steamId = getSteamId(playerSrc)
    id =  MySQL.scalar.await('SELECT id FROM players WHERE steamid = ?', {steamId})
    return id
end

---------------------------------------------------- ARCADIA GROUPS ------------------------------------------------


function getPlayerGroup(player)
	local grupo
	local playerids = GetPlayerIdentifiers(player)
    local id = getPlayerId(player)
	grupo = MySQL.scalar.await('SELECT grupo FROM players_data WHERE id = ?', {id})
	return grupo
end

function getPlayerOrg(player)
	local org
	local playerids = GetPlayerIdentifiers(player)
    local id = getPlayerId(player)
	org = MySQL.scalar.await('SELECT organizacao FROM players_data WHERE id = ?', {id})
	return org
end

function hasPermission(source,permission)
    local temPermissao
    local permissao = tostring(permission)
    local pgroup  = getPlayerGroup(source)
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
function GetClosestVehicle()
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
function PutPlayerInClosestVehicle()
    -- Chama a função para encontrar o veículo mais próximo
    closestVehicle = GetClosestVehicle()

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
function setPlayerModel(model)
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

function banPlayer(id)
    MySQL.Async.execute('UPDATE players SET banned = ? WHERE id = ? ', {1, id}, function(affectedRows)
        if affectedRows then
            print(affectedRows)
        end
    end)
end

function isPlayerBanned(source)
    local isBanned
    local id = getPlayerId(source)
    local banned = MySQL.prepare.await('SELECT banned FROM players WHERE id = ?', {id})
    if banned == 0 then
        isBanned = false
    else
        isBanned = true
    end
    return isBanned
end

function wlPlayer(id)
    MySQL.Async.execute('UPDATE players SET whitelist = ? WHERE id = ? ', {1, id}, function(affectedRows)
        if affectedRows then
            print(affectedRows)
        end
    end)
end

function isPlayerWl(source)
    local isWl
    local id = getPlayerId(source)
    local wl = MySQL.prepare.await('SELECT whitelist FROM players WHERE id = ?', {id})
    if wl == 0 then
        isWl = false
    else
        isWl = true
    end
    return isWl
end

function teleportWay()
end

function enviarMsgDiscordWh(webhookLink,menssagem)
    local whLink = webhook
    local data = {
        ['conteudo'] = menssagem
    }
    PerformHttpRequest(whLink, function(err,text,headers)end, 'POST', json.encode(data), {['Content-Type']= 'application/json'})
end



---------- CLIENT

function getOutfit(source)
    local playerPed = GetPlayerPed(-1)
    local playerOutfit = {}

    for i = 0,11 do
        playerOutfit[i]= {
            drawable = GetPedDrawableVariation(playerPed, i),
            texture = GetPedTextureVariation(playerPed, i)
        }
    end

    return json.encode(playerOutfit)
end

----------