local log = hs.logger.new("config-reloader", "debug")

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
myWatcher =
	hs.pathwatcher.new(os.getenv("HOME") .. "/Work/src/github.com/gcg/dotfiles/.hammerspoon/", reloadConfig):start()
hs.alert.show("HammerSpoon Config Updated")

log.i("config file change dedected, config reloaded ")
