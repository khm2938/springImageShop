<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop</title>
<link rel="stylesheet" href="<c:url value='/css/common.css'/>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="container board-page">
		<div class="card board-card">
			<div class="user-list-head">
				<h2 class="board-title">
					<spring:message code="user.header.list" />
				</h2>
				<a href="/user/register" class="btn btn-primary">
					<spring:message code="action.new" />
				</a>
			</div>

			<div class="board-table-wrap">
				<table class="board-table">
					<thead>
						<tr>
							<th class="col-no"><spring:message code="user.no" /></th>
							<th class="col-userid"><spring:message code="user.userId" /></th>
							<th><spring:message code="user.userPw" /></th>
							<th class="col-center"><spring:message code="user.userName" /></th>
							<th class="col-center"><spring:message code="user.job" /></th>
							<th class="col-date"><spring:message code="user.regdate" /></th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td colspan="6" class="empty">
										<spring:message code="common.listEmpty" />
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="member">
									<tr>
										<td class="col-no">${member.userNo}</td>
										<td class="col-userid">
											<a href='/user/read?userNo=${member.userNo}' class="title-link">
												${member.userId}
											</a>
										</td>
										<td class="col-pw">${member.userPw}</td>
										<td class="col-center col-name">${member.userName}</td>
										<td class="col-center">${member.job}</td>
										<td class="col-date">
											<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${member.regDate}" />
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