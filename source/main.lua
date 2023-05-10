package.path = package.path .. ';./connection/?.lua'
package.path = package.path .. ';./config/?.lua'

local Config = require("config")
local Connection = require("connection")

function main()
    local config = Config:new()
    local Connection = Connection:new(config.endpoint)
end

main()