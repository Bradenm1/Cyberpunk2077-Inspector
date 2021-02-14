![alt text](https://i.imgur.com/flx9rFr.png)
An inspector tool created for inspecting/editing entities in Cyberpunk 2077.

# Links:
[Nexus Page Link](https://www.nexusmods.com/cyberpunk2077/mods/1621)

# Who's this for?
This mod was created for anyone who needs information such as the one this mod provides. Just allows you to view certain variables. Maybe you're creating a mod that edits certain things and you need a way to view that information without having to log everything. You can also do edits with this mod, but, it's basic currently.

# Usage:
The menu will open by default once loaded through Cyber Engine Tweaks.

This mod has two menus:
The "Debug Menu" which houses everything which is not related to the Entity Inspector itself.
The "Entity Inspector" which houses everything related to entities. :-)

The main entity inspector window works by the user looking at an entity, it will show information once you do this. The other windows/tabs are user saved Entities the user has opened. Not looking at an entity in the main window? The inspector will display "No Entity at crosshair...".

Use the "Toggle Inspector Window" to enable/disable the actual Inspector window.

NOTE: This inspector will not save states. E.g. If you move an Entity it will revert when it's garbage collected (Moving too far away).

# Issues:
ImGui seems to act strange when you have too many tabs/dropdowns open. You might not be able to switch tabs or open a certain things. Simply close all your open dropdowns/tabs.
When you get too far away from an entity it will be destroyed, be aware of this. This is just how the game does garbage collection. You won't be able to save Judy for example then teleport across the map and still interact with her via the menu. You can still see data but it no longer exists in the actual game. Some entities do stick around for what ever reason, such as a car always existing no matter where the player is in the world.