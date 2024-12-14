package vn.edu.hcmuaf.fit.coriphoto.dbconnect;

import java.io.InputStream;
import java.util.Properties;

public class DBProperties {
    private static Properties prop = new Properties();

    static {
        try {
            InputStream is = DBProperties.class.getClassLoader().getResourceAsStream("db.properties");
            prop.load(is);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static String host() { return prop.get("db.host").toString(); }

    public static int port() {
        try {
            return Integer.parseInt(prop.get("db.port").toString());
        } catch (NumberFormatException e) {
            return 3306;
        }
    }

    public static String username() { return prop.get("db.username").toString(); }

    public static String password() { return prop.get("db.password").toString(); }

    public static String dbname() { return prop.get("db.dbname").toString(); }

    public static String option() { return prop.get("db.option").toString(); }

}
