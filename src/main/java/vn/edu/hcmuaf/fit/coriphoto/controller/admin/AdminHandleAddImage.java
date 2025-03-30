package vn.edu.hcmuaf.fit.coriphoto.controller.admin;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@WebServlet(name = "AdminHandleAddImage", value = "/AdminHandleAddImage")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 20,
        maxFileSize = 1024 * 1024 * 100,
        maxRequestSize = 1024 * 1024 * 500
)

public class AdminHandleAddImage extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = new ProductService();
        int lenProducts = productService.getInNextProduct();

        Part filePart = request.getPart("file");

        // Lấy dung lượng file
        String fileSize = (filePart.getSize() > 1024 * 1024)
                ? String.format("%.1fMB", filePart.getSize() / (1024.0 * 1024.0))
                : String.format("%.1fKB", filePart.getSize() / 1024.0);

        // Lấy tên file
        String fileName = filePart.getSubmittedFileName();

        String sanitizedFileName = fileName.replaceAll("[^a-zA-Z0-9\\.\\-_]", "_");

        InputStream fileContent = filePart.getInputStream();

        // Lấy kích thước ảnh
        BufferedImage image = ImageIO.read(fileContent);
        String imageSize = "Không xác định";
        if (image != null) {
            int width = image.getWidth();
            int height = image.getHeight();
            imageSize = width + "x" + height;
        }
        fileContent.close();

        String fileUrl = "assets/images/uploads/" + sanitizedFileName;

        System.out.println(fileUrl+ " " + fileSize+ " " +  imageSize + " " + lenProducts);
        response.setContentType("application/json");
        response.getWriter().write(
                "{" +
                    "\"imageUrl\": \"" + fileUrl + "\", " +
                    "\"fileSize\": \"" + fileSize + "\", " +
                    "\"imageSize\": \"" + imageSize + "\"," +
                    "\"id\": \"" + lenProducts + "\"" +
                "}"
        );

    }
}