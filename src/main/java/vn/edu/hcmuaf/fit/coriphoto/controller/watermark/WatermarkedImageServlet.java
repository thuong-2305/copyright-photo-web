package vn.edu.hcmuaf.fit.coriphoto.controller.watermark;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/watermarkedImage")
public class WatermarkedImageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        String url = req.getParameter("url");

        String imagePath = getServletContext().getRealPath("/") + url.substring(2);

        File imageFile = new File(imagePath);
        if (!imageFile.exists()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy file ảnh.");
            return;
        }

        BufferedImage originalImage = ImageIO.read(imageFile);
        BufferedImage watermarkedImage = applyDiagonalWatermark(originalImage);

        resp.setContentType("image/png");
        OutputStream os = resp.getOutputStream();
        ImageIO.write(watermarkedImage, "png", os);
        os.close();
    }

    //Watermark nằm chéo
    private BufferedImage applyDiagonalWatermark(BufferedImage original) {
        int width = original.getWidth();
        int height = original.getHeight();

        BufferedImage watermarked = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = watermarked.createGraphics();

        g2d.drawImage(original, 0, 0, null);

        AlphaComposite alphaChannel = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.15f);
        g2d.setComposite(alphaChannel);

        String watermarkText = "Bản quyền © CoRiPhoto";
        Font font = new Font("Arial", Font.BOLD, 48);
        g2d.setFont(font);
        g2d.setColor(new Color(30, 144, 255));

        // Xoay Graphics2D theo góc -45 độ quanh tâm của hình ảnh để tạo hiệu ứng diagonal
        double theta = Math.toRadians(-45);
        g2d.rotate(theta, width / 2, height / 2);

        FontMetrics fontMetrics = g2d.getFontMetrics();
        int textWidth = fontMetrics.stringWidth(watermarkText);
        int textHeight = fontMetrics.getHeight();

        // Vòng lặp để vẽ watermark theo mẫu chéo
        int step = 100;
        for (int x = -width; x < width * 2; x += textWidth + step) {
            for (int y = -height; y < height * 2; y += textHeight + step) {
                g2d.drawString(watermarkText, x, y);
            }
        }

        g2d.dispose();
        return watermarked;
    }
}