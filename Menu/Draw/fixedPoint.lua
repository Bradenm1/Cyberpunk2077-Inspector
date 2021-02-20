local FixedPoint = {}

function FixedPoint:Draw(fixedPoint)
	ImGui.Indent()

	-- Properties
	ImGui.Text("Bits: " .. tostring(fixedPoint.Bits))

	ImGui.Unindent()
end

return FixedPoint