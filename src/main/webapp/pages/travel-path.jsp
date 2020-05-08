<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>ITCAST - AdminLTE2定制版</title>
    <meta name="description" content="AdminLTE2定制版">
    <meta name="keywords" content="AdminLTE2定制版">

    <jsp:include page="alpha-resources.jsp"/>
</head>


<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page="beta-header.jsp"/>

    <jsp:include page="beta-sidebar.jsp"/>

    <div class="content-wrapper">

        <section class="content-header">
            <h1>旅行线路查询<small>系统管理</small></h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/user/index.do"><i class="fa fa-dashboard"></i>首页</a></li>
                <li><a href="${pageContext.request.contextPath}/travel/user.do">所有景点</a></li>
                <li class="active">全部公告</li>
            </ol>
        </section>

        <form action="${pageContext.request.contextPath}/travel/path.do" method="post">

        <section class="content">
                <div class="panel panel-default">
                    <div class="panel-heading">旅行线路</div>
                    <div class="row data-type">

                        <div class="col-md-2 title">起点,坐标为0</div>
                        <div class="col-md-4 data">
                              <input type="text"class="form-control" name="path0"value="${param.path0}"autocomplete="off">
                        </div>

                        <div class="col-md-2 title">途径,坐标为1</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="path1"value="${param.path1}"autocomplete="off">
                        </div>

                        <div class="col-md-2 title">途径,坐标为2</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="path2"value="${param.path2}"autocomplete="off">
                        </div>


                        <div class="col-md-2 title">途径,坐标为3</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="path3"value="${param.path3}"autocomplete="off">
                        </div>

                        <div class="text-center">${pathValue}</div>
                        <div class="text-center">${routeValue}</div>
                        <div class="text-center">${priceValue}</div>
                        <div class="text-center">${routeValue2}</div>
                    </div>
                </div>

        </section>

        <!--工具栏-->
        <div class="box-tools text-center">
            <button type="submit" class="btn bg-maroon">提交</button>
            <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
        </div>
        <!--工具栏/-->
        </form>

    </div>

    <jsp:include page="beta-footer.jsp"/>

</div>


</body>

</html>