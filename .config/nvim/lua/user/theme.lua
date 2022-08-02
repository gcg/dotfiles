local theme_ok, monokai = pcall(require, "monokai")
if not theme_ok then
				return
end

monokai.setup { palette = require("monokai").pro }
