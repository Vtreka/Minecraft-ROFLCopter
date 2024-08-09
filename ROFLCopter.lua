local sides = {"left", "right", "back", "top", "bottom", "front"}
local monitor = nil

-- Find the monitor
for _, side in ipairs(sides) do
    if peripheral.isPresent(side) and peripheral.getType(side) == "monitor" then
        monitor = peripheral.wrap(side)
        break
    end
end

if not monitor then
    print("No monitor found on any side.")
    return
end

monitor.clear()
monitor.setTextScale(0.5) -- Adjust text scale to fit more characters

-- ROFLCOPTER frames split into lines
local frames = {
    {
        "  ROFL:ROFL:LOL:         ",
        "         ____^___        ",
        "        /      []\\       ",
        "   LOL===         \\      ",
        "         \\         \\     ",
        "          \\_________]    ",
        "            I     I      ",
        "         -------------/  ",
        "                         ",
        "         ROFL COPTER!!!  "
    },
    {
        "           :LOL:ROFL:ROFL",
        "         ____^___        ",
        "    L   /      []\\       ",
        "    O ===         \\      ",
        "    L    \\         \\     ",
        "          \\_________]    ",
        "            I     I      ",
        "         -------------/  ",
        "                         ",
        "         ROFL COPTER!!!  "
    },
}

local frameCount = #frames
local currentFrame = 1

-- Animation loop
while true do
    -- Update monitor dimensions in each iteration
    local width, height = monitor.getSize()

    monitor.clear()

    -- Calculate the starting Y position to center vertically
    local startY = math.floor((height - #frames[1]) / 2) + 1
    
    for i, line in ipairs(frames[currentFrame]) do
        -- Calculate the starting X position to center horizontally for each line
        local startX = math.floor((width - #line) / 2) + 1
        monitor.setCursorPos(startX, startY + i - 1)
        monitor.write(line)
    end
    
    currentFrame = currentFrame + 1
    if currentFrame > frameCount then
        currentFrame = 1
    end
    
    sleep(0.1) -- Control the speed of the animation
end