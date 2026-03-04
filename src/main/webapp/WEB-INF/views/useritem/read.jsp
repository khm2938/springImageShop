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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<%-- 전체 레이아웃 컨테이너 --%>
	<div class="container useritem-wrap">
		<div class="card useritem-card">

			<%-- 헤더 영역 --%>
			<div class="useritem-head">
				<h2 class="useritem-title">
					<spring:message code="useritem.header.read" />
				</h2>
			</div>

			<form:form modelAttribute="useritem" id="useritem">
				<form:hidden path="userItemNo" />

				<%-- 구매상품 테이블 --%>
				<table class="useritem_table">
					<tr>
						<td><spring:message code="useritem.itemName" /></td>
						<td><form:input path="itemName" readonly="true" /></td>
						<td><font color="red"><form:errors path="itemName" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="useritem.itemPrice" /></td>
						<td><form:input path="price" readonly="true" /></td>
						<td><font color="red"><form:errors path="price" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="useritem.itemFile" /></td>
						<td><img src="/item/display?itemId=${userItem.itemId}"
							width="210"></td>
					</tr>
					<tr>
						<td><spring:message code="useritem.itemDescription" /></td>
						<td><form:textarea path="description" readonly="true" /></td>
						<td><font color="red"><form:errors path="description" /></font></td>
					</tr>
				</table>

				<%-- 버튼 --%>
				<div class="useritem-actions">
					<button type="submit" id="btnList">
						<spring:message code="action.list" />
					</button>
				</div>
			</form:form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {

			var formObj = $("#useritem");

			$("#btnList").on("click", function() {
				self.location = "list";
			});

		});
	</script>
</body>
</html>