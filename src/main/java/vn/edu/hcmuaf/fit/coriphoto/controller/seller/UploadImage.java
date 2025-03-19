package vn.edu.hcmuaf.fit.coriphoto.controller.seller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.SellerService;

import java.io.IOException;
import java.io.InputStream;
import java.lang.foreign.MemorySegment;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;

@WebServlet(name = "UploadImage", value = "/uploadImage")
@MultipartConfig(
    fileSizeThreshold = 1024 * 10,
    maxFileSize = 1024 * 1024 * 100,
    maxRequestSize = 1024 * 1024 * 500
)
public class UploadImage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String dimension = request.getParameter("dimension");
        String fileSize = request.getParameter("file-size");
        String category = request.getParameter("category");
        String price = request.getParameter("price");

        User user = (User) request.getSession().getAttribute("auth");
        int uid = user.getUid();
        int cid = Integer.parseInt(category);

        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + "assets/images/uploads/";

        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        String sanitizedFileName = fileName.replaceAll("[^a-zA-Z0-9\\.\\-_]", "_");

        InputStream fileContent = filePart.getInputStream();
        Files.copy(fileContent,
                Paths.get(savePath + sanitizedFileName),
                StandardCopyOption.REPLACE_EXISTING);
        fileContent.close();

        String fileUrl = "assets/images/uploads/" + sanitizedFileName;

        Product product = new Product();
        product.setUid(uid);
        product.setCid(cid);
        product.setName(title);
        product.setDescription(description);
        product.setSize(fileSize);
        product.setDimension(dimension);
        product.setDateUpload(LocalDateTime.now());
        product.setUrl(fileUrl);
        product.setPrice(Double.parseDouble(price));

        SellerService sellerService = new SellerService();
        sellerService.uploadProduct(product, "waiting");

        request.setAttribute("msgUpload", "Upload ảnh thành công!");
        request.getRequestDispatcher("myphoto-seller.jsp").forward(request, response);
    }
}