package cz.uhk.ppro.dima.controller;

import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * obhospodari veskere nesmysly zadane v adresním radku
 */

@Controller
public class MyErrorController implements ErrorController {


    @RequestMapping("/error")
    public String handleError() {
        //do something like logging
        return "/notfound";
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }
}

