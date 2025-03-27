package vn.edu.hcmuaf.fit.coriphoto.controller.functions;

import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class ExtracImageFromFile {

    public String getImageUrl(Part filePart, String savePath) throws IOException {
        String fileName = filePart.getSubmittedFileName();
        String sanitizedFileName = fileName.replaceAll("[^a-zA-Z0-9\\.\\-_]", "_");

        InputStream fileContent = filePart.getInputStream();
        Files.copy(fileContent,
                Paths.get(savePath + sanitizedFileName),
                StandardCopyOption.REPLACE_EXISTING);
        fileContent.close();

        return "assets/images/uploads/" + sanitizedFileName;
    }
}
