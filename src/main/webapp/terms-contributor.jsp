<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="include/head.jsp"/>
    <link href="${pageContext.request.contextPath}/assets/css/terms-contributor.css" rel="stylesheet" type="text/css" />
    <style>
        #nav:not(.scrolled) .title-logo {
            color: black;
        }

        #nav:not(.scrolled) .title-item {
            color: black !important;
        }

        #nav:not(.scrolled) .nav-item:hover {
            color: #009970;
        }

        #nav:not(.scrolled) .title-item:hover {
            color: #009970 !important;
        }

        #nav:not(.scrolled) .title-item:hover i {
            color: #009970 !important;
        }

        #nav:not(.scrolled) .nav-item:hover .title-item {
            color: #009970 !important;
        }

        #nav:not(.scrolled) .container .login-button {
            background-color: transparent;
            color: black;
            padding: 7px 19px;
            border: 1px solid black;
        }
    </style>
</head>
<body>
<jsp:include page="include/navbar.jsp"/>
<div class="container">
    <aside class="sidebar">
        <h3>Các Mục</h3>
        <ul class="sidebar-menu">
            <li><a href="#section1" class="active">Giới thiệu</a></li>
            <li><a href="#section2">Đăng ký tài khoản</a></li>
            <li><a href="#section3">Nộp ảnh</a></li>
            <li><a href="#section4">Quyền sở hữu</a></li>
            <li><a href="#section5">Hoa hồng và thanh toán</a></li>
            <li><a href="#section6">Giấy phép và sử dụng</a></li>
            <li><a href="#section7">Quy định chung</a></li>
        </ul>
    </aside>

    <main class="content">
        <h1>Điều Khoản Người Đóng Góp</h1>
        <p class="updated">Cập nhật lần cuối: 17 tháng 4, 2025</p>

        <div class="buttons">
            <button class="print-btn">
                <i class="fas fa-print"></i> In trang
            </button>
            <button class="pdf-btn">
                <i class="fas fa-file-pdf"></i> Tải PDF
            </button>
        </div>

        <section id="section1">
            <h2>1. Giới thiệu</h2>
            <p>
                Chào mừng bạn đến với điều khoản người đóng góp của CoRiPhoto. Văn
                bản này đặt ra các điều khoản và điều kiện chi phối mối quan hệ giữa
                CoRiPhoto ("chúng tôi", "của chúng tôi") và bạn - người đóng góp
                hình ảnh ("người đóng góp", "bạn", "của bạn").
            </p>
            <p>
                Bằng cách đăng ký làm người đóng góp và/hoặc tải lên bất kỳ hình ảnh
                nào lên nền tảng của chúng tôi, bạn xác nhận rằng bạn đã đọc, hiểu
                và đồng ý tuân thủ các điều khoản này.
            </p>
        </section>

        <section id="section2">
            <h2>2. Đăng ký tài khoản</h2>
            <p>Để trở thành người đóng góp, bạn phải:</p>
            <ul>
                <li>
                    Từ 18 tuổi trở lên hoặc có sự đồng ý của cha mẹ/người giám hộ
                </li>
                <li>Cung cấp thông tin cá nhân chính xác và đầy đủ</li>
                <li>Tự chịu trách nhiệm về việc bảo mật thông tin tài khoản</li>
            </ul>
        </section>

        <section id="section3">
            <h2>3. Nộp ảnh</h2>
            <p>Khi bạn tải lên hình ảnh để đăng tải trên CoRiPhoto:</p>
            <ul>
                <li>
                    Chúng tôi có quyền chấp nhận hoặc từ chối hình ảnh theo quy định
                    về chất lượng và nội dung
                </li>
                <li>
                    Hình ảnh phải tuân thủ tất cả các hướng dẫn kỹ thuật được công bố
                    trên trang web
                </li>
                <li>
                    Bạn phải cung cấp từ khóa và mô tả chính xác cho mỗi hình ảnh
                </li>
            </ul>
        </section>

        <section id="section4">
            <h2>4. Quyền sở hữu</h2>
            <p>Bằng việc tải lên hình ảnh:</p>
            <ul>
                <li>
                    Bạn xác nhận rằng bạn sở hữu hoặc có quyền hợp pháp đối với tất cả
                    hình ảnh mà bạn tải lên
                </li>
                <li>
                    Bạn cấp cho chúng tôi giấy phép không độc quyền, toàn cầu để sử
                    dụng, sao chép và phân phối hình ảnh của bạn
                </li>
                <li>Bạn vẫn giữ bản quyền cho hình ảnh của mình</li>
            </ul>
        </section>

        <section id="section5">
            <h2>5. Hoa hồng và thanh toán</h2>
            <p>Đối với mỗi giấy phép được bán:</p>
            <ul>
                <li>
                    Bạn sẽ nhận được 50% doanh thu từ việc cấp phép hình ảnh của bạn
                </li>
                <li>
                    Thanh toán được thực hiện hàng tháng cho số dư từ $50 trở lên
                </li>
                <li>
                    Các khoản thanh toán nhỏ hơn sẽ được chuyển sang tháng tiếp theo
                </li>
            </ul>
        </section>

        <section id="section6">
            <h2>6. Giấy phép và sử dụng</h2>
            <p>
                Chúng tôi cấp giấy phép cho khách hàng sử dụng hình ảnh của bạn theo
                các điều khoản sau:
            </p>
            <ul>
                <li>Giấy phép tiêu chuẩn cho phép sử dụng nhiều lần</li>
                <li>Giấy phép Mở rộng cho các trường hợp sử dụng đặc biệt</li>
            </ul>
            <p>
                Khi khách hàng mua ảnh, họ sẽ nhận được chi tiết giấy phép dưới dạng
                tệp PDF kèm theo hình ảnh tải xuống.
            </p>
        </section>

        <section id="section7">
            <h2>7. Quy định chung</h2>
            <p>Các điều khoản bổ sung:</p>
            <ul>
                <li>
                    Chúng tôi có thể thay đổi các điều khoản này với thông báo trước
                    30 ngày
                </li>
                <li>
                    Chúng tôi có quyền chấm dứt tài khoản người đóng góp vi phạm điều
                    khoản
                </li>
                <li>Mọi tranh chấp sẽ được giải quyết theo luật pháp Việt Nam</li>
            </ul>
        </section>

        <div class="contact-box">
            <h3>Bạn cần hỗ trợ?</h3>
            <p>
                Nếu bạn có thắc mắc về điều khoản này, vui lòng liên hệ với bộ phận
                hỗ trợ người đóng góp của chúng tôi:
            </p>
            <a href="mailto:contributors@yourphotostock.com" class="contact-btn"
            >Liên hệ hỗ trợ</a
            >
        </div>
    </main>
</div>

<jsp:include page="include/footer.jsp"/>

<jsp:include page="include/scripts.jsp"/>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const menuItems = document.querySelectorAll(".sidebar-menu a");

        menuItems.forEach((item) => {
            item.addEventListener("click", function (e) {
                menuItems.forEach((i) => i.classList.remove("active"));

                this.classList.add("active");

                const targetId = this.getAttribute("href").substring(1);
                const targetSection = document.getElementById(targetId);

                if (targetSection) {
                    e.preventDefault();
                    window.scrollTo({
                        top: targetSection.offsetTop - 100,
                        behavior: "smooth",
                    });
                }
            });
        });

        const printButton = document.querySelector(".print-btn");
        if (printButton) {
            printButton.addEventListener("click", function () {
                window.print();
            });
        }

        const pdfButton = document.querySelector(".pdf-btn");
        if (pdfButton) {
            pdfButton.addEventListener("click", function () {
                alert("Tính năng tải PDF đang được phát triển.");
            });
        }

        window.addEventListener("scroll", function () {
            const sections = document.querySelectorAll("main section");
            let currentSectionId = "";

            sections.forEach((section) => {
                const sectionTop = section.offsetTop;
                const sectionHeight = section.clientHeight;

                if (
                    window.pageYOffset >= sectionTop - 150 &&
                    window.pageYOffset < sectionTop + sectionHeight - 150
                ) {
                    currentSectionId = section.getAttribute("id");
                }
            });

            if (currentSectionId) {
                menuItems.forEach((item) => {
                    item.classList.remove("active");

                    if (item.getAttribute("href") === `#${currentSectionId}`) {
                        item.classList.add("active");
                    }
                });
            }
        });
    });
</script>
</body>
</html>
