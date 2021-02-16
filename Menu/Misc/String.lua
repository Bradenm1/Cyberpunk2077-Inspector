-- Returns if anything in self contains anything from compareString
function string.BMContains(self,compareString)
	return string.lower(self):match("^.*" .. string.lower(compareString) .. ".*$")
end