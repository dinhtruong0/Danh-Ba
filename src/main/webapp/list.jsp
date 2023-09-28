<%-- 
    Document   : list.jsp
    Created on : Sep 15, 2023, 8:14:39 AM
    Author     : KHOACNTT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--nhung noi dung header.jsp-->
<jsp:include page="shared/header.jsp" />
<!--nhung noi dung nav.jsp-->
<jsp:include page="shared/nav.jsp" />
<jsp:useBean id="dao" class="dao.ContactDAO" />
<c:set var="kq" value="${dao.search(param.txtname)}" />

<div class="container" id="main-content">   
    <div class="row">
        <div class="col-md-6">
            <form method="post">  
                <div class="row">
                    <div class="col-md-8"> 
                        <input class="form-control" type="search" name="txtname" value="${param.txtname}" placeholder="Search by name ....." />
                    </div>
                    <div class="col-md-4">
                        <button class="btn btn-primary" type="submit">
                            <i class="fa fa-search"></i> Search
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-6 text-end">
            <a href="add.jsp" class="btn btn-success float-right">
                <i class="fa fa-plus-square"></i> New contact
            </a>
        </div>
    </div>                  

    <div class="row mt-4">
        <div class="table-responsive">
            <h5>List of contacts</h5>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="x" items="${kq}">
                        <tr>
                            <td>${x.id}</td>
                            <td>${x.name}</td>
                            <td>${x.email}</td>
                            <td>${x.phone}</td>
                            <td>
                                <a href="edit.jsp?id=${x.id}" class="mr-sm-2 text-primary"><i class="fa fa-pencil"></i></a>
                                <a href="delete.jsp?id=${x.id}" onclick="return confirm('Are you sure about that ?')" class="text-danger"><i class="fa fa-trash"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div><!-- /.container -->
<!--nhung noi dung footer.jsp-->
<jsp:include page="shared/footer.jsp" />   
