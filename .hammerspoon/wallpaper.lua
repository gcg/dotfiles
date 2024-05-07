-- Select the folder that you store your wallpapers
local wallpaperDirectory = os.getenv("HOME") .. "/Pictures/Wallpapers"
local wallpapers = {}

local log = hs.logger.new("wallpaper", "debug")

-- find and pick a random picture from our wallpaper directory
local function buildWallpapers()
	--hs.alert.show("Building wallpapers")
	log.i("building wallpaper table")
	wallpapers = {}
	local i = 0
	for file in hs.fs.dir(wallpaperDirectory) do
		wallpapers[i] = file
		i = i + 1
	end
	log.i("wallpaper table built")
	--hs.alert.show("Wallpaper table built")
end

-- so we can refresh our table when a new picture comes
local wallpaperWatcher = hs.pathwatcher.new(wallpaperDirectory, buildWallpapers)
wallpaperWatcher:start()

local function updateWallpaper()
	-- check to see if we have wallpapers loaded
	local wc = #wallpapers
	if wc < 1 then
		buildWallpapers()
	end

	local ri = math.random(#wallpapers) -- get random index from all the file entries in our table
	local rwp = wallpapers[ri] -- get the wallpaper at that random index

	for _, s in ipairs(hs.screen.allScreens()) do
		s:desktopImageURL("file://" .. wallpaperDirectory .. "/" .. rwp)
		log.i("Updating wallpaper with: " .. rwp)
	end
	--hs.alert.show("Updating wallpaper with: " .. rwp)
end

-- timer config for wallpaper change in seconds
local wallpaperUpdater = hs.timer.new(300, updateWallpaper)
wallpaperUpdater:start()
