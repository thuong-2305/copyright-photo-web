<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <title>Category Details</title>
    <jsp:include page="include/head.jsp" />
    <link rel="stylesheet" href="./assets/css/category-details.css">
</head>

<body>
<jsp:include page="include/navbar.jsp"/>

<!--section banner -->
<section class="banner d-flex flex-column justify-content-center align-items-center">
    <div class="banner-home">
        <div class="main-title text-white text-center">
            <h1 class="fw-bolder">Khám phá hàng trăm ảnh có bản quyền của chúng tôi.</h1>
            <p class="w-50 mx-auto">Với hàng trăm hình ảnh bản quyền trong danh mục của chúng tôi và nhiều hình ảnh khác
                được thêm
                vào mỗi ngày, bạn chắc chắn sẽ tìm thấy hình ảnh hoặc đồ họa hoàn hảo cho dự án tiếp theo của mình tại
                CoRiPhoto.</p>
        </div>
    </div>
</section>
<!--section banner -->

<!-- section categories -->
<section class="category">
    <div class="container list-category">
        <jsp:useBean id="categories" scope="request" type="java.util.List"/>
        <c:forEach var="item" items="${categories}">
            <a href="products?cid=${item.getCid()}" class="box-link">
                <div class="box">
                    <img src="${item.getUrl()}" alt="" class="image">
                    <p class="text-white fw-semibold fs-4">${item.getName()}</p>
                    <i class="bi bi-back"></i>
                </div>
            </a>
        </c:forEach>
    </div>
</section>
<!-- section categories -->

<!-- section content-add -->
<section class="content-add">
    <div class="container d-flex justify-content-center align-items-center bar-content">
        <ul class="d-flex border-bottom title-content">
            <li class="tab list-unstyled px-3 text-secondary active" data-target="social-network">Mạng xã hội</li>
            <li class="tab list-unstyled px-3 text-secondary" data-target="marketing">Chiến dịch thị trường</li>
            <li class="tab list-unstyled px-3 text-secondary" data-target="design">Thiết kế website</li>
            <li class="tab list-unstyled px-3 text-secondary" data-target="creative">Sáng tạo dự án</li>
        </ul>
    </div>
    <div class="container main-content">
        <div id="social-media" class="content">
            <div class="container content-text social-network active">
                <ul class="float-start w-50 list-unstyled">
                    <h2 class="my-2">Mạng xã hội</h2>
                    <li class="text-secondary my-3"><i class="fa-solid fa-caret-right text-success"></i> Nghiên cứu trên mạng xã
                        hội đã chỉ
                        ra rằng việc thường xuyên đăng nội dung là một trong những chìa
                        khóa thu hút khán giả. Bạn không có thời gian đi loanh quanh để chụp ảnh cho Instagram của mình? Đừng
                        lo lắng. Thư viện hình ảnh miễn phí khổng lồ của CoRiPhoto luôn sẵn sàng trợ giúp. Ví dụ: giả sử bạn
                        muốn đăng một câu trích dẫn đầy cảm hứng và bạn cho rằng những từ đó sẽ kết hợp tốt nhất với một bức ảnh
                        bình minh tuyệt đẹp. Nếu không muốn dậy sớm để tự chụp ảnh, bạn chỉ cần gõ "Sunrise" vào thanh tìm kiếm
                        của CoRiPhoto và chọn.
                    </li>
                    <li class="text-secondary my-3"><i class="fa-solid fa-caret-right text-success"></i> Bạn có bảng màu cụ thể
                        mà bạn sử dụng trên Instagram của mình nhưng ảnh bạn
                        tìm thấy trong thư viện của
                        chúng tôi không hoàn toàn khớp với nhau? Sử dụng CoRiPhoto Editor để điều chỉnh màu sắc của hình ảnh
                        miễn phí bản quyền. Tải xuống tác phẩm đã chỉnh sửa của bạn và chia sẻ.
                    </li>
                </ul>
                <img src="./assets/images/People/9.jpg" alt="" class="float-end w-50 my-3">
            </div>

            <div class="container content-text marketing">
                <ul class="float-start w-50 list-unstyled">
                    <h2 class="my-2">Chiến dịch thị trường</h2>
                    <li class="text-secondary my-3"><i class="fa-solid fa-caret-right text-success"></i> Thêm không khí đích
                        thực vào chiến dịch tiếp thị tiếp theo của bạn bằng
                        những
                        bức ảnh miễn phí bản quyền. Không có gì ngạc nhiên khi người tiêu dùng phản ứng tích cực hơn với những
                        người
                        có vẻ ngoài chân thật trong các quảng cáo mà họ xem. Những người cứng nhắc, tạo dáng với nụ cười gượng gạo
                        sẽ không giúp bán được sản phẩm của bạn. May mắn thay, thư viện của CoRiPhoto tràn ngập những bức ảnh
                        miễn phí về những người có vẻ ngoài tự nhiên. Bằng cách sử dụng các tùy chọn bộ lọc của CoRiPhoto, bạn
                        có thể chỉ định độ tuổi, giới tính, dân tộc và số lượng người trong hình ảnh của mình.</li>
                </ul>
                <img src="./assets/images/Commercial/2.jpg" alt="" class="float-end w-50 my-3">
            </div>

            <div class="container content-text design">
                <ul class="float-start w-50 list-unstyled">
                    <h2 class="my-2">Thiết kế web</h2>
                    <li class="text-secondary my-3"><i class="fa-solid fa-caret-right text-success"></i> Làm nổi bật thiết kế
                        trang web của bạn và nổi bật giữa đám đông bằng
                        hình ảnh miễn phí bản quyền. Hãy thử khám phá trang hình ảnh "Tóm tắt" được tuyển chọn của CoRiPhoto.
                        Trong trang đó, bạn thậm chí sẽ tìm thấy một trang danh mục phụ dành cho "Hình nền trừu tượng" để giúp
                        bạn tiết kiệm thời gian hơn nữa khi tìm kiếm hình ảnh. Bạn cũng có thể xem trang danh mục hình ảnh
                        "Nền/Hoạ tiết" hoặc chỉ cần nhập từ khóa vào thanh tìm kiếm chính để tìm bất kỳ loại nền nào mà bạn
                        có thể nghĩ đến.
                    </li>
                    <li class="text-secondary my-3"><i class="fa-solid fa-caret-right text-success"></i> Sử dụng các tùy chọn bộ
                        lọc của CoRiPhoto để chọn màu chính bạn muốn
                        làm nổi bật trong hình ảnh của mình. Đảm bảo màu sắc của logo công ty và nền trang web của bạn bổ sung
                        cho nhau. Điều này sẽ giúp mang lại cho trang web của bạn một cái nhìn gắn kết, chuyên nghiệp.
                    </li>
                </ul>
                <img src="./assets/images/technology/data/7.webp" alt="" class="float-end w-50 my-3">
            </div>

            <div class="container content-text creative">
                <ul class="float-start w-50 list-unstyled">
                    <h2 class="my-2">Sáng tạo dự án</h2>
                    <li class="text-secondary my-3"><i class="fa-solid fa-caret-right text-success"></i> Với hàng triệu hình ảnh
                        miễn phí bản quyền để lựa chọn và thư viện hình ảnh
                        ngày càng phát triển, CoRiPhoto chắc chắn sẽ có ảnh, hình minh họa hoặc vectơ để đáp ứng nhu cầu sáng
                        tạo của bạn. Hình ảnh của chúng tôi hoàn hảo cho nhiều tình huống và dự án, từ hình nền trang web đến
                        thiệp
                        mời đám cưới, ảnh bìa Facebook cho đến câu chuyện trên Instagram, v.v. Hãy bắt đầu ngay hôm nay.
                    </li>
                </ul>
                <img src="./assets/images/HandScenery/007.jpg" alt="" class="float-end w-50 my-3">
            </div>
        </div>
    </div>
</section>

<!-- section content-add -->

<!--section banner2 -->
<section class="banner ver2 d-flex flex-column justify-content-center align-items-center">
    <div class="banner-home">
        <div class="main-title text-white text-center">
            <h1 class="fw-bolder mb-3">Không thể tìm thấy những gì bạn đang tìm kiếm.</h1>
            <section class="search">
                <div class="search-container">
                    <div class="dropdown">
                        <button class="text-secondary" id="type-search"><i class="fa-solid fa-image px-2"></i><span>Tất cả
                          ảnh</span><i class="fa-solid fa-caret-down px-2"></i></button>
                        <div class="dropdown-content">
                            <a href="#" class="active" data-icon="fa-image"><i class="fa-solid fa-image pe-3"></i>Tất cả
                                ảnh</a>
                            <a href="#" data-icon="fa-camera"><i class="fa-solid fa-camera px-3"></i>Ảnh chụp</a>
                            <a href="#" data-icon="fa-vector-square"><i class="fa-solid fa-vector-square px-3"></i>Vectors</a>
                            <a href="#" data-icon="fa-pen-fancy"><i class="fa-solid fa-pen-fancy px-3"></i>AI</a>
                        </div>
                    </div>
                    <div class="search-bar">
                        <input type="text" id="search-input" placeholder="Tìm kiếm tất cả nguồn">
                        <span class="clear-btn text-dark">&#10005;</span>
                    </div>
                    <button class="search-button"><i class="fa-solid fa-magnifying-glass"></i><span class="ps-2">Tìm
                      kiếm</span></button>
                </div>
            </section>
        </div>
    </div>
</section>
<!--section banner2 -->

<jsp:include page="include/footer.jsp"/>

<jsp:include page="include/scripts.jsp"/>
</body>

</html>
