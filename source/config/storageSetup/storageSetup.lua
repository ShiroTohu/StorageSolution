package.path = package.path .. ";../?.lua"

-- Import the module
local clear = require("clear")
local optionMenu = require("optionMenu")

local Storage = {}

function Storage:new()
    inventoryPeripherals = self:getInventoryPeripherals()
    local instance = { }
    setmetatable(instance, self)
    self.__index = self
    return instance
end

function Storage:getInventoryPeripherals()
    inventoryPeripherals = {}

    local peripherals = peripheral.getNames()
    for key, value in pairs(peripherals) do
        local primaryType, secondaryType = peripheral.getType(value)
        if secondaryType == "inventory" then
            print(value .. ',')
            table.insert(inventoryPeripherals, value)
        end
    end

    return inventoryPeripherals
end

function Storage:storageSetup()
    term.setTextColour(colours.blue)
    print("Storage Configuration Wizard")
    term.setTextColour(colours.white)
    print("This program aims to configure the IOconfiguration of the storage alongside the subnetwork that will be used to configure the storage units")
    print("")
    print("The next section involves configure the IO of the system")
    print("Press enter to continue")
    read()
end

function Storage:selectIO()
    term.setTextColour(colours.blue)
    print("Selecting IO chest")
    term.setTextColour(colours.white)
    print("This section dictates the chest/s that will be used as the input and output of blocks in the storage system")
    input = read()

function main()
    clear()
    storageSetup()
    clear()
    getInventoryPeripherals()
end

main()

return main