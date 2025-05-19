<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/5/2025
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trang đăng ký bán ảnh</title>
    <link
            rel="stylesheet"
            href="./assets/libraries/fontawesome-free-6.6.0-web/css/all.css"
    />
    <link
            href="./assets/libraries/bootstrap/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="./assets/css/register-contributor.css?1234" />
</head>
<body>
<div class="container">
    <!-- Begin: Nav -->
    <ul class="nav-list">
        <li class="item active" data-step="1">
            <p>Điều khoản và điều kiện</p>
        </li>
        <li class="item" data-step="2">
            <p>Hồ sơ</p>
        </li>
        <li class="item" data-step="3">
            <p>Chào mừng</p>
        </li>
    </ul>
    <!-- End: Nav -->
    <div class="secsion">
        <!-- Begin: content frame-->
        <div class="content-frame">
            <div class="content">
                <h2>Điều khoản và điều kiện cấp phép cộng tác viên CoRiPhoTo</h2>

                <h2>Tháng 11 Năm 2024</h2>

                <h3>1. Đăng ký</h3>

                <p>
                    1.1 Người đóng góp phải tạo tài khoản bằng cách cung cấp địa chỉ
                    email hợp lệ.
                </p>
                <p>
                    1.2 Chỉ được có một tài khoản đang hoạt động tại bất kỳ thời điểm
                    nào.
                </p>

                <h3>2. Giấy phép cho tác phẩm</h3>

                <p>
                    Người đóng góp cấp cho Công ty quyền sử dụng các tác phẩm mà họ
                    tải lên một cách không độc quyền, toàn cầu, và có thể chuyển
                    nhượng.
                </p>

                <h3>3. Tiền tham gia</h3>

                <p>
                    3.1 Cộng tác viên sẽ nhận 50% doanh thu ròng từ tác phẩm được phân
                    phối dưới dạng cao cấp.
                </p>
                <p>
                    3.2 Khoản thù lao sẽ được thanh toán vào tài khoản Ngân hàng khi
                    đạt tối thiểu 500.000VND.
                </p>

                <h3>4. Cam kết & Vấn đề trách nhiệm</h3>

                <p>
                    4.1 Người đóng góp đảm bảo tác phẩm không vi phạm quyền của bên
                    thứ ba và tự chịu trách nhiệm về việc này.
                </p>
                <p>
                    4.2 Bảo vệ và giữ cho Công ty an toàn khỏi mọi khiếu nại liên quan
                    đến vi phạm bản quyền.
                </p>

                <h3>5. Chấm dứt hợp đồng</h3>

                <p>
                    5.1 Người đóng góp có quyền chấm dứt các điều khoản bất cứ lúc nào
                    nhưng vẫn phải thông báo rõ ràng.
                </p>
                <p>
                    5.2 Công ty cũng giữ quyền chấm dứt các điều khoản này mà không
                    cần báo trước vì lý do chính đáng.
                </p>

                <h3>6. Bảo vệ dữ liệu</h3>

                <p>
                    Dữ liệu cá nhân sẽ được xử lý để thực hiện hợp đồng và tuân thủ
                    quy định pháp lý quốc gia của bạn.
                </p>
                <p></p>

                <p>
                    Điều khoản này tạo ra một sự thỏa thuận ràng buộc giữa Công ty và
                    người đóng góp, quy định rõ quyền lợi, trách nhiệm và nghĩa vụ của
                    mỗi bên liên quan đến việc sử dụng và phân phối các tác phẩm sáng
                    tạo.
                </p>
            </div>
            <button class="btn-agree">
                <i class="fa-solid fa-check"></i>Tôi chấp nhận các điều khoản và
                điều kiện
            </button>
            <a class="info-terms" href="terms-contributor.jsp">Xem chi tiết điều khoản</a>
        </div>
        <!-- End: Content frame-->
        <!-- Begin: Content condition -->
        <div class="info-user">
            <div class="content">
                <h2>Xác nhận thông tin cá nhân</h2>
                <form action="register-contributor" method="post">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input
                                name="email"
                                type="email"
                                class="form-control"
                                id="email"
                                placeholder="Xác nhận Email của bạn/Thay đổi email"
                                value="${email != null ? email : ''}"
                                required
                        />
                    </div>
                    <div class="mb-3">
                        <label
                                for="username"
                                class="form-label d-flex justify-content-between"
                        >
                            Tên tài khoản:
                        </label>
                        <input
                                name="username"
                                type="text"
                                class="form-control"
                                id="username"
                                placeholder="Xác nhận tên tài khoản của bạn"
                                value="${uname != null ? uname : ''}"
                                required
                        />
                    </div>
                    <button type="submit" class="btn btn-save w-100 mb-3">Lưu thông tin</button>
                </form>
            </div>
        </div>
        <!-- End: Content condition -->
        <!-- Begin: Welcom -->
        <div class="welcome-frame">
            <div class="content">
                <h2>Chào mừng bạn đến với CoRiPhoTo</h2>
                <p>Bạn gần như đã sẵn sàng để bắt đầu tải ảnh lên rồi.</p>
                <p>
                    Tuy nhiên, trước khi làm điều đó, chúng tôi khuyên bạn nên đọc Sổ
                    tay dành cho người sáng tạo có chứa tất cả thông tin quan trọng
                    liên quan đến hệ thống Người đóng góp của chúng tôi.
                </p>
            </div>
            <a href="homepage-seller.jsp" class="text-decoration-none"
            ><button class="btn-upload">Bắt đầu tải lên</button></a
            >
        </div>
        <!-- End: Welcom -->
    </div>
</div>

<!-- Hành động khi nhấn btn chấp nhận -->
<script src="./assets/js/register-contributor.js?"></script>
<script>
    // Truyền giá trị từ server vào JavaScript
    const successRegister = ${requestScope.successRegisSeller ? requestScope.successRegisSeller : false};
    // Nếu `successRegister` tồn tại, gọi hàm `hideInfoUser`
    if (successRegister) {
        hideContent();
        hideInfoUser();
    }
</script>
</body>
</html>

