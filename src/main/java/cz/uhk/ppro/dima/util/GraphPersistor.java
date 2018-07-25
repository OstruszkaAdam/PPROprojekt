package cz.uhk.ppro.dima.util;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

@Component
public class GraphPersistor {

    public GraphPersistor() {
    }

    public void saveGraph(MultipartFile mpf, String graphName) {

        try {
            byte[] graph = mpf.getBytes();
            if (graph != null) {
                File file = new File("D:/PPRO/src/main/webapp/resources/graphs/uploaded/" + graphName + ".js");
                OutputStream out = new FileOutputStream(file);
                out.write(graph);
                out.flush();
                out.close();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
