<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>删除</title>
    </head>
    <body> 
        <%
            request.setCharacterEncoding("utf-8");
            //连接数据库   
            String driverClass = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/manpower?characterEncoding=utf-8";
            String user = "root";//MySQL帐号
            String password = "mysql";//MYSQL密码
            String id = request.getParameter("ygnum");
            String ygname = request.getParameter("ygname");
            Connection conn;
            try {
                Class.forName(driverClass).newInstance();
                conn = DriverManager.getConnection(url, user, password);
                Statement stmt = conn.createStatement();
                String sql = "delete from ygtable where ygnum=" + id;
                stmt.executeUpdate(sql);
                String message = "员工" + ygname + "删除";
                String sql1 = "insert into rstable values(null,?)";
                PreparedStatement ps1 = conn.prepareStatement(sql1);
                ps1.setString(1, message);
                ps1.executeUpdate();
                response.sendRedirect("ygInfo.jsp");
            }//end try
            catch (Exception ex) {
                ex.printStackTrace();
            }%>
    </body>
</html>
