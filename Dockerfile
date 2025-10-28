FROM nginx:alpine

# 빌드 인자 정의
ARG BACKEND_URL=https://wjdakstjd.store

# 기본 nginx 설정 제거
RUN rm -rf /usr/share/nginx/html/*

# 현재 디렉토리의 모든 파일을 nginx html 디렉토리로 복사
COPY . /usr/share/nginx/html/

# nginx 설정 파일을 올바른 위치로 복사
COPY nginx.conf /etc/nginx/conf.d/default.conf

# config.js 파일을 빌드 타임에 생성
RUN echo "window.BACKEND_URL = 'https://wjdakstjd.store';" > /usr/share/nginx/html/config.js

# 포트 노출
EXPOSE 80

# nginx 실행
CMD ["nginx", "-g", "daemon off;"]