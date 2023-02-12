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
    for arg in $argv
	set search_term $search_term $arg
    end
    set search_term (echo $search_term | string collect)
    yt-dlp -f 251 -x ytsearch:$search_term -o /tmp/tmp-yt-audio.opus
    mpv /tmp/tmp-yt-audio.opus
    rm /tmp/tmp-yt-audio.opus
end

function yv
    yt-dlp ytsearch:$argv -o /tmp/tmp-yt-video.webm
    mpv /tmp/tmp-yt-video.webm
    rm /tmp/tmp-yt-video.webm
end

function play
    ffplay -autoexit -nodisp $argv
end

function cp
    rsync $argv[1] $argv[2] --info=progress2
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

fish_add_path /home/berinaniesh/.cargo/bin/
fish_add_path /home/berinaniesh/.bin
