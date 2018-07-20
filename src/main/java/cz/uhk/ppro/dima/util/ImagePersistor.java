package cz.uhk.ppro.dima.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.*;

public class ImagePersistor {

    public static void saveImage(MultipartFile mpf, String imageUuid){

        try {
            byte[] imgOriginal = mpf.getBytes();
            byte[] imgDownscaled = ImageResampler.downscaleImage(imgOriginal);
            if(imgOriginal != null || imgDownscaled != null) {
                String uuid = imageUuid;
                File file = new File("D:/PPRO/src/resampled/"+uuid+".jpg");
                OutputStream out = new FileOutputStream(file);
                out.write(imgOriginal);
                out.flush();
                file = new File("D:/PPRO/src/original/"+uuid+".jpg");
                out= new FileOutputStream(file);
                out.write(imgDownscaled);
                out.flush();
                out.close();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
