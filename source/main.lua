package.path = package.path .. ';./connection/?.lua'
package.path = package.path .. ';./config/?.lua'

local Config = require("config")
local Connection = require("connection")

function main()
    local config = Config:new()
    local connection = Connection:new(config)
    connection:listen()
end

main()