local GameExtension = {}

-- Get the current targeted entity
function GameExtension.BMGetTargetEntity(self)
	if self:BMIsEntityNull(Game:GetPlayer()) == false then
		return Game.GetTargetingSystem():GetLookAtObject(Game:GetPlayer(), false, false)
	end
	return nil
end

-- Check if an entity still exists
function GameExtension.BMIsEntityNull(self, entity)
	return entity == nil or entity:IsAttached() == false
end

return GameExtension