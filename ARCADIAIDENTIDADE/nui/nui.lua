RegisterNetEvent('arcadia_NUI:openId')
AddEventHandler('arcadia_NUI:openId', function(value,id,nome,sobrenome,job,cargo)
    SendNUIMessage(
        {
        type = "ui",
        display = value,
        id = id,
        nome = nome,
        sobrenome = sobrenome,
        job = job,
        cargo = cargo
        }
    )
end)

-- ,id,nome,sobrenome,job,cargo