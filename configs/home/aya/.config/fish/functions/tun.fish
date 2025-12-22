function tun
    if test (count $argv) -eq 0
        echo "Status:  "(curl 'http://127.0.0.1:9090/configs' -sH 'Authorization: Bearer your_passwd' | jq '.tun.enable')
        echo "Usage:   tun [true|false]"
        return 1
    end
    set command_action $argv[1]
    switch $command_action
        case true
            curl 'http://127.0.0.1:9090/configs' -X PATCH -H 'Authorization: Bearer your_passwd' --data-raw '{"tun":{"enable":true}}'
            echo "Mihomo TUN on."
        case false
            curl 'http://127.0.0.1:9090/configs' -X PATCH -H 'Authorization: Bearer your_passwd' --data-raw '{"tun":{"enable":false}}'
            echo "Mihomo TUN off."
        case '*'
            echo "Invalid argument: '$command_action'"
            echo "Usage: tun [true|false]"
            return 1
    end
end
complete -c tun -f -a "true false"
