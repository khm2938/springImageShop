<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
		<div class="card board-card comment-list-card">
			<div class="board-head">
				<h2 class="board-title">
					<spring:message code="comment.header.list" arguments="${totalCount}"/>
				</h2>
			</div>

			<div class="board-table-wrap">
				<table class="board-table comment-list-table">
					<tbody>
						<c:forEach items="${list}" var="comment">
							<tr class="comment-item-header">
								<td class="col-no">${comment.commentNo}</td>
								<td class="col-commenter">${comment.commenter}</td>
								<td class="col-date">
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${comment.regDate}" />
								</td>
							</tr>
							<tr class="comment-item-body">
								<td colspan="3" class="col-content">
									${comment.content}
								</td>
							</tr>
						</c:forEach>
						
						<c:if test="${empty list}">
							<tr>
								<td colspan="3" class="empty">등록된 댓글이 없습니다.</td>
							</tr>
						</c:if>
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