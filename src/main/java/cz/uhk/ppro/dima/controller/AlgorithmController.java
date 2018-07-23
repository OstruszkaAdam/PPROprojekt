package cz.uhk.ppro.dima.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AlgorithmController {


    @RequestMapping(value = "/algoritmus", method = RequestMethod.GET)
    public ModelAndView algoritmus() {

        return new ModelAndView("algoritmus");
    }

}

