<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>查询结果</title>
    </head>
    <body>
        <p>查询界面</p>
        <hr>
        <h3>查询结果</h3>
        <div>
            <a href="gwInfo.jsp">返回</a>
            <br>
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
                request.setCharacterEncoding("utf-8");
                //连接数据库 
                String driverClass = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/manpower?characterEncoding=utf-8";
                String user = "root";//MySQL帐号
                String password = "mysql";//MYSQL密码
                String gwnum = request.getParameter("gwnum");
                String gwname = request.getParameter("gwname");
                String gwlevel = request.getParameter("gwlevel");
                String gwmoney = request.getParameter("gwmoney");
                Connection conn;
                try {
                    Class.forName(driverClass).newInstance();
                    conn = DriverManager.getConnection(url, user, password);
                    String sql = "select * from gwtable where ";
                    if (gwnum != null && !"".equals(gwnum)) {
                        sql += "gwnum like '%" + gwnum + "%'";
                    }
                    if (gwname != null && !"".equals(gwname)) {
                        sql += "gwname like '%" + gwname + "%'";
                    }
                    if (gwlevel != null && !"".equals(gwlevel)) {
                        sql += "gwlevel like '%" + gwlevel + "%'";
                    }
                    if (gwmoney != null && !"".equals(gwmoney)) {
                        sql += "gwmoney like '%" + gwmoney + "%'";
                    }
                    Statement ps = conn.createStatement();
                    ResultSet rs = ps.executeQuery(sql);
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