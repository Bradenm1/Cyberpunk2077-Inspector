local StringExtension = {}

-- Returns if anything in self contains anything from compareString
function StringExtension.BMContains(string1,string2)
	return string.lower(string2):match(".*" .. string.lower(string1) .. "*.")
end

-- Lowercase the first letter
function StringExtension.BMFirstToLower(string)
    return string:sub(1,1):lower() .. string:sub(2)
end

return StringExtension