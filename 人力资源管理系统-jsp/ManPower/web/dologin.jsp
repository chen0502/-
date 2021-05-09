<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*" %>
<html>
    <head>
        <title>登录确认</title>
        <meta http-equiv="keywords" content="jsp,登陆">
    </head>
    <body>
        <div align="left">
            <%
                //获取用户名
                String strUserName = request.getParameter("txtUserName");
                //获取密码
                String strPassword = request.getParameter("txtPassword");
                //加载JDBC驱动程序
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String url = "jdbc:mysql://localhost:3306/manpower";
                //建立连接 
                Connection connection = DriverManager.getConnection(url, "root",
                        "mysql"); 
                //SQL语句
                String sql = "select * from users where username='" + strUserName
                        + "' and password = '" + strPassword + "'";
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery(sql); //返回查询结果
                //如果记录集非空，表明有匹配的用户名和密码，登陆成功 
                if (rs.next()) {%>
            <jsp:forward page="main.jsp"></jsp:forward>
            <%} else //否则登录失败
               {%>
            <jsp:forward page="default.jsp"></jsp:forward>
            <%
                }
                rs.close();
                stmt.close();
                connection.close();
            %>
        </div>
    </body>
</html>