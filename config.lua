Config = {}

Config.CharacterSlots = 5

-- MAXIMUM 16 FOR BOTH
Config.FirstNameMaxCharacters = 15 -- Amount of characters you want to allow in a first name
Config.LastNameMaxCharacters = 15 -- Amount of characters you want to allow in a last name

Config.MinYear = 1960
Config.MaxYear = 2070

Config.StallTime = 2500 -- (in ms) -  If you ever for whatever reason have issues with data loss or the menu
-- updating showing faster than it's recieveing data, then increase this number. However, 1000 should be way more than fine for every single machine

Config.DisplayPageCounterOnMainMenu = false

Config.locale = 'en'

Config.locales = {}

Config.locales['en'] = {
    mainMenuLabel = "Select character",
    mainMenuDesc = "~b~CHARACTER MENU",
    selectChar = "Play character",
    selectCharDesc = "Play character ",
    deleteChar = "Delete character",
    deleteCharDesc = "Delete character ",
    createChar = "Create character",
    deleteCharConfTitle = "Confirm",
    deleteCharConfText = "Are you sure you want to delete ",
    deleteCharYes = "Yes",
    deleteCharNo = "No",
    deleteCharYesDesc = "Yes I have no idea what I'm doing",
    deleteCharNoDesc = "No I have no idea what I'm doing",
    createCharDesc = "Open create character form",
}
