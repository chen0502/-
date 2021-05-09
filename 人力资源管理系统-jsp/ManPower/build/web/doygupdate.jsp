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
            String ygnum = request.getParameter("ygnum");
            String ygname = request.getParameter("ygname");
            String ygbday = request.getParameter("ygbday");
            String ygage = request.getParameter("ygage");
            String ygface = request.getParameter("ygface");
            String ygbody = request.getParameter("ygbody");
            String ygwork = request.getParameter("ygwork");
            String ygbm = request.getParameter("ygbm");
            String ygmonmoney = request.getParameter("ygmonmoney");
            String ygyearmoney = request.getParameter("ygyearmoney");
            Connection conn;
            try {
                Class.forName(driverClass).newInstance();
                conn = DriverManager.getConnection(url, user, password);
                String sql = "update ygtable set ygname=?,ygbday=?,ygage=?,ygface=?,ygbody=?,ygwork=?,ygbm=?,ygmonmoney=?,ygyearmoney=? where ygnum =?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, ygname);
                ps.setString(2, ygbday);
                ps.setString(3, ygage);
                ps.setString(4, ygface);
                ps.setString(5, ygbody);
                ps.setString(6, ygwork);
                ps.setString(7, ygbm);
                ps.setString(8, ygmonmoney);
                ps.setString(9, ygyearmoney);
                ps.setInt(10, Integer.parseInt(ygnum));
                ps.executeUpdate();
                String message = ygname + "信息修改";
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
