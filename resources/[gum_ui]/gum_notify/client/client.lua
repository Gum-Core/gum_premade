
RegisterNetEvent('gum_notify:notify')
AddEventHandler('gum_notify:notify', function(title, subtext, icon, duration)
    show_notification(true, title, subtext, icon, duration)
end)

exports('DisplayLeftNotification', function(title, subtext, icon, duration)
    show_notification(true, title, subtext, icon, duration)
end)

function show_notification(bool, title_text, subtext_text, icon_text, duration)
    SendNUIMessage({type = "notify",status = bool,title = title_text,text = subtext_text,id = icon_text})
    Citizen.Wait(tonumber(duration))
    delete_show_notification(false)
end

function delete_show_notification(bool)
    SendNUIMessage({type = "notify",status = bool})
end


