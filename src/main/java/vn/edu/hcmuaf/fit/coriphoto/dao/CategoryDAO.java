package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.Category;
import vn.edu.hcmuaf.fit.coriphoto.model.CategoryParent;

import java.util.List;

public class CategoryDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public List<Category> getAll() {
        String sqlQuery = "SELECT c.cid, c.`name`, MAX(a.url) AS url " +
                "FROM categories c " +
                "JOIN products a ON c.cid = a.cid " +
                "GROUP BY c.cid, c.`name`";
        return jdbi.withHandle(handle -> handle.createQuery(sqlQuery)
                .mapToBean(Category.class).list());
    }

    public List<Category> getAll_notImage() {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM categories")
                .mapToBean(Category.class).list());
    }

    public Category getById(int cid) {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM categories WHERE cid = ?")
                .bind(0, cid).mapToBean(Category.class).findFirst().orElse(null));
    }

    public boolean deleteCategory(int cid) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM categories WHERE cid = :cid")
                        .bind("cid", cid)
                        .execute() > 0 // Trả về true nếu có ít nhất 1 hàng bị ảnh hưởng
        );
    }

    public List<Category> getTrendCategory() {
        String sqlQuery = "SELECT c.cid, c.name, COUNT(v.id) AS total_views, MAX(p.url) AS url " +
                "FROM Views v " +
                "JOIN Products p ON p.id = v.pid " +
                "JOIN Categories c ON p.cid = c.cid " +
                "WHERE p.status = 'accepted' " +
                "GROUP BY c.cid, c.name " +
                "ORDER BY total_views DESC " +
                "LIMIT 5;";
        return jdbi.withHandle(handle -> handle.createQuery(sqlQuery)
                .mapToBean(Category.class).list());
    }

    public List<CategoryParent> getTypeImage() {
        String sqlQuery = "SELECT * FROM categories_parent where name IN ('ai', 'vector', 'photo')";
        return jdbi.withHandle(handle -> handle.createQuery(sqlQuery)
                .mapToBean(CategoryParent.class).list());
    }

    public boolean updateCategory(int cid, String name) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE categories SET name = :name WHERE cid = :cid")
                        .bind("name", name)
                        .bind("cid", cid)
                        .execute() > 0 // Trả về true nếu có ít nhất 1 bản ghi bị ảnh hưởng
        );
    }

    public boolean addCategory(String name, int cpid) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO categories (cpid, name) VALUES (:cpid, :name)")
                        .bind("cpid", cpid) // Liên kết giá trị name
                        .bind("name", name) // Liên kết giá trị cpid
                        .execute() > 0 // Trả về true nếu ít nhất 1 bản ghi được chèn vào
        );
    }

    public int getCategoryIdByName(String name) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT cid FROM categories WHERE name = ?")
                        .bind(0, name)  // Gán giá trị name vào tham số đầu tiên
                        .mapTo(int.class)  // Lấy kết quả dưới dạng int (categoryId)
                        .findFirst()  // Lấy kết quả đầu tiên
                        .orElse(-1)  // Nếu không tìm thấy thì trả về -1
        );
    }

    public String getNameCategoryById(int cid) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT name FROM categories WHERE cid = ?")
                        .bind(0, cid)
                        .mapTo(String.class)
                        .one()
        );
    }

    public int getNumberOfType(int cid) {
        String sql = """
            SELECT count(*) FROM products p
            JOIN categories c ON p.cid = c.cid
            WHERE c.cid = ?
            """;
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind(0, cid)
                        .mapTo(int.class)
                        .one()
        );
    }

    public static void main(String[] args) {
//        CategoryDAO categoryDAO = new CategoryDAO();
//        System.out.println(categoryDAO.getAll());

//        UserDAO userDAO = new UserDAO();
//        System.out.println(userDAO.findByEmail("cust1@gmail.com"));

        CategoryDAO categoryDAO = new CategoryDAO();
        System.out.println(categoryDAO.getNumberOfType(5));

    }



}
