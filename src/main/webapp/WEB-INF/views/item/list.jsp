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

	<div class="container board-page">
		<div class="card board-card">
			<div class="board-head">
				<h2 class="board-title">
					<spring:message code="item.header.list" />
				</h2>

				<div class="board-search">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a class="btn btn-primary" href="register"> <spring:message
								code="action.new" />
						</a>
					</sec:authorize>
				</div>
			</div>

			<div class="board-table-wrap">
				<table class="board-table">
					<thead>
						<tr>
							<th class="col-no"><spring:message code="item.itemId" /></th>
							<th class="col-title"><spring:message code="item.itemName" /></th>
							<th class="col-price"><spring:message code="item.itemPrice" /></th>

							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<th></th>
								<th></th>
							</sec:authorize>

							<sec:authorize
								access="hasRole('ROLE_MEMBER') and !hasRole('ROLE_ADMIN')">
								<th><spring:message code="item.read" /></th>
							</sec:authorize>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty itemList}">
								<tr>
									<c:set var="colCount" value="3" />
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<c:set var="colCount" value="5" />
									</sec:authorize>
									<sec:authorize
										access="hasRole('ROLE_MEMBER') and !hasRole('ROLE_ADMIN')">
										<c:set var="colCount" value="4" />
									</sec:authorize>

									<td colspan="${colCount}" class="empty"><spring:message
											code="common.listEmpty" /></td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${itemList}" var="item">
									<tr>
										<td class="col-no">${item.itemId}</td>
										<td class="col-title"><span class="item-name-text">${item.itemName}</span>
										</td>
										<td class="col-price"><fmt:formatNumber
												value="${item.price}" type="number" />원</td>

										<sec:authorize access="hasRole('ROLE_ADMIN')">
											<td class="col-action"><a
												href="modify?itemId=${item.itemId}"
												class="btn btn-table-action"> <spring:message
														code="item.edit" />
											</a></td>
											<td class="col-action"><a
												href="remove?itemId=${item.itemId}"
												class="btn btn-table-action btn-table-remove"> <spring:message
														code="item.remove" />
											</a></td>
										</sec:authorize>

										<sec:authorize
											access="hasRole('ROLE_MEMBER') and !hasRole('ROLE_ADMIN')">
											<td><a href="read?itemId=${item.itemId}"
												class="btn btn-primary btn-table-action"> <spring:message
														code="item.read" />
											</a></td>
										</sec:authorize>
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