package com.madaha.codesecmemshell.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DemoController {

    @RequestMapping("/springBoot/jsp")
    public String jsp(Model model){
        model.addAttribute("data", "SpringBoot 前端使用JSP页面！");
        return "index";
    }
}
