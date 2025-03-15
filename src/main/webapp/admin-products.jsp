<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- CSS -->
    <link rel="stylesheet" href="./assets/css/admin-products.css"/>
    <link rel="stylesheet" href="./assets/css/admin-1.css"/>
    <link rel="stylesheet" href="assets/css/admin-nav.css">
    <link rel="stylesheet" href="assets/css/admin-dashboard.css"/>
    <jsp:include page="include/head-libraries.jsp" />
    <title>Admin</title>
</head>

<body>
<!-- MAIN -->
<section class="container-main">
    <!-- LEFT MAIN -->
    <jsp:include page="include/sidebar.jsp" />
    <!-- LEFT MAIN -->

    <!-- RIGHT MAIN -->
    <section class="right-category">
        <!-- navbar admin -->
        <jsp:include page="include/nav-admin.jsp"/>

        <!-- Content main -->
        <div id="admin-dashboard-graph">
            <div class="mt-4 content-view">
                <div class="header d-flex justify-content-between align-items-center mb-3 py-1 px-2">
                    <h5 class="fw-semibold">Các sản phẩm</h5>
                    <div id="exportButtons">
                        <button class="btn button-add fw-semibold"><i class="bi bi-plus-circle me-2"></i>Thêm sản phẩm</button>
                    </div>
                </div>

                <!-- Bảng sản phẩm -->
                <div class="frame__container px-2">
                    <div class="card-body">
                        <table id="productsTable" class="table table-bordered">
                            <colgroup>
                                <col style="width: 5%;">
                                <col style="width: 35%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 20%;">
                            </colgroup>
                            <thead class="table-dark">
                            <tr>
                                <th>Mã</th>
                                <th>Tên</th>
                                <th>Username</th>
                                <th>Giá</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- Ví dụ -->
                            <c:forEach var="product" items="${products}">
                                <tr>
                                    <td>#${product.id}</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img src="${product.url}" alt="" style="width: 40px; height: 40px; border-radius: 5px;">
                                            <span class="ms-3">${product.name}</span>
                                        </div>
                                    </td>
                                    <td>${product.uid}</td>
                                    <td><fmt:formatNumber value="${product.price}" pattern="#,###"/>đ</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${product.status == 'accepted'}">
                                                <span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: green; background: #d1e7dd">
                                                    Accepted
                                                </span>
                                            </c:when>
                                            <c:when test="${product.status == 'waiting'}">
                                                <span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: orange; background: #fdffb6">
                                                    Waiting
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: red; background: #fee0e3">
                                                    Rejected
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <button class="btn view-btn" data-id="${product.id}"><i class="bi bi-eye-fill"></i></button>
                                        <button class="btn edit-btn" data-id="${product.id}"><i class="bi bi-pencil-square"></i></button>
                                        <button class="btn delete-btn" data-id="${product.id}"><i class="fa-solid fa-trash"></i></button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div id="khungThemSanPham" class="overlay">
                        <span class="close"
                              onclick="this.parentElement.style.transform = 'scale(0)';">&times;</span>
                        <form action="${pageContext.request.contextPath}/admin-products" method="POST">
                            <table id="khungThemSanPhamTable" class="overlayTable table-outline table-content table-header">
                                <tr>
                                    <th colspan="2">Thêm hình ảnh</th>
                                </tr>
                                <tr>
                                    <td>Hình:</td>
                                    <td>
                                        <input type="file" name="image" accept="image/*" />
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2">Thông tin hình ảnh</th>
                                </tr>
                                <tr style="display: none">
                                    <td><label>
                                        <input type="text" name="loi"/>
                                    </label></td>
                                </tr>
                                <tr>
                                    <td>Tên hình ảnh:</td>
                                    <td><label>
                                        <input type="text" name="nameProduct" required />
                                    </label></td>
                                </tr>
                                <tr>
                                    <td>Mô tả:</td>
                                    <td><input type="text" name="description" required /></td>
                                </tr>
                                <tr>
                                    <td>Loại hình ảnh:</td>
                                    <td><input type="text" name="category" required /></td>
                                </tr>
                                <tr>
                                    <td>Giá:</td>
                                    <td><input type="number" name="price" step="1000" required /></td>
                                </tr>
                                <tr>
                                    <td>ID người đăng:</td>
                                    <td><input type="text" name="contributor" required /></td>
                                </tr>
                                <tr>
                                    <td>Trạng thái:</td>
                                    <td><label>
                                        <select name="status">
                                            <option value="accepted">
                                                Đã chấp nhận
                                            </option>
                                            <option value="waiting">Chờ đợi</option>
                                            <option value="rejected">Từ chối</option>
                                        </select>
                                    </label></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="table-footer">
                                        <button type="submit">THÊM</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div id="khungSuaSanPham" class="overlay">
                            <span class="close"
                                  onclick="this.parentElement.style.transform = 'scale(0)';">&times;</span>
                            <form action="${pageContext.request.contextPath}/admin-products" method="POST">
                                <table id="khungSuaSanPhamTable" class="overlayTable table-outline table-content table-header">
                                    <tr>
                                        <th colspan="2">Thêm hình ảnh</th>
                                    </tr>
                                    <tr>
                                        <td>Hình:</td>
                                        <td>
                                            <input type="file" name="image" accept="image/*" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="2">Thông số kĩ thuật</th>
                                    </tr>
                                    <tr style="display: none">
                                        <td><label>
                                            <input type="text" name="defineForm" value="formEdit"/>
                                        </label></td>
                                    </tr>
                                    <tr style="display: none">
                                        <td><label>
                                            <input type="text" name="idProduct"/>
                                        </label></td>
                                    </tr>
                                    <tr>
                                        <td>Tên hình ảnh:</td>
                                        <td><label>
                                            <input type="text" name="nameProduct" required />
                                        </label></td>
                                    </tr>
                                    <tr>
                                        <td>Mô tả:</td>
                                        <td><input type="text" name="description" required /></td>
                                    </tr>
                                    <tr>
                                        <td>Loại hình ảnh:</td>
                                        <td><input type="text" name="category" required /></td>
                                    </tr>
                                    <tr>
                                        <td>Giá:</td>
                                        <td><input type="number" name="price" step="1000" required /></td>
                                    </tr>
                                    <tr>
                                        <td>Người đóng góp:</td>
                                        <td><input type="text" name="contributor" required /></td>
                                    </tr>
                                    <tr>
                                        <td>Trạng thái:</td>
                                        <td><label>
                                            <select name="status">
                                                <option value="accepted">
                                                    Đã chấp nhận
                                                </option>
                                                <option value="waiting">Chờ đợi</option>
                                                <option value="rejected">Từ chối</option>
                                            </select>
                                        </label></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="table-footer">
                                            <button type="submit">Cập nhật</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                </div>
            </div>
        </div>

        <!-- footer-admin -->
        <jsp:include page="include/admin-footer.jsp" />
    </section>
    <!-- RIGHT MAIN -->
</section>
<!-- MAIN -->

<!-- DataTables -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<!-- DataTables Buttons JS -->
<script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>

<!-- JS -->
<jsp:include page="include/admin-libraries.jsp" />

<script>
    $(document).ready(function () {
        const table = $('#productsTable').DataTable({
            buttons:[
                {
                    extend: 'copy',
                    text: 'Sao chép'
                },
                {
                    extend: 'excel',
                    text: 'Xuất Excel'
                },
                {
                    extend: 'print',
                    text: 'In'
                }
            ],
            language: {
                search: "Nhập từ khóa:",
                lengthMenu: "Hiển thị _MENU_ mục",
                info: "Hiển thị _START_ đến _END_ của _TOTAL_ mục",
                infoEmpty: "Không có dữ liệu để hiển thị",
                infoFiltered: "(lọc từ _MAX_ mục)",
                paginate: { previous: "←", next: "→" }
            },
            scrollX: false
        });
        table.buttons().container().appendTo('#exportButtons');

        $(".buttons-copy span").html("<i class=\"bi bi-copy\"></i> Copy");
        $(".buttons-excel span").html("<i class=\"bi bi-file-earmark-excel\"></i> Excel");
        $(".buttons-print span").html("<i class=\"bi bi-printer\"></i> Print");

        $('.dataTables_filter input').attr('placeholder', 'Tìm kiếm sản phẩm ...');
    });

    $(document).ready(function () {
        const controlsWrapper = $("<div class='dataTables-controls'></div>");
        $("#productsTable_filter, #productsTable_length").wrapAll(controlsWrapper);
    });
</script>
</body>
</html>
