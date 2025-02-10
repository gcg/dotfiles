return {
	init_options = {
		licenceKey = os.getenv("HOME") .. "/Documents/intelephense.licenceKey.txt",
	},
	settings = {
		intelephense = {
			files = {
				maxSize = 500000000;
			}
		}
	}
}
