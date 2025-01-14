<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="../assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/homepage.js"></script>
<script src="../assets/js/navbar.js"></script>
<script src="../assets/js/category-details.js"></script>
<script src="../assets/js/homeuser.js"></script>
<script src="../assets/js/products.js"></script>
<script src="../assets/js/product-details.js"></script>
<script src="../assets/js/cart.js"></script>
<script>
    function submitSearch() {
        var query = document.getElementById('search-input').value.trim(); // Lấy giá trị input
        if (query) {
            window.location.href = "search?content=" + encodeURIComponent(query);
        }
    }
</script>