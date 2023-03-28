Citizen.CreateThread(function()
        for k,v in pairs(blips) do
            createBlip(v.x,v.y,v.z,v.sprite,v.scale,v.color,v.name)
            Citizen.Wait(100)
        end
end)