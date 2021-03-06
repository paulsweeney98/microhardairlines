/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package QR_Code;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;

/**
 *
 * @author D00191889
 */
    
public class QRCodeGenerator {
    private static final String QR_CODE_IMAGE_PATH = "C:\\College\\Year 3\\Semester 2\\Software Project\\microhard_airlines\\web\\QRCodeImages/";
//    private static final String QR_CODE_IMAGE_PATH = "E:\\College\\Year 3\\Semester 2\\Software Project\\test\\microhard_airlines\\web\\QRCodeImages/";

    public void generateQRCodeImage(String text, int width, int height, String filePath)
            throws WriterException, IOException {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);

        Path path = FileSystems.getDefault().getPath(QR_CODE_IMAGE_PATH + filePath);
        MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);
    }

//    public static void main(String[] args) {
//        try {
//            generateQRCodeImage("This is my first QR Code", 350, 350, QR_CODE_IMAGE_PATH);
//        } catch (WriterException e) {
//            System.out.println("Could not generate QR Code, WriterException :: " + e.getMessage());
//        } catch (IOException e) {
//            System.out.println("Could not generate QR Code, IOException :: " + e.getMessage());
//        }
//    }
}