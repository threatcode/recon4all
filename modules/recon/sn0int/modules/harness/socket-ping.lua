-- Description: Connect somewhere and send a ping every 3s
-- Version: 0.1.0
-- License: GPL-3.0

INTERVAL = 3

function run()
    local sock = sock_connect('127.0.0.1', 4444, {
        read_timeout=INTERVAL,
    })
    if last_err() then return end

    local last_ping = time_unix()
    while true do
        local now = time_unix()
        local sleep = last_ping + INTERVAL - now

        if sleep <= 0 then
            sock_send(sock, sn0int_time() .. ' ping\n')
            last_ping = now
            sleep = INTERVAL
        end

        sock_options(sock, {
            read_timeout=sleep,
        })
        if last_err() then return end

        local buf = sock_recv(sock)
        if last_err() then return end
        info(buf)
    end
end
