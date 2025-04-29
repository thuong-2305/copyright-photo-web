<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link rel="stylesheet" href="./assets/css/admin-1.css"/>
  <link rel="stylesheet" href="././assets/css/admin-dashboard.css"/>
  <link rel="stylesheet" href="./assets/css/admin-homepage.css"/>
  <link rel="stylesheet" href="./assets/css/admin-products.css"/>
  <link rel="stylesheet" href="./assets/libraries/bootstrap/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="./assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css"/>
  <link rel="stylesheet" href="./assets/libraries/bootstrap-icons/font/bootstrap-icons.min.css"/>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
  <script src="./assets/js/admin-products.js"></script>
  <title>Admin</title>

  <style>
    .table-dark {
      background-color: #343a40;
      color: #fff;
    }
    .edit-btn {
      margin-right: 5px;
    }
    .dashboard-info {
      display: flex;
      justify-content: space-between;
      margin-bottom: 20px;
    }
    .dashboard-info .info-box {
      flex: 1;
      margin: 0 10px;
      padding: 15px;
      border: 1px solid #ccc;
      border-radius: 8px;
      text-align: center;
      background-color: #f8f9fa;
    }
    .dashboard-info .info-box h3 {
      margin: 10px 0;
      font-size: 24px;
    }
  </style>
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
    <main class="mt-4">
      <div class="frame">
        <div class="frame__container">
          <div class="mt-4">
              <div class="container header d-flex justify-content-between align-items-center mb-3 py-2">
                  <h3>Danh sách ảnh người bán upload</h3>
                  <div class="add-category">
                      <i class="fa-solid fa-print"></i>
                      <i class="bi bi-arrow-bar-down mx-2"></i>
                  </div>
              </div>
          </div>
          <div class="card">
            <div class="card-body">
              <table id="productsTable" class="table table-bordered table-striped">
                <colgroup>
                  <col style="width: 5%;">
                  <col style="width: 15%;">
                  <col style="width: 30%;">
                  <col style="width: 15%;">
                  <col style="width: 17%;">
                  <col style="width: 20%;">
                </colgroup>
                <thead class="table-success">
                <tr>
                  <th>Stt</th>
                  <th>Id người bán</th>
                  <th>Tên</th>
                  <th>Hình ảnh</th>
                  <th>Thời gian</th>
                  <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <!-- Ví dụ -->
                <%
                    List<Product> productList = (List<Product>) request.getAttribute("products");
                    for (int i = 0; i < productList.size(); i++) {
                        Product product = productList.get(i);
                %>
                  <tr>
                    <td><%= i + 1 %></td>
                    <td><%= product.getUid() %></td>
                    <td><%= product.getName() %></td>
                    <td><img src="<%= product.getUrl() %>" alt="" style="width:60px; height: 60px; border-radius: 5px;"></td>
                    <td><%= product.getDateUpload() %></td>
                    <td>
                      <button class="btn accept-btn btn-primary">
                          <a class="text-light text-decoration-none" href="/AdminHandleActNotify?id=<%= product.getId() %>&act=<%= "accepted" %>&uid=<%= product.getUid()%>">Accept</a>
                      </button>
                      <button class="btn reject-btn btn-danger" data-id="<%=product.getId() %>">
                          <a class="text-light text-decoration-none" href="/AdminHandleActNotify?id=<%= product.getId() %>&act=<%= "rejected" %>&uid=<%= product.getUid()%>">Reject</a>
                      </button>
                    </td>
                  </tr>
                <% } %>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </main>
  </section>
  <!-- RIGHT MAIN -->
</section>
<!-- MAIN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="./assets/js/admin.js"></script>
<script src="./assets/js/admin-dashboard.js"></script>
<script src="./assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
  $(document).ready(function () {
    var table = $('#productsTable').DataTable({
      buttons:['copy', 'excel', 'print', 'excel', 'csv'],
      language: {
        search: "Nhập từ khóa:",
        lengthMenu: "Hiển thị _MENU_ mục",
        info: "Hiển thị _START_ - _END_ / _TOTAL_ mục",
        infoEmpty: "Không có dữ liệu để hiển thị",
        infoFiltered: "(lọc từ _MAX_ mục)",
        paginate: {
          previous: "Trước",
          next: "Tiếp"
        }
      },
      scrollX: true
    });
    table.buttons().container().appendTo('#productsTable_wapper .col-md-6:eq(0)');
    var search = $('.dataTables_filter input');
    search.attr('text', 'Tìm kiếm');
    search.attr('placeholder', 'Tìm kiếm sản phẩm ...');
  });
</script>

</body>
</html>
