local nSystems = 20
local rangeOfX = {352, 865}
local rangeOfY = {140, 340}

local systemIDRange = math.pow(16, 8)

for i = 1, nSystems, 1 do
    math.randomseed(i)
    local systemPosX = math.random(rangeOfX[1], rangeOfX[2])
    local systemPosY = math.random(rangeOfY[1], rangeOfY[2])
    local systemIDInName = math.random(0, systemIDRange)
    local systemName = string.format("Hyl %X", systemIDInName)

    print(string.format([[
system "%s"
    pos %.1f %.1f
]], systemName, systemPosX, systemPosY))
end
