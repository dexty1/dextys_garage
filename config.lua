Config = {}

-- Autotallit (7 sijaintia, jokaisella 4 koordinaattia luomaan neliön)
Config.GarageLocations = {
    { {x = 200.0, y = 200.0, z = 30.0}, {x = 220.0, y = 200.0, z = 30.0}, {x = 220.0, y = 220.0, z = 30.0}, {x = 200.0, y = 220.0, z = 30.0} },  -- Autotalli 1
    { {x = 300.0, y = 300.0, z = 30.0}, {x = 320.0, y = 300.0, z = 30.0}, {x = 320.0, y = 320.0, z = 30.0}, {x = 300.0, y = 320.0, z = 30.0} },  -- Autotalli 2
    { {x = 400.0, y = 400.0, z = 30.0}, {x = 420.0, y = 400.0, z = 30.0}, {x = 420.0, y = 420.0, z = 30.0}, {x = 400.0, y = 420.0, z = 30.0} },  -- Autotalli 3
    { {x = 500.0, y = 500.0, z = 30.0}, {x = 520.0, y = 500.0, z = 30.0}, {x = 520.0, y = 520.0, z = 30.0}, {x = 500.0, y = 520.0, z = 30.0} },  -- Autotalli 4
    { {x = 600.0, y = 600.0, z = 30.0}, {x = 620.0, y = 600.0, z = 30.0}, {x = 620.0, y = 620.0, z = 30.0}, {x = 600.0, y = 620.0, z = 30.0} },  -- Autotalli 5
    { {x = 700.0, y = 700.0, z = 30.0}, {x = 720.0, y = 700.0, z = 30.0}, {x = 720.0, y = 720.0, z = 30.0}, {x = 700.0, y = 720.0, z = 30.0} },  -- Autotalli 6
    { {x = 800.0, y = 800.0, z = 30.0}, {x = 820.0, y = 800.0, z = 30.0}, {x = 820.0, y = 820.0, z = 30.0}, {x = 800.0, y = 820.0, z = 30.0} },  -- Autotalli 7
}

-- Varikot (3 sijaintia, jokaisella 4 koordinaattia luomaan neliön)
Config.GarageSpots = {
    { {x = 1000.0, y = 1000.0, z = 30.0}, {x = 1020.0, y = 1000.0, z = 30.0}, {x = 1020.0, y = 1020.0, z = 30.0}, {x = 1000.0, y = 1020.0, z = 30.0} },  -- Varikko 1
    { {x = 1100.0, y = 1100.0, z = 30.0}, {x = 1120.0, y = 1100.0, z = 30.0}, {x = 1120.0, y = 1120.0, z = 30.0}, {x = 1100.0, y = 1120.0, z = 30.0} },  -- Varikko 2
    { {x = 1200.0, y = 1200.0, z = 30.0}, {x = 1220.0, y = 1200.0, z = 30.0}, {x = 1220.0, y = 1220.0, z = 30.0}, {x = 1200.0, y = 1220.0, z = 30.0} },  -- Varikko 3
}

-- Aikaraja ajoneuvojen hakemiselle varikolta autotallista ottamisen jälkeen (10 minuuttia)
Config.VehicleRetrieveCooldown = 600  -- 600 sekuntia eli 10 minuuttia

-- Korjausasetukset
Config.RepairEnabled = true
Config.RepairExteriorOnly = false  -- Vaihda false jos haluat myös moottorin korjaamisen
