Config = {}
Config.Coords = {
    vector3(2827.178955078125, -1320.1697998046875, 46.755672454833984),
}


Config.items = {
    ['unemployed'] = {
        {item = 'Bread',                       label = 'Bread',                price = 0.10, value = 'buy', autorise = 'unemployed', grade = 0},
        {item = 'Bread',                       label = 'Bread',                price = 0.10, value = 'sell', autorise = 'unemployed', grade = 0},
    },
    ['yourjob_2'] = {
        {item = 'Bread',                       label = 'Bread',                price = 0.10, value = 'buy', autorise = 'yourjob_1', grade = 1},
        {item = 'Bread',                       label = 'Bread',                price = 0.10, value = 'sell', autorise = 'yourjob_1', grade = 1},
    },
}