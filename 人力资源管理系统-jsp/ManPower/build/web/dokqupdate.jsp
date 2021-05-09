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
            String id = request.getParameter("kqid");
            String ygnum = request.getParameter("ygnum");
            String kqdate = request.getParameter("kqdate");
            String kqstate = request.getParameter("kqstate");
            String kqtime = request.getParameter("kqtime");
            Connection conn;
            try {
                Class.forName(driverClass).newInstance();
                conn = DriverManager.getConnection(url, user, password);
                String sql = "update kqtable set ygnum=?,kqdate=?,kqstate=?,kqtime=? where kqid =?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, ygnum);
                ps.setString(2, kqdate);
                ps.setString(3, kqstate);
                ps.setString(4, kqtime);
                ps.setInt(5, Integer.parseInt(id));
                int i = ps.executeUpdate();
                response.sendRedirect("kqInfo.jsp");
            }//end try
            catch (Exception ex) {
                ex.printStackTrace();
            }%>
    </body>
</html>
