if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g PATH $HOME/.local/bin $PATH
    export EDITOR=nano
    export BAT_THEME=OneHalfDark
    alias ll	'exa -lh --time-style long-iso --icons'
    alias clip	'curl -F file=@- https://envs.sh'
    abbr ba	'bat -Sn'
    abbr c	'cd ..'
    abbr cip	'curl ip.shakaianee.top'
    abbr dk	'docker'
    abbr up	'docker compose up'
    abbr down	'docker compose down'
    abbr logs	'docker compose logs -f'
    abbr m	'micro'
    abbr pa	'sudo pacman -S'
    abbr se	'sudo -e'
    abbr sys	'sudo systemctl'
    abbr st	'systemctl status'
    abbr s	'source .venv/bin/activate.fish'
    abbr uvi	'uv pip install'
    zoxide init fish | source
    # 在 pwd 中包含 "odin" 字符串时，Ctrl+s 执行 odinfmt 并执行当前命令
    # 否则，Ctrl+s 执行默认的 forward-search-history
    bind \cs '
        if string match -q "*odin*" (pwd)
            commandline -r "odinfmt -w"
            commandline -f execute
        end
    '
    bind ctrl-c cancel-commandline
end
