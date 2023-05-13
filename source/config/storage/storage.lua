package.path = package.path .. ";../?.lua"

-- Import the module
local clear = require("clear")
local heading = require("heading")
local optionMenu = require("optionMenu")

local Storage = {}

function Storage:new()
    local instance = { }
    setmetatable(instance, self)
    self.__index = self
    self:main() 
    return instance
end

function Storage:getInventoryPeripherals()
    local inventoryPeripherals = {}

    local peripherals = peripheral.getNames()
    for key, value in pairs(peripherals) do
        local primaryType, secondaryType = peripheral.getType(value)
        if secondaryType == "inventory" then
            local wrapped_peripheral = peripheral.wrap(value)
            table.insert(inventoryPeripherals, wrapped_peripheral)
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
    return inputChest
end

function Storage:getOutputPeripheral()
    clear()
    heading("Select Output Chest", colours.blue)
    print("This section dictates the ouput peripheral of the system (this can be the same as the input peripheral)")
    print("Press enter to continue: ")
    input = read()
    clear()

    local outputChest = optionMenu(self.inventoryPeripherals)
    return outputChest
end

function Storage:getStoragePeripherals()
    local storagePeripherals = {}
    local inputPeripheralName = peripheral.getName(self.inputPeripheral)
    local outputPeripheralName = peripheral.getName(self.outputPeripheral)

    local peripherals = peripheral.getNames()
    for key, storagePeripheralName in pairs(peripherals) do
        if storagePeripheralName ~= inputPeripheralName or storagePeripheralName ~= outputPeripheralName then
            local primaryType, secondaryType = peripheral.getType(storagePeripheralName)
            if secondaryType == "inventory" then
                local wrappedPeripheral = peripheral.wrap(storagePeripheralName)
                table.insert(storagePeripherals, wrappedPeripheral)
            end
        end
    end

    return storagePeripherals
end

-- gets the item and number of that item from the system and stores it in a dictionary
function Storage:storageMap()
    storageMap = {}

    clear()
    for key, storagePeripheral in ipairs(self.storagePeripherals) do
        heading("Mapping storage items and chests", colours.blue)
        print("depending on the complexity and the amount of items stored time will vary")
        print(key .. "/" .. #self.storagePeripherals)
        if #storagePeripheral.list() > 0 then -- literally impossible for it do go below one, but I don't trust them
            for slot = 1, storagePeripheral.size() do
                local item = storagePeripheral.getItemDetail(slot)
                if item ~= nil then
                    print(peripheral.getName(storagePeripheral) .. ": " ..item.name)
                    storageMap[peripheral.getName(storagePeripheral)] = item
                end
            end
        end
        clear()
    end
    clear()
end

function Storage:main()
    self.inventoryPeripherals = self:getInventoryPeripherals()
    self.inputPeripheral = self:getInputPeripheral()
    self.outputPeripheral = self:getOutputPeripheral()
    self.storagePeripherals = self:getStoragePeripherals()
    self.storageMap = self:storageMap()
end

function Storage:isFull(inventoryPeripheral)
    print("inventory peripheral: " .. peripheral.getName(inventoryPeripheral))
    if inventoryPeripheral.size() == #inventoryPeripheral.list() then
        return true
    else
        return false
    end
end

function Storage:debug()
    for key, value in ipairs(self.inventoryPeripherals) do
        print(value)
    end
    print("anything there?")
    read()
end

return Storage