<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-eqiv="Content-Type" content="text/html; charset=UTF-8">
        <title>记录添加</title>
    </head>
    <body>
        <p>记录添加页面</p>
        <hr>
        <form action="dokqadd.jsp"  name="add" method="post">
            <div align="left">
                工号：<input type="text" name="ygnum" value="输入工号"
                          onfocus="if (this.value === '输入工号')
                                       this.value = '';" maxlength=30><br>
                日期：<input type="text" name="kqdate" value="输入日期"
                          onfocus="if (this.value === '输入日期')
                                       this.value = '';" maxlength=30><br>
                状态：<select name="kqstate" size="1">
                    <option value="加班">加班</option>
                    <option value="迟到">迟到</option>
                    <option value="请假">请假</option>
                    <option value="旷工">旷工</option>
                </select><br>
                时长：<input type="text" name="kqtime" value="输入时长"
                          onfocus="if (this.value === '输入时长')
                                      this.value = '';" maxlength=11><br>
                <input type="submit" name="submit" value="添加">
                <br><br><br>
                <a href="kqInfo.jsp">返回</a>
            </div>
        </form>
    </body>
</html>
