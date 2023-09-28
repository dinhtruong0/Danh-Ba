<%-- 
    Document   : add
    Created on : Sep 15, 2023, 8:14:58 AM
    Author     : KHOACNTT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--nhung noi dung header.jsp-->
<jsp:include page="shared/header.jsp" />

<!--nhung noi dung nav.jsp-->
<jsp:include page="shared/nav.jsp" />
<jsp:useBean id="dao" class="dao.ContactDAO"/>
<c:if test="${param.id!= null}">
    <c:set var="x" value="${dao.findById(param.id)}"/>
</c:if>
<c:if test="${param.btupdate!=null}">
    <jsp:useBean id="obj" class="dto.Contact"/>
    <jsp:setProperty name="obj" property="*"/>
    <c:set var="kq" value="${dao.Update(obj)}"/>
    <c:if test="${kq>0}">
        <c:set var="success" value="Contact inserted success" scope="request"/>  
    </c:if>
    <c:if test="${kq==0}">
        <c:set var="error" value="Contact inserted error" scope="request"/>
    </c:if>
    <jsp:forward page="list.jsp"/>
</c:if>
<div class="container" id="main-content">
      <div class="row justify-content-center">
          <form action="edit.jsp" style="min-width: 300px" method="post">
          <h5 class="text-center">Edit Contact</h5>
          <input type="hidden" name="id" value="${x.id}"/>

          <div class="mb-3">
             <label class="form-label">Name</label>
             <input class="form-control" type="text" name="name" value="${x.name}" placeholder="Contact name..." />
          </div>

          <div class="mb-3">
              <label class="form-label">Email</label>
              <input class="form-control" type="email" name="email" value="${x.email}" placeholder="Contact email..." />
          </div>

          <div class="mb-3">
             <label class="form-label">Phone</label>
             <input class="form-control" type="text" name="phone" value="${x.phone}" placeholder="Contact phone..." />
          </div>

          <div class="mb-3">
              <button type="submit" class="btn btn-block btn-primary" name="btupdate">
              <i class="fa fa-save"></i> Update
            </button>
          </div>
        </form>
      </div>
    </div>
        
<!--nhung noi dung footer.jsp-->
<jsp:include page="shared/footer.jsp" />      