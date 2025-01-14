local QBCore = exports['qb-core']:GetCoreObject()

-- Tarkista kansion nimi
local correctFolderName = 'dextys_garage'
local scriptFolder = GetCurrentResourceName()

if scriptFolder ~= correctFolderName then
    print('Virhe: Kansion nimi ei ole oikea! Skripti ei toimi.')
    return
end

-- Tallenna ajoneuvo autotalliin
RegisterServerEvent('dextys_garage:storeVehicle')
AddEventHandler('dextys_garage:storeVehicle', function(plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid

    -- Tarkista, että ajoneuvo ei ole jo tallennettu tietokannassa
    MySQL.Async.fetchScalar('SELECT COUNT(*) FROM garage_slots WHERE citizenid = @citizenid AND plate = @plate', {
        ['@citizenid'] = citizenid,
        ['@plate'] = plate
    }, function(count)
        if count == 0 then
            -- Talletetaan ajoneuvo tietokantaan
            MySQL.Async.execute('INSERT INTO garage_slots (citizenid, plate) VALUES (@citizenid, @plate)', {
                ['@citizenid'] = citizenid,
                ['@plate'] = plate
            }, function()
                TriggerClientEvent('QBCore:Notify', src, "Ajoneuvo tallennettu autotalliin!", "success")
            end)
        else
            TriggerClientEvent('QBCore:Notify', src, "Ajoneuvo on jo tallennettuna autotallissa.", "error")
        end
    end)
end)

-- Hae pelaajan autotallissa olevat ajoneuvot
QBCore.Functions.CreateCallback('dextys_garage:getStoredVehicles', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player
