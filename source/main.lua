package.path = package.path .. ';./connection/?.lua'
package.path = package.path .. ';./config/?.lua'

local Config = require("config")
local Connection = require("connection")

function main()
    local storageConfig = Config:new()
    local connection = Connection:new(storageConfig)
    connection:listen()
end

main()