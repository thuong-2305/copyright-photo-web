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

        // Xác định đường dẫn tuyệt đối tới file ảnh dựa trên thuộc tính url của Product
        String imagePath = getServletContext().getRealPath("/") + url.substring(2);

        File imageFile = new File(imagePath);
        if (!imageFile.exists()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy file ảnh.");
            return;
        }

        BufferedImage originalImage = ImageIO.read(imageFile);
//        BufferedImage watermarkedImage = applyWatermark(originalImage);
        BufferedImage watermarkedImage = applyDiagonalWatermark(originalImage);

        // Định dạng ảnh đầu ra là PNG
        resp.setContentType("image/png");
        OutputStream os = resp.getOutputStream();
        ImageIO.write(watermarkedImage, "png", os);
        os.close();
    }

    //Watermark nằm chéo
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
        // Giá trị bước nhảy có thể được điều chỉnh tùy theo độ dày của watermark mong muốn
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
     * Phương thức áp dụng watermark cho ảnh gốc.
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
        // Màu xanh lam với độ mờ 0.3
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
        // Đường dẫn tới logo được lưu trong thư mục WEB-INF/resources (không truy cập trực tiếp qua URL)
        String logoPath = getServletContext().getRealPath("/") + "WEB-INF/resources/logo.png";
        File logoFile = new File(logoPath);
        if (logoFile.exists()) {
            BufferedImage logo = ImageIO.read(logoFile);
            // Đặt lại composite để logo có độ mờ 0.3
            g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.3f));
            // Vẽ logo tại góc trên bên trái với khoảng cách 20px từ mép
            g2d.drawImage(logo, 20, 20, null);
        }

        g2d.dispose();
        return watermarked;
    }
}