RegisterNetEvent('ARCADIACLIENT:NOTIFICACAO')
AddEventHandler('ARCADIACLIENT:NOTIFICACAO', function(menssagem)
    local msg = menssagem
    SendNUIMessage(
    {
        display = true,
        type = "notify",
        message = msg   
    }
    )
    Citizen.Wait(3000)
    SendNUIMessage(
    {
        display = false,
        type = "notify"
    }
    )
end)