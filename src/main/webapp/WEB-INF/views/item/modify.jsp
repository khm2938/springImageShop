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
<link rel="stylesheet" href="/css/user.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />


	<div align="center">
		<h2>
			<spring:message code="notice.header.read" />
		</h2>
		<form:form modelAttribute="notice" action="/notice/modify" method="post">
			<form:hidden path="noticeNo" />
			<table>
				<tr>
					<td><spring:message code="notice.title" /></td>
					<td><form:input path="title" /></td>
					<td><font color="red"><form:errors path="title" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="notice.content" /></td>
					<td><form:textarea path="content" /></td>
					<td><font color="red"><form:errors path="content" /></font></td>
				</tr>
			</table>

		</form:form>

		<div>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="button" id="btnModify">
					<spring:message code="action.modify" />
				</button>
			</sec:authorize>

			<button type="button" id="btnList">
				<spring:message code="action.list" />
			</button>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(
				function() {
					let formObj = $("#notice");

					$("#btnModify").on(
							"click",
							function() {
								formObj.submit();
							});

					$("#btnList").on(
							"click",
							function() {
								self.location = "/list"
							});

				});
	</script>
</body>
</html>