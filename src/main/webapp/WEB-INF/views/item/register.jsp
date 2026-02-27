<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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

	<h2>
		<spring:message code="item.header.register" />
	</h2>
	<form:form modelAttribute="item" action="/item/register" enctype="multipart/form-data" method="post">
		<table>
			<tr>
				<td><spring:message code="item.itemName" /></td>
				<td><form:input path="itemName" /></td>
				<td><font color="red"><form:errors path="itemName" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="item.itemPrice" /></td>
				<td><form:input path="price" />&nbsp;원</td>
				<td><font color="red"><form:errors path="price" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="item.itemFile" /></td>
				<td><input type="file" name="picture" /></td>
				<td></td>
			</tr>
			<tr>
				<td><spring:message code="item.itemPreviewFile" /></td>
				<td><input type="file" name="preview" /></td>
				<td></td>
			</tr>
			<tr>
				<td><spring:message code="item.itemDescription" /></td>
				<td><form:textarea path="description" /></td>
				<td><form:errors path="description" /></td>
			</tr>
		</table>
	</form:form>

	<div>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<button type="button" id="btnRegister">
				<spring:message code="action.register" />
			</button>
		</sec:authorize>

		<button type="button" id="btnList">
			<spring:message code="action.list" />
		</button>
	</div>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			var formObj = $("#item");
			$("#btnRegister").on("click", function() {
				formObj.submit();
			});

			$("#btnList").on("click", function() {
				self.location = "/item/list";
			});
		});
	</script>

</body>
</html>