<%--
  Created by IntelliJ IDEA.
  User: madahaRCE
  Date: 2023/6/21
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spring Boot前端使用jsp</title>
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
