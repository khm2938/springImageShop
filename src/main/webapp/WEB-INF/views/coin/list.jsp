<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	<div class="container charge-coin-page">
		<div class="card charge-coin-card">
			<div class="charge-coin-head">
				<h2 class="charge-coin-title">
					<spring:message code="coin.header.list" />
				</h2>
			</div>

			<div class="charge-coin-table-wrap">
				<table class="charge-coin-table">
					<thead>
						<tr>
							<th class="col-no"><spring:message code="coin.no" /></th>
							<th class="col-amount"><spring:message code="coin.amount" /></th>
							<th class="col-date"><spring:message code="coin.regdate" /></th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list}">
								<tr class="empty-row">
									<td colspan="3"><spring:message code="common.listEmpty" /></td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="chargeCoin">
									<tr>
										<td class="text-center">${chargeCoin.historyNo}</td>
										<td class="text-right amount-text"><fmt:formatNumber
												value="${chargeCoin.amount}" type="number" /> P</td>
										<td class="text-center"><fmt:formatDate
												pattern="yyyy-MM-dd HH:mm" value="${chargeCoin.regDate}" />
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />


</body>
</html>