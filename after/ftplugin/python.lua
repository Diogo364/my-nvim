vim.keymap.set("n", "<leader>ogs", ":JukitOut conda activate general-qa<cr>", { buffer = true })

-- Send code within the current cell to output split (also saves the output if ipython is used and `g:jukit_save_output==1`). Argument: if 1, will move the cursor to the next cell below after sending the code to the split, otherwise cursor position stays the same.
vim.keymap.set("n", "<leader><cr>", ":call jukit#send#section(0)<cr>", { buffer = true })

-- Opens a new output window and executes the command specified in `g:jukit_shell_cmd`
vim.keymap.set("n", "<leader>os", ":call jukit#splits#output()<cr>", { buffer = true })

-- Opens a new output window without executing any command
vim.keymap.set("n", "<leader>ts", ":call jukit#splits#term()<cr>", { buffer = true })

-- Opens a new output-history window, where saved ipython outputs are displayed
vim.keymap.set("n", "<leader>hs", ":call jukit#splits#history()<cr>", { buffer = true })

-- Shortcut for opening output terminal and output-history
vim.keymap.set("n", "<leader>ohs", ":call jukit#splits#output_and_history()<cr>", { buffer = true })

-- Close output-history window
vim.keymap.set("n", "<leader>hd", ":call jukit#splits#close_history()<cr>", { buffer = true })

-- Close output window
vim.keymap.set("n", "<leader>od", ":call jukit#splits#close_output_split()<cr>", { buffer = true })

-- Close both windows. Argument: Whether or not to ask you to confirm before closing.
vim.keymap.set("n", "<leader>ohd", ":call jukit#splits#close_output_and_history(1)<cr>", { buffer = true })

-- Show output of current cell (determined by current cursor position) in output-history window. Argument: Whether or not to reload outputs if cell id of outputs to display is the same as the last cell id for which outputs were displayed
vim.keymap.set("n", "<leader>so", ":call jukit#splits#show_last_cell_output(1)<cr>", { buffer = true })

-- Scroll down in output-history window. Argument: whether to scroll down (1) or up (0)
vim.keymap.set("n", "<leader>j", ":call jukit#splits#out_hist_scroll(1)<cr>", { buffer = true })

-- Create/delete autocmd for displaying saved output on CursorHold. Also, see explanation for `g:jukit_auto_output_hist`
vim.keymap.set("n", "<leader>ah", ":call jukit#splits#toggle_auto_hist()<cr>", { buffer = true })

-- Apply layout (see `g:jukit_layout`) to current splits - NOTE: it is expected that this function is called from the main file buffer/split
vim.keymap.set("n", "<leader>sl", ":call jukit#layouts#set_layout()<cr>", { buffer = true })

-- Send visually selected code to output split
vim.keymap.set("v", "<cr>", ":<C-U>call jukit#send#selection()<cr>", { buffer = true })

-- Execute all cells until the current cell
vim.keymap.set("n", "<leader>cc", ":call jukit#send#until_current_section()<cr>", { buffer = true })

-- Execute all cells
vim.keymap.set("n", "<leader>all", ":call jukit#send#all()<cr>", { buffer = true })

-- Create new code cell below. Argument: Whether to create code cell (0) or markdown cell (1)
vim.keymap.set("n", "<leader>co", ":call jukit#cells#create_below(0)<cr>", { buffer = true })

-- Create new code cell above. Argument: Whether to create code cell (0) or markdown cell (1)
vim.keymap.set("n", "<leader>cO", ":call jukit#cells#create_above(0)<cr>", { buffer = true })

-- Create new textcell below. Argument: Whether to create code cell (0) or markdown cell (1)
vim.keymap.set("n", "<leader>ct", ":call jukit#cells#create_below(1)<cr>", { buffer = true })

-- Create new textcell above. Argument: Whether to create code cell (0) or markdown cell (1)
vim.keymap.set("n", "<leader>cT", ":call jukit#cells#create_above(1)<cr>", { buffer = true })

-- Delete current cell
vim.keymap.set("n", "<leader>cd", ":call jukit#cells#delete()<cr>", { buffer = true })

-- Split current cell (saved output will then be assigned to the resulting cell above)
vim.keymap.set("n", "<leader>cs", ":call jukit#cells#split()<cr>", { buffer = true })

-- Merge current cell with the cell above
vim.keymap.set("n", "<leader>cM", ":call jukit#cells#merge_above()<cr>", { buffer = true })

-- Merge current cell with the cell below
vim.keymap.set("n", "<leader>cm", ":call jukit#cells#merge_below()<cr>", { buffer = true })

-- Move current cell up
vim.keymap.set("n", "<leader>ck", ":call jukit#cells#move_up()<cr>", { buffer = true })

-- Move current cell down
vim.keymap.set("n", "<leader>cj", ":call jukit#cells#move_down()<cr>", { buffer = true })

-- Jump to the next cell below
vim.keymap.set("n", "<leader>J", ":call jukit#cells#jump_to_next_cell()<cr>", { buffer = true })

-- Jump to the previous cell above
vim.keymap.set("n", "<leader>K", ":call jukit#cells#jump_to_previous_cell()<cr>", { buffer = true })

-- Delete saved output of current cell. Argument: Whether to delete all saved outputs (1) or only saved output of current cell (0)
vim.keymap.set("n", "<leader>ddo", ":call jukit#cells#delete_outputs(0)<cr>", { buffer = true })

-- Delete saved outputs of all cells. Argument: Whether to delete all saved outputs (1) or only saved output of current cell (0)
vim.keymap.set("n", "<leader>dda", ":call jukit#cells#delete_outputs(1)<cr>", { buffer = true })

-- Convert from ipynb to py or vice versa. Argument: Optional. If an argument is specified, then its value is used to open the resulting ipynb file after converting script.
vim.keymap.set("n", "<leader>np", ":call jukit#convert#notebook_convert('jupyter-notebook')<cr>", { buffer = true })

-- Convert file to html (including all saved outputs) and open it using the command specified in `g:jukit_html_viewer'. If `g:jukit_html_viewer` is not defined, then will default to `g:jukit_html_viewer='xdg-open'`. Arguments: 1.: Whether to rerun all cells when converting 2.: Whether to open it after converting 3.: filetype to convert to 
vim.keymap.set("n", "<leader>ht", ":call jukit#convert#save_nb_to_file(0,1,'html')<cr>", { buffer = true })

-- same as above, but will (re-)run all cells when converting to html
vim.keymap.set("n", "<leader>rht", ":call jukit#convert#save_nb_to_file(1,1,'html')<cr>", { buffer = true })

-- Convert file to pdf (including all saved outputs) and open it using the command specified in `g:jukit_pdf_viewer'. If `g:jukit_pdf_viewer` is not defined, then will default to `g:jukit_pdf_viewer='xdg-open'`. Arguments: 1.: Whether to rerun all cells when converting 2.: Whether to open it after converting 3.: filetype to convert to. NOTE: If the function doesn't work there may be issues with your nbconvert or latex version - to debug, try converting to pdf using `jupyter nbconvert --to pdf --allow-errors --log-level='ERROR' --HTMLExporter.theme=dark </abs/path/to/ipynb> && xdg-open </abs/path/to/pdf>` in your terminal and check the output for possible issues.
vim.keymap.set("n", "<leader>pd", ":call jukit#convert#save_nb_to_file(0,1,'pdf')<cr>", { buffer = true })

-- same as above, but will (re-)run all cells when converting to pdf. NOTE: If the function doesn't work there may be issues with your nbconvert or latex version - to debug, try converting to pdf using `jupyter nbconvert --to pdf --allow-errors --log-level='ERROR' --HTMLExporter.theme=dark </abs/path/to/ipynb> && xdg-open </abs/path/to/pdf>` in your terminal and check the output for possible issues.
vim.keymap.set("n", "<leader>rpd", ":call jukit#convert#save_nb_to_file(1,1,'pdf')<cr>", { buffer = true })
