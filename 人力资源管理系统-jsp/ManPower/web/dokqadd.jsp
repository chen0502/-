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
            String ygnum = request.getParameter("ygnum");
            String kqdate = request.getParameter("kqdate");
            String kqstate = request.getParameter("kqstate");
            String kqtime = request.getParameter("kqtime");
            //连接数据库 
            String driverClass = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/manpower?characterEncoding=utf-8";
            String user = "root";//MySQL帐号
            String password = "mysql";//MYSQL密码
            Connection conn;
            try {
                Class.forName(driverClass).newInstance();
                conn = DriverManager.getConnection(url, user, password);
                String sql = "insert into kqtable(ygnum,kqdate,kqstate,kqtime)values(?,?,?,?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, ygnum);
                ps.setString(2, kqdate);
                ps.setString(3, kqstate);
                ps.setString(4, kqtime);
                i = ps.executeUpdate();
                if (i != 0) {
                    response.sendRedirect("kqInfo.jsp");
                } else {%>  
        <p><a href="kqadd.jsp">添加失败,点击重新添加</a></p>
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
