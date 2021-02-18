function Inspector.DrawentAnimationControllerComponent(self, entAnimationControllerComponent)

    BradenMenu.IGE.ObjectToText("animDatabaseCollection", entAnimationControllerComponent.animDatabaseCollection)
    self:DrawWindowCName("name", entAnimationControllerComponent.name)
        
    BradenMenu.IGE.DrawNodeTree("animDatabaseCollection", "animAnimDatabaseCollection", entAnimationControllerComponent.animDatabaseCollection, 
        function(animDatabaseCollection) 
            BradenMenu.IGE.DisplayObjectArray("animDatabases", "animAnimDatabaseCollectionEntry", animDatabaseCollection.animDatabases,
            function(key, value) 
                self:DrawWindowCName("name", value.name)
            end
            )
        end
    )

    BradenMenu.IGE.DrawNodeTree("actionAnimDatabaseRef", "animActionAnimDatabase", entAnimationControllerComponent.actionAnimDatabaseRef, 
    function(actionAnimDatabaseRef) self:DrawanimActionAnimDatabase(actionAnimDatabaseRef) end
)
end