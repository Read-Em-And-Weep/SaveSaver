---@meta _
-- globals we define are private to our plugin!
---@diagnostic disable: lowercase-global

-- here is where your mod sets up all the things it will do.
-- this file will not be reloaded if it changes during gameplay
-- 	so you will most likely want to have it reference
--	values and functions later defined in `reload.lua`.


--table.insert(HubRoomData.Hub_Main.StartUnthreadedEvents, 1, {FunctionName = "ActivatePrePlaced", Args = {Ids = {742624}}})

modutil.mod.Path.Wrap("DeathAreaRoomTransition", function(base, source, args)
  base(source, args)
  Activate({ Id = 742624 })
  mod.SetupStoryResetObject()
end)

function mod.SetupStoryResetObject()
local storyResetObject = MapState.ActiveObstacles[742624]
	if storyResetObject ~= nil then
			storyResetObject.OnUsedFunctionName = "OpenStoryResetPromptScreen"
		SetAnimation({ DestinationId = 741509, Name = "Tilesets\\Crossroads\\Crossroads_FountainWall_02" })
		SetAnimation({ DestinationId = 743214, Name = "Tilesets\\Crossroads\\Crossroads_FountainWall_02b" })
		SetAnimation({ DestinationIds = { 743226, 743215, 743461 }, Name = "Tilesets\\Crossroads\\Crossroads_FountainWall_02a" })
		SetColor({ Ids = { 743217, 743216 }, Color = { 82, 59, 36, 255 }, SetBase = true })
	end
end