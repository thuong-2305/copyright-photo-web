package vn.edu.hcmuaf.fit.coriphoto.controller.watermark;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.FileImageInputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

@WebServlet("/watermarkedImage")
public class WatermarkedImageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String url = req.getParameter("url");

        if (url == null || url.trim().isEmpty()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parameter 'url' is required.");
            return;
        }

        String imagePath = getServletContext().getRealPath("/") + url.substring(3);
        File imageFile = new File(imagePath);

        if (!imageFile.exists() || !imageFile.isFile()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "File không tồn tại: " + imagePath);
            return;
        }

        try {
            BufferedImage originalImage = null;

            // Kiểm tra định dạng file
            String fileName = imageFile.getName().toLowerCase();

            if (fileName.endsWith(".webp")) {
                // Sử dụng ImageReader để đọc WebP với library sejda
                ImageReader reader = ImageIO.getImageReadersByMIMEType("image/webp").next();
                if (reader != null) {
                    reader.setInput(new FileImageInputStream(imageFile));
                    originalImage = reader.read(0);
                    reader.dispose();
                } else {
                    // Fallback: thử đọc trực tiếp
                    originalImage = ImageIO.read(imageFile);
                }
            } else {
                // Đọc các định dạng khác
                originalImage = ImageIO.read(imageFile);
            }

            // Kiểm tra null sau khi đọc
            if (originalImage == null) {
                resp.sendError(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE,
                        "Không thể đọc file ảnh: " + imagePath);
                return;
            }

            // Áp dụng watermark
            BufferedImage watermarkedImage = applyDiagonalWatermark(originalImage);

            // Trả về ảnh
            resp.setContentType("image/png");
            ImageIO.write(watermarkedImage, "png", resp.getOutputStream());

        } catch (Exception e) {
            System.err.println("Lỗi xử lý ảnh: " + imagePath);
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Lỗi xử lý ảnh: " + e.getMessage());
        }
    }

    // Watermark nằm chéo: vẽ watermark theo mẫu chéo lặp lại trên toàn bộ ảnh
    private BufferedImage applyDiagonalWatermark(BufferedImage original) {
        int width = original.getWidth();
        int height = original.getHeight();

        // Tạo ảnh mới hỗ trợ kênh alpha
        BufferedImage watermarked = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = watermarked.createGraphics();

        // Vẽ ảnh gốc
        g2d.drawImage(original, 0, 0, null);

        // Cấu hình độ mờ của watermark (0.15f cho watermark nhẹ nhàng)
        AlphaComposite alphaChannel = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.15f);
        g2d.setComposite(alphaChannel);

        // Cấu hình font và màu sắc watermark
        String watermarkText = "Bản quyền © CoRiPhoto";
        Font font = new Font("Arial", Font.BOLD, 48);
        g2d.setFont(font);
        g2d.setColor(new Color(30, 144, 255)); // Màu xanh lam DodgerBlue

        // Xoay Graphics2D theo góc -45 độ quanh tâm của hình ảnh để tạo hiệu ứng diagonal
        double theta = Math.toRadians(-45);
        g2d.rotate(theta, width / 2, height / 2);

        // Lấy kích thước watermark bằng cách tính FontMetrics
        FontMetrics fontMetrics = g2d.getFontMetrics();
        int textWidth = fontMetrics.stringWidth(watermarkText);
        int textHeight = fontMetrics.getHeight();

        // Vòng lặp để vẽ watermark theo mẫu chéo (tile pattern)
        int step = 100;
        for (int x = -width; x < width * 2; x += textWidth + step) {
            for (int y = -height; y < height * 2; y += textHeight + step) {
                g2d.drawString(watermarkText, x, y);
            }
        }

        g2d.dispose();
        return watermarked;
    }

    /**
     * Phương thức áp dụng watermark khác cho ảnh gốc (nếu cần sử dụng kiểu watermark khác).
     */
    private BufferedImage applyWatermark(BufferedImage original) throws IOException {
        int width = original.getWidth();
        int height = original.getHeight();

        // Tạo BufferedImage mới hỗ trợ kênh alpha
        BufferedImage watermarked = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = watermarked.createGraphics();

        // Vẽ ảnh gốc
        g2d.drawImage(original, 0, 0, null);

        // --- Áp dụng watermark văn bản ---
        String watermarkText = "Bản quyền © YourCompany";
        Font font = new Font("Arial", Font.BOLD, 48);
        g2d.setFont(font);
        g2d.setColor(new Color(30, 144, 255));
        AlphaComposite alphaChannel = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.3f);
        g2d.setComposite(alphaChannel);

        // Tính toán vị trí đặt watermark (góc dưới bên phải)
        FontMetrics fontMetrics = g2d.getFontMetrics();
        int textWidth = fontMetrics.stringWidth(watermarkText);
        int xText = width - textWidth - 20;
        int yText = height - fontMetrics.getHeight() + fontMetrics.getAscent() - 20;
        g2d.drawString(watermarkText, xText, yText);

        // --- Áp dụng watermark logo ---
        String logoPath = getServletContext().getRealPath("/") + "WEB-INF/resources/logo.png";
        File logoFile = new File(logoPath);
        if (logoFile.exists()) {
            BufferedImage logo = ImageIO.read(logoFile);
            g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.3f));
            g2d.drawImage(logo, 20, 20, null);
        }

        g2d.dispose();
        return watermarked;
    }
}