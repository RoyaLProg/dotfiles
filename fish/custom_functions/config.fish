#simple function to configure dotfiles from everywhere

function config --wraps="nvim $HOME/.config/" --description "alias config=nvim $HOME/.config[/dir]"

	if test "$(echo $argv | wc -w)" -gt 1
		echo "config [config repertory]"
	else if test -n "$argv"
		nvim /home/royal/.config/$argv
	else
		nvim /home/royal/.config
	end
end
