<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-eqiv="Content-Type" content="text/html; charset=UTF-8">
        <title>部门添加</title>
    </head>
    <body>
        <p>部门添加页面</p>
        <hr>
        <form action="dobmadd.jsp"  name="add" method="post">
            <div align="left">
                部门号：<input type="text" name="bmnum" value="输入部门号"
                           onfocus="if (this.value === '输入部门号')
                                       this.value = '';" maxlength=30><br>
                部门名：<input type="text" name="bmname" value="输入部门名"
                           onfocus="if (this.value === '输入部门名')
                                       this.value = '';" maxlength=5><br>
                经理：<input type="text" name="bmboss" value="输入经理名字"
                          onfocus="if (this.value === '输入经理名字')
                                      this.value = '';" maxlength=11><br>
                <input type="submit" name="submit" value="添加">
                <br><br><br>
                <a href="bmInfo.jsp">返回</a>
            </div>
        </form>
    </body>
</html>
