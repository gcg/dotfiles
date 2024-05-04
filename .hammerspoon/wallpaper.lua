-- Select the folder that you store your wallpapers
wallpaperDirectory = os.getenv("HOME") .. "/Pictures/Wallpapers"
wallpapers = {}
-- find and pick a random picture from our wallpaper directory
function buildWallpapers()
	hs.alert.show("Building wallpapers")
	wallpapers = {}
	i = 0
	for file in hs.fs.dir(wallpaperDirectory) do
		wallpapers[i] = file
		i = i + 1
	end
	--hs.alert.show("Wallpaper table built")
end

-- so we can refresh our table when a new picture comes
wallpaperWatcher = hs.pathwatcher.new(wallpaperDirectory, buildWallpapers):start()

function updateWallpaper()
	-- check to see if we have wallpapers loaded
	wc = #wallpapers
	if wc < 1 then
		buildWallpapers()
	end

	local ri = math.random(#wallpapers)
	local rwp = wallpapers[ri]

	-- TODO: improve this to change all screens instead of main one
	for i, s in ipairs(hs.screen.allScreens()) do
		s:desktopImageURL("file://" .. wallpaperDirectory .. "/" .. rwp)
	end
	--hs.alert.show("Updating wallpaper with: " .. rwp)
end

-- timer config for wallpaper change in seconds
wallpaperUpdater = hs.timer.new(10, updateWallpaper)
wallpaperUpdater:start()

-- Random Wallpaper End
