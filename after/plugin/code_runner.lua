local codeRunner = require('code_runner')

codeRunner.setup({
  -- put here the commands by filetype
  filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python3 -u",
		typescript = "deno run $fileName",
		javascript = "node $fileName",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
	},
})
