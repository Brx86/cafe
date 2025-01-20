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
    # 保存当前命令行内容
    function push_line
        set -g _saved_command (commandline)
        commandline ''
    end
    # 执行或恢复命令
    function execute_or_restore
        if set -q _saved_command
            commandline $_saved_command
            set -e _saved_command # 清除变量
        else
            commandline -f execute
        end
    end
    # 绑定键位
    bind \cq push_line
    bind \cj execute_or_restore
end
