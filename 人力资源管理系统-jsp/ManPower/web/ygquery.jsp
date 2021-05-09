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
            <a href="ygInfo.jsp">返回</a>
            <br>
        </div>
        <br>
        <table border="1/2" align="left">
            <tr>
                <th>工号</th>
                <th>姓名</th>
                <th>出生日期</th>
                <th>年龄</th>
                <th>政治面貌</th>
                <th>健康状况</th>
                <th>职位</th>
                <th>所在部门</th>
                <th>月薪</th>
                <th>年薪</th>
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
                String ygname = request.getParameter("ygname");
                String ygbday = request.getParameter("ygbday");
                String ygage = request.getParameter("ygage");
                String ygface = request.getParameter("ygface");
                String ygbody = request.getParameter("ygbody");
                String ygwork = request.getParameter("ygwork");
                String ygbm = request.getParameter("ygbm");
                Connection conn;
                try {
                    Class.forName(driverClass).newInstance();
                    conn = DriverManager.getConnection(url, user, password);
                    String sql = "select * from ygtable where ";
                    if (ygname != null && !"".equals(ygname)) {
                        sql += "ygname like '%" + ygname + "%'";
                    }
                    if (ygbday != null && !"".equals(ygbday)) {
                        sql += "ygbday like '%" + ygbday + "%'";
                    }
                    if (ygage != null && !"".equals(ygage)) {
                        sql += "ygage like '%" + ygage + "%'";
                    }
                    if (ygface != null && !"".equals(ygface)) {
                        sql += "ygface like '%" + ygface + "%'";
                    }
                    if (ygbody != null && !"".equals(ygbody)) {
                        sql += "ygbody like '%" + ygbody + "%'";
                    }
                    if (ygwork != null && !"".equals(ygwork)) {
                        sql += "ygwork like '%" + ygwork + "%'";
                    }
                    if (ygbm != null && !"".equals(ygbm)) {
                        sql += "ygbm like '%" + ygbm + "%'";
                    }
                    Statement ps = conn.createStatement();
                    ResultSet rs = ps.executeQuery(sql);
                    while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("ygnum")%></td>   
                <td><%=rs.getString("ygname")%></td>
                <td><%=rs.getString("ygbday")%></td>
                <td><%=rs.getString("ygage")%></td>
                <td><%=rs.getString("ygface")%></td>   
                <td><%=rs.getString("ygbody")%></td>
                <td><%=rs.getString("ygwork")%></td>
                <td><%=rs.getString("ygbm")%></td>
                <td><%=rs.getString("ygmonmoney")%></td>
                <td><%=rs.getString("ygyearmoney")%></td>
                <td>
                    <form action="ygupdate.jsp" method="post">
                        <button type="submit">更改</button>
                        <input type="hidden" name="ygnum" value="<%=rs.getString("ygnum")%>">
                    </form>
                </td>
                <td>
                    <form action="ygdelete.jsp" method="post">
                        <button type="submit">删除</button>
                        <input type="hidden" name="ygnum" value="<%=rs.getString("ygnum")%>">
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