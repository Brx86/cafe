if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g PATH $HOME/.local/bin $PATH
    export EDITOR=nano
    export BAT_THEME=OneHalfDark
    alias ll    'exa -lh --time-style long-iso --icons'
    alias clip  'curl -F file=@- https://envs.sh'
    abbr ba     'bat -Sn'
    abbr c      'cd ..'
    abbr cg     'curl google.com'
    abbr cip    'curl ip.shakaianee.top'
    abbr dk     'docker'
    abbr es     'exercism submit src/*'
    abbr up     'docker compose up'
    abbr down   'docker compose down'
    abbr logs   'docker compose logs -f'
    abbr m      'micro'
    abbr pa     'sudo pacman -S'
    abbr se     'sudo -e'
    abbr sys    'sudo systemctl'
    abbr st     'systemctl status'
    abbr s      'source .venv/bin/activate.fish'
    abbr uvi    'uv pip install'
    zoxide init fish | source
    # 在 pwd 中包含 "odin" 字符串时，Ctrl+s 执行 odinfmt 并执行当前命令
    # 否则，Ctrl+s 执行默认的 forward-search-history
    bind \cs '
        if string match -q "*/odin*" (pwd)
            commandline -r "odinfmt -w"
            commandline -f execute
        else if string match -rq ".*er_ln|gleam.*" (pwd)
            commandline -r "gleam format && gleam run"
            commandline -f execute
        end
    '
    bind \cb '
        if string match -rq ".*er_ln|gleam.*" (pwd)
            commandline -r "gleam build && gleam run -m gleescript"
            commandline -f execute
        end
    '
    bind ctrl-c cancel-commandline

    function fish_command_not_found
        pacfiles $argv[1] || echo -e "$argv[1] not found!"
    end
end
