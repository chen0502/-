<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>更改</title>
    </head>
    <body>
        <p>部门更改页面</p>
        <hr>
        <%
            //连接数据库   
            String driverClass = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/manpower?characterEncoding=utf-8";
            String user = "root";//MySQL帐号
            String password = "mysql";//MYSQL密码
            String bmnum = request.getParameter("bmnum");
            Connection conn;
            try {
                Class.forName(driverClass).newInstance();
                conn = DriverManager.getConnection(url, user, password);
                Statement stmt = conn.createStatement();
                String sql = "select * from  bmtable where bmnum=" + bmnum;
                ResultSet rs = stmt.executeQuery(sql);
                if (rs.next()) {
        %>
        <form action="dobmupdate.jsp"  name="update" method="post">
            <div align="left">
                部门号：<input type="text" name="bmnum" 
                          value="<%=rs.getString("bmnum")%>"
                          maxlength=30><br>
                部门名：<input type="text" name="bmname" 
                          value="<%=rs.getString("bmname")%>"
                          maxlength=5><br>
                经理：<input type="text" name="bmboss" 
                          value="<%=rs.getString("bmboss")%>" 
                          maxlength=11><br>
                <input type="hidden" name="bmnum" value="<%=rs.getString("bmnum")%>">
                <input type="submit" name="submit" value="更改">
                <br><br><br>
                <a href="bmInfo.jsp">返回</a>
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
