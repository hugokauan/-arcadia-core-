Citizen.CreateThread(function()
    local isOpened = false
    while true do
        if IsControlJustReleased(0, 344) then
            if isOpened then
                TriggerServerEvent('arcadia_NUI:serverOpenId',false)
                isOpened = false
                print("false")
            else
                TriggerServerEvent('arcadia_NUI:serverOpenId',true)
                print('true')
                isOpened = true
            end
        end
        Citizen.Wait(1)
    end
end)