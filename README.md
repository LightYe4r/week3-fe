# Frontend - MyApp

## 환경변수 설정

### BACKEND_URL
백엔드 API 서버 주소를 설정합니다.

### 로컬 테스트
```bash
docker build -t myapp-frontend .
docker run -d -p 8080:80 -e BACKEND_URL=http://localhost:3000 myapp-frontend
```

### ECS Task Definition에서 설정
```json
{
  "containerDefinitions": [{
    "name": "frontend",
    "image": "YOUR_ACCOUNT_ID.dkr.ecr.ap-northeast-2.amazonaws.com/myapp-frontend:latest",
    "portMappings": [{
      "containerPort": 80,
      "protocol": "tcp"
    }],
    "environment": [{
      "name": "BACKEND_URL",
      "value": "http://your-backend-alb-url"
    }]
  }]
}
```

### 프로덕션 배포 예시
```bash
# ALB 사용 시
BACKEND_URL=http://myapp-be-alb-xxxxx.ap-northeast-2.elb.amazonaws.com

# Route53 도메인 사용 시
BACKEND_URL=https://api.wjdakstjd.store
```

## 파일 구조
```
myapp-frontend/
├── index.html              # 로그인 페이지
├── signup.html             # 회원가입 페이지
├── dashboard.html          # 대시보드
├── style.css               # 스타일시트
├── app.js                  # API 호출 로직
├── config.template.js      # 환경변수 템플릿
├── entrypoint.sh          # 컨테이너 시작 스크립트
├── nginx.conf             # Nginx 설정
├── Dockerfile             # Docker 이미지
└── README.md              # 이 파일
```

## 빌드 & 실행

```bash
# 이미지 빌드
docker build -t myapp-frontend .

# 로컬 실행 (환경변수 지정)
docker run -d -p 8080:80 \
  -e BACKEND_URL=http://localhost:3000 \
  myapp-frontend

# 브라우저에서 확인
http://localhost:8080
```

## ECR 푸시

```bash
# ECR 로그인
aws ecr get-login-password --region ap-northeast-2 | \
  docker login --username AWS --password-stdin \
  YOUR_ACCOUNT_ID.dkr.ecr.ap-northeast-2.amazonaws.com

# 태그
docker tag myapp-frontend:latest \
  YOUR_ACCOUNT_ID.dkr.ecr.ap-northeast-2.amazonaws.com/myapp-frontend:latest

# 푸시
docker push YOUR_ACCOUNT_ID.dkr.ecr.ap-northeast-2.amazonaws.com/myapp-frontend:latest
```
