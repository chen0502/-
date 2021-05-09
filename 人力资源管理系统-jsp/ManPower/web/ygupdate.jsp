<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>更改</title>
    </head>
    <body>
        <p>员工更改页面</p>
        <hr>
        <%
            //连接数据库   
            String driverClass = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/manpower?characterEncoding=utf-8";
            String user = "root";//MySQL帐号
            String password = "mysql";//MYSQL密码
            String ygnum = request.getParameter("ygnum");
            Connection conn;
            try {
                Class.forName(driverClass).newInstance();
                conn = DriverManager.getConnection(url, user, password);
                Statement stmt = conn.createStatement();
                String sql = "select * from  ygtable where ygnum=" + ygnum;
                ResultSet rs = stmt.executeQuery(sql);
                if (rs.next()) {
        %>
        <form action="doygupdate.jsp"  name="update" method="post">
            <div align="left">
                工号：<input type="text" name="ygnum" 
                          value="<%=rs.getString("ygnum")%>"
                          maxlength=10><br>
                姓名：<input type="text" name="ygname" 
                          value="<%=rs.getString("ygname")%>"
                          maxlength=5><br>
                出生日期：<input type="text" name="ygbday" 
                            value="<%=rs.getString("ygbday")%>"
                            maxlength=20><br>
                年龄：<input type="text" name="ygage" 
                          value = "<%=rs.getString("ygage")%>"
                          maxlength=5><br>
                政治面貌：<input type="text" name="ygface" 
                            value = "<%=rs.getString("ygface")%>"
                            maxlength=10><br>
                健康状况：<input type="text" name="ygbody" 
                            value = "<%=rs.getString("ygbody")%>"
                            maxlength=5><br>
                职称：<input type="text" name="ygwork" 
                          value = "<%=rs.getString("ygwork")%>"
                          maxlength=11><br>
                部门：<input type="text" name="ygbm" 
                          value = "<%=rs.getString("ygbm")%>"
                          maxlength=10><br>
                月薪：<input type="text" name="ygmonmoney" 
                          value = "<%=rs.getString("ygmonmoney")%>"
                          maxlength=20><br>
                年薪：<input type="text" name="ygyearmoney" 
                          value = "<%=rs.getString("ygyearmoney")%>"
                          maxlength=20><br>
                <input type="hidden" name="ygnum" value="<%=rs.getString("ygnum")%>">
                <input type="submit" name="submit" value="更改">
                <br><br><br>
                <a href="ygInfo.jsp">返回</a>
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
