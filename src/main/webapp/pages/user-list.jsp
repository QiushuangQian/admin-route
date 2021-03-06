<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="my" uri="http://java.sun.com/jsp/jstl/tag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>数据 - AdminLTE2定制版</title>
    <meta name="description" content="AdminLTE2定制版">
    <meta name="keywords" content="AdminLTE2定制版">
    <jsp:include page="alpha-resources.jsp"/>

</head>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

    <jsp:include page="beta-header.jsp"/>

    <jsp:include page="beta-sidebar.jsp"/>

    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>用户管理<small>系统管理</small></h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/user/index.do"><i class="fa fa-dashboard"></i>首页</a></li>
                <li><a href="${pageContext.request.contextPath}/user/findAll.do">用户管理</a></li>
                <li class="active">全部用户</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">
            <div class="box box-primary">

                <!-- box-header -->
                <div class="box-header with-border">
                    <h3 class="box-title">用户列表</h3>
                </div>
                <!-- box-header -->


                <!-- box-body -->
                <div class="box-body">

                    <!--table-box-->
                    <div class="table-box">
                        <div class="pull-left">
                            <button type="button" class="btn btn-default" title="刷新" onclick="location.href='${pageContext.request.contextPath}/user/findAll.do'">
                                <i class="fa fa-refresh"></i> 页面刷新
                            </button>

                        </div>
                        
                        <div class="box-tools pull-right">
                            <div class="has-feedback">
                                <input type="text" id="search" class="form-control input-sm" placeholder="搜索"><span class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
                        </div>

                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="" style="padding-right: 0px">
                                    <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th class="sorting_desc">用户名</th>
                                <th class="sorting_asc sorting_asc_disabled">邮箱</th>
                                <th class="sorting_desc sorting_desc_disabled">联系电话</th>
                                <th class="sorting">状态</th>
                                <%--<th class="text-center">文件</th>--%>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${pageInfo.list}" var="user" varStatus="num">
                                <tr>
                                    <td><input name="userIds" type="checkbox"></td>
                                    <td>${user.username }</td>
                                    <td>${user.userEmail }</td>
                                    <td>${user.userPhone }</td>
                                    <td>${user.userStatusStr }</td>
                                    <%--<td class="text-center">
                                        <c:if test="${user.userFileURL == null}">--%>
                                           <%-- <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#uploadFile${num.index + 1}">上传</button>
                                            <div id="uploadFile${num.index + 1}" class="modal" role="dialog" style="display: none;">
                                                <form id="updateFile" action="${pageContext.request.contextPath}/user/upload.do" method="post" enctype="multipart/form-data">
                                                    <div class="modal-dialog">

                                                        <input type="hidden" name="userId" value="${user.userId}">

                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">X</span></button>
                                                                <h4 class="modal-title">文件上传</h4>
                                                            </div>

                                                            <div class="modal-body">
                                                                <div class="box-body">
                                                                    <div class="form-horizontal">
                                                                        <div class="form-group">
                                                                            <label for="username" class="col-sm-2 control-label">合同名称</label>
                                                                            <div class="col-sm-8">
                                                                                <div class="input-group">
                                                                                    <input type="text" class="form-control" name="userFilename">
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-horizontal">
                                                                            <div class="form-group">
                                                                                <label for="username" class="col-sm-2 control-label">文件上传</label>
                                                                                <div class="col-sm-6">
                                                                                    <div class="input-group">
                                                                                        <input type="file" class="form-control" name="upload">
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn bg-maroon" data-dismiss="modal">关闭</button>
                                                                    <button type="submit" class="btn bg-blue">保存</button>
                                                                </div>--%>
                                                  <%--          </div>
                                                            <!-- /.modal-content -->
                                                        </div>

                                                        <!-- /.modal-dialog -->
                                                    </div>
                                                </form>
                                            </div>
                                        </c:if>
                                        <c:if test="${user.userFileURL != null}">
                                            <a href="${pageContext.request.contextPath}/user/download.do?filename=${user.userFileURL}" class="btn bg-maroon btn-xs">下载</a>
                                        </c:if>
                                    </td>--%>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#userDetail${num.index + 1}">详情</button>
                                        <div id="userDetail${num.index + 1}" class="modal" role="dialog" style="display: none;">
                                            <div class="modal-dialog">

                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">X</span></button>
                                                        <h4 class="modal-title text-center">用户信息</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="box-body">
                                                            <div class="form-horizontal">

                                                                <div class="form-group">
                                                                    <label for="username" class="col-sm-2 control-label">用户名称:</label>
                                                                    <div class="col-sm-5">
                                                                        <input  type="text" class="form-control" name="username" value="${user.username}" readonly>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <label for="username" class="col-sm-2 control-label">用户邮箱:</label>
                                                                    <div class="col-sm-5">
                                                                        <input  type="text" class="form-control" name="userEmail" value="${user.userEmail}" readonly>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <label for="username" class="col-sm-2 control-label">联系电话:</label>
                                                                    <div class="col-sm-5">
                                                                        <input  type="text" class="form-control" name="userPhone" value="${user.userPhone}" readonly>
                                                                    </div>
                                                                </div>


                                                                <div class="form-group">
                                                                    <label for="username" class="col-sm-2 control-label">用户状态:</label>
                                                                    <div class="col-sm-5">
                                                                        <input  type="text" class="form-control" name="userStatusStr" value="${user.userStatusStr}" readonly>
                                                                    </div>
                                                                </div>

                                                                <c:if test="${user.userFilename != null}">
                                                                    <div class="form-group">
                                                                        <label for="username" class="col-sm-2 control-label">合同名称:</label>
                                                                        <div class="col-sm-5">
                                                                            <input  type="text" class="form-control" name="userFilename" value="${user.userFilename}" readonly>
                                                                        </div>
                                                                    </div>
                                                                </c:if>

                                                                <c:if test="${user.roles.size() != 0}">
                                                                    <div class="form-group">
                                                                        <label for="username" class="col-sm-2 control-label">用户角色:</label>
                                                                        <div class="col-sm-5">
                                                                            <input  type="text" class="form-control" name="userFilename" value="<c:forEach items="${user.roles}" var="role">${role.roleName} </c:forEach>" readonly>
                                                                        </div>
                                                                    </div>
                                                                </c:if>



                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn bg-maroon" data-dismiss="modal">关闭</button>
                                                    </div>
                                                </div>
                                                <!-- /.modal-content -->
                                            </div>
                                        </div>
                                        <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#userUpdate${num.index + 1}">修改</button>
                                        <div id="userUpdate${num.index + 1}" class="modal" role="dialog" style="display: none;">
                                            <form action="${pageContext.request.contextPath}/user/update.do" method="post">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">X</span></button>
                                                            <h4 class="modal-title text-center">修改用户</h4>
                                                        </div>

                                                        <div class="modal-body">
                                                            <div class="box-body">
                                                                <div class="form-horizontal">

                                                                    <input type="hidden" name="userId" value="${user.userId}">

                                                                    <div class="form-group">
                                                                        <label for="username" class="col-sm-2 control-label">用户名称:</label>
                                                                        <div class="col-sm-5">
                                                                            <input  type="text" class="form-control" name="username" value="${user.username}" readonly>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label  class="col-sm-2 control-label">用户邮箱:</label>
                                                                        <div class="col-sm-5">
                                                                            <input  type="text" class="form-control" name="userEmail" value="${user.userEmail}" readonly>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label class="col-sm-2 control-label">联系电话:</label>
                                                                        <div class="col-sm-5">
                                                                            <input  type="text" class="form-control" name="userPhone" value="${user.userPhone}">
                                                                        </div>
                                                                    </div>


                                                                    <div class="form-group">
                                                                        <label  class="col-sm-2 control-label">用户状态:</label>
                                                                        <div class="col-sm-5 text-left">
                                                                            <c:if test="${user.userStatus == 0}">
                                                                                <select class="form-control select2" style="width: 100%" name="userStatus">
                                                                                    <option value="0" selected>关闭</option>
                                                                                    <option value="1">开启</option>
                                                                                </select>
                                                                            </c:if>

                                                                            <c:if test="${user.userStatus == 1}">
                                                                                <select class="form-control select2" style="width: 100%" name="userStatus">
                                                                                    <option value="0">关闭</option>
                                                                                    <option value="1" selected>开启</option>
                                                                                </select>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>


                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn bg-maroon" data-dismiss="modal">关闭</button>
                                                            <button type="submit" name="updateUser" class="btn bg-blue">保存</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                        <a href="${pageContext.request.contextPath}/user/findByIdAndAllRole.do?userId=${user.userId}" class="btn bg-olive btn-xs">用户角色</a>
                                        <a href="${pageContext.request.contextPath}/user/deleteById.do?userId=${user.userId}" class="btn bg-maroon btn-xs" onclick="javascript:return del();">删除用户</a>
                                        <script>
                                            function del() {
                                                var del = confirm("您确定要删除此条记录");
                                                if (del === true) {

                                                } else {
                                                    return false;

                                                }
                                            }
                                        </script>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <!--数据列表-->

                        </table>
                        <!--数据列表-->
                    </div>
                    <!--table-box-->

                </div>
                <!-- box-body -->


                <!-- box-footer -->
                <div class="box-footer">
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            总共${pageInfo.pages}页，共${pageInfo.total}条数据。 每页
                            <select class="form-control" id="changePageSize" onchange="changePageSize()">
                                <my:option pageSize="${pageInfo.pageSize}"/>
                            </select> 条
                        </div>
                    </div>

                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                            </c:forEach>
                            <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
                        </ul>
                    </div>
                    <script>
                        function changePageSize() {
                            //获取下拉框的值
                            var pageSize = $("#changePageSize").val();

                            //向服务器发送请求，改变没页显示条数
                            location.href = "${pageContext.request.contextPath}/user/findAll.do?page=1&size=" + pageSize;
                        }
                    </script>

                </div>
                <!-- box-footer -->
            </div>
        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- 内容区域 /-->

    <jsp:include page="beta-footer.jsp"/>

</div>


</body>

</html>