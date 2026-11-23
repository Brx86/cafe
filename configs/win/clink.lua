local aliases = {
    cd   = [[cd /d $*]],
    cdd  = [[cd /d "%USERPROFILE%"]],
    cfg  = [[edit %LocalAppData%/clink/config.lua]],
    cip  = [[curl cip.cc $*]],
    clip = [[curl -Fc=@- https://shz.al]],
    cpr  = [[rsync.exe -e "/bin/ssh" -rtvhzP@10 --info=stats1,progress2 $*]],
    jpeg = [[fd -tf -e jpg | rush -j 8 -k "ffmpeg -i {} -loglevel quiet -vf scale=iw/2:-1 -q:v 1 {.}.jpeg && echo {}"]],
    ll   = [[eza -lh --time-style long-iso --icons auto $*]],
    py   = [[python $*]],
    proxy= [[echo "Set system proxy..."]],
    reset= [[powershell -NoProfile -Command "[Console]::Write([char]27 + 'c'); Clear-Host"]],
    ssh  = [[tssh $*]],
    uvi  = [[uv pip install $*]],
    yt   = [[yt-dlp --cookies-from-browser firefox $*]],
}

for name, command in pairs(aliases) do
    os.setalias(name, command)
end

local function proxy()
    local key = [[HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings]]

    local pipe = io.popen('reg.exe query "' .. key .. '" /v ProxyEnable 2>nul')
    if not pipe then
        print("Proxy: failed to query registry")
        return
    end

    local output = pipe:read("*a")
    pipe:close()

    local hex = output:match("ProxyEnable%s+REG_DWORD%s+0x(%x+)")
    local enabled = hex and tonumber(hex, 16) == 1
    local new_value = enabled and 0 or 1

    local command = string.format(
        'reg.exe add "%s" /v ProxyEnable /t REG_DWORD /d %d /f >nul 2>&1',
        key,
        new_value
    )

    local ok = os.execute(command)
    if ok == true or ok == 0 then
        print(new_value == 1 and "Proxy ON" or "Proxy OFF")
    else
        print("Proxy: failed to update registry")
    end
end

clink.onfilterinput(function(line)
    if not line then
        return
    end
    if line:match("^proxy$") then
        proxy()
        return ""
    end
end)
