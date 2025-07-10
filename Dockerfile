FROM alpine

# نصب ابزارهای موردنیاز
RUN apk add --no-cache curl

# دانلود آخرین نسخه Hysteria2 برای لینوکس
RUN curl -L -o /usr/bin/hysteria https://github.com/apernet/hysteria/releases/latest/download/hysteria-linux-amd64 \
    && chmod +x /usr/bin/hysteria

# کپی فایل پیکربندی
COPY config.yaml /etc/hysteria/config.yaml

# اجرای Hysteria2
CMD ["hysteria", "server", "-c", "/etc/hysteria/config.yaml"]
