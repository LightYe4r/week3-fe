#!/bin/sh

# 환경변수를 config.js에 주입
envsubst '${BACKEND_URL}' < /usr/share/nginx/html/config.template.js > /usr/share/nginx/html/config.js

# nginx 실행
exec nginx -g 'daemon off;'
