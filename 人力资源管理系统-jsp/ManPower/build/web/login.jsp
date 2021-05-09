<%@ page contentType="text/html; charset=utf-8" language="java"	import="java.util.*" errorPage=""%>
<HTML>
    <head>
        <title>登录</title>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <!-- javaScript 函数 validateLogin(),用来验证用户名和密码是否为空 -->
        <script language="javaScript">
            function validateLogin()
            {
                var sUserName = document.frmLogin.txtUserName.value;
                var sPassword = document.frmLogin.txtPassword.value;
                if (sUserName == "" || sPassword == "")
                {
                    alert("用户名或密码不能为空！");
                    return false;
                }
                if (sUserName.length() > 20) {
                    alert("用户名不能超过20个字符！");
                    return false;
                }
                if (sPassword.length() > 10) {
                    alert("密码不能超过10位！");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <!-- Form 用来提取用户填入并提交的信息-->
        <p>登录界面</p>
        <hr>
        <form method="post" name="frmLogin" action="dologin.jsp">
            <div align="left">
                <h2 >用户登录</h2>
                用户名:<input type="text" name="txtUserName" value="输入用户名"
                           onfocus="if (this.value === '输入用户名')
                                       this.value = '';" maxlength=30><br />
                密码：<input type="password" name="txtPassword" value=""
                          onfocus="if (this.value === '密码')
                                      this.value = '';" maxlength=10><br />
                <input type="submit" name="submit" value="确定" onclick="validateLogin()">
                <input type="reset" name="reset" value="重置"><br />
            </div>
        </form>
    </body>
</HTML>