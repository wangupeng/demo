<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>

<head>
    <title>用户管理</title>
</head>

<body>
<div class="breadcrumbs  breadcrumbs-fixed" id="breadcrumbs">
    <ul class="breadcrumb">
        <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">首页</a></li>
        <li class="active">系统管理</li>
        <li class="active">用户管理</li>
    </ul>
</div>

<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <div class="widget-box widget-color-blue">
                <div class="widget-header">
                    <h5 class="widget-title bigger lighter">
                        <i class="ace-icon fa fa-table"></i> 操作面板<result:result/>
                    </h5>
                </div>

                <div class="widget-body">
                    <div class="widget-main">
                        <form  name="sysUser" class="form-horizontal" action="sysUser" method="post">
                        <table class="searchField">
                            <tr>
                                <td>账号：</td>
                                <td><input type="text" name = "userName" class="form-control input-small" value="${sysUser.userName}"></td>
                                <td>姓名：</td>
                                <td><input type="text" name = "realName" class="form-control input-small" value="${sysUser.realName}"></td>
                                <td>状态：</td>
                                <td>
                                    <form:select path="sysUser.status" class="form-control" id="cmbStatus">
                                        <form:option value="" label="--全部--"/>
                                        <form:option value="1">正常</form:option>
                                        <form:option value="2">已锁定</form:option>
                                    </form:select>
                                </td>
                                <td>角色：</td>
                                <td>
                                    <form:select path="sysRole.roleId" class="form-control" id="cmbRoleId">
                                        <form:option value="" label="--全部--"/>
                                        <form:options items="${listRole}" itemValue="roleId" itemLabel="roleName"/>
                                    </form:select>
                                </td>
                                <td>
                                    <button class="btn btn-primary btn-sm" id="btnSearch">
                                        <i class="ace-icon fa fa-search"></i> 查询
                                    </button>
                                    <shiro:hasPermission name="/sysUser/add">
                                        <button type="button" class="btn btn-success btn-sm" id="btnAdd">
                                            <i class="ace-icon fa fa-plus bigger-110"></i>新增
                                        </button>
                                    </shiro:hasPermission>
                                </td>
                            </tr>
                        </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- PAGE CONTENT BEGINS -->
    <div class="row">
        <div class="col-xs-12">
            <table id="simple-table" class="table table-striped table-bordered table-hover text-center">
                <thead>
                <tr>
                    <th width="40" class="text-center">序号</th>
                    <th width="120" class="text-center">账号</th>
                    <th width="70" class="text-center">姓名</th>
                    <th width="100" class="text-center">角色</th>
                    <th width="70" class="text-center">创建人</th>
                    <th width="140" class="text-center">创建时间</th>
                    <th width="60" class="text-center">状态</th>
                    <%--<th width="80" class="text-center">登录记录</th>--%>
                    <th width="160" class="text-center">操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${listUser }" var="sysUser" varStatus="st">
                    <tr>
                        <td>${st.index+1 }</td>
                        <td>${sysUser.userName }</td>
                        <td>${sysUser.realName }</td>
                        <td>${sysUser.roleName}</td>
                        <td>${sysUser.createUser }</td>
                        <td><fmt:formatDate value="${sysUser.createDate }" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>
                            <c:if test="${sysUser.status eq '1'}">正常</c:if>
                            <c:if test="${sysUser.status eq '2'}">已锁定</c:if>
                        </td>
                        <td>
                            <div class="hidden-sm hidden-xs action-buttons">
                                <shiro:hasPermission name="/sysUser/update">
                                    <a class="green" href="sysUser/toUpdateUser?userId=${sysUser.userId }" title="修改">
                                        <i class="ace-icon fa fa-pencil bigger-130"></i>
                                    </a>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="/sysUser/delete">
                                    <a class="red" href="javascript:deleteUser(${sysUser.userId });">
                                        <i class="ace-icon fa fa-trash-o bigger-130"  title="删除"></i>
                                    </a>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="/sysUser/lock">
                                        <a class="dark" href="javascript:lockUser(${sysUser.userId });" title="锁定">
                                            <i class="ace-icon fa fa-lock bigger-130"></i>
                                        </a>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="/sysUser/unlock">
                                    <a class="blue" href="javascript:unlockUser(${sysUser.userId });" title="解锁">
                                        <i class="ace-icon fa fa-unlock bigger-130"></i>
                                    </a>
                                </shiro:hasPermission>

                                <shiro:hasPermission name="/sysUser/reset">
                                    <a class="orange" href="javascript:resetPassWord(${sysUser.userId });" title="重置密码">
                                        <i class="ace-icon fa fa-repeat bigger-120"></i>
                                    </a>
                                </shiro:hasPermission>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-xs-12">${ pageNavigate.pageModel}</div>
    </div>
    <div id="dialog-viewLogin" class="hide center">
    </div>
</div>
<script type="text/javascript">
    $(function () {
//        $("#btnSearch").bind('click', searchUser);
        $("#btnAdd").bind('click', addUser);
    })

    // 删除
    var deleteUser = function (userId) {
        bootbox.confirm("你确定要删除该用户吗？", function (result) {
            if (result) {
                window.location = "sysUser/deleteUser?userId=" + userId;
            }
        })
    }
    // 锁定
    var lockUser = function (userId) {
        bootbox.confirm("你确定要锁定该用户吗？", function (result) {
            if (result) {
                window.location = "sysUser/lockUser?userId=" + userId;
            }
        })
    }
    // 解锁
    var unlockUser = function (userId) {
        bootbox.confirm("你确定要解锁该用户吗？", function (result) {
            if (result) {
                window.location = "sysUser/unlockUser?userId=" + userId;
            }
        })
    }
    // 重置密码
    var resetPassWord = function (userId) {
        bootbox.confirm("你确定要给该用户重置密码吗？", function (result) {
            if (result) {
                window.location = "sysUser/resetPassWord?userId=" + userId;
            }
        })
    }

    //新增
    var addUser = function (id) {
        window.location = 'sysUser/toAddUser';
    }

    var viewLoginHis = function (id, title) {
        $.post('searchUserLogin.htm', {
            userId: id
        }, function (html) {
            $("#dialog-viewLogin").html(html);
            var dialog = $("#dialog-viewLogin").removeClass('hide').dialog({
                title: "【" + title + "】登录历史",
                title_html: false,
                width: 1000,
                minHeight: 500,
                position: {my: "center", at: "center", of: window},
                modal: true,
                buttons: [
                    {
                        text: "返回",
                        "class": "btn btn-minier btn-center",
                        click: function () {
                            $(this).dialog("close");
                        }
                    }
                ]
            });
        });
    }
</script>
</body>
