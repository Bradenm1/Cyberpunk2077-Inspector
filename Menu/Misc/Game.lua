-- Get the current targeted entity
function Game.BMGetTargetEntity(self)
	if self:BMIsEntityNull(self:GetPlayer()) == false then
		return self.GetTargetingSystem():GetLookAtObject(self:GetPlayer(), false, false)
	end
	return nil
end

-- Check if an entity still exists
function Game.BMIsEntityNull(self, entity)
	return entity == nil or entity:IsAttached() == false
end