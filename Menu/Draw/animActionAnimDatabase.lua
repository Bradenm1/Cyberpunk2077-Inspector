function Inspector.DrawanimActionAnimDatabase(self, animActionAnimDatabase)
    self:DisplayObjectArray("rows", "animActionAnimDatabase_DatabaseRow", animActionAnimDatabase.rows,
            function(key, value) 
                self:ObjectToText("animFeatureName", value.animFeatureName)
                self:ObjectToText("state", value.state)
                self:ObjectToText("animVariation", value.animVariation)
                self:ObjectToText("animationData", value.animationData)
            end
		)
    self:ObjectToText("cookingPlatform", animActionAnimDatabase.cookingPlatform)
end