<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>更改</title>
    </head>
    <body>
        <p>更改薪资标准页面</p>
        <hr>
        <%
            //连接数据库   
            String driverClass = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/manpower?characterEncoding=utf-8";
            String user = "root";//MySQL帐号
            String password = "mysql";//MYSQL密码
            String gwnum = request.getParameter("gwnum");
            Connection conn;
            try {
                Class.forName(driverClass).newInstance();
                conn = DriverManager.getConnection(url, user, password);
                Statement stmt = conn.createStatement();
                String sql = "select * from  gwtable where gwnum=" + gwnum;
                ResultSet rs = stmt.executeQuery(sql);
                if (rs.next()) {
        %>
        <form action="dogwupdate.jsp"  name="update" method="post">
            <div align="left">
                岗位号：<input type="text" name="gwnum" 
                          value="<%=rs.getString("gwnum")%>"
                          maxlength=30><br>
                岗位名：<input type="text" name="gwname" 
                          value="<%=rs.getString("gwname")%>"
                          maxlength=5><br>
                等级：<input type="text" name="gwlevel" 
                          value="<%=rs.getString("gwlevel")%>" 
                          maxlength=11><br>
                薪资标准：<input type="text" name="gwmoney" 
                          value="<%=rs.getString("gwmoney")%>" 
                          maxlength=11><br>
                <input type="hidden" name="gwnum" value="<%=rs.getString("gwnum")%>">
                <input type="submit" name="submit" value="更改">
                <br><br><br>
                <a href="gwInfo.jsp">返回</a>
            </div>
        </form>
        <%
                }
            }//end try
            catch (Exception ex) {
                ex.printStackTrace();
            }%>
    </body>
</html>
