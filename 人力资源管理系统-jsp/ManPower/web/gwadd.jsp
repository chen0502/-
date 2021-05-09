<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-eqiv="Content-Type" content="text/html; charset=UTF-8">
        <title>岗位添加</title>
    </head>
    <body>
        <p>岗位添加页面</p>
        <hr>
        <form action="dogwadd.jsp"  name="add" method="post">
            <div align="left">
                岗位号：<input type="text" name="gwnum" value="输入岗位号"
                           onfocus="if (this.value === '输入岗位号')
                                      this.value = '';" maxlength=30><br>
                岗位名：<input type="text" name="gwname" value="输入岗位名"
                           onfocus="if (this.value === '输入岗位名')
                                      this.value = '';" maxlength=30><br>
                级别：<select name="gwlevel" size="1">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select><br>
                薪酬标准：<select name="gwmoney" size="1">
                    <option value="1w以下">1w以下</option>
                    <option value="1w-2W">1w-2W</option>
                    <option value="2w-3w">2w-3w</option>
                    <option value="3w-4w">3w-4w</option>
                    <option value="4w-5w">4w-5w</option>
                    <option value="5w-6w">5w-6w</option>
                    <option value="6w-7w">6w-7w</option>
                    <option value="7w-8w">7w-8w</option>
                    <option value="10w-50w">10w-50w</option>
                    <option value="50w-100w">50w-100w</option>
                </select><br>
                <input type="submit" name="submit" value="添加">
                <br><br><br>
                <a href="gwInfo.jsp">返回</a>
            </div>
        </form>
    </body>
</html>
