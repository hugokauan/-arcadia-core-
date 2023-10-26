RegisterNetEvent('arcadia:openGarageUI')
AddEventHandler('arcadia:openGarageUI', function()
    SetNuiFocus(true, true)
    SendNUIMessage(
        {
            type = "GarageUI",
            display = true
        }
    )
end)

RegisterNetEvent('arcadia:closeGarageUI')
AddEventHandler('arcadia:closeGarageUI', function()
    SetNuiFocus(false, false)
    SendNUIMessage(
        {
            type = "GarageUI",
            display = false
        }
    )
end)

RegisterNUICallback('close', function(data)
    TriggerEvent('arcadia:closeGarageUI')
end)

