package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.Favourite;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;

import java.sql.Timestamp;
import java.util.List;

public class FavouriteDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    // Kiểm tra xem sản phẩm đã có trong danh sách yêu thích chưa
    public boolean checkFavouriteExists(int userId, int productId) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM favourite WHERE userId = :userId AND productId = :productId")
                        .bind("userId", userId)
                        .bind("productId", productId)
                        .mapTo(Integer.class)
                        .one() > 0
        );
    }

    // Thêm sản phẩm vào danh sách yêu thích
    public void addFavourite(int userId, int productId) {
        jdbi.useHandle(handle -> {
            handle.createUpdate("INSERT INTO favourite (userId, productId, dateAdded) VALUES (:userId, :productId, :dateAdded)")
                    .bind("userId", userId)
                    .bind("productId", productId)
                    .bind("dateAdded", new Timestamp(System.currentTimeMillis()))
                    .execute();
        });
    }

    public void addFavourite(Favourite favourite) {
        jdbi.useHandle(handle -> {
            handle.createUpdate("INSERT INTO favourite (userId, productId, dateAdded) VALUES (:userId, :productId, :dateAdded)")
                    .bind("userId", favourite.getUserId())
                    .bind("productId", favourite.getProductId())
                    .bind("dateAdded", new Timestamp(System.currentTimeMillis()))
                    .execute();
        });
    }

    // Xóa sản phẩm khỏi danh sách yêu thích
    public void removeFavourite(int userId, int productId) {
        jdbi.useHandle(handle -> {
            handle.createUpdate("DELETE FROM favourite WHERE userId = :userId AND productId = :productId")
                    .bind("userId", userId)
                    .bind("productId", productId)
                    .execute();
        });
    }

    // Lấy danh sách sản phẩm yêu thích của người dùng
    public List<Product> getFavouriteProducts(int userId) {
        String sqlQuery = "SELECT p.* FROM products p " +
                "JOIN favourite f ON p.id = f.productId " +
                "WHERE f.userId = ? " +
                "ORDER BY dateUpload DESC;";
        return jdbi.withHandle(handle -> handle.createQuery(sqlQuery)
                .bind(0, userId).mapToBean(Product.class).list());
    }

//    public static void main(String[] args) {
//        FavouriteDAO favouriteDAO = new FavouriteDAO();
//        for (Product p : favouriteDAO.getFavouriteProducts(98)){
//            System.out.println(p);
//        }
//        favouriteDAO.addFavourite(98,13);
//        favouriteDAO.addFavourite(98,14);
//        favouriteDAO.addFavourite(98,15);
//        System.out.println(favouriteDAO.checkFavouriteExists(98,13));
//        favouriteDAO.removeFavourite(98,13);
//    }
}
