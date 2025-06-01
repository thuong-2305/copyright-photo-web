package vn.edu.hcmuaf.fit.coriphoto.controller.serializer;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import vn.edu.hcmuaf.fit.coriphoto.model.ActivityLog;

import java.lang.reflect.Type;
import java.time.format.DateTimeFormatter;

public class ActivityLogSerializer implements JsonSerializer<ActivityLog> {

    @Override
    public JsonElement serialize(ActivityLog activityLog, Type type, JsonSerializationContext context) {
        JsonObject jsonObject = new JsonObject();

        // Các thuộc tính cơ bản
        jsonObject.addProperty("id", activityLog.getId());
        jsonObject.addProperty("severity", activityLog.getSeverity());
        jsonObject.addProperty("uid", activityLog.getUid());
        jsonObject.addProperty("username", activityLog.getUsername());
        jsonObject.addProperty("message", activityLog.getMessage());
        jsonObject.addProperty("eventDate", activityLog.getFormatOrderDateTime());

        return jsonObject;
    }
}
