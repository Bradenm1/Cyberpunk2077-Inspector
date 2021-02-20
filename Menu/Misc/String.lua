-- Returns if anything in self contains anything from compareString
function string.BMContains(self,compareString)
	return string.lower(self):match("^.*" .. string.lower(compareString) .. ".*$")
end

-- Lowercase the first letter
function string.BMFirstToLower(self)
    return self:sub(1,1):lower() .. self:sub(2)
end