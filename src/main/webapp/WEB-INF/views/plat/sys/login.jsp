<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${webTitle}</title>
    <%@ include file="../common/styles.jspf" %>
    <link href="${staticServer}/assets/common/css/cloud.css" rel="stylesheet" type="text/css" />
    <script src="${staticServer}/assets/common/js/jquery.min.js"></script>
    <script src="${staticServer}/assets/common/js/cloud.js" ></script>
</head>
<body>
<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>

<div class="loginbody">
    <div class="login-container">
        <div class="space"></div><div class="space"></div><div class="space"></div>
        <div class="center">
            <h1>
                <span class="white">${webTitle}</span>
            </h1>
        </div>
        <div class="space"></div>
        <div class="space"></div>
        <div class="space"></div>
        <div class="position-relative">
            <div id="login-box" class="login-box visible widget-box no-border">
                <form id="loginForm" action="" method="post">

                    <label class="block clearfix">
                        <span class="block input-icon input-icon-right">
                            <input type="text" class="form-control" name="userName" id="userName" placeholder="用户名" value="admin"/>
                            <i class="ace-icon fa fa-user"></i>
                        </span>
                    </label>

                    <div class="space"></div>

                    <label class="block clearfix">
                        <span class="block input-icon input-icon-right">
                            <input type="password" class="form-control" name="passWord" id="passWord" placeholder="密码" value="123456"/>
                            <i class="ace-icon fa fa-lock"></i>
                        </span>
                    </label>

                    <div class="space"></div>

                    <label class="block clearfix">
                        <span class="block input-icon input-icon-right">
                            <span class="errMsg">${msg}</span>
                        </span>
                    </label>

                    <label  class="block clearfix">
                        <button type="submit" class="width-45 pull-left btn btn-sm btn-primary">
                            <i class="ace-icon fa fa-key"></i> <span class="bigger-110">登 录</span>
                        </button>

                        <button type="reset" class="width-45 pull-right btn btn-sm btn-primary">
                            <i class="ace-icon fa fa-refresh"></i> <span class="bigger-110">重 置</span>
                        </button>
                    </label>

                    <div class="space"></div>

                    <%--<label class="inline pull-right">
                        <input type="checkbox" class="ace" name="rememberMe"/><span class="lbl"> 记住我</span>
                        <input type="checkbox" class="ace" id="chk1" disabled="disabled"/><span class="lbl"> 自动登录</span>
                    </label>--%>
                </form>
            </div>
        </div>
    </div>
    </div>
</div>
<div class="loginbm">版权所有 © 2017</div>
</body>
</html>
