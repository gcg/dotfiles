function reloadConfig(files)
	doReload = false
	for _, file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
	end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

-- start a timer to change the wallpaper
--
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
	hs.alert.show("Wallpaper table built")
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

	screen = hs.screen.mainScreen()
	screen:desktopImageURL("file://" .. wallpaperDirectory .. "/" .. rwp)

	hs.alert.show("Updating wallpaper with: " .. rwp)
end

wallpaperUpdater = hs.timer.new(300, updateWallpaper)
wallpaperUpdater:start()
