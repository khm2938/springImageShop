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

	<div class="container listPay-page">
		<div class="card listPay-card">
			<div class="listPay-head">
				<h2 class="listPay-title">
					<spring:message code="coin.header.listPay" />
				</h2>
			</div>

			<div class="listPay-table-wrap">
				<table class="listPay-table">
					<tr>
						<th align="center" width="80"><spring:message code="coin.no" /></th>
						<th align="center" width="120"><spring:message code="coin.itemName" /></th>
						<th align="right" width="120"><spring:message code="coin.payAmount" /></th>
						<th align="center" width="180"><spring:message code="coin.regdate" /></th>
					</tr>
					<c:choose>
						<c:when test="${empty list}">
							<tr class="empty-row">
								<td colspan="4"><spring:message code="common.listEmpty" />
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="payCoin">
								<tr>
                                    <td align="center">${payCoin.historyNo}</td>
                                    <td>${payCoin.itemName}</td>
                                    <td><fmt:formatNumber value="${payCoin.amount}" type="number"/> 원 </td>
                                    <td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${payCoin.regDate}" /></td>
                                </tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>

	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		var result = "${msg}";
		if (result === "SUCCESS") {
			alert("<spring:message code='common.processSuccess' />");
		} else if (result === "FAIL") {
			alert("요청처리 실패");
		}
	</script>
</body>
</html>