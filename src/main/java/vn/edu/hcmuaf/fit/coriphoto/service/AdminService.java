package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.AdminDAO;

public class AdminService {
    private static final AdminDAO adminDao = new AdminDAO();

    // Lấy tổng số người dùng
    public int getTotalUsers() {
        return adminDao.getTotalUsers();
    }

    // Tính tổng thu nhập
    public double getTotalIncome() {
        return adminDao.getTotalIncome();
    }

    // Lấy tổng số đơn hàng
    public int getTotalOrders() {
        return adminDao.getTotalOrders();
    }

    // Tính tổng thu nhập theo tháng và năm
    public double getTotalIncomeByMonthYear(int month, int year) {
        return adminDao.getTotalIncomeByMonthYear(month, year);
    }

    // Lấy tổng số khách hàng theo tháng và năm
    public int getTotalCustomerByMonthYear(int month, int year) {
        return adminDao.getTotalCustomerByMonthYear(month, year);
    }

    // Lấy tổng số người bán theo tháng và năm
    public int getTotalSellerByMonthYear(int month, int year) {
        return adminDao.getTotalSellerByMonthYear(month, year);
    }

    public int[] getCustomersDataByMonthYear(int year) {
        return adminDao.getCustomersDataByMonthYear(year);
    }

    public int[] getSellersDataByMonthYear(int year) {
        return adminDao.getSellersDataByMonthYear(year);
    }

    }
