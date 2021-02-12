-- Get the current targeted entity
function Game.GetTargetEntity(self)
	if self:IsEntityNull(self:Player()) == false then
		return self.GetTargetingSystem():GetLookAtObject(self:Player(), false, false)
	end
	return nil
end

-- Check if an entity still exists
function Game.IsEntityNull(self, entity)
	return entity:IsAttached() == false
end

-- Returns the player
function Game.Player(self)
	return self:GetPlayer()
end