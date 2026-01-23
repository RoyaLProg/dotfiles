#simple function to configure dotfiles from everywhere

function config --wraps="cd $HOME/.config/" --description "alias config=nvim $HOME/.config[/dir]"

	set OLD_PWD $PWD
	set CONFIG_FOLDER $HOME/.config
	if test "$(echo $argv | wc -w)" -gt 1
		echo "config [config repertory]"
		return 0
	end

	if ! test -d $CONFIG_FOLDER/$argv
		echo "config: folder $argv does not exist under $CONFIG_FOLDER"
		return 1
	end

	cd $CONFIG_FOLDER/$argv
	nvim .
	cd $OLD_PWD
	set -e OLD_PWD
end
