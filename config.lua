Config = {}

-- Autotallin käytettävissä olevat sijainnit (4 koordinaattia jokaiseen sijaintiin, muodostavat neliön)
Config.GarageLocations = {
    {
        {x = 215.5, y = -804.5, z = 30.5},
        {x = 218.0, y = -802.0, z = 30.5},
        {x = 217.0, y = -806.0, z = 30.5},
        {x = 219.5, y = -804.0, z = 30.5}
    },
    {
        {x = 300.5, y = -550.3, z = 43.3},
        {x = 303.0, y = -552.5, z = 43.3},
        {x = 301.5, y = -556.0, z = 43.3},
        {x = 304.0, y = -554.5, z = 43.3}
    },
    {
        {x = -300.5, y = 2700.3, z = 43.2},
        {x = -303.0, y = 2702.0, z = 43.2},
        {x = -301.5, y = 2698.5, z = 43.2},
        {x = -303.5, y = 2701.0, z = 43.2}
    },
    {
        {x = -1100.1, y = -350.5, z = 37.5},
        {x = -1102.0, y = -352.0, z = 37.5},
        {x = -1101.5, y = -348.0, z = 37.5},
        {x = -1103.0, y = -350.5, z = 37.5}
    },
    {
        {x = 1500.2, y = -2000.1, z = 52.1},
        {x = 1503.0, y = -2002.0, z = 52.1},
        {x = 1501.5, y = -2003.5, z = 52.1},
        {x = 1504.0, y = -2001.0, z = 52.1}
    },
    {
        {x = -580.4, y = -780.3, z = 26.2},
        {x = -583.0, y = -782.0, z = 26.2},
        {x = -581.5, y = -778.5, z = 26.2},
        {x = -584.0, y = -780.0, z = 26.2}
    }
}

Config.StorageFee = 0 -- Autotalli on ilmainen
Config.RepairEnabled = true  -- Ota käyttöön ajoneuvon korjaaminen autotallissa
Config.RepairExteriorOnly = false -- Korjaa myös moottori, jos asetettu false
