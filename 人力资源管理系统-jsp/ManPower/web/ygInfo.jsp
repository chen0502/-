<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>员工基本信息</title>
    </head>
    <body>
        <p>员工基本信息</p>
        <hr>
        <div>
            <a href="main.jsp">返回</a>
            <br>
            <form action="ygquery.jsp" method="post">
                <input type="text" name="ygname" placeholder="名字">
                <input type="text" name="ygbday" placeholder="生日">
                <input type="text" name="ygage" placeholder="年龄">
                <input type="text" name="ygface" placeholder="政治面貌">
                <input type="text" name="ygbody" placeholder="健康状况">
                <input type="text" name="ygwork" placeholder="职称">
                <input type="text" name="ygbm" placeholder="部门">
                <button type="submit">查询</button>
                <a href="ygadd.jsp">添加员工</a>
            </form>
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
                    String sql = "SELECT * FROM ygtable ";
                    ResultSet rs = stmt.executeQuery(sql);
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
                        <input type="hidden" name="ygname" value="<%=rs.getString("ygname")%>">
                    </form>
                </td>
                <td>
                    <form action="ygdelete.jsp" method="post">
                        <button type="submit">删除</button>
                        <input type="hidden" name="ygnum" value="<%=rs.getString("ygnum")%>">
                        <input type="hidden" name="ygname" value="<%=rs.getString("ygname")%>">
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
