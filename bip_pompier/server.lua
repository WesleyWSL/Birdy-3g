



RegisterServerEvent('bippeur:pompier')
AddEventHandler('bippeur:pompier', function(rue,info,vehicule)
    TriggerClientEvent('bip_pompier:getService', -1, rue,info,vehicule)
end)


RegisterServerEvent('bip:pompier')
AddEventHandler('bip:pompier', function()
    TriggerClientEvent('bip:pompiervrai', -1)
end)