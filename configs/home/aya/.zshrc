if [[ -z "$TMUX" ]]; then
    fastfetch -c /usr/share/fastfetch/presets/examples/14.jsonc
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias clip='curl -F c=@- "https://fars.ee/?u=1"'
alias dufl='LANG=C duf -only local'
alias ip='ip --color'
alias ll='exa -lh --time-style long-iso --icons'
alias naliu='nali update;rm -f ~/.local/share/nali/Geo*;wget https://github.com/P3TERX/GeoLite.mmdb/releases/latest/download/GeoLite2-City.mmdb -P ~/.local/share/nali -q --show-progres'
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain --paging=never'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain --paging=never'
dg(){dog $@|nali}
get_pacman(){(url=https://mirror.cachyos.org/repo/x86_64/cachyos/;sudo pacman -U $url$(curl -s $url|perl -ne 'print "$1" if /title="(pacman.*?zst)"/'))}
killport(){echo "Killing port $1"&&kill -9 `lsof -t -i:$1`; }

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

source "$HOME/.env"
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit

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
zinit ice lucid wait='1'
zinit light atuinsh/atuin

# 加载 OMZ 框架及部分插件
zinit snippet OMZ::lib/completion.zsh
#zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh
zinit snippet /usr/share/doc/pkgfile/command-not-found.zsh

# p10k 主题
zinit ice depth=1
zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# the fuck
eval "$(pay-respects zsh --alias)"
### End of Zinit's installer chunk
