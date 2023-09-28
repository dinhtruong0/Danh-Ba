<%-- 
    Document   : add
    Created on : Sep 15, 2023, 8:14:58 AM
    Author     : KHOACNTT
--%>

<%@page import="dto.Contact"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--nhung noi dung header.jsp-->
<jsp:include page="shared/header.jsp" />

<!--nhung noi dung nav.jsp-->
<jsp:include page="shared/nav.jsp" />
<c:if test="${param.btadd!= null}">
    <jsp:useBean id="dao" class="dao.ContactDAO"/>
    <jsp:useBean id="objcontact" class="dto.Contact"/>
    <jsp:setProperty name="objcontact" property="name" value="${param.name}"/>
    <jsp:setProperty name="objcontact" property="email" value="${param.email}"/>
    <jsp:setProperty name="objcontact" property="phone" value="${param.phone}"/>
    <c:set var="kq" value="${dao.Insert(objcontact)}"/>
    <c:if test="${kq>0}">
        <c:set var="success" value="Contact inserted success" scope="request"/>  
    </c:if>
    <c:if test="${kq==0}">
        <c:set var="error" value="Contact inserted error" scope="request"/>
    </c:if>
    <jsp:forward page="list.jsp" />
</c:if>

<div class="container" id="main-content">
      <div class="row justify-content-center">
          <form action="add.jsp" style="min-width: 300px;" method="post">
          <h5 class="text-center">Add Contact</h5>

          <div class="mb-3">
             <label class="form-label">Name</label>
            <input class="form-control" type="text" name="name" placeholder="Contact name..." />
          </div>

          <div class="mb-3">
              <label class="form-label">Email</label>
            <input class="form-control" type="email"name="email" placeholder="Contact email..." />
          </div>

          <div class="mb-3">
             <label class="form-label">Phone</label>
             <input class="form-control" type="text" name="phone" placeholder="Contact phone..." />
          </div>

          <div class="mb-3">
            <button type="submit" class="btn btn-block btn-primary" name="btadd">
              <i class="fa fa-save"></i> Save
            </button>
          </div>
        </form>
      </div>
    </div>       

<!--nhung noi dung footer.jsp-->
<jsp:include page="shared/footer.jsp" />      