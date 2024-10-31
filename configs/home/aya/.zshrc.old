if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
alias bh="bat --language=help --style=plain --paging=never"
alias clip='curl -F "c=@-" "https://fars.ee/?u=1"'
alias copy=wl-copy
alias conda="micromamba"
alias cpr='rsync -ahzP --info=stats1,progress2'
alias duf='LANG= duf --hide-mp /efi'
alias ll='exa -l --time-style long-iso --icons'
alias la='exa -lha --time-style long-iso --icons'
alias naliu='nali update;rm -f ~/.local/share/nali/Geo*;wget https://raw.githubusercontent.com/P3TERX/GeoLite.mmdb/download/GeoLite2-City.mmdb -P ~/.local/share/nali -q --show-progres'
alias neofetch='neofetch --ascii ~/Pictures/9.ascii'
alias suspend='systemctl suspend'
alias sudoe='sudo -E'
alias uvi='uv pip install -i https://mirrors.bfsu.edu.cn/pypi/web/simple'
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain --paging=never'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain --paging=never'

bl(){printf $1|sudo tee /sys/class/backlight/amdgpu_bl2/brightness}
cn(){xdg-open "https://github.com/archlinuxcn/repo/tree/master/archlinuxcn/$1"}
code(){/bin/code $@ 2>/dev/null}
condarm(){conda remove -n $1 --all;rm -rf "$MAMBA_ROOT_PREFIX/envs/$1"}
dg(){dog $1 A AAAA|nali}
ff(){fd -H -tf -g "*$1*"}
ffping(){fping -asg $1/24 2>/dev/null}
fget(){thread=$2;thread=${thread:-5};echo "使用${thread}进程并行下载$1";cat $1 | xargs -n 1 -P ${thread} wget -q --show-progress ${@[@]:3}}
gr(){go run $@}
get_pacman(){sudo pacman -U $(curl -s https://mirror.cachyos.org/repo/x86_64/cachyos/|perl -ne 'print "https://mirror.cachyos.org/repo/x86_64/cachyos/$1" if /title="(pacman.*?zst)"/')}
killport(){echo "Killing port $1"&&kill -9 `lsof -t -i:$1`; }
mpvass(){mpv --hwdec=auto --sub-file="${1%.*}.sc.ass" $1}
r4x(){realesrgan-ncnn-vulkan -n realesrgan-x4plus-anime -i "$1" -o "out/${1%.*}.jpg"}
snbk(){sudo btrfs su sn -r @root-$1 @root-$1-r&&sudo btrfs su sn -r @home-$1 @home-$1-r}
share(){adb -s _gateway:5555 push $(wl-paste) /sdcard/Pictures/share/&&adb -s _gateway:5555 shell am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d "file:///sdcard/Pictures/share"}
tojpg(){ffmpeg -i "$1" "${1%\.*}.jpg" -loglevel quiet&&echo -e "'$1' \033[93m=>\033[0m '${1%\.*}.jpg'"}
tomp4(){ffmpeg -i "$1" -vcodec copy -acodec copy "${1%\.*}.mp4" -loglevel quiet&&echo -e "'$1' \033[93m=>\033[0m '${1%\.*}.mp4'"}
webp(){ffmpeg -i "$1" "${1%\.*}.webp" -loglevel quiet&&echo -e "\033[35m'$1' \033[93m=>\033[0m \033[35m'${1%\.*}.webp'"}
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

bindkey -r "^s"
source ~/.local/share/zinit/zinit.git/zinit.zsh

# 快速目录跳转
zinit ice lucid wait='1'
zinit light skywind3000/z.lua

# 语法高亮
zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

# 自动建议
zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# 补全
zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions

# git插件
zinit ice lucid wait='1'
zinit snippet OMZ::plugins/git/git.plugin.zsh

# 加载缩写
zinit ice lucid wait='0'
zinit light olets/zsh-abbr

# atuin 历史
zinit ice lucid wait='0'
zinit light atuinsh/atuin 

# 加载 OMZ 框架及部分插件
zinit snippet OMZ::lib/completion.zsh
#zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh
zinit snippet /usr/share/doc/pkgfile/command-not-found.zsh
#zinit snippet /usr/share/fzf/key-bindings.zsh

# p10k 主题
zinit ice depth=1
zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#export PATH="$HOME/.local/bin:$PATH"
### End of Zinit's installer chunk


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/usr/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/aya/.local/share/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/aya/.local/share/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/aya/.local/share/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/aya/.local/share/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

bg_black="\033[40m"
bg_red="\033[41m"
bg_green="\033[42m"
bg_yellow="\033[43m"
bg_blue="\033[44m"
bg_purple="\033[45m"
bg_cyan="\033[46m"
bg_white="\033[47m"

fg_black="\033[30m"
fg_red="\033[31m"
fg_green="\033[32m"
fg_yellow="\033[33m"
fg_blue="\033[34m"
fg_purple="\033[35m"
fg_cyan="\033[36m"
fg_white="\033[37m"

set_clear="\033[0m"
set_bold="\033[1m"
set_underline="\033[4m"
set_flash="\033[5m"
set_reverse="\33[7m"

# pnpm
export PNPM_HOME="/home/aya/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
