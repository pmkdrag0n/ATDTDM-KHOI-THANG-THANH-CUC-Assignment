# Flask App Mariadb
## Yêu cầu:
- Máy linux đã cài Docker và Docker-compose
- Port 5000 không có dịch vụ nào sử dụng
## Hướng dẫn sử dụng:
``` bash
git clone https://github.com/pmkdrag0n/flask_mariadb
cd flask_mariadb
docker-compose up -d --build
```
Khi chạy xong truy cập địa chỉ web http://<IP của máy chủ>:5000 để kiểm tra. Có thể chỉnh sửa port muốn expose trong file docker-compose.yml
