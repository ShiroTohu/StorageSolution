package.path = package.path .. ';./storage/?.lua'

local Storage = require("storage")

local Config = {}

function Config:new()
    local storage = Storage:new()

    local instance = { 
        storage = storage
    }

    setmetatable(instance, self)
    self.__index = self -- I have no clue what this does
    return instance
end

return Config