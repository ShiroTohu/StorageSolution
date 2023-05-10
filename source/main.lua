package.path = package.path .. ';./connection/?.lua'
package.path = package.path .. ';./config/?.lua'

local Connection = require("connection")

function main()
    print("main")
end

main()