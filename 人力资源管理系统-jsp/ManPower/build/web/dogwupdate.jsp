<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>执行更改</title>
    </head>
    <body> 
        <% 
            request.setCharacterEncoding("utf-8");
            //连接数据库   
            String driverClass = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/manpower?characterEncoding=utf-8";
            String user = "root";//MySQL帐号
            String password = "mysql";//MYSQL密码
            String id = request.getParameter("gwnum");
            String cubname = request.getParameter("gwname");
            String name = request.getParameter("gwlevel");
            String phone = request.getParameter("gwmoney");
            Connection conn;
            try {
                Class.forName(driverClass).newInstance();
                conn = DriverManager.getConnection(url, user, password);
                String sql = "update gwtable set gwname=?,gwlevel=?,gwmoney=? where gwnum =?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, cubname);
                ps.setString(2, name);
                ps.setString(3, phone);
                ps.setInt(4, Integer.parseInt(id));
                int i = ps.executeUpdate();
                response.sendRedirect("gwInfo.jsp");
            }//end try
            catch (Exception ex) {
                ex.printStackTrace();
            }%>
    </body>
</html>
