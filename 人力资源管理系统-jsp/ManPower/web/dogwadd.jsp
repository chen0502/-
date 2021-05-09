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
            String gwnum = request.getParameter("gwnum");
            String gwname = request.getParameter("gwname");
            String gwlevel = request.getParameter("gwlevel");
            String gwmoney = request.getParameter("gwmoney");
            //连接数据库 
            String driverClass = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/manpower?characterEncoding=utf-8";
            String user = "root";//MySQL帐号
            String password = "mysql";//MYSQL密码
            Connection conn;
            try {
                Class.forName(driverClass).newInstance();
                conn = DriverManager.getConnection(url, user, password);
                String sql = "insert into gwtable(gwnum,gwname,gwlevel,gwmoney)values(?,?,?,?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, gwnum);
                ps.setString(2, gwname);
                ps.setString(3, gwlevel);
                ps.setString(4, gwmoney);
                i = ps.executeUpdate();
                if (i != 0) {
                    response.sendRedirect("gwInfo.jsp");
                } else {%>  
        <p><a href="gwadd.jsp">添加失败,点击重新添加</a></p>
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
