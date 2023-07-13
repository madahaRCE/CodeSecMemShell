package com.madaha.codesecmemshell.config;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;


public class Demo_HandlerInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        PrintWriter writer = response.getWriter();

        //@TEST_POC:  http://10.201.170.88:38888/login?cmd=calc
        //如果请求路径为/login则放行
        if ( url.indexOf("/login") >= 0){
            writer.write("LoginIn");
            writer.flush();
            writer.close();
            return true;
        }

        writer.write("LoginInFirst");
        writer.flush();
        writer.close();
        return false;
    }
}
