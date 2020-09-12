FROM alpine:3.6

# nginxのインストール
RUN apk update && \
    apk add --no-cache nginx


# ポート設定
EXPOSE 80

RUN mkdir -p /run/nginx

# フォアグラウンドでnginx実行
CMD nginx -g "daemon off;"

# ドキュメントルート
ADD app /app
ADD www /www
ADD default.conf /etc/nginx/conf.d/default.conf
