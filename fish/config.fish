if status is-interactive
    # Commands to run in interactive sessions can go here
end

function ytads
    yt-dlp --default-search ytsearchall: $argv --playlist-items 1 -f 251 -x -N 8 -o "~/Music/%(title)s.%(ext)s"
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


function gitpush
	git add .
	git commit -m $argv
	git push origin main
	end

fish_add_path /home/berinaniesh/.cargo/bin/
fish_add_path /home/berinaniesh/.bin

function ym
    yt-dlp -f 251 -x ytsearch:$argv -o /tmp/tmp-yt-audio.opus
    ffplay -nodisp -autoexit /tmp/tmp-yt-audio.opus
    rm /tmp/tmp-yt-audio.opus
    end
