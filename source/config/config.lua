package.path = package.path .. ';./config/storage/?.lua'
package.path = package.path .. ';./config/endpoint/?.lua'
package.path = package.path .. ';./config/monitors/?.lua'

local Storage = require("storage")
local endpoint = require("endpoint")

local Config = {}

function Config:new()
    local storage = Storage:new()
    local endpoint = endpoint()

    local instance = { 
        storage = storage,
        endpoint = endpoint
    }

    setmetatable(instance, self)
    self.__index = self -- I have no clue what this does
    return instance
end

local heading = require("heading")
local clear = require("clear")

function Config:configComplete()
    clear()
    heading("Congratulations", colours.green)
    print("you have completed the configuration wizard press enter to start storage system")
    read()
    clear()
end

return Config