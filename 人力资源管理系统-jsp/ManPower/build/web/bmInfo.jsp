<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>部门信息</title>
    </head>
    <body>
        <p>部门信息</p>
        <hr>  
        <div>
            <a href="main.jsp">返回</a>
            <br>
            <form action="bmquery.jsp" method="post">
                <input type="text" name="bmname" placeholder="部门名">
                <input type="text" name="bmboss" placeholder="经理名">
                <button type="submit">查询</button>
                <a href="bmadd.jsp">添加部门</a>
            </form>
        </div>
        <br>
        <table border="1/2" align="left">
            <tr>
                <th>部门号</th>
                <th>部门名</th>
                <th>经理</th>
                <th>更改</th>

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
                    String sql = "SELECT * FROM bmtable ";
                    ResultSet rs = stmt.executeQuery(sql);
                    while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("bmnum")%></td>   
                <td><%=rs.getString("bmname")%></td>
                <td><%=rs.getString("bmboss")%></td>

                <td>
                    <form action="bmupdate.jsp" method="post">
                        <button type="submit">更改</button>
                        <input type="hidden" name="bmnum" value="<%=rs.getString("bmnum")%>">
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
</html>
