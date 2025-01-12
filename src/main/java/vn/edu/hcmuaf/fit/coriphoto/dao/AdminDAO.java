package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.Order;
import vn.edu.hcmuaf.fit.coriphoto.service.OrderService;
import vn.edu.hcmuaf.fit.coriphoto.service.PromotionService;

import java.util.List;

public class AdminDAO {
    OrderService orderService = new OrderService();
    PromotionService promotionService = new PromotionService();
    private static final Jdbi jdbi = new DBConnect().get();



    public int getTotalUsers() {
        String sql = "SELECT COUNT(*) FROM users WHERE role != '0'";
        return jdbi.withHandle(handle -> handle.createQuery(sql).mapTo(Integer.class).one());    }

    // Tính lợi nhuận = (tiền các đơn/2) - (tiền giảm giá) => Do giảm giá bên admin chịu
    public double getTotalIncome() {
        double result = 0;
        List<Integer> orders = orderService.getAllOrdersId();
        for (Integer i: orders) {
            double priceByOrder = orderService.getTotalPriceById(i);
            double percentage = promotionService.getDiscountByOrderId(i);
            result += priceByOrder/2 - (priceByOrder * percentage);
        }
        return result;
    }

    public int getTotalOrders() {
        return orderService.totalOrders();
    }


    public double getTotalIncomeByMonthYear(int month, int year) {
        double result = 0;
        List<Integer> orders = orderService.getAllOrdersIdMonthYear(month,year);
        for (Integer i: orders) {
            double priceByOrder = orderService.getTotalPriceById(i);
            double percentage = promotionService.getDiscountByOrderId(i);
            result += priceByOrder/2 - (priceByOrder * percentage);
        }
        return result;
    }

    public int getTotalCustomerByMonthYear(int month, int year) {
        String sql = """
            SELECT COUNT(*)
            FROM users
            WHERE role = '2' AND MONTH(createDate) = :month AND YEAR(createDate) = :year
            """;
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("month", month)
                        .bind("year", year)
                        .mapTo(Integer.class)
                        .one()
        );
    }

    public int getTotalSellerByMonthYear(int month, int year) {
        String sql = """
            SELECT COUNT(*)
            FROM users
            WHERE role = '1' AND MONTH(createDate) = :month AND YEAR(createDate) = :year
            """;
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("month", month)
                        .bind("year", year)
                        .mapTo(Integer.class)
                        .one()
        );
    }

    public int[] getSellersDataByMonthYear(int year) {
        // Tạo mảng chứa dữ liệu cho 12 tháng
        int[] sellersData = new int[12];
        for (int i = 0; i < 12; i++) {
            sellersData[i] = getTotalSellerByMonthYear(i+1, year);
        }
        return sellersData;
    }

    public int[] getCustomersDataByMonthYear(int year) {
        // Tạo mảng chứa dữ liệu cho 12 tháng
        int[] customersData = new int[12];

        // Lặp qua 12 tháng để giả lập dữ liệu
        for (int i = 0; i < 12; i++) {
            // Giả sử mỗi tháng có số lượng khách hàng tăng dần
            customersData[i] = getTotalCustomerByMonthYear(i+1, year);
        }
        return customersData;
    }


    public static void main(String[] args) {
        AdminDAO adminDAO = new AdminDAO();
        System.out.println(adminDAO.getTotalUsers());
        System.out.println(adminDAO.getTotalIncome());
        System.out.println(adminDAO.getTotalIncomeByMonthYear(2,2025));

        System.out.println(adminDAO.getTotalCustomerByMonthYear(5, 2024));
        System.out.println(adminDAO.getTotalSellerByMonthYear(5,2024));

    }

}
