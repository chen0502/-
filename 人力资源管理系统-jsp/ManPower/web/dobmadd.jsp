<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加结果</title>
    </head>
    <body>
        <p>添加结果界面</p>
        <hr>
        <%
            int i = 0;
            request.setCharacterEncoding("utf-8");
            String bmnum = request.getParameter("bmnum");
            String bmname = request.getParameter("bmname");
            String bmboss = request.getParameter("bmboss");
            //连接数据库 
            String driverClass = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/manpower?characterEncoding=utf-8";
            String user = "root";//MySQL帐号
            String password = "mysql";//MYSQL密码
            Connection conn;
            try {
                Class.forName(driverClass).newInstance();
                conn = DriverManager.getConnection(url, user, password);
                String sql = "insert into bmtable(bmnum,bmname,bmboss)values(?,?,?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, bmnum);
                ps.setString(2, bmname);
                ps.setString(3, bmboss);
                i = ps.executeUpdate();
                if (i != 0) {
                    response.sendRedirect("bmInfo.jsp");
                } else {%>  
        <p><a href="bmadd.jsp">添加失败,点击重新添加</a></p>
        <%}
                ps.close();
                conn.close();
            }//end try
            catch (Exception ex) {
                ex.printStackTrace();
            }
        %>
    </body>
</html>
