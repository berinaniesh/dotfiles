if status is-interactive
    # Commands to run in interactive sessions can go here
end

function ytad
    yt-dlp -f 251 -x -N 8 -o "~/Music/%(title)s.%(ext)s" $argv
    end

set -Ux GOPATH /home/berinaniesh/Development/go
set -Ux PATH $PATH /home/berinaniesh/Development/go/bin /home/berinaniesh/.bin
set -Ux EDITOR nvim

abbr ytda "yt-dlp -x -f 251"
abbr ytdaxel "yt-dlp --external-downloader axel --external-downloader-args '-n 8'"
abbr fishedit "nvim /home/berinaniesh/.config/fish/config.fish"
abbr lazygit 'git add . && git commit -m "update" && git push origin main'
abbr swayedit 'nvim /home/berinaniesh/.config/sway/config'
abbr alacrittyedit 'nvim /home/berinaniesh/.config/alacritty/alacritty.yml'
alias compile "g++"
alias nvimedit "nvim ~/.config/nvim/init.vim"

abbr siteupdate "scp -r /home/berinaniesh/Development/berinaniesh.xyz/dst/* berinaniesh@berinaniesh.xyz:/home/berinaniesh/websites/berinaniesh.xyz/"


function gitpush
	git add .
	git commit -m $argv
	git push origin main
	end
fish_add_path /home/berinaniesh/.cargo/bin/
fish_add_path /home/berinaniesh/.bin

