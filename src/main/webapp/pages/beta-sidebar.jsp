<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${pageContext.request.contextPath}/img/user1.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${user.username}</p>
                <a href="#"><i class="fa fa-circle text-success"></i>在线</a>
            </div>
        </div>


        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li id="admin-index">
                <a href="${pageContext.request.contextPath}/user/index.do">
                    <i class="fa fa-dashboard"></i>
                    <span>首页</span></a>
            </li>


            <c:forEach items="${sessionScope.user.roles}" var="role">
                <c:if test="${role.roleName == 'ADMIN'}">
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-cogs"></i>
                            <span>系统管理</span>
                            <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                        </a>

                        <ul class="treeview-menu">

                            <li id="system-setting">
                                <a href="${pageContext.request.contextPath}/user/findAll.do">
                                    <i class="fa fa-circle-o"></i> 用户管理
                                </a>
                            </li>

                            <li id="system-setting">
                                <a href="${pageContext.request.contextPath}/travel/findAll.do">
                                    <i class="fa fa-circle-o"></i> 景点管理
                                </a>
                            </li>

                            <li id="system-setting">
                                <a href="${pageContext.request.contextPath}/user/announce.do">
                                    <i class="fa fa-circle-o"></i> 发布公告
                                </a>
                            </li>


                        </ul>

                    </li>

                </c:if>
            </c:forEach>


            <li class="treeview"><a href="#"> <i class="fa fa-cube"></i>
                <span>主要功能</span> <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
				</span>
            </a>
                <ul class="treeview-menu">

                    <li id="system-setting">
                        <a href="${pageContext.request.contextPath}/user/information.do">
                            <i class="fa fa-circle-o"></i> 个人信息
                        </a>
                    </li>

                    <li id="system-setting">
                        <a href="${pageContext.request.contextPath}/travel/user.do">
                            <i class="fa fa-circle-o"></i> 查看景点
                        </a>
                    </li>

                    <li id="system-setting">
                        <a href="${pageContext.request.contextPath}/travel/get.do">
                            <i class="fa fa-circle-o"></i> 旅行线路
                        </a>
                    </li>

                    <li id="system-setting">
                        <a href="${pageContext.request.contextPath}/user/notification.do">
                            <i class="fa fa-circle-o"></i> 系统消息
                        </a>
                    </li>


                </ul>
            </li>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>