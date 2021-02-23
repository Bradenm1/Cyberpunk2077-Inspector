local VehicleLightColourChanger = {}

function VehicleLightColourChanger:new(entity)
	local o = {} 

	-- All inspectors share these vars
	o.Entity = entity
	o.ValueSpeed = 0.1 -- The value at which sliders are changed
	o.LightStrength = 1
	o.SelectedVehicleELightType = 5 -- The vehicle light type selection
	o.DoAllLights = true

	o.Colour = NewObject('Color')
	o.Colour.Red = 1
	o.Colour.Green = 0
	o.Colour.Blue = 255
	o.Colour.Alpha = 1

	self.__index = self
   	return setmetatable(o, self)
end

function VehicleLightColourChanger:Draw()
    ImGui.Text("Vehicle Light Colour Changer")

	local value, pressed = ImGui.Checkbox("Do All Lights", self.DoAllLights)
	if pressed then
		self.DoAllLights = value
	end

	local current_item, clicked = ImGui.Combo("Light Type", self.SelectedVehicleELightType - 1, BradenMenu.VehicleELightType, #BradenMenu.VehicleELightType)
	if clicked then
		self.SelectedVehicleELightType = current_item + 1
		self:SetLights()
	end

	local value, used = ImGui.DragFloat("Value Changed Speed", self.ValueSpeed, 0.01, 0, 255)
	if used then 
		self.ValueSpeed = value
	end

	local value, used = ImGui.DragFloat("Light Strength", self.LightStrength, self.ValueSpeed)
	if used then 
		self.LightStrength = value
		self:SetLights()
	end

	-- The colour window
	local col, used = ImGui.ColorEdit3("Colour", { self.Colour.Red / 255, self.Colour.Green / 255, self.Colour.Blue / 255, self.Colour.Alpha / 255 })
	if used then 
		self.Colour.Red = math.floor((col[1] * 255) + 0.5)
		self.Colour.Green = math.floor((col[2] * 255) + 0.5)
		self.Colour.Blue = math.floor((col[3] * 255) + 0.5)

		self:SetLights()
	end

end

-- Sets the light colour for the Entity
function VehicleLightColourChanger:SetLights() 
	local vehController = self.Entity:GetController()
	if vehController == nil then return end

	if self.DoAllLights then 
		-- Changes all light colours
		for i, name in pairs(BradenMenu.VehicleELightType) do
			vehController:SetLightColor(i, self.Colour, 0) 
			vehController:SetLightStrength(i, self.LightStrength, 0)
		end
	else
		-- Changes just the selected light colour
		vehController:SetLightColor(self.SelectedVehicleELightType, self.Colour, 0) 
		vehController:SetLightStrength(self.SelectedVehicleELightType, self.LightStrength, 0)
	end
end


return VehicleLightColourChanger