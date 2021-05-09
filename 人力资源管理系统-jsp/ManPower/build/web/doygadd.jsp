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
            String ygname = request.getParameter("ygname");
            String ygbday = request.getParameter("ygbday");
            String ygage = request.getParameter("ygage");
            String ygface = request.getParameter("ygface");
            String ygbody = request.getParameter("ygbody");
            String ygwork = request.getParameter("ygwork");
            String ygbm = request.getParameter("ygbm");
            String ygmonmoney = request.getParameter("ygmonmoney");
            String ygyearmoney = request.getParameter("ygyearmoney");
            //连接数据库 
            String driverClass = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/manpower?characterEncoding=utf-8";
            String user = "root";//MySQL帐号
            String password = "mysql";//MYSQL密码
            Connection conn;
            try {
                Class.forName(driverClass).newInstance();
                conn = DriverManager.getConnection(url, user, password);
                String sql = "insert into ygtable(ygnum,ygname,ygbday,ygage,ygface,ygbody,ygwork,ygbm,ygmonmoney,ygyearmoney)values(?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, ygnum);
                ps.setString(2, ygname);
                ps.setString(3, ygbday);
                ps.setString(4, ygage);
                ps.setString(5, ygface);
                ps.setString(6, ygbody);
                ps.setString(7, ygwork);
                ps.setString(8, ygbm);
                ps.setString(9, ygmonmoney);
                ps.setString(10, ygyearmoney);
                i = ps.executeUpdate();
                if (i != 0) {
                    String message = "新增" + ygname;
                    String sqlyvjv = "insert into rstable values(null,?)";
                    PreparedStatement ps1 = conn.prepareStatement(sqlyvjv);
                    ps1.setString(1, message);
                    ps1.executeUpdate();
                    response.sendRedirect("ygInfo.jsp");
                } else {%>  
        <p><a href="ygadd.jsp">添加失败,点击重新添加</a></p>
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
