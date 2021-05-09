<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>更改</title>
    </head>
    <body>
        <p>考勤记录更改页面</p>
        <hr>
        <%
            //连接数据库   
            String driverClass = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/manpower?characterEncoding=utf-8";
            String user = "root";//MySQL帐号
            String password = "mysql";//MYSQL密码
            String kqid = request.getParameter("kqid");
            Connection conn;
            try {
                Class.forName(driverClass).newInstance();
                conn = DriverManager.getConnection(url, user, password);
                Statement stmt = conn.createStatement();
                String sql = "select * from  kqtable where kqid=" + kqid;
                ResultSet rs = stmt.executeQuery(sql);
                if (rs.next()) {
        %>
        <form action="dokqupdate.jsp"  name="update" method="post">
            <div align="left">
                工号：<input type="text" name="ygnum" 
                          value="<%=rs.getString("ygnum")%>"
                          maxlength=20><br>
                日期：<input type="text" name="kqdate" 
                          value="<%=rs.getString("kqdate")%>"
                          maxlength=20><br>
                状态：<input type="text" name="kqstate" 
                          value="<%=rs.getString("kqstate")%>" 
                          maxlength=11><br>
                时长：<input type="text" name="kqtime" 
                          value="<%=rs.getString("kqtime")%>" 
                          maxlength=11><br>
                <input type="hidden" name="kqid" value="<%=rs.getString("kqid")%>">
                <input type="submit" name="submit" value="更改">
                <br><br><br>
                <a href="kqInfo.jsp">返回</a>
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
