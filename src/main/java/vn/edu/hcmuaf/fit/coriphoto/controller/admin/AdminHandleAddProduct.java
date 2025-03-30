package vn.edu.hcmuaf.fit.coriphoto.controller.admin;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.edu.hcmuaf.fit.coriphoto.controller.functions.ExtracImageFromFile;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.service.SellerService;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;

@WebServlet(name = "AdminHandleAddProduct", value = "/AdminHandleAddProduct")
@MultipartConfig(
        fileSizeThreshold = 1024 * 10,
        maxFileSize = 1024 * 1024 * 100,
        maxRequestSize = 1024 * 1024 * 500
)

public class AdminHandleAddProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String nameProduct = request.getParameter("nameProduct");
        String desciptProduct = request.getParameter("desciptProduct");
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        int idSeller = Integer.parseInt(request.getParameter("idSeller"));
        String imageSize = request.getParameter("imageSize");
        String fileSize = request.getParameter("fileSize");
        String priceProduct = request.getParameter("priceProduct");
        int IdCategory = Integer.parseInt(request.getParameter("category"));
        String status = request.getParameter("status");

        boolean checkIdSeller = new SellerService().checkExistSeller(idSeller);

        System.out.print("{"
                + "\"message\": \"Sản phẩm đã được thêm thành công!\","
                + "\"nameProduct\": \"" + nameProduct + "\","
                + "\"desciptProduct\": \"" + desciptProduct + "\","
                + "\"idProduct\": \"" + idProduct + "\","
                + "\"idSeller\": \"" + idSeller + "\","
                + "\"imageSize\": \"" + imageSize + "\","
                + "\"fileSize\": \"" + fileSize + "\","
                + "\"priceProduct\": \"" + priceProduct + "\","
                + "\"category\": \"" + IdCategory + "\","
                + "\"status\": \"" + status + "\"" + checkIdSeller
                + "}");

        if(!checkIdSeller) {
            response.getWriter().write("{\"message\": \"ID người bán không đúng!\"}");
        } else {

            String appPath = request.getServletContext().getRealPath("");
            String savePath = appPath + "assets/images/uploads/";

            Part filePart = request.getPart("file");

            String fileUrl = new ExtracImageFromFile().getImageUrl(filePart, savePath);

            Product product = new Product();
            product.setUid(idSeller);
            product.setCid(IdCategory);
            product.setName(nameProduct);
            product.setDescription(desciptProduct);
            product.setSize(fileSize);
            product.setDimension(imageSize);
            product.setDateUpload(LocalDateTime.now());
            product.setUrl(fileUrl);
            product.setPrice(Double.parseDouble(priceProduct));
            product.setStatus(status);

            SellerService sellerService = new SellerService();
            sellerService.uploadProduct(product, status);

            response.getWriter().write("{\"message\": \"Success\"}");
        }
    }
}