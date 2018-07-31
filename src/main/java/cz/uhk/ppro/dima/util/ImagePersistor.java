package cz.uhk.ppro.dima.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

@Component
public class ImagePersistor {

    @Autowired
    private ImageResampler imageResampler;

    public ImagePersistor() {
    }

    //fyzicke ulozeni obrazku s nazvem vygenerovaneho uuid
    public void saveImage(MultipartFile mpf, String imageUuid) {

        try {
            byte[] imgOriginal = mpf.getBytes();
            byte[] imgResampled = imageResampler.downscaleImage(imgOriginal);
            if (imgOriginal != null || imgResampled != null) {
                String uuid = imageUuid;
                File file = new File("D:/PPRO/src/main/webapp/resources/images/resampled/" + uuid + ".jpg");
                OutputStream out = new FileOutputStream(file);
                out.write(imgResampled);
                out.flush();
                out.close();
                file = new File("D:/PPRO/src/main/webapp/resources/images/original/" + uuid + ".jpg");
                out = new FileOutputStream(file);
                out.write(imgOriginal);
                out.flush();
                out.close();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
