function Inspector.DrawFixedPoint(self, fixedPoint)
	ImGui.Indent()

	-- Properties
	ImGui.Text("Bits: " .. tostring(fixedPoint.Bits))

	ImGui.Unindent()
end