package vn.edu.hcmuaf.fit.coriphoto.controller.serializer;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import vn.edu.hcmuaf.fit.coriphoto.model.Order;

import java.lang.reflect.Type;

public class OrderSerializer implements JsonSerializer<Order> {

    @Override
    public JsonElement serialize(Order order, Type type, JsonSerializationContext jsonSerializationContext) {
        JsonObject jsonObject = new JsonObject();

        jsonObject.addProperty("orderId", order.getOrderId());
        jsonObject.addProperty("uid", order.getUid());
        jsonObject.addProperty("pmid", order.getPmid());
        jsonObject.addProperty("promotionId", order.getPromotionId());
        jsonObject.addProperty("orderDate", order.getOrderDate().toString());
        jsonObject.addProperty("totalPrice", order.getTotalPrice());
        jsonObject.addProperty("status", order.getStatus());
        jsonObject.addProperty("fullName", order.getFulleName());
        jsonObject.addProperty("email", order.getEmail());
        jsonObject.addProperty("customerName", order.getCustomerName());
        jsonObject.addProperty("formatDateTime", order.getFormatOrderDateTime());
        jsonObject.addProperty("promotionPercent", order.getPromotionPercent());
        jsonObject.addProperty("paymentTypeName", order.getPaymentTypeName()); // Lấy tên phương thức thanh toán

        return jsonObject;
    }
}
