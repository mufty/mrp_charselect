MRP = nil
Citizen.CreateThread(function()
    while MRP == nil do
        Citizen.Wait(0)
        TriggerEvent('mrp:getSharedObject', function(obj) MRP = obj end)
    end
end)

-- Once player has connected, run the event
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if NetworkIsPlayerActive(PlayerId()) and MRP ~= nil then
            TriggerEvent('mrp:characters')
            break
        end
    end
end)

RegisterNetEvent('mrp:client:fetchCharacters')
AddEventHandler('mrp:client:fetchCharacters', function(playerCharacters)
    CharacterMenu(playerCharacters)
end)

RegisterNetEvent('mrp:spawn')
AddEventHandler('mrp:spawn', function(characterToUse, spawnPoint)
    mainMenu:Visible(false)
    _menuPool:CloseAllMenus()
end)

RegisterNetEvent('mrp:characters')
AddEventHandler('mrp:characters', function()
    TriggerServerEvent('mrp:fetchCharacters', GetPlayerServerId(PlayerId()))
end)

locale = Config.locales[Config.locale]

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu(locale.mainMenuLabel, locale.mainMenuDesc)
_menuPool:Add(mainMenu)

function CharacterMenu(characters)
    for k, char in pairs(characters) do
        local submenu = _menuPool:AddSubMenu(mainMenu, char.name .. " " .. char.surname)
        local selectChar = NativeUI.CreateItem(locale.selectChar, locale.selectCharDesc .. char.name .. " " .. char.surname)
        submenu:AddItem(selectChar)
        local deleteChar = _menuPool:AddSubMenu(submenu, locale.deleteChar)
        local delCharYes = NativeUI.CreateItem(locale.deleteCharYes, locale.deleteCharYesDesc)
        local delCharNo = NativeUI.CreateItem(locale.deleteCharNo, locale.deleteCharNoDesc)
        deleteChar:AddItem(delCharNo)
        deleteChar:AddItem(delCharYes)
        
        submenu.OnItemSelect = function(sender, item, index)
            if item == selectChar then
                TriggerServerEvent('mrp:useCharacter', GetPlayerServerId(PlayerId()), char)
            end
        end
        
        deleteChar.OnItemSelect = function(sender, item, index)
            if item == delCharYes  then
                TriggerServerEvent('mrp:deleteCharacter', GetPlayerServerId(PlayerId()), char._id)
            elseif item == delCharNo then
                deleteChar:GoBack()
            end
        end
    end
    
    local createSubmenu = NativeUI.CreateItem(locale.createChar, locale.createCharDesc)
    mainMenu:AddItem(createSubmenu)
    mainMenu.OnItemSelect = function(sender, item, index)
        if item == createSubmenu then
            SetNuiFocus(true, true)
            SendNUIMessage({
                type = 'show'
            })
        end
    end
    
    _menuPool:RefreshIndex()
    mainMenu:Visible(true)
end

RegisterNUICallback('cancel', function(data, cb)
    SetNuiFocus(false, false)
    cb()
end)

RegisterNUICallback('submit', function(data, cb)
    SetNuiFocus(false, false)
    cb()
    TriggerServerEvent('mrp:createCharacter', GetPlayerServerId(PlayerId()), data)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
    end
end)
