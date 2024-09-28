vim.keymap.set(
	"n",
	"<leader>ogs",
	":JukitOut conda activate general-qa<cr>",
	{ buffer = true, desc = "Activate conda environment 'general-qa'" }
)

vim.keymap.set(
	"n",
	"<leader><cr>",
	":call jukit#send#section(0)<cr>",
	{ buffer = true, desc = "Send code within current cell to output" }
)

vim.keymap.set(
	"n",
	"<leader>os",
	":call jukit#splits#output()<cr>",
	{ buffer = true, desc = "Open output window and execute shell command" }
)

vim.keymap.set(
	"n",
	"<leader>ts",
	":call jukit#splits#term()<cr>",
	{ buffer = true, desc = "Open output window without executing command" }
)

vim.keymap.set(
	"n",
	"<leader>hs",
	":call jukit#splits#history()<cr>",
	{ buffer = true, desc = "Open output-history window" }
)

vim.keymap.set(
	"n",
	"<leader>ohs",
	":call jukit#splits#output_and_history()<cr>",
	{ buffer = true, desc = "Open output terminal and output-history window" }
)

vim.keymap.set(
	"n",
	"<leader>hd",
	":call jukit#splits#close_history()<cr>",
	{ buffer = true, desc = "Close output-history window" }
)

vim.keymap.set(
	"n",
	"<leader>od",
	":call jukit#splits#close_output_split()<cr>",
	{ buffer = true, desc = "Close output window" }
)

vim.keymap.set(
	"n",
	"<leader>ohd",
	":call jukit#splits#close_output_and_history(1)<cr>",
	{ buffer = true, desc = "Close both output and history windows with confirmation" }
)

vim.keymap.set(
	"n",
	"<leader>so",
	":call jukit#splits#show_last_cell_output(1)<cr>",
	{ buffer = true, desc = "Show output of current cell in output-history window" }
)

vim.keymap.set(
	"n",
	"<leader>j",
	":call jukit#splits#out_hist_scroll(1)<cr>",
	{ buffer = true, desc = "Scroll down in output-history window" }
)

vim.keymap.set(
	"n",
	"<leader>ah",
	":call jukit#splits#toggle_auto_hist()<cr>",
	{ buffer = true, desc = "Toggle auto output display on CursorHold" }
)

vim.keymap.set(
	"n",
	"<leader>sl",
	":call jukit#layouts#set_layout()<cr>",
	{ buffer = true, desc = "Apply layout to current splits" }
)

vim.keymap.set(
	"v",
	"<cr>",
	":<C-U>call jukit#send#selection()<cr>",
	{ buffer = true, desc = "Send visually selected code to output" }
)

vim.keymap.set(
	"n",
	"<leader>cc",
	":call jukit#send#until_current_section()<cr>",
	{ buffer = true, desc = "Execute all cells until the current cell" }
)

vim.keymap.set("n", "<leader>all", ":call jukit#send#all()<cr>", { buffer = true, desc = "Execute all cells" })

vim.keymap.set(
	"n",
	"<leader>co",
	":call jukit#cells#create_below(0)<cr>",
	{ buffer = true, desc = "Create new code cell below" }
)

vim.keymap.set(
	"n",
	"<leader>cO",
	":call jukit#cells#create_above(0)<cr>",
	{ buffer = true, desc = "Create new code cell above" }
)

vim.keymap.set(
	"n",
	"<leader>ct",
	":call jukit#cells#create_below(1)<cr>",
	{ buffer = true, desc = "Create new markdown cell below" }
)

vim.keymap.set(
	"n",
	"<leader>cT",
	":call jukit#cells#create_above(1)<cr>",
	{ buffer = true, desc = "Create new markdown cell above" }
)

vim.keymap.set("n", "<leader>cd", ":call jukit#cells#delete()<cr>", { buffer = true, desc = "Delete current cell" })

vim.keymap.set("n", "<leader>cs", ":call jukit#cells#split()<cr>", { buffer = true, desc = "Split current cell" })

vim.keymap.set(
	"n",
	"<leader>cM",
	":call jukit#cells#merge_above()<cr>",
	{ buffer = true, desc = "Merge current cell with the cell above" }
)

vim.keymap.set(
	"n",
	"<leader>cm",
	":call jukit#cells#merge_below()<cr>",
	{ buffer = true, desc = "Merge current cell with the cell below" }
)

vim.keymap.set("n", "<leader>ck", ":call jukit#cells#move_up()<cr>", { buffer = true, desc = "Move current cell up" })

vim.keymap.set(
	"n",
	"<leader>cj",
	":call jukit#cells#move_down()<cr>",
	{ buffer = true, desc = "Move current cell down" }
)

vim.keymap.set(
	"n",
	"<leader>J",
	":call jukit#cells#jump_to_next_cell()<cr>",
	{ buffer = true, desc = "Jump to the next cell below" }
)

vim.keymap.set(
	"n",
	"<leader>K",
	":call jukit#cells#jump_to_previous_cell()<cr>",
	{ buffer = true, desc = "Jump to the previous cell above" }
)

vim.keymap.set(
	"n",
	"<leader>ddo",
	":call jukit#cells#delete_outputs(0)<cr>",
	{ buffer = true, desc = "Delete saved output of the current cell" }
)

vim.keymap.set(
	"n",
	"<leader>dda",
	":call jukit#cells#delete_outputs(1)<cr>",
	{ buffer = true, desc = "Delete saved outputs of all cells" }
)

vim.keymap.set(
	"n",
	"<leader>np",
	":call jukit#convert#notebook_convert('jupyter-notebook')<cr>",
	{ buffer = true, desc = "Convert ipynb to py or vice versa" }
)

vim.keymap.set(
	"n",
	"<leader>ht",
	":call jukit#convert#save_nb_to_file(0,1,'html')<cr>",
	{ buffer = true, desc = "Convert file to HTML and open" }
)

vim.keymap.set(
	"n",
	"<leader>rht",
	":call jukit#convert#save_nb_to_file(1,1,'html')<cr>",
	{ buffer = true, desc = "Convert file to HTML, rerun all cells, and open" }
)

vim.keymap.set(
	"n",
	"<leader>pd",
	":call jukit#convert#save_nb_to_file(0,1,'pdf')<cr>",
	{ buffer = true, desc = "Convert file to PDF and open" }
)

vim.keymap.set(
	"n",
	"<leader>rpd",
	":call jukit#convert#save_nb_to_file(1,1,'pdf')<cr>",
	{ buffer = true, desc = "Convert file to PDF, rerun all cells, and open" }
)
