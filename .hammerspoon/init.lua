-- watches config files so we don't have to manually reload
local _ = require("configwatcher")
-- changes wallpaper randomly on all screens in timer
local _ = require("wallpaper")

-- quits the preview if no open windows left.
-- Create a filter for the Preview application
local previewFilter = hs.window.filter.new("Preview")
-- Subscribe to the event that triggers when a window is closed (destroyed)
previewFilter:subscribe(hs.window.filter.windowDestroyed, function()
	local preview = hs.application.get("Preview")

	-- Check if Preview is running and if it has any windows left
	-- We use a slight delay to ensure the window count is updated accurately
	hs.timer.doAfter(0.5, function()
		if preview and #preview:allWindows() == 0 then
			preview:kill()
		end
	end)
end)
