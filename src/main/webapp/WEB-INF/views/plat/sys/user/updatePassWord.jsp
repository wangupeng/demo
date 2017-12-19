<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>修改密码</title>
</head>

<body class="no-skin">
<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
    <ul class="breadcrumb">
        <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">首页</a></li>
        <li class="active">修改密码</li>
    </ul>
</div>

<div class="page-content">
    <div class="page-header">
        <h1>
            修改密码
            <small><i class="ace-icon fa fa-angle-double-right"></i>
            </small>
        </h1>
    </div>
    <!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">
            <form id="inputForm" name="inputForm" class="form-horizontal" action="updatePassWord" method="post">
                <div class="form-group">
                    <label class="col-sm-3 control-label">原密码：</label>
                    <div class="col-sm-9">
                        <input id="oldPassWord" name="oldPassWord" type="password" class="col-xs-10 col-sm-5">
                        <label id="oldPassWordTip"></label><label class="control-label" style="color: red;padding-left: 5px">${oldPassError}</label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">新密码：</label>
                    <div class="col-sm-9">
                        <input id="passWord" type="password" name="passWord" class="col-xs-10 col-sm-5">
                        <label id="passWordTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">确认新密码：</label>
                    <div class="col-sm-9">
                        <input id="rePassWord" type="password" name="rePassWord" class="col-xs-10 col-sm-5">
                        <label id="rePassWordTip"></label>
                    </div>
                </div>
                <div class="clearfix form-actions">
                    <div class="col-md-offset-3 col-md-9">
                        <button class="btn btn-primary" type="submit">
                            <i class="ace-icon fa fa-save bigger-110"></i> 保存
                        </button>
                        <button class="btn" type="button" onclick="history.back(-1)">
                            <i class="ace-icon fa fa-undo bigger-110"></i> 取消
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        if("${updatePassSuccess}" > 0){
            bootbox.alert({
                buttons: {
                    ok: {label: '确定'}
                },
                message: '密码修改成功，请重新登录！',
                callback: function() {
                    window.location = "/pmis/logout";
                }
            });
        }
        var validate = $("#inputForm").validate({
            errorElement: "label",
            errorClass: "valiError",
            errorPlacement: function (error, element) {
                error.appendTo($("#" + element.attr('id') + "Tip"));
            },
            rules: {
                oldPassWord: {
                    required: true,
                    minlength: 6,
                    maxlength: 20
                },
                passWord: {
                    required: true,
                    minlength: 6,
                    maxlength: 20
                },
                rePassWord: {
                    required: true,
                    minlength: 6,
                    maxlength: 20,
                    equalTo: "#passWord"
                },
            },
            messages: {
                renewPass: {
                    equalTo: "确认新密码与新密码输入不一致"
                }
            }
        });
    });
</script>
</body>
