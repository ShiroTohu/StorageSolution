Input = {}

function Input:new(config, data)
    local instance = {
        config = config,
        storageConfig = config.storage,
        data = data
    }
    setmetatable(instance, self)
    self.__index = self
    Input:dataHandler(instance, data)
    return instance
end


-- writing self and taking the instance is only a quick fix, there is probably a
-- better way of approaching the problem than what I have come up with. 
function Input:dataHandler(self, data)
    print("data: " .. data)
    if data == "all" then
        print("data handling rn frfr")
        Input:inputAll(self)
    end
end

function Input:inputAll(self)
    for key, inventoryPeripheral in ipairs(self.storageConfig.inventoryPeripherals) do
        if #self.storageConfig.inputPeripheral.list() <= 0  then
            print("stopped iteration")
            return true
        end
        for key, item in ipairs(self.storageConfig.inputPeripheral.list()) do
            if not (self.storageConfig:isFull(inventoryPeripheral)) then
                self.storageConfig.inputPeripheral.pushItems(peripheral.getName(inventoryPeripheral), key)
            end
        end
    end
end

return Input