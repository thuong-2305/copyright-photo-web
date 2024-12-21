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

    public static void main(String[] args) {
    }
}
