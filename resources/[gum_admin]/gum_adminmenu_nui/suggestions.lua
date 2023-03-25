TriggerEvent('chat:addSuggestion', '/report', 'Nahlásí správcům chybu či hráče.', {
    { name="Nadpis", help="Jednodnotný nadpis problému." },
    { name="Popis", help="Popis problému." },
})

TriggerEvent('chat:addSuggestion', '/admin', 'Otevře adminmenu', {
})

TriggerEvent('chat:addSuggestion', '/spectate', 'Spectate hráče', {
    { name="ID", help="Herní ID hráče" },
})

TriggerEvent('chat:addSuggestion', '/revive', 'Oživení hráče', {
    { name="ID", help="Herní ID hráče" },
})
TriggerEvent('chat:addSuggestion', '/revive', 'Oživení hráče', {
    { name="ID", help="Herní ID hráče" },
})
TriggerEvent('chat:addSuggestion', '/n', 'No clip', {
})
TriggerEvent('chat:addSuggestion', '/tpw', 'Teleport na označené místo na mapě', {
})
TriggerEvent('chat:addSuggestion', '/tpc', 'Teleport na souřadnice', {
    { name="X", help="X souřadnice" },
    { name="Y", help="Y souřadnice" },
    { name="Z", help="Z souřadnice" },
})
TriggerEvent('chat:addSuggestion', '/tpb', 'Teleport zpět na místo', {
})

TriggerEvent('chat:addSuggestion', '/giveitem', 'Darování předmětu', {
    { name="ID", help="ID hráče" },
    { name="ID", help="ID předmětu" },
    { name="Count", help="Kolik jich chceš dát" },
})
TriggerEvent('chat:addSuggestion', '/giveweapon', 'Darování zbraně', {
    { name="ID", help="ID hráče" },
    { name="Hash", help="Hash name zbraně" },
})
TriggerEvent('chat:addSuggestion', '/givemoney', 'Darování peněz', {
    { name="ID", help="ID hráče" },
    { name="ID", help="Kolik" },
})
TriggerEvent('chat:addSuggestion', '/givegold', 'Darování zlata', {
    { name="ID", help="ID hráče" },
    { name="ID", help="Kolik" },
})
TriggerEvent('chat:addSuggestion', '/changeped', 'Změna tvé postavy v peda', {
    { name="Ped hash", help="Hash name pro peda" },
})
TriggerEvent('chat:addSuggestion', '/kick', 'Vyhodí hráče ze serveru.', {
    { name="ID", help="ID hráče" },
    { name="Důvod", help="Důvod vykopnutí" },
})
TriggerEvent('chat:addSuggestion', '/tpp', 'Teleport na hráče.', {
    { name="ID", help="ID" },
})
TriggerEvent('chat:addSuggestion', '/bring', 'Teleport hráče k sobě.', {
    { name="ID", help="ID" },
})

TriggerEvent('chat:addSuggestion', '/addwl', 'Dá hráče na whitelist', {
    { name="Hash", help="Hash se udává bez steam:" },
})

TriggerEvent('chat:addSuggestion', '/setjob', 'Dá hráči určenou práci', {
    { name="ID", help="ID Hráče" },
    { name="Job", help="ID Práce" },
    { name="Grade", help="Hodnost práce" },
})
TriggerEvent('chat:addSuggestion', '/setchar', 'Dá hráči možnost hrát za více postav', {
    { name="Hex", help="steam hex bez steam:" },
    { name="Kolik", help="Kolik postav může hráč vlastnit" },
})
TriggerEvent('chat:addSuggestion', '/delchar', 'Smazání postavy', {
    { name="CharID", help="Character ID" },
})
