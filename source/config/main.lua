local systemIntegrity = require("systemIntegrity")

local StorageConfig = {}

function StorageConfig:new()
    local instance = {
        
    }

    setmetatable(instance, self)
    self.__index = self -- I have no clue what this does
    return instance
end

return storageConfig