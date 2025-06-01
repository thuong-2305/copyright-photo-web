<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- CSS -->
  <link rel="stylesheet" href="assets/css/admin-categories.css">
  <link rel="stylesheet" href="assets/css/admin-1.css">
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
    <div id="admin-dashboard-graph" class="view-products-main">
      <div class="mt-4 content-view">
        <div class="header d-flex justify-content-between align-items-center mb-3 py-1 px-2">
          <h5 class="fw-semibold">Các danh mục</h5>
          <div id="exportButtons">
            <button class="btn button-add fw-semibold"><i class="bi bi-plus-circle me-2"></i>Thêm danh mục</button>
          </div>
        </div>

        <div class="frame__container px-2">
          <div class="card-body">
            <table id="productsTable" class="table table-bordered">
              <colgroup>
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 20%;">
                <col style="width: 25%;">
                <col style="width: 15%;">
              </colgroup>
              <thead class="table-dark">
              <tr>
                <th>Mã log</th>
                <th>Mức độ</th>
                <th>Username</th>
                <th>Thời gian</th>
                <th>Nội dung</th>
                <th>Hành động</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="log" items="${logs}">
                <tr>
                  <td>${log.id}</td>
                  <td>${log.severity}</td>
                  <td>${log.username}</td>
                  <td>${log.formatOrderDateTime}</td>
                  <td>${log.message}</td>
                  <td>
                    <div class="d-flex justify-content-start">
                      <button class="btn view-btn" data-id="${log.id}"><i class="bi bi-eye-fill"></i></button>
                      <button class="btn edit-btn" data-id="${log.id}"><i class="bi bi-pencil-square"></i></button>
                      <button class="btn delete-btn" data-id="${log.id}"><i class="fa-solid fa-trash"></i></button>
                    </div>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>

          <!-- Xác nhận xóa sản phẩm -->
          <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title user-select-none" id="deleteModalLabel">
                    <i class="bi bi-exclamation-triangle-fill" style="color: #fa2e2e;"></i>
                    Xóa sản phẩm
                  </h5>
                </div>
                <div class="modal-body">
                  Bạn có chắc chắn muốn xóa sản phẩm này?
                </div>
                <div class="modal-footer">
                  <button type="button" id="confirmCancelDelete" class="btn btn-secondary rounded-pill fw-semibold" data-dismiss="modal">Hủy</button>
                  <button type="button" id="confirmDelete" class="btn btn-danger rounded-pill fw-semibold">Xóa</button>
                </div>
              </div>
            </div>
          </div>

          <!-- Thêm danh mục -->
          <div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title user-select-none" id="addCategoryModalLabel">
                    <i class="bi bi-plus-circle-fill" style="color: #28a745;"></i>
                    Thêm danh mục mới
                  </h5>
                </div>
                <div class="modal-body">
                  <label for="categoryName" class="form-label">Tên danh mục</label>
                  <input type="text" id="categoryName" class="form-control" placeholder="Nhập tên danh mục..." required>
                </div>
                <div class="modal-footer">
                  <button type="button" id="confirmCancel" class="btn btn-secondary rounded-pill fw-semibold" data-dismiss="modal">Hủy</button>
                  <button type="button" id="confirmAddCategory" class="btn btn-success rounded-pill fw-semibold">Thêm</button>
                </div>
              </div>
            </div>
          </div>

          <!-- Chỉnh sửa danh mục -->
          <div class="modal fade" id="editCategoryModal" tabindex="-1" role="dialog" aria-labelledby="editCategoryModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title user-select-none" id="editCategoryModalLabel">
                    <i class="bi bi-pencil-square" style="color: #007bff;"></i>
                    Chỉnh sửa danh mục
                  </h5>
                  <input type="hidden" id="editCategoryId">
                </div>
                <div class="modal-body">
                  <label for="editCategoryName" class="form-label">Tên danh mục</label>
                  <input type="text" id="editCategoryName" class="form-control" placeholder="Nhập tên danh mục..." required>
                </div>
                <div class="modal-footer">
                  <button type="button" id="confirmCancelEdit" class="btn btn-secondary rounded-pill fw-semibold" data-dismiss="modal">Hủy</button>
                  <button type="button" id="confirmEditCategory" class="btn btn-primary rounded-pill fw-semibold">Lưu thay đổi</button>
                </div>
              </div>
            </div>
          </div>

          <!-- Xem sản phẩm của mỗi danh mục -->
          <div class="overlay" id="overlay"></div>
          <div class="view-product d-none" id="productsCategory" >
            <div class="d-flex justify-content-between align-items-center mb-2">
              <h5 class="fs-3 fw-semibold title-category-view">Danh mục:</h5>
              <button class="btn-close" onclick="toggleProductDetail()"></button>
            </div>
            <hr>
            <div class="product-info mt-2">
              <h5 class="fw-semibold"><i class="bi bi-list-nested me-2"></i>Thông tin các sản phẩm </h5>
              <div class="show-content">
                <p class="id-image"><span class="title-info fw-semibold">Mã hình ảnh:</span> </p>
                <p class="category-image"><span class="title-info fw-semibold">Danh mục:</span> </p>
                <p class="price-image"><span class="title-info fw-semibold">Giá:</span> </p>
                <p class="size-image"><span class="title-info fw-semibold">Độ phân giải:</span> </p>
                <p class="dimension-image"><span class="title-info fw-semibold">Kích thước ảnh:</span> </p>
                <p class="date-image"><span class="title-info fw-semibold">Ngày thêm:</span> </p>
                <p class="status-image"><span class="title-info fw-semibold">Trạng thái:</span> </p>
                <p class="d-flex align-items-start description-image"><span class="title-info fw-semibold me-1">Mô tả:</span> </p>
              </div>
              <div class="show-content2 d-none" id="content-replace">
                <p class="id-image"><span class="title-info fw-semibold">Mã hình ảnh:</span> </p>
                <p class="category-image"><span class="title-info fw-semibold">Danh mục:</span> </p>
                <p class="price-image"><span class="title-info fw-semibold">Giá:</span> </p>
                <p class="size-image"><span class="title-info fw-semibold">Độ phân giải:</span> </p>
                <p class="dimension-image"><span class="title-info fw-semibold">Kích thước ảnh:</span> </p>
                <p class="date-image"><span class="title-info fw-semibold">Ngày thêm:</span> </p>
                <p class="status-image"><span class="title-info fw-semibold">Trạng thái:</span> </p>
                <p class="d-flex align-items-start description-image"><span class="title-info fw-semibold me-1">Mô tả:</span> </p>
                <button class="btn mt-2 mb-3 btn-back-view-category btn-outline-dark" onclick="backViewCategory()"><i class="bi bi-arrow-return-left"> Trở lại</i></button>
              </div>
            </div>
            <div class="show-image d-none">
              <h5 class="fw-semibold mb-3"><i class="bi bi-image me-2"></i>Hình ảnh</h5>
              <img src="" alt="" class="product-img">
            </div>
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

<!-- Notification -->
<div class="alert alert-danger d-none align-items-center position-fixed"
     role="alert"
     style="display: none; width: 25%; top: 15%; right: 0"
>
  <i class="bi bi-exclamation-triangle me-2"></i><span></span>
</div>
<div class="alert alert-success d-none align-items-center position-fixed"
     role="alert"
     style="display: none; width: 25%; top: 15%; right: 0"
>
  <i class="bi bi-check2-circle me-2"></i><span></span>
</div>
<!-- Notification -->

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

<!-- Chức năng của dataTable -->
<script>
  $(document).ready(function () {
    const table = $('#productsTable').DataTable({
      deferRender: true,
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

<!-- Chức năng thêm danh mục -->
<script>
  $('.button-add').on("click", function() {
    $('#addCategoryModal').modal('show');
  });

  $('#confirmCancel').on("click", function() {
    $('#addCategoryModal').modal('hide');
  })

  let categoryNameAdd = null;

  // Xử lý sau khi nhấn xóa
  $('#confirmAddCategory').on('click', function () {
    categoryNameAdd = $('#categoryName').val();

    $.ajax({
      url: '/admin-category',
      type: 'POST',
      headers: {
        'X-Requested-By': 'AJAX'
      },
      data: {
        action: 'add',
        category_name: categoryNameAdd
      },
      success: function (response) {
        if (response.success) {
          $(".alert-success span").text("Thêm thành công!");
          $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
            $(this).addClass("d-none");
          });
          $('#categoryName').val("")
          location.reload();

        } else {
          $(".alert-danger span").text("Thêm thất bại!");
          $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
            $(this).addClass("d-none");
          });
        }
      },
      error: function () {
        alert('Đã xảy ra lỗi!');
      }
    });
  });
</script>

<!-- Xử lý xóa danh mục -->
<script>
  let parentElement = null;

  $('.delete-btn').on('click', function () {
    categoryIdToDelete = $(this).data('id');
    parentElement = $(this).closest("tr");
    // Lây nội dung ảnh hiển thị
    var categoryName = parentElement.find("td").eq(1).text().trim();
    $('#deleteModal .modal-body').html("Bạn có chắc chắn muốn xóa <strong>" + categoryName + "</strong>.");
    $('#deleteModal').modal('show');
  });

  // Xử lý sau khi nhấn xóa
  $('#confirmDelete').on('click', function () {
    if (categoryIdToDelete) {
      $.ajax({
        url: '/admin-category',
        type: 'POST',
        headers: {
          'X-Requested-By': 'AJAX'
        },
        data: {
          action: 'delete',
          category_id: categoryIdToDelete
        },
        success: function (response) {
          if (response.success) {
            $(".alert-success span").text("Xóa thành công!");
            $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
              $(this).addClass("d-none");
            });
            parentElement.fadeOut(function () {
              $(this).remove();
            });
          } else {
            $(".alert-danger span").text("Xóa thất bại!");
            $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
              $(this).addClass("d-none");
            });
          }
        },
        error: function () {
          alert('Đã xảy ra lỗi!');
        }
      });
    }
    $('#deleteModal').modal('hide');
  });
</script>

<!-- Chức năng chỉnh sửa danh mục -->
<script>
  $(document).on("click", ".edit-btn", function() {
    const categoryId = $(this).data('id');
    parentElement = $(this).closest("tr");
    const categoryName = parentElement.find("td").eq(1).text().trim();

    $('#editCategoryId').val(categoryId);
    $('#editCategoryName').val(categoryName);

    $('#editCategoryModal').modal('show');
  });

  $('#confirmCancelEdit').on("click", function() {
    $('#editCategoryModal').modal('hide');
  });

  $('#confirmEditCategory').on('click', function() {
    const categoryId = $('#editCategoryId').val();
    const categoryName = $('#editCategoryName').val();

    $.ajax({
      url: '/admin-category',
      type: 'POST',
      headers: {
        'X-Requested-By': 'AJAX'
      },
      data: {
        action: 'edit',
        category_id: categoryId,
        category_name: categoryName
      },
      success: function(response) {
        if (response.success) {
          $(".alert-success span").text("Cập nhật thành công!");
          $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
            $(this).addClass("d-none");
          });

          parentElement.find("td").eq(1).text(categoryName);
        } else {
          $(".alert-danger span").text("Cập nhật thất bại!");
          $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
            $(this).addClass("d-none");
          });
        }
        $('#editCategoryModal').modal('hide');
      },
      error: function() {
        alert('Đã xảy ra lỗi khi cập nhật!');
        $('#editCategoryModal').modal('hide');
      }
    });
  });
</script>

<!-- Chức năng xem các sản phẩm -->
<script>
  $(document).on('click', '.view-btn', function () {
    parentElement = $(this).closest("tr");
    const categoryName = parentElement.find("td").eq(1).text().trim();

    const categoryId = $(this).data('id');
    fetch(`/AdminhandleViewProductsCategory?id=` + categoryId)
            .then(response => {
              $('.title-category-view').text("Danh mục: " + categoryName)
              return response.json()
            })
            .then(products => {
              if (products.length > 0) {
                toggleProductDetail();
                renderProducts(products);
              } else {
                alert('Không có sản phẩm nào trong danh mục này.');
              }
            })
            .catch(error => { alert('Lỗi danh mục!'); });
  });

  function toggleProductDetail() {
    const productCategory = document.getElementById('productsCategory');
    productCategory.classList.toggle('d-none');
    const overlay = document.getElementById("overlay");
    overlay.classList.toggle('show');
    document.body.classList.toggle('no-scroll');
    $('#content-replace').addClass("d-none");
    $('.show-content').removeClass("d-none");
    $('.show-image').addClass('d-none');
  }

  function renderProducts(products) {
    const showContent = document.querySelector('.show-content');
    showContent.innerHTML = '';

    products.forEach(product => {
      const productCard = '<div class="product-card" data-id="'+product.id+'">' +
              '<div class="product-image">' +
              '<img src="' + product.url + '" alt="' + product.name + '">' +
              '</div>' +
              '<div class="product-title">' +
              '<p>' + product.name + '</p>' +
              '</div>' +
              '</div>';
      showContent.innerHTML += productCard;
    });
  }

  function backViewCategory() {
    $('#content-replace').addClass("d-none");
    $('.show-content').removeClass("d-none");
    $('.show-image').addClass('d-none');
  }

  $(document).on('click', '.product-card', function () {
    const productId = $(this).data('id');
    $('#content-replace').toggleClass("d-none");
    $('.show-content').toggleClass("d-none");
    $('.show-image').removeClass('d-none');
    fetch(`/admin-products?id=`+productId)
            .then(response =>{
              console.log('Response received:', response);
              return response.json()
            })
            .then(product => {
              if (product) {
                // Hiển thị thông tin sản phẩm
                $('#productsCategory h5.fs-3').text(product.name);
                $('#productsCategory .id-image').html("<span class=\"title-info fw-semibold\">Mã hình ảnh:</span>#" + product.id);
                $('#productsCategory .category-image').html("<span class=\"title-info fw-semibold\">Danh mục:</span>" + product.category);
                let formatPrice = new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" }).format(product.price);
                $('#productsCategory .price-image').html("<span class=\"title-info fw-semibold\">Giá:</span>" + formatPrice);
                $('#productsCategory .size-image').html("<span class=\"title-info fw-semibold\">Độ phân giải:</span>" + product.size);
                $('#productsCategory .dimension-image').html("<span class=\"title-info fw-semibold\">Kích thước ảnh:</span>" + product.dimension);
                $('#productsCategory .date-image').html("<span class=\"title-info fw-semibold\">Ngày thêm:</span>" + product.formatDateUpload);
                let statusHtml = '';
                if (product.status === 'accepted') {
                  statusHtml = `<span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: green; background: #d1e7dd">Accepted</span>`;
                } else if (product.status === 'waiting') {
                  statusHtml = `<span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: orange; background: #fdffb6">Waiting</span>`;
                } else {
                  statusHtml = `<span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: red; background: #fee0e3">Rejected</span>`;
                }

                $('#productsCategory .status-image').html("<span class=\"title-info fw-semibold\">Trạng thái:</span>" + statusHtml);
                $('#productsCategory .description-image').html("<span class=\"title-info fw-semibold\">Mô tả:</span>" + product.description);
                $('#productsCategory .show-image img').attr('src', product.url);

              } else { alert('Lỗi sản phẩm!'); }
            })
            .catch(error => { alert('Lỗi sản phẩm!'); });
  });
</script>

</body>
</html>