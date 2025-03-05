FROM alpine:3.21

RUN apk add --no-cache openssh rsync && \
    ssh-keygen -A && \
    addgroup -g 1001 aya && \
    adduser -u 1002 -G aya -s /bin/sh -D aya && \
    echo 'aya:aya' | chpasswd && \
    mkdir -p /home/aya/.ssh && \
    echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGzrTaKyCOhE2GCSHJt7VPH0SXDRZeN2X8ICLS7rX4t0 aya@0k' > /home/aya/.ssh/authorized_keys && \
    chmod 700 -R /home/aya/ && \
    chmod 600 /home/aya/.ssh/authorized_keys && \
    chown aya:aya -R /home/aya && \
    echo 'PermitRootLogin no' /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication no' /etc/ssh/sshd_config && \
    echo "AllowUsers aya" >> /etc/ssh/sshd_config

CMD ["/usr/sbin/sshd", "-D"]
