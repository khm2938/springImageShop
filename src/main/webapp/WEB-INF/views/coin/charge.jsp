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
	<div class="container coin-charge-wrap">
		<div class="card coin-charge-card">

			<%-- 헤더 영역 --%>
			<div class="coin-head">
				<h2>
					<spring:message code="coin.header.chargeCoin" />
				</h2>
			</div>

			<%-- 충전 폼 --%>
			<form:form modelAttribute="chargeCoin" action="charge">
				<table>
					<tr>
						<td><spring:message code="coin.amount" /></td>
						<td><form:input path="amount" /></td>
						<td><font color="red"><form:errors path="amount" /></font></td>
					</tr>
				</table>
			</form:form>

			<div>
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<button type="submit" id="btnCharge">
						<spring:message code="action.charge" />
					</button>
					<button type="submit" id="btnList">
						<spring:message code="action.list" />
					</button>
				</sec:authorize>
			</div>

		</div>
	</div>

	<script>
		$(document).ready(function() {
			var formObj = $("#chargeCoin");

			$("#btnCharge").on("click", function() {
				formObj.submit();
			});

			$("#btnList").on("click", function() {
				self.location = "/coin/list";
			});
		});
	</script>
</body>
</html>