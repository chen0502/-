<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>考勤信息</title>
    </head>
    <body>
        <p>考勤信息</p>
        <hr>
         <div>
            <a href="main.jsp">返回</a>
            <br>
            <form action="kqquery.jsp" method="post">
                <input type="text" name="ygnum" placeholder="员工工号">
                <input type="text" name="kqdate" placeholder="考勤日期">
                <input type="text" name="kqstate" placeholder="考勤状态">
                <input type="text" name="kqtime" placeholder="时长">
                <button type="submit">查询</button>
                <a href="kqadd.jsp">添加记录</a>
            </form>
        </div>
        <br>
        <table border="1/2" align="left">
            <tr>
                <th>工号</th>
                <th>日期</th>
                <th>状态</th>
                <th>时长</th>
                <th>更改</th>
                <th>删除</th>
            </tr>
            <%
                //连接数据库 
                String driverClass = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/manpower?characterEncoding=utf-8";
                String user = "root";//MySQL帐号
                String password = "mysql";//MYSQL密码
                Connection conn;
                try {
                    Class.forName(driverClass).newInstance();
                    conn = DriverManager.getConnection(url, user, password);
                    Statement stmt = conn.createStatement();
                    String sql = "SELECT * FROM kqtable ";
                    ResultSet rs = stmt.executeQuery(sql);
                    while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("ygnum")%></td>   
                <td><%=rs.getString("kqdate")%></td>
                <td><%=rs.getString("kqstate")%></td>
                <td><%=rs.getString("kqtime")%></td>
                
                <td>
                    <form action="kqupdate.jsp" method="post">
                        <button type="submit">更改</button>
                        <input type="hidden" name="kqid" value="<%=rs.getString("kqid")%>">
                    </form>
                </td>
                <td>
                    <form action="kqdelete.jsp" method="post">
                        <button type="submit">删除</button>
                        <input type="hidden" name="kqid" value="<%=rs.getString("kqid")%>">
                    </form>
                </td>
            </tr>
            <%
                    } //end while
                }//end try
                catch (Exception ex) {
                    ex.printStackTrace();
                }
            %>
        </table>
    </body>
</html>
