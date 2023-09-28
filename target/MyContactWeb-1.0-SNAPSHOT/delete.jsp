<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.ContactDAO"/>
<c:if test="${param.id!=null}">
    <c:set var="kq" value="${dao.Delete(param.id)}"/>
    <c:if test="${kq>0}">
        <c:set var="success" value="ban muon xoa khong" scope="request"/>
        <jsp:forward page="list.jsp"/>
    </c:if>
</c:if>   