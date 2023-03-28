local display = false

RegisterNetEvent("ARCADIABANKUI:ON")
RegisterNetEvent("ARCADIABANKUI:OFF")
RegisterNetEvent("ARCADIABANK:SENDSALDO")

AddEventHandler("ARCADIABANKUI:ON", function(value)
    SetNuiFocus(value, value)
    SendNUIMessage(
        {
        type = "ui",
        display = value
        }
    )
    TriggerServerEvent('ARCADIASERVER:SALDO')
end)

AddEventHandler("ARCADIABANKUI:OFF", function(value)
    SetNuiFocus(value, value)
    SendNUIMessage({
        type = "ui",
        display = value
    })
end)

AddEventHandler('ARCADIABANK:SENDSALDO', function(value)
    SendNUIMessage({
        valor = value
    })
end)



RegisterNUICallback('sair', function(data)
    TriggerEvent('ARCADIABANKUI:OFF', false)
end)

RegisterNUICallback('saldo', function(data)
end)

RegisterNUICallback('sacar', function(data)
    local valorsaque = data.valorsaque
    TriggerServerEvent('ARCADIASERVER:SAQUE', valorsaque)
    TriggerEvent('ARCADIABANKUI:OFF', false)
end)
RegisterNUICallback('deposito', function(data)
    local valordeposito = data.valordeposito
    TriggerServerEvent('ARCADIASERVER:DEPOSITO', valordeposito)
    TriggerEvent('ARCADIABANKUI:OFF', false)
end)



--[[RegisterCommand("uioff", function(source)
    TriggerEvent("ARCADIABANKUI:OFF",false)
end)
RegisterCommand("uion", function(source)
    TriggerEvent("ARCADIABANKUI:ON",true)
end)]]