<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-eqiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加员工</title>

    </head>
    <body>
        <p>员工添加页面</p>
        <hr>
        <form action="doygadd.jsp"  name="ygadd" method="post">
            <div align="left">
                工号：<input type="text" name="ygnum" value="输入工号"
                          onfocus="if (this.value === '输入工号')
                                      this.value = '';" maxlength=15><br>
                姓名：<input type="text" name="ygname" value="输入姓名"
                          onfocus="if (this.value === '输入姓名')
                                      this.value = '';" maxlength=5><br>
                出生日期：<input type="text" name="ygbday" value="输入出生日期"
                            onfocus="if (this.value === '输入出生日期')
                                        this.value = '';" maxlength=20><br>
                年龄：<input type="text" name="ygage" value="输入年龄"
                          onfocus="if (this.value === '输入年龄')
                                      this.value = '';" maxlength=10><br>
                政治面貌：<input type="text" name="ygface" value="输入政治面貌"
                            onfocus="if (this.value === '输入政治面貌')
                                        this.value = '';" maxlength=10><br>
                健康状况：<input type="text" name="ygbody" value="输入身体状况"
                            onfocus="if (this.value === '输入身体状况')
                                        this.value = '';" maxlength=5><br>
                职称：<input type="text" name="ygwork" value="输入职称"
                          onfocus="if (this.value === '输入职称')
                                      this.value = '';" maxlength=11><br>
                部门：
                                <input type="text" name="ygbm" value="输入部门"
                                          onfocus="if (this.value === '输入部门')
                                                       this.value = '';" maxlength=10><br>

                月薪：<input type="text" name="ygmonmoney" value="输入月薪"
                          onfocus="if (this.value === '输入月薪')
                                      this.value = '';" maxlength=6><br>
                年薪：<input type="text" name="ygyearmoney" value="输入年薪"
                          onfocus="if (this.value === '输入年薪')
                                      this.value = '';" maxlength=10><br>
                <input type="submit" name="submit" value="添加" >
                <br><br><br>
                <a href="ygInfo.jsp">返回</a>
            </div>
        </form>
    </body>
</html>
