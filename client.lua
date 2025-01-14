local QBCore = exports['qb-core']:GetCoreObject()

-- Tarkista kansion nimi
local correctFolderName = 'dextys_garage'
local scriptFolder = GetCurrentResourceName()

if scriptFolder ~= correctFolderName then
    print('Virhe: Kansion nimi ei ole oikea! Skripti ei toimi.')
    return
end

-- Korjaa ajoneuvo (ulkoisesti tai moottorin kanssa)
function RepairVehicle(vehicle)
    if Config.RepairEnabled then
        if Config.RepairExteriorOnly then
            SetVehicleBodyHealth(vehicle, 1000.0)  -- Korjaa vain ulkokuori
        else
            SetVehicleBodyHealth(vehicle, 1000.0)  -- Korjaa ulkokuoren
            SetVehicleEngineHealth(vehicle, 1000.0)  -- Korjaa myös moottori
            SetVehicleEngineOn(vehicle, true, true, true)  -- Käynnistää moottorin uudelleen, jos se oli rikki
        end
        QBCore.Functions.Notify("Ajoneuvo on korjattu!", "success")
    end
end

-- Näytä autotallin valikko (radial menu)
function OpenGarageMenu()
    QBCore.Functions.TriggerCallback('dextys_garage:getStoredVehicles', function(vehicles)
        local elements = {}

        if #vehicles > 0 then
            for _, vehicle in ipairs(vehicles) do
                table.insert(elements, {label = "Ajoneuvo: " .. vehicle.plate, value = vehicle.plate})
            end

            TriggerEvent('qb-menu:client:openMenu', elements, function(data, menu)
                if data[1].value then
                    -- Lähetä ajoneuvon noutopyyntö serverille
                    TriggerServerEvent('dextys_garage:retrieveVehicle', data[1].value)
                end
            end)
        else
            QBCore.Functions.Notify("Ei ajoneuvoja tallennettuna autotallissa.", "error")
        end
    end)
end

-- Talleta ajoneuvo autotalliin
function StoreVehicleInGarage()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local plate = GetVehicleNumberPlateText(vehicle)

    if vehicle and plate then
        -- Korjaa ajoneuvo ennen tallentamista
        RepairVehicle(vehicle)
        
        -- Lähetä ajoneuvo serverille talletettavaksi
        TriggerServerEvent('dextys_garage:storeVehicle', plate)
        QBCore.Functions.Notify("Ajoneuvo talletettu autotalliin!", "success")
    else
        QBCore.Functions.Notify("Ei ajoneuvoa lähettyvillä", "error")
    end
end

-- Näytä autotalli valikko pelaajalle
Citizen.CreateThread(function()
    for _, garageCoords in ipairs(Config.GarageLocations) do
        -- Asetetaan blip autotalliin
        local blip = AddBlipForCoord((garageCoords[1].x + garageCoords[3].x) / 2, (garageCoords[1].y + garageCoords[3].y) / 2, (garageCoords[1].z + garageCoords[3].z) / 2)
        SetBlipSprite(blip, 357)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 2)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Autotalli")
        EndTextCommandSetBlipName(blip)

        -- Luodaan triggeri, joka aktivoituu kun pelaaja menee autotallin alueelle
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)
                if IsPlayerInGarageZone(garageCoords) then
                    DrawText3D((garageCoords[1].x + garageCoords[3].x) / 2, (garageCoords[1].y + garageCoords[3].y) / 2, (garageCoords[1].z + garageCoords[3].z) / 2, "[E] Avaa autotalli")
                    if IsControlJustPressed(0, 38) then -- E-näppäin
                        OpenGarageMenu()
                    end
                end
            end
        end)
    end
end)

-- Tekstin piirtäminen maailmaan
function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText3DHelper(x, y, z)
end

function DrawText3DHelper(x, y, z)
    local p = GetEntityCoords(PlayerPedId())
    local offsetX, offsetY = 0.0, 0.0
    local screenX, screenY = World3dToScreen2d(x, y, z)
    SetDrawOrigin(screenX, screenY, 0)
end
