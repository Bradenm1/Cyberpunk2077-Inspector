-- Returns if anything in string1 contains anything from string2
function string.StringContains(self,compareString)
	return string.lower(self):match("^.*" .. string.lower(compareString) .. ".*$")
end

-- Get the name in the CName
function string.GetCNameName(self)
	return self:match("%[ (%g+) -")
end