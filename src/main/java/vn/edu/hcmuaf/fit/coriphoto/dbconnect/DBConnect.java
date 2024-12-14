package vn.edu.hcmuaf.fit.coriphoto.dbconnect;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class DBConnect {
    static String url = "jdbc:mysql://" + DBProperties.host() + ":"
            + DBProperties.port() + "/" + DBProperties.dbname() + "?"
            + DBProperties.option();

    static Jdbi jdbi;

    public static Jdbi get() throws SQLException {
        if(jdbi == null) makeConnect();
        return jdbi;
    }

    private static void makeConnect() throws SQLException {
        MysqlDataSource src = new MysqlDataSource();
        src.setURL(url);
        src.setUser(DBProperties.username());
        src.setPassword(DBProperties.password());
        src.setUseCompression(true);
        src.setAutoReconnect(true);

        jdbi = Jdbi.create(src);
    }

    public static void main(String[] args) throws SQLException {
        Jdbi j = get();

        jdbi.useHandle(handle -> {
            List<Map<String, Object>> categories = handle.createQuery("select * from categories")
                    .mapToMap()
                    .list();

            System.out.println("Dữ liệu trong bảng 'categories':");
            for (Map<String, Object> row : categories) {
                System.out.println(row);
            }
        });
    }
}
