package vn.edu.hcmuaf.fit.coriphoto.controller.admin;


import com.google.gson.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.edu.hcmuaf.fit.coriphoto.controller.functions.ExtracImageFromFile;
import vn.edu.hcmuaf.fit.coriphoto.controller.serializer.ProductSerializer;
import vn.edu.hcmuaf.fit.coriphoto.model.ActivityLog;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.LogService;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;
import vn.edu.hcmuaf.fit.coriphoto.service.SellerService;

import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDate;
import java.time.LocalDateTime;

@WebServlet(name = "AdminHandleEditProduct", value = "/AdminHandleEditProduct")
@MultipartConfig(
        fileSizeThreshold = 1024 * 10,
        maxFileSize = 1024 * 1024 * 100,
        maxRequestSize = 1024 * 1024 * 500
)

public class AdminHandleEditProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("product_id"));
        Product product = new ProductService().getById(id);

        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDate.class, new JsonSerializer<LocalDate>() {
                    @Override
                    public JsonElement serialize(LocalDate src, Type typeOfSrc, JsonSerializationContext context) {
                        return new JsonPrimitive(src.toString());
                    }
                })
                .registerTypeAdapter(LocalDateTime.class, new JsonSerializer<LocalDateTime>() {
                    @Override
                    public JsonElement serialize(LocalDateTime src, Type typeOfSrc, JsonSerializationContext context) {
                        return new JsonPrimitive(src.toString());
                    }
                })
                .registerTypeAdapter(Product.class, new ProductSerializer())
                .create();
        String jsonResponse = gson.toJson(product);
        response.getWriter().write(jsonResponse);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameProduct = request.getParameter("nameProduct");
        String desciptProduct = request.getParameter("desciptProduct");
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        int idSeller = Integer.parseInt(request.getParameter("idSeller"));
        String imageSize = request.getParameter("imageSize");
        String fileSize = request.getParameter("fileSize");
        String priceProduct = request.getParameter("priceProduct");
        int IdCategory = Integer.parseInt(request.getParameter("category"));
        String status = request.getParameter("status");
        String url = request.getParameter("url");

        boolean checkIdSeller = new SellerService().checkExistSeller(idSeller);

        if(!checkIdSeller) {
            response.getWriter().write("{\"message\": \"ID người bán không đúng!\"}");
        } else {
            ProductService productService = new ProductService();
            Product product = productService.getById(idProduct);

            if (request.getPart("file") != null) {
                String appPath = request.getServletContext().getRealPath("");
                String savePath = appPath + "assets/images/uploads/";
                Part filePart = request.getPart("file");
                String fileUrl = new ExtracImageFromFile().getImageUrl(filePart, savePath);
                product.setUrl(fileUrl);
            } else product.setUrl(url);

            product.setUid(idSeller);
            product.setCid(IdCategory);
            product.setName(nameProduct);
            product.setDescription(desciptProduct);
            product.setSize(fileSize);
            product.setDimension(imageSize);
            product.setDateUpload(LocalDateTime.now());

            product.setPrice(Double.parseDouble(priceProduct));
            product.setStatus(status);

            productService.updateProduct(product);

            response.getWriter().write("{\"message\": \"Success\"}");

            HttpSession session = request.getSession(true);
            User user = (User) session.getAttribute("auth");
            ActivityLog loginLog = new ActivityLog("WARNING", user.getUid(),
                    user.getUsername(), LocalDateTime.now(),
                    user.getUsername() + " đã cập nhật thông tin sản phẩm có id:" + idProduct);
            new LogService().insertLog(loginLog);
        }
    }
}
