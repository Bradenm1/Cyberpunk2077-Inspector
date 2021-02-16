function Inspector.DrawentAnimationControllerComponent(self, entAnimationControllerComponent)

    self:ObjectToText("animDatabaseCollection", entAnimationControllerComponent.animDatabaseCollection)
    self:DrawWindowCName("name", entAnimationControllerComponent.name)
        
    self:DrawNodeTree("animDatabaseCollection", "animAnimDatabaseCollection", entAnimationControllerComponent.animDatabaseCollection, 
        function(animDatabaseCollection) 
            self:DisplayObjectArray("animDatabases", "animAnimDatabaseCollectionEntry", animDatabaseCollection.animDatabases,
            function(key, value) 
                self:DrawWindowCName("name", value.name)
            end
            )
        end
    )

    self:DrawNodeTree("actionAnimDatabaseRef", "animActionAnimDatabase", entAnimationControllerComponent.actionAnimDatabaseRef, 
    function(actionAnimDatabaseRef) self:DrawanimActionAnimDatabase(actionAnimDatabaseRef) end
)
end