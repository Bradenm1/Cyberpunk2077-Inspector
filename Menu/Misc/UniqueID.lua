local UniqueID = {}

function UniqueID:new()
    setmetatable(UniqueID, self)
    self.__index = self

    self.CurrentID = 0

    return UniqueID
end

-- Returns the next ID in line.
function UniqueID:GetNextID()
    local previousID = self.CurrentID
    self.CurrentID = self.CurrentID + 1
    return previousID 
end

function UniqueID:Reset()
    self.CurrentID = 0
end

return UniqueID