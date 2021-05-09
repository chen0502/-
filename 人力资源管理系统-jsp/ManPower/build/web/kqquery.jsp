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
            <a href="kqInfo.jsp">返回</a>
            <br>
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
                request.setCharacterEncoding("utf-8");
                //连接数据库 
                String driverClass = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/manpower?characterEncoding=utf-8";
                String user = "root";//MySQL帐号
                String password = "mysql";//MYSQL密码
                String ygnum = request.getParameter("ygnum");
                String kqdate = request.getParameter("kqdate");
                String kqstate = request.getParameter("kqstate");
                String kqtime = request.getParameter("kqtime");
                Connection conn;
                try {
                    Class.forName(driverClass).newInstance();
                    conn = DriverManager.getConnection(url, user, password);
                    String sql = "select * from kqtable where ";
                    if (ygnum != null && !"".equals(ygnum)) {
                        sql += "ygnum like '%" + ygnum + "%'";
                    }
                    if (kqdate != null && !"".equals(kqdate)) {
                        sql += "kqdate like '%" + kqdate + "%'";
                    }
                    if (kqstate != null && !"".equals(kqstate)) {
                        sql += "kqstate like '%" + kqstate + "%'";
                    }
                    if (kqtime != null && !"".equals(kqtime)) {
                        sql += "kqtime like '%" + kqtime + "%'";
                    }
                    Statement ps = conn.createStatement();
                    ResultSet rs = ps.executeQuery(sql);
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