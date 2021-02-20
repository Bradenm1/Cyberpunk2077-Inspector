local entAnimationControllerComponent = {}

function entAnimationControllerComponent:Draw(entAnimationControllerComponent)

    BradenMenu.IGE.ObjectToText("animDatabaseCollection", entAnimationControllerComponent.animDatabaseCollection)
    BradenMenu.CName:Draw("name", entAnimationControllerComponent.name)
        
    BradenMenu.IGE.DrawNodeTree("animDatabaseCollection", "animAnimDatabaseCollection", entAnimationControllerComponent.animDatabaseCollection, 
        function(animDatabaseCollection) 
            BradenMenu.IGE.DisplayObjectArray("animDatabases", "animAnimDatabaseCollectionEntry", animDatabaseCollection.animDatabases,
            function(key, value) 
                BradenMenu.CName:Draw("name", value.name)
            end
            )
        end
    )
    
    BradenMenu.IGE.DrawNodeTree("actionAnimDatabaseRef", "animActionAnimDatabase", entAnimationControllerComponent.actionAnimDatabaseRef, 
    function(actionAnimDatabaseRef) BradenMenu.animActionAnimDatabase:Draw(actionAnimDatabaseRef) end
)
end

return entAnimationControllerComponent