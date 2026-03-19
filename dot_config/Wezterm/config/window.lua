local M = {}

function M.setup(config)
	config.enable_tab_bar = true
	config.use_fancy_tab_bar = false
	config.tab_bar_at_bottom = true
	config.tab_max_width = 15
	config.show_tab_index_in_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = false
	-- config.initial_cols = 90 -- number of columns (width)
	config.window_decorations = "RESIZE"
	config.adjust_window_size_when_changing_font_size = true
	config.max_fps = 60
	config.animation_fps = 60
	config.enable_kitty_graphics = true
	config.window_close_confirmation = "NeverPrompt"
	config.window_background_opacity = 0.6
	config.win32_system_backdrop = "Acrylic"
	config.audible_bell = "Disabled"
	config.window_padding = {
		left = 0,
		right = 0,
		top = 10,
		bottom = 10,
	}

	config.default_prog = {
		"pwsh.exe",
		"-NoLogo",
		"-NoExit",
		"-Command",
		--	starship
		'$env:STARSHIP_CONFIG="$env:USERPROFILE\\.config\\starship.toml"; [Console]::OutputEncoding = [System.Text.Encoding]::UTF8; Invoke-Expression (&starship init powershell)',
		-- -- oh my posh
		-- '[Console]::OutputEncoding = [System.Text.Encoding]::UTF8; oh-my-posh init pwsh --config "$env:USERPROFILE\\OneDrive\\Documents\\PowerShell\\takuya.omp.json" | Invoke-Expression',
	}
end

return M
