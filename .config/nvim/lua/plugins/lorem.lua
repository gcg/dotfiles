return {
	"derektata/lorem.nvim",
	cmd = "LoremIpsum",
	config = function()
		require("lorem").opts({
			sentenceLength = "medium",
			comma_chance = 0.2,
			max_commas_per_sentence = 2,
		})
	end,
}
