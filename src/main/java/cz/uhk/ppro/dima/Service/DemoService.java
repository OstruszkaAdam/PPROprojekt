package cz.uhk.ppro.dima.Service;

import cz.uhk.ppro.dima.Model.Demo;
import cz.uhk.ppro.dima.Repository.DemoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;

@Service
public class DemoService {

    private DemoRepository demoRepository;

    @Autowired
    public DemoService(DemoRepository demoRepository) {
        this.demoRepository = demoRepository;
    }

    @Transactional
    public void saveArticle(Demo demo) {
        demo.setTimestamp(new Timestamp(System.currentTimeMillis()));
        demoRepository.save(demo);
    }

}
