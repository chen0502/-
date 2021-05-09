<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>人事变动</title>
    </head>
    <body>
        <p>人事变动界面</p>
        <hr>
        <h3>人事变动记录</h3>
        <div>
            <a href="main.jsp">返回</a>
            <br>
        </div>
        <br>
        <table border="1/2" align="left">
            <tr>
                <th>记录号</th>
                <th>人事变动记录</th>
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
                    String sql = "SELECT * FROM rstable ";
                    ResultSet rs = stmt.executeQuery(sql);
                    while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("Id")%></td>   
                <td><%=rs.getString("message")%></td>
                <td>
                    <form action="rsdelete.jsp" method="post">
                        <button type="submit">删除</button>
                        <input type="hidden" name="Id" value="<%=rs.getString("Id")%>">
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