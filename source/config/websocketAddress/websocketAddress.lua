package.path = package.path .. ";../?.lua"

local heading = require("heading")
local clear = require("clear")

function websocketAddress()
    clear()
    heading("Endpoint Setup", colours.cyan)
    print("this is where you will setup the connection to the websocket server type in the desired IP and port number like this '122.113.37.654:1234")
    print()
    print("type the desired endpoint address below: ")
    local websocketAddress = read()
    clear()
    return websocketAddress
end

return websocketAddress