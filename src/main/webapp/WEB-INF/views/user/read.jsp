<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop</title>

<link rel="stylesheet" href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" href="<c:url value='/css/codegroup.css'/>">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />


	<div align="center">
		<h2>
			<spring:message code="codedetail.header.read" />
		</h2>

		<form:form id="codeDetail" modelAttribute="codeDetail" >
			<table>
				<tr>
					<td><spring:message code="codedetail.groupCode" /></td>
					<td><form:select path="groupCode" items="${groupCodeList}"
							itemValue="value" itemLabel="label" readonly="true" /></td>
					<td><font color="red"><form:errors path="groupCode" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="codedetail.codeValue" /></td>
					<td><form:input path="codeValue" readonly="true" /></td>
					<td><font color="red"><form:errors path="codeValue" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="codedetail.codeName" /></td>
					<td><form:input path="codeName" readonly="true" /></td>
					<td><font color="red"><form:errors path="codeName" /></font></td>
				</tr>
			</table>

			<div>
				<button type="submit" id="btnEdit">
					<spring:message code="action.edit" />
				</button>
				<button type="submit" id="btnRemove">
					<spring:message code="action.remove" />
				</button>
				<button type="button" id="btnList">
					<spring:message code="action.list" />
				</button>
			</div>
		</form:form>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
	$(document).ready(function() {
	    let formObj = $("#codeDetail");

	    $("#btnEdit").on("click", function() {
	        formObj.attr("action", "/codedetail/modify");
	        formObj.attr("method", "get");
	        formObj.submit();
	    });

	    $("#btnRemove").on("click", function() {
	        formObj.attr("action", "/codedetail/remove");
	        formObj.attr("method", "get");
	        formObj.submit();
	    });

	    $("#btnList").on("click", function() {
	        self.location = "/codegroup/list";
	    });
	});
		
	</script>
</body>
</html>