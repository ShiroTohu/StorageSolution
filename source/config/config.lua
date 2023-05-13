package.path = package.path .. ';./config/storage/?.lua'
package.path = package.path .. ';./config/websocketAddress/?.lua'
package.path = package.path .. ';./config/monitors/?.lua'

local Storage = require("storage")
local websocketAddress = require("websocketAddress")

local Config = {}

function Config:new()
    Config:configStartUp()
    local storage = Storage:new()
    local websocketAddress = websocketAddress()
    Config:configComplete()

    local instance = { 
        storage = storage,
        websocketAddress = websocketAddress
    }

    setmetatable(instance, self)
    self.__index = self -- I have no clue what this does
    return instance
end

local heading = require("heading")
local clear = require("clear")

function Config:configStartUp()
    clear()
    heading("Storage Configuration Wizard", colours.blue)
    print("This program aims to configure the IOconfiguration of the storage alongside the subnetwork that will be used to configure the storage units")
    print("")
    print("If you are unsure about what peripheral leads to where, disconnect and reconnect it to the network in order to get the name of the peripheral")
    print("Press enter to continue: ")
    read()
    clear()
end

function Config:configComplete()
    clear()
    heading("Congratulations", colours.green)
    print("you have completed the configuration wizard press enter to start storage system")
    read()
    clear()
end

return Config