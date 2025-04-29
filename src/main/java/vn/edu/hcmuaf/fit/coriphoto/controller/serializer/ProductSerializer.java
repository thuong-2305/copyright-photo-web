package vn.edu.hcmuaf.fit.coriphoto.controller.serializer;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;

import java.lang.reflect.Type;

public class ProductSerializer implements JsonSerializer<Product> {

    @Override
    public JsonElement serialize(Product product, Type type, JsonSerializationContext jsonSerializationContext) {
        JsonObject jsonObject = new JsonObject();

        jsonObject.addProperty("id", product.getId());
        jsonObject.addProperty("uid", product.getUid());
        jsonObject.addProperty("cid", product.getCid());
        jsonObject.addProperty("name", product.getName());
        jsonObject.addProperty("description", product.getDescription());
        jsonObject.addProperty("size", product.getSize());
        jsonObject.addProperty("dimension", product.getDimension());
        jsonObject.addProperty("dateUpload", product.getDateUpload().toString());
        jsonObject.addProperty("formatDateUpload", product.getFormatDateUpload());
        jsonObject.addProperty("url", product.getUrl());
        jsonObject.addProperty("price", product.getPrice());
        jsonObject.addProperty("status", product.getStatus());
        jsonObject.addProperty("username", product.getUsername());
        jsonObject.addProperty("category", product.getCategory());

        return jsonObject;
    }
}
