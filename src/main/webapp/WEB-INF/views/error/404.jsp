<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop</title>

<link rel="stylesheet" href="<c:url value='/css/common.css'/>">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />


	<div align="center">
		<h2><spring:message code="common.error.urlNotFound" /></h2> 
		<a href="javascript:window.history.back();" ><spring:message code="common.error.backPage" /></a><br> 
		<a href="/"><spring:message code="common.error.returnHome" /></a>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />


</body>
</html>