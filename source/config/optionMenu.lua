local clear = require("clear")

-- Set the initial cursor position
local cursor = 1
local max = 18
local min = 1

-- Function to display the options with the cursor at the current position
function displayOptions(options)
    clear()
    for index, option in ipairs(options) do
        if (index >= min and index <= max) then
            if index == cursor then
            -- Highlight the current cursor position
            print(">> " .. option)
            else
            print("  " .. option)
            end
        end
    end
end

function optionMenu(options)
    displayOptions(options)
    -- Loop until the user presses Enter
    while true do
        -- Wait for a key press
        local event, key = os.pullEvent("key")

        -- Check if the user pressed the up arrow key
        if key == keys.up and cursor > 1 then
            cursor = cursor - 1
            if cursor < min then
                max = max - 1
                min = min - 1
            end
            displayOptions(options)
        end

        -- Check if the user pressed the down arrow key
        if key == keys.down and cursor < #options then
            cursor = cursor + 1
            if cursor > max then
                min = min + 1
                max = max + 1
            end
            displayOptions(options)
        end

        -- Check if the user pressed Enter
        if key == keys.enter then
            print("option: " .. options[cursor])
            return options[cursor]
        end
    end
    clear()
end

return optionMenu
