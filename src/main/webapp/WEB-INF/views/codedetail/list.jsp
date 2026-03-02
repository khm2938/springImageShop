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
					<spring:message code="codedetail.header.list" />
				</h2>
				<a href="register" class="btn btn-primary">
					<spring:message code="action.new" />
				</a>
			</div>

			<div class="board-table-wrap">
				<table class="board-table codedetail-table">
					<thead>
						<tr>
							<th class="col-group"><spring:message code="codedetail.groupCode" /></th>
							<th class="col-val"><spring:message code="codedetail.codeValue" /></th>
							<th><spring:message code="codedetail.codeName" /></th>
							<th class="col-seq"><spring:message code="codedetail.sortSeq" /></th>
							<th class="col-date"><spring:message code="codedetail.regdate" /></th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td colspan="5" class="empty">
										<spring:message code="common.listEmpty" />
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="codeDetail">
									<tr>
										<td class="col-group">${codeDetail.groupCode}</td>
										<td class="col-val">${codeDetail.codeValue}</td>
										<td class="col-name">
											<a href="/codedetail/read?groupCode=${codeDetail.groupCode}&codeValue=${codeDetail.codeValue}" class="title-link">
												${codeDetail.codeName}
											</a>
										</td>
										<td class="col-seq">${codeDetail.sortSeq}</td>
										<td class="col-date">
											<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${codeDetail.regDate}" />
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