// API URL Configuration
// 환경변수 BACKEND_URL이 설정되어 있으면 사용, 없으면 기본값 사용

const API_URL = window.BACKEND_URL || (
    window.location.hostname === 'localhost' 
        ? 'http://localhost:3000' 
        : 'https://wjdakstjd.store'
);

console.log('API URL:', API_URL);
