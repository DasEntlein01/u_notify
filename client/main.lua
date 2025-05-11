HUD = {
    Sounds = {
        ["Notify"] = {
            mp3 = true,   -- false to use gta sounds
            url = "https://dasentlein.isfucking.pro/qydEe1.mp3",
            volume = 0.5, -- Works perfectly fine!
            gta = {
                audioName = "ATM_WINDOW",
                audioRef = "HUD_FRONTEND_DEFAULT_SOUNDSET"
            }
        },
    },
}

RegisterNetEvent('u_notify:notify', function(type, msg, time)
    SendNUIMessage({
        action = "AddNotification",
        type = type,
        message = msg,
        timeout = time,
    })

    if HUD.Sounds["Notify"].mp3 then
        SendNUIMessage({
            action = "playSound",
            sound = {
              url = HUD.Sounds["Notify"].url,
              volume = HUD.Sounds["Notify"].volume
            }
          })
      else
        PlaySoundFrontend(-1, HUD.Sounds["Notify"].gta.audioName, HUD.Sounds["Notify"].gta.audioRef, 1)
      end
end)


RegisterCommand("testnotify", function()
    
    
    TriggerEvent("u_notify:notify", "info", "Hallo dies ist ein Test :)", 8000)
    TriggerEvent("u_notify:notify", "error", "Hallo dies ist ein Test :)", 8000)
    TriggerEvent("u_notify:notify", "warning", "Hallo dies ist ein Test :)", 8000)


end, false)