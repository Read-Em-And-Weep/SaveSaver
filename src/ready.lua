---@meta _
-- globals we define are private to our plugin!
---@diagnostic disable: lowercase-global

-- here is where your mod sets up all the things it will do.
-- this file will not be reloaded if it changes during gameplay
-- 	so you will most likely want to have it reference
--	values and functions later defined in `reload.lua`.


table.insert(HubRoomData.Hub_Main.StartUnthreadedEvents, 1, {FunctionName = "Activate", Args = {Ids = {742624}}})

modutil.mod.Path.Wrap("DeathAreaRoomTransition", function(base, source, args)
  base(source, args)
  SetupStoryResetObject()
end)