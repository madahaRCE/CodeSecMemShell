package com.madaha.codesecmemshell.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DemoController {

    /**
     * 注意点：
     *
     *    （1）giaogiao！！！  我想吐槽的是，如果通过Controller去跳转jsp内存马页面，这种情况下会直接报错并抛出异常，导致jsp页面不能完成渲染执行！！！
     *
     *    （2）使用Controller可以直接访问jsp页面；  如果是使用war形式 + 配置前后缀，也可以直接访问jsp页面！
     */
    @RequestMapping("/springBoot/DemoController")
    public String jsp(Model model){
        model.addAttribute("data", "SpringBoot Controller Model 返回前端，构建JSP数据页面！");
        return "index";
    }
}
