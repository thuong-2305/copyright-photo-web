package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;

public class PaymentMethodDAO {
    private static final Jdbi jdbi = new DBConnect().get();

}
