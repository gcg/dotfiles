local util = require 'lspconfig.util'
return {
	root_dir = function (fname)
		return util.root_pattern("psalm.xml")(fname)
	end
}
