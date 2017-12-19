<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>资源管理</title>
    <link href="${staticServer}/assets/ace1.4/css/treeTable.min.css?version=${versionNo}" rel="stylesheet" type="text/css"/>
</head>

<body>

<div class="breadcrumbs  breadcrumbs-fixed" id="breadcrumbs">
    <ul class="breadcrumb">
        <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">首页</a></li>
        <li class="active">系统管理</li>
        <li class="active">资源管理</li>
    </ul>
</div>

<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <div class="widget-box widget-color-blue">
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
                                    <shiro:hasPermission name="/sysResource/add">
                                        <button type="button" class="btn btn-success btn-sm" id="btnAdd">
                                            <i class="ace-icon fa fa-plus bigger-110"></i>新增
                                        </button>
                                    </shiro:hasPermission>
                                    <%--<button class="btn btn-success btn-sm" id="btnClear">
                                        <i class="ace-icon fa fa-refresh"></i> 清空缓存
                                    </button>--%>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12">
            <table id="treeTable" class="table table-bordered table-condensed table-hover">
                <thead>
                <tr>
                    <th width=200 class="center">模块名称</th>
                    <th width=200 class="center">模块链接</th>
                    <th width=90 class="center">类型</th>
                    <th width=90 class="center">链接目标</th>
                    <th width=90 class="center">图标</th>
                    <th width=90 class="center">排序</th>
                    <th width="120" class="center">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listResource }" var="sysResource" varStatus="st">
                    <tr id="${sysResource.resourceId}" pId="${sysResource.parentId}">
                        <td>${sysResource.resourceName}</td>
                        <td style="word-break: break-all;">${sysResource.resourceUrl}</td>
                        <td class="center">
                            <c:if test="${sysResource.resourceType eq '1'}">模块</c:if>
                            <c:if test="${sysResource.resourceType eq '2'}">按钮</c:if>
                        </td>
                        <td class="center">${sysResource.target}</td>
                        <td class="center"><div><i class="fa ${sysResource.icon}"></i></div></td>
                         <td class="center">${sysResource.displayOrder}</td>
                        <td class="center">
                            <div class="hidden-sm hidden-xs action-buttons">
                                <shiro:hasPermission name="/sysResource/update">
                                    <a class="green" href="sysResource/toUpdateResource?resourceId=${sysResource.resourceId }" title="修改">
                                        <i class="ace-icon fa fa-pencil bigger-130"></i>
                                    </a>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="/sysResource/delete">
                                    <a class="red" href="javascript:delModule(${sysResource.resourceId });">
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
        <%--<div class="col-xs-12">${ pageNavigate.pageModel}</div>--%>
    </div>
</div>

<script src="${staticServer}/assets/ace1.4/js/jquery.treeTable.min.js" type="text/javascript"></script>

<script type="text/javascript">
    $(function() {
        $("#btnSearch").bind('click', searchModule);
        $("#btnAdd").bind('click', addResource);
        $("#btnClear").bind('click', clearCache);

        $("#treeTable").treeTable({
            expandLevel : 1//树表的展开层次，默认1
        });
    })

    // 查询方法
    var searchModule = function() {
        var url = "sysResource";
        window.location = encodeURI(url);
    }
    // 删除
    var delModule = function(resourceId) {
        bootbox.confirm("你确定要删除该模块吗？", function(result) {
            if (result) {
                window.location = "sysResource/deleteResource?resourceId=" + resourceId;
            }
        })
    }
    //新增
    var addResource = function() {
        window.location = 'sysResource/toAddResource';
    }
    //清空缓存
    var clearCache = function() {
        window.location = 'clearCache.htm';
    }

</script>
</body>
