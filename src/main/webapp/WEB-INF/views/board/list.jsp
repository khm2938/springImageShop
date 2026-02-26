<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="<c:url value='/css/codegroup.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="board-page">
		<div class="board-card">
			<div class="board-head">
				<h2 class="board-title">
					<spring:message code="board.header.list" />
				</h2>

				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<a class="btn-primary" href="/board/register"> <spring:message
							code="action.new" />
					</a>
				</sec:authorize>
			</div>

			<div class="board-table-wrap">
				<table class="board-table">
					<thead>
						<tr>
							<th class="col-no" width="80"><spring:message code="board.no" /></th>
							<th class="col-title"><spring:message code="board.title" /></th>
							<th class="col-writer" width="140"><spring:message code="board.writer" /></th>
							<th class="col-date" width="190"><spring:message code="board.regdate" /></th>
						</tr>
					</thead>

					<tbody>
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td class="empty" colspan="4"><spring:message
											code="common.listEmpty" /></td>
								</tr>
							</c:when>

							<c:otherwise>
								<c:forEach items="${list}" var="board">
									<tr>
										<td class="col-no">${board.boardNo}</td>
										<td class="col-title"><a class="title-link"
											href="/board/read?boardNo=${board.boardNo}">
												${board.title} </a></td>
										<td class="col-writer">${board.writer}</td>
										<td class="col-date"><fmt:formatDate
												pattern="yyyy-MM-dd HH:mm" value="${board.regDate}" /></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>

		<div class="footer-card">
			<jsp:include page="/WEB-INF/views/common/footer.jsp" />
		</div>
	</div>

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