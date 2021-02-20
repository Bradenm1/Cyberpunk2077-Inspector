local animActionAnimDatabase = {}

function animActionAnimDatabase:Draw(animActionAnimDatabase)
    BradenMenu.IGE.DisplayObjectArray("rows", "animActionAnimDatabase_DatabaseRow", animActionAnimDatabase.rows,
            function(key, value) 
                BradenMenu.IGE.ObjectToText("animFeatureName", value.animFeatureName)
                BradenMenu.IGE.ObjectToText("state", value.state)
                BradenMenu.IGE.ObjectToText("animVariation", value.animVariation)
                BradenMenu.IGE.ObjectToText("animationData", value.animationData)
            end
		)
    BradenMenu.IGE.ObjectToText("cookingPlatform", animActionAnimDatabase.cookingPlatform)
end

return animActionAnimDatabase