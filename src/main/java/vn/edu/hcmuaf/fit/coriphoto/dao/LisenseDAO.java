package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;

public class LisenseDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public String getName(int lisenseId) {
        String query = "SELECT lisenseName FROM lisenses WHERE lisenseId = ?";
        return jdbi.withHandle(handle -> handle.createQuery(query)
                .bind(0, lisenseId).mapTo(String.class).one());
    }
}
