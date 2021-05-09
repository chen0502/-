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
            <a href="bmInfo.jsp">返回</a>
            <br>
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
                request.setCharacterEncoding("utf-8");
                //连接数据库 
                String driverClass = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/manpower?characterEncoding=utf-8";
                String user = "root";//MySQL帐号
                String password = "mysql";//MYSQL密码
                String bmnum = request.getParameter("bmnum");
                String bmname = request.getParameter("bmname");
                String bmboss = request.getParameter("bmboss");
                Connection conn;
                try {
                    Class.forName(driverClass).newInstance();
                    conn = DriverManager.getConnection(url, user, password);
                    String sql = "select * from bmtable where ";
                    if (bmname != null && !"".equals(bmname)) {
                        sql += "bmname like '%" + bmname + "%'";
                    }
                    if (bmboss != null && !"".equals(bmboss)) {
                        sql += "bmboss like '%" + bmboss + "%'";
                    }
                    Statement ps = conn.createStatement();
                    ResultSet rs = ps.executeQuery(sql);
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
    </body>
</html>