package.path = package.path .. ';./connection/commands/?.lua'

local Input = require("input")
local Output = require("output")
local Search = require("search")

-- Represents a connection
local Connection = {}

-- Creates a new connection given a websocketAddress string and 
-- storageConfiguration class.
-- @param websocketAddress the websocket address e.g. "1.1.1.1:1111"
function Connection:new(config)
    local websocketAddress = config.websocketAddress
    print("connecting to: " .. websocketAddress)
    local ws, err = http.websocket(websocketAddress)
    if not ws then
        error ("Failed to connection: " .. err)
    else
        print(string.format("connection established to: %s", websocketAddress))
    end

    local instance = {
        websocketAddress = websocketAddress,
        ws = ws,
        config = config
    }
    setmetatable(instance, self)
    self.__index = self -- I have no clue what this does
    return instance
end

-- Exeecutes a given instruction from a websocket packet. These packets are
-- supposed to look like this unserialsed "{"command": "input", "data": "all"}"
-- keep in mind this doens' represent an actual command, but what a command
-- look like.
function Connection:listen()
    local serialPacket = self.ws.receive()
    print("serialPacket: " .. serialPacket)
    local packet = textutils.unserialiseJSON(serialPacket)
    local command = packet.command
    local data = packet.data
    print("command: " .. command)

    commandList = {
        ["input"] = Input,
        ["output"] = Output,
        ["search"] = Search
    }

    commandList[command]:new(self.config, ws, data)
end

return Connection