<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>

<head>
    <title>角色管理</title>
</head>

<body>
<div class="breadcrumbs  breadcrumbs-fixed" id="breadcrumbs">
    <ul class="breadcrumb">
        <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">首页</a></li>
        <li class="active">系统管理</li>
        <li class="active">角色管理</li>
    </ul>
</div>

<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <div class="widget-box widget-color-blue">
                <!-- #section:custom/widget-box.options -->
                <div class="widget-header">
                    <h5 class="widget-title bigger lighter">
                        <i class="ace-icon fa fa-table"></i> 操作面板
                    </h5>
                </div>

                <div class="widget-body">
                    <div class="widget-main">
                        <table class="searchField">
                            <tr>
                                <td>
                                    <button class="btn btn-primary btn-sm" id="btnSearch">
                                        <i class="ace-icon fa fa-search"></i> 刷新
                                    </button>
                                    <shiro:hasPermission name="/sysRole/add">
                                        <button type="button" class="btn btn-success btn-sm" id="btnAdd">
                                            <i class="ace-icon fa fa-plus bigger-110"></i>新增
                                        </button>
                                    </shiro:hasPermission>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- PAGE CONTENT BEGINS -->
    <div class="row">
        <div class="col-xs-12">
            <table class="table table-striped table-bordered table-hover text-center">
                <thead>
                <tr>
                    <th width="60" class="text-center">序号</th>
                    <th width="150" class="text-center">角色代码</th>
                    <th width="150" class="text-center">角色名称</th>
                    <th width="220" class="text-center">描述</th>
                    <th width="140" class="text-center">创建人</th>
                    <th width="170" class="text-center">创建时间</th>
                    <th width="140" class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listRole }" var="sysRole" varStatus="st">
                    <tr>
                        <td>${st.index+1 }</td>
                        <td>${sysRole.roleCode }</td>
                        <td>${sysRole.roleName }</td>
                        <td>${sysRole.description }</td>
                        <td>${sysRole.createUser }</td>
                        <td><fmt:formatDate value="${sysRole.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>
                            <div class="hidden-sm hidden-xs action-buttons">
                                <shiro:hasPermission name="/sysRole/update">
                                    <a class="green" href="sysRole/toUpdateRole?roleId=${sysRole.roleId }" title="修改">
                                        <i class="ace-icon fa fa-pencil bigger-130"></i>
                                    </a>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="/sysRole/delete">
                                    <a class="red" href="javascript:deleteRole(${sysRole.roleId });">
                                        <i class="ace-icon fa fa-trash-o bigger-130"  title="删除"></i>
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
    <div class="row">
        <div class="col-xs-12">${ pageNavigate.pageModel}</div>
    </div>

</div>
<script type="text/javascript">
    $(function() {
        $("#btnSearch").bind('click', searchRole);
        $("#btnAdd").bind('click', addRole);
    })

    // 查询方法
    var searchRole = function() {
        var url = "sysRole";
        window.location = encodeURI(url);
    }
    // 删除
    var deleteRole = function(roleId) {
        bootbox.confirm("你确定要删除该角色吗？", function(result) {
            if (result) {
                window.location = "sysRole/deleteRole?roleId=" + roleId;
            }
        })
    }
    //新增
    var addRole = function(id) {
        window.location = 'sysRole/toAddRole';
    }
</script>
</body>
