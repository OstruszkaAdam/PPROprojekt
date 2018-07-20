package cz.uhk.ppro.dima.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.*;

public class ImagePersistor {

    public static void saveImage(MultipartFile mpf, String imageUuid){

        try {
            byte[] imgOriginal = mpf.getBytes();
            byte[] imgResampled= ImageResampler.downscaleImage(imgOriginal);
            if(imgOriginal != null || imgResampled != null) {
                String uuid = imageUuid;
                File file = new File("D:/PPRO/src/main/webapp/resources/images/resampled/"+uuid+".jpg");
                OutputStream out = new FileOutputStream(file);
                out.write(imgResampled);
                out.flush();
                file = new File("D:/PPRO/src/main/webapp/resources/images/original/"+uuid+".jpg");
                out= new FileOutputStream(file);
                out.write(imgOriginal);
                out.flush();
                out.close();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
