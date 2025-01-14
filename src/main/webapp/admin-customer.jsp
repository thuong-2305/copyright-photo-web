<%-- Created by IntelliJ IDEA. User: ADMIN Date: 1/14/2025 Time: 12:59 PM To
change this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./assets/css/admin-1.css" />
    <link
      rel="stylesheet"
      href="./assets/libraries/bootstrap/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="./assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css"
    />
    <link
      rel="stylesheet"
      href="./assets/libraries/bootstrap-icons/font/bootstrap-icons.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"
    />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <title>Admin</title>
  </head>
  <body>
    <!-- MAIN -->
    <section class="container-main">
      <!-- LEFT MAIN -->
      <section class="left d-flex flex-column justify-content-between">
        <div class="top-left">
          <p class="fs-5 fw-semibold m-0 text-center mt-2">
            <span class="text-logo fw-bold">CoRiPhoto</span> Admin
          </p>
          <ul class="list-unstyled">
            <li>
              <a href="${pageContext.request.contextPath}/ShowDashBoard"
                ><i class="fa-solid fa-house"></i>Trang chủ</a
              >
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/admin-products"
                ><i class="bi bi-grid-fill"></i>Sản phẩm</a
              >
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/admin-category"
                ><i class="bi bi-list-task"></i>Danh mục</a
              >
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/admin-order"
                ><i class="bi bi-wallet-fill"></i>Đơn hàng</a
              >
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/admin-customer"
                ><i class="fa-solid fa-user"></i>Khách hàng</a
              >
            </li>
            <li class="active">
              <a href="${pageContext.request.contextPath}/admin-contributor"
                ><i class="bi bi-coin"></i>Người phân phối</a
              >
            </li>
            <hr />
            <li>
              <a href="${pageContext.request.contextPath}/homepage"
                ><i class="bi bi-box-arrow-right"></i>Đăng xuất</a
              >
            </li>
          </ul>
        </div>
        <div
          class="avatar bottom-left d-flex justify-content-between align-items-center mx-2 mb-4"
        >
          <div class="d-flex justify-content-center align-items-center">
            <img src="./assets/images/avart-default.png" alt="" />
            <p class="ms-2 m-0">Thanh Thương</p>
          </div>
          <i class="bi bi-three-dots"></i>
        </div>
      </section>
      <!-- LEFT MAIN -->

  <!-- RIGHT MAIN -->
  <section class="right-category">
    <div class="mt-4">
      <div class="container header d-flex justify-content-between align-items-center mb-3 py-2">
        <div class="add-category">
          <button class="btn btn-primary" id="openModalBtn">
            + Thêm khách hàng mới
          </button>
        </div>
      </div>

          <h1>Danh sách người dùng</h1>
          <table
            id="userTable"
            class="display table table-bordered table-striped"
          >
            <thead class="table-dark">
              <tr>
                <th>UID</th>
                <%--
                <th>Role</th>
                --%>
                <th>Full Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Create Date</th>
                <th>Hành động</th>
                <!-- Cột Hành động -->
              </tr>
            </thead>
            <tbody>
              <c:forEach var="user" items="${users}">
                <tr>
                  <td>${user.uid}</td>
                  <%--
                  <td>${user.role}</td>
                  --%>
                  <td>${user.fullName}</td>
                  <td>${user.username}</td>
                  <td>${user.email}</td>
                  <td>${user.createDate}</td>
                  <td>
                    <button
                      class="btn edit-btn btn-warning"
                      data-id="${user.uid}"
                    >
                      Sửa
                    </button>
                    <button
                      class="btn delete-btn btn-danger"
                      data-id="${user.uid}"
                    >
                      Xóa
                    </button>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <div
          class="modal fade"
          id="categoryModal"
          tabindex="-1"
          aria-labelledby="categoryModalLabel"
          aria-hidden="true"
        >
          <div class="modal-dialog">
            <div class="modal-content">
              <form
                id="categoryForm"
                action="${pageContext.request.contextPath}/admin-customer"
                method="POST"
              >
                <div class="modal-header">
                  <h5 class="modal-title" id="categoryModalLabel">
                    Thêm người dùng
                  </h5>
                  <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                  ></button>
                </div>
                <div class="modal-body">
                  <div class="mb-3" style="display: none">
                    <label for="define" class="form-label">Họ tên</label>
                    <input
                      type="text"
                      class="form-control"
                      id="define"
                      name="defineForm"
                      value="formAdd"
                    />
                  </div>
                  <div class="mb-3">
                    <label for="categoryName" class="form-label">Họ tên</label>
                    <input
                      type="text"
                      class="form-control"
                      id="categoryName"
                      name="username"
                      required
                    />
                  </div>
                  <div class="mb-3">
                    <label for="categoryEmail" class="form-label">Email</label>
                    <input
                      type="email"
                      class="form-control"
                      id="categoryEmail"
                      name="email"
                      required
                    />
                  </div>
                  <div class="mb-3">
                    <label for="categoryProducts" class="form-label"
                      >Mật khẩu</label
                    >
                    <input
                      type="password"
                      class="form-control"
                      id="categoryProducts"
                      name="password"
                      required
                    />
                  </div>
                </div>
                <div class="modal-footer">
                  <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal"
                  >
                    Thoát
                  </button>
                  <button
                    type="submit"
                    class="btn btn-primary"
                    id="saveCategory"
                  >
                    Lưu
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </section>
      <!-- RIGHT MAIN -->
    </section>
    <!-- MAIN -->
    <script src="./assets/js/admin.js"></script>
    <script src="./assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
      $(document).ready(function () {
        $("#userTable").DataTable({
          language: {
            search: "Nhập từ khóa:",
            lengthMenu: "Hiển thị _MENU_ mục",
            info: "Hiển thị _START_ đến _END_ của _TOTAL_ mục", // Tùy chỉnh "Showing 1 to 10 of 53 entries"
            infoEmpty: "Không có dữ liệu để hiển thị", // Khi không có bản ghi
            infoFiltered: "(lọc từ _MAX_ mục)", // Thông báo khi có lọc dữ liệu
            paginate: {
              previous: "Trước", // Tùy chỉnh "Previous"
              next: "Tiếp", // Tùy chỉnh "Next"
            },
          },
        });
        var table = $("#userTable").DataTable();
        // Thay đổi placeholder của khung tìm kiếm
        var search = $(".dataTables_filter input");
        search.attr("text", "Tìm kiếm");
        search.attr("placeholder", "Tìm kiếm người dùng ...");
      });
    </script>
    <script>
      document
        .getElementById("openModalBtn")
        .addEventListener("click", function () {
          const myModal = new bootstrap.Modal(
            document.getElementById("categoryModal")
          );
          myModal.show();
        });
      document
        .getElementById("saveCategory")
        .addEventListener("click", function () {
          const modal = bootstrap.Modal.getInstance(
            document.getElementById("categoryModal")
          );
          modal.hide();
        });
    </script>
  </body>
</html>
