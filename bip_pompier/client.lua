ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)




RegisterNetEvent('bip_pompier:getService')
AddEventHandler('bip_pompier:getService', function(rue,info,vehicule) 
    if ESX.PlayerData.job and ESX.PlayerData.job.name == config.namejob then    

        SendNUIMessage({
            action = "showui2",
            vehicule = 'Vehicule : '..vehicule,
            rue = 'RUE : '..rue,    
            info = 'INFO : '..info,
            timer = config.time*1000
        })
    end
end)




RegisterNUICallback('buttone', function(value, cb)
    
    TriggerServerEvent("bippeur:pompier",value.ehehe,value.test,value.veh) 
    SetNuiFocus(false, false)

end)


RegisterNUICallback('crdeoss', function(value, cb)
    SetNuiFocus(false, false)
end)

function jsp()
    SendNUIMessage({
        action = "showui4",

    })
    SetNuiFocus(true, true)
end

Citizen.CreateThread(function()
    while true do
        if ESX.PlayerData.job.name == config.namejob then    
            local timer = 1000
            local coordsp = GetEntityCoords(PlayerPedId())
            local dist = Vdist(coordsp.x, coordsp.y, coordsp.z, config.pos.Menu.position.x, config.pos.Menu.position.y, config.pos.Menu.position.z)
            if dist <= 1.0 then
                timer = 1
                
                DrawMarker(6, config.pos.Menu.position.x, config.pos.Menu.position.y, config.pos.Menu.position.z-1.00, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.7, 0.7, 0.7, 0, 155, 255, 200, false, false, true, false, false, false, false, false)

                if IsControlJustPressed(1,51) then
                    Citizen.Wait(100)
                    jsp() 
                end
            end
            Citizen.Wait(timer)
        end
    end
end)