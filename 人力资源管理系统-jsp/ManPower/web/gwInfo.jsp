<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>岗位信息</title>
    </head>
    <body>
        <p>岗位信息</p>
        <hr>
        <div>
            <a href="main.jsp">返回</a>
            <br>
            <form action="gwquery.jsp" method="post">
                <input type="text" name="gwnum" placeholder="岗位号">
                <input type="text" name="gwname" placeholder="岗位名">
                <input type="text" name="gwlevel" placeholder="岗位级别">
                <input type="text" name="gwmoney" placeholder="岗位薪资">
                <button type="submit">查询</button>
                <a href="gwadd.jsp">添加岗位</a>
            </form>
        </div>
        <br>
        <table border="1/2" align="left">
            <tr>
                <th>岗位号</th>
                <th>岗位名</th>
                <th>级别</th>
                <th>薪酬标准</th>
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
                    String sql = "SELECT * FROM gwtable ";
                    ResultSet rs = stmt.executeQuery(sql);
                    while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("gwnum")%></td>   
                <td><%=rs.getString("gwname")%></td>
                <td><%=rs.getString("gwlevel")%></td>
                <td><%=rs.getString("gwmoney")%></td>

                <td>
                    <form action="gwupdate.jsp" method="post">
                        <button type="submit">更改</button>
                        <input type="hidden" name="gwnum" value="<%=rs.getString("gwnum")%>">
                    </form>
                </td>
                <td>
                    <form action="gwdelete.jsp" method="post">
                        <button type="submit">删除</button>
                        <input type="hidden" name="gwnum" value="<%=rs.getString("gwnum")%>">
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
