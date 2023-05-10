package.path = package.path .. ";../?.lua"

-- Import the module
local clear = require("clear")
local heading = require("heading")
local optionMenu = require("optionMenu")

local Storage = {}

function Storage:new()
    local instance = { }
    Storage:main() 
    setmetatable(instance, self)
    self.__index = self
    return instance
end

function Storage:storageStartUp()
    clear()
    heading("Storage Configuration Wizard", colours.blue)
    print("This program aims to configure the IOconfiguration of the storage alongside the subnetwork that will be used to configure the storage units")
    print("")
    print("If you are unsure about what peripheral leads to where, disconnect and reconnect it to the network in order to get the name of the peripheral")
    print("Press enter to continue: ")
    read()
    clear()
end

function Storage:getInventoryPeripherals()
    local inventoryPeripherals = {}

    local peripherals = peripheral.getNames()
    for key, value in pairs(peripherals) do
        local primaryType, secondaryType = peripheral.getType(value)
        if secondaryType == "inventory" then
            table.insert(inventoryPeripherals, value)
        end
    end

    return inventoryPeripherals
end

function Storage:getInputPeripheral()
    clear()
    heading("Selecting Input Chest", colours.blue)
    print("This section dictates the input peripheral of the system (this can be the same as the output peripheral)")
    print("Press enter to continue: ")
    input = read()
    clear()

    local inputChest = optionMenu(self.inventoryPeripherals)
    return peripheral.wrap(inputChest)
end

function Storage:getOutputPeripheral()
    clear()
    heading("Select Input Chest", colours.blue)
    print("This section dictates the ouput peripheral of the system (this can be the same as the input peripheral)")
    print("Press enter to continue: ")
    input = read()
    clear()

    local outputChest = optionMenu(self.inventoryPeripherals)
    return peripheral.wrap(outputChest)
end

function Storage:getStoragePeripherals()
    local storagePeripherals = {}

    local peripherals = peripheral.getNames()
    for key, value in pairs(peripherals) do
        if not (value == self.inputPeripheral or value == self.outputPeripheral) then
            local primaryType, secondaryType = peripheral.getType(value)
            if secondaryType == "inventory" then
                local wrapped_peripheral = peripheral.wrap(value)
                table.insert(storagePeripherals, wrapped_peripheral)
            end
        end
    end

    return storagePeripherals
end

function Storage:main()
    self:storageStartUp()
    self.inventoryPeripherals = self:getInventoryPeripherals()
    self.inputPeripheral = self:getInputPeripheral()
    self.outputPeripheral = self:getOutputPeripheral()
    self.storagePeripherals = self:getStoragePeripherals()
end

-- Command functions

function Storage:intput(data)
    
end

function Storage:output(data)
    
end

function Storage:search(data)

end

return Storage