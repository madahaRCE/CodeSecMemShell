package com.madaha.codesecmemshell.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class Demo_WebMvcConfigurer implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry interceptorRegistry) {
          //@TEST_POC:  http://10.201.170.88:38888/login?cmd=calc

//        interceptorRegistry.addInterceptor(new Demo_HandlerInterceptor())
//                .addPathPatterns("/**")
//                .excludePathPatterns();
    }
}
