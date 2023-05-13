Output = {}

function Output:new(config, ws, data)
    print("ran output")
    local instance = {
        config = config,
        storageConfig = config.storage,
        ws = ws,
        data = data
    }
    setmetatable(instance, self)
    self.__index = self
    Output:dataHandler(instance)
    return instance
end

function Output:dataHandler(self)
    print("outputting items")
end

return Output
