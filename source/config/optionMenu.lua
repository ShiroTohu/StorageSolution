-- Define the list of options
local options = {"Option 1", "Option 2", "Option 3", "Option 4"}

-- Set the initial cursor position
local cursor = 1

-- Function to display the options with the cursor at the current position
function displayOptions(options)
    term.clear()
    for i, option in ipairs(options) do
        if i == cursor then
        -- Highlight the current cursor position
        print(">> " .. option)
        else
        print("  " .. option)
        end
    end
end

-- Display the options for the first time
displayOptions()

function optionsMenu(options)
    -- Loop until the user presses Enter
    while true do
        -- Wait for a key press
        local event, key = os.pullEvent("key")

        -- Check if the user pressed the up arrow key
        if key == keys.up and cursor > 1 then
            cursor = cursor - 1
            displayOptions()
        end

        -- Check if the user pressed the down arrow key
        if key == keys.down and cursor < #options then
            cursor = cursor + 1
            displayOptions()
        end

        -- Check if the user pressed Enter
        if key == keys.enter then
            print("You selected: " .. options[cursor])
            break
        end
    end
end

return optionsMenu
