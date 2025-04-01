package vn.edu.hcmuaf.fit.coriphoto.controller.admin;


import com.google.gson.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.controller.serializer.ProductSerializer;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "AdminhandleViewProductsCategory", value = "/AdminhandleViewProductsCategory")
public class AdminhandleViewProductsCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idCategory = Integer.parseInt(request.getParameter("id"));
        System.out.println(idCategory);

        ProductService productService = new ProductService();
        List<Product> productList = productService.getByCategoryId(idCategory);

        response.setContentType("application/json");
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

        String jsonResponse = gson.toJson(productList);
        System.out.println(jsonResponse);

        response.getWriter().write(jsonResponse);
    }
}