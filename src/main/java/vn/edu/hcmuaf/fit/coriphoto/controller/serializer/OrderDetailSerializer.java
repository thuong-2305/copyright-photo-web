package vn.edu.hcmuaf.fit.coriphoto.controller.serializer;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import vn.edu.hcmuaf.fit.coriphoto.model.OrderDetail;

import java.lang.reflect.Type;

public class OrderDetailSerializer implements JsonSerializer<OrderDetail> {

    private final ProductSerializer productSerializer = new ProductSerializer();

    @Override
    public JsonElement serialize(OrderDetail orderDetail, Type type, JsonSerializationContext context) {
        JsonObject jsonObject = new JsonObject();

        // Thêm các thuộc tính cơ bản
        jsonObject.addProperty("orderId", orderDetail.getOrderId());
        jsonObject.addProperty("productId", orderDetail.getProductId());
        jsonObject.addProperty("licenseId", orderDetail.getLicenseId());
        jsonObject.addProperty("price", orderDetail.getPrice());

        // Thêm thông tin license name
        jsonObject.addProperty("licenseName", orderDetail.getNameLicense());

        // Sử dụng ProductSerializer để serialize thông tin sản phẩm
        if (orderDetail.getProduct() != null) {
            JsonElement productJson = productSerializer.serialize(
                    orderDetail.getProduct(),
                    type,
                    context
            );
            jsonObject.add("product", productJson);
        }

        return jsonObject;
    }
}