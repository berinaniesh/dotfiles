if status is-interactive
    # Commands to run in interactive sessions can go here
end

function ytads
    yt-dlp --default-search ytsearchall: $argv --playlist-items 1 -f 251 -x -N 8 -o "~/Music/%(title)s.%(ext)s"
end

function ytad
    yt-dlp -f 251 -x -N 8 -o "~/Music/%(title)s.%(ext)s" $argv
end

function gitpush
	git add .
	git commit -m $argv
	git push origin main
end

function ym
    set uuid (uuidgen)
    set fname (string join '' '/data/tmp/' $uuid '.opus')
    set fpath (string join '' '/data/tmp/' $uuid)
    yt-dlp -f 251 -x ytsearch:"$argv" -o $fpath 
    mpv $fname
    rm $fname
end

function yv
    set uuid (uuidgen)
    set fname (string join '' '/data/tmp/' $uuid '.webm')
    set fpath (string join '' '/data/tmp/' $uuid)
    yt-dlp ytsearch:$argv -o $fpath
    mpv --no-osd-bar $fname
    rm $fname
end

function play
    ffplay -autoexit -nodisp $argv
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
abbr nvimedit "nvim ~/.config/nvim/init.lua"
abbr history "nvim ~/.local/share/fish/fish_history"
alias compile "g++"
alias sl "ls"

fish_add_path /home/berinaniesh/.cargo/bin/
fish_add_path /home/berinaniesh/.bin
