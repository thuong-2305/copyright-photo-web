package vn.edu.hcmuaf.fit.coriphoto.controller.serializer;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

import java.lang.reflect.Type;
import java.time.format.DateTimeFormatter;

public class UserSerializer implements JsonSerializer<User> {

    private static final DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE;

    @Override
    public JsonElement serialize(User user, Type typeOfSrc, JsonSerializationContext context) {
        JsonObject jsonObject = new JsonObject();

        jsonObject.addProperty("uid", user.getUid());
        jsonObject.addProperty("role", user.getRole());
        jsonObject.addProperty("fullName", user.getFullName());
        jsonObject.addProperty("username", user.getUsername());
        //
        jsonObject.addProperty("email", user.getEmail());

        if (user.getCreateDate() != null) {
            jsonObject.addProperty("createDate", user.getCreateDate().format(formatter));
        } else {
            jsonObject.addProperty("createDate", (String) null);
        }

        return jsonObject;
    }
}