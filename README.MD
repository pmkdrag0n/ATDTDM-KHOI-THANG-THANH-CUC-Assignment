# Báo cáo Điện toán đám mây
## Thành viên nhóm:
- Phạm Minh Khôi
- Trương Đức Thắng
- Đinh Thị Giang Thanh
- Hoàng Thị Cúc
## Yêu cầu:
- Máy linux đã cài Docker và Docker-compose
- Port 5000 không có dịch vụ nào sử dụng
## Hướng dẫn sử dụng:
``` bash
git clone https://github.com/pmkdrag0n/flask_mariadb
cd flask_mariadb
docker-compose up -d --build
```

![Tiến hành build container](/media/photo1.jpg)

Khi chạy xong truy cập địa chỉ web http://<IP của máy chủ>:5000 để kiểm tra. Có thể chỉnh sửa port muốn expose trong file docker-compose.yml

### Giao diện chính
![Giao diện chính](/media/photo2.jpg)

### Giao diện bảng khách hàng
![Giao diện bảng khách hàng](/media/photo3.jpg)

### Giao diện bảng sản phẩm
![Giao diện bảng sản phẩm](/media/photo4.jpg)

