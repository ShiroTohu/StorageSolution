Input = {}

function Input:new(storageConfig, data)
    local instance = {
        storageConfig = storageConfig,
        data = data
    }
    setmetatable(instance, self)
    self.__index = self
    return instance
end

function Input:inputAll()
    
end

return Input