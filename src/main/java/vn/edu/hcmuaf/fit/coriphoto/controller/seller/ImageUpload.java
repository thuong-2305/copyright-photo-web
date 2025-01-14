package vn.edu.hcmuaf.fit.coriphoto.controller.seller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ImageUpload", value = "/ImageUpload")
public class ImageUpload extends HttpServlet {
    private static final String UPLOAD_DIR = "/assets/images"; // Thư mục lưu ảnh

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Passs1");

//        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
//        File uploadDir = new File(uploadPath);
//        if (!uploadDir.exists()) {
//            uploadDir.mkdir();
//        }
//        System.out.println(uploadPath);
//        String fileName = "";
//        String fileUrl = "";
//        String msg = "";

//        try {
//            for (Part part : request.getParts()) {
//                fileName = extractFileName(part);
//                if (fileName != null && !fileName.isEmpty()) {
//                    String filePath = uploadPath + File.separator + fileName;
//                    part.write(filePath);
//
//                    fileUrl = request.getContextPath() + "/" + UPLOAD_DIR + "/" + fileName;
//                }
//            }
//            if (!fileUrl.isEmpty()) {
//                msg = "File ảnh đã tồn tại";
//            }
//            System.out.println(fileUrl);

//            String title = request.getParameter("title");
//            String description = request.getParameter("description");
//            String dimension = request.getParameter("dimension");
//            String fileSize = request.getParameter("file-size");
//            int cid = Integer.parseInt(request.getParameter("category"));
//            double price = Double.parseDouble(request.getParameter("price"));
//
//            System.out.println(title + " " + description);
//
//            User user = (User) request.getSession().getAttribute("auth");
//            ProductService productService = new ProductService();
//            LocalDateTime date = LocalDateTime.now();
//            productService.addProduct(user.getUid(), cid, title, description, dimension, fileSize, date, fileUrl, price);
//            System.out.println("OK");
//            msg = "Upload ảnh thành công";
//        } catch (Exception _) {
//            msg = "Upload ảnh thất bại";
//        }

        request.getRequestDispatcher("myphoto-seller.jsp").forward(request, response);
    }

//    // Trích xuất tên file từ header
//    private String extractFileName(Part part) {
//        String contentDisp = part.getHeader("content-disposition");
//        for (String content : contentDisp.split(";")) {
//            if (content.trim().startsWith("filename")) {
//                return content.substring(content.indexOf("=") + 2, content.length() - 1);
//            }
//        }
//        return null;
//    }
}