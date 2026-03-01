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
<link rel="stylesheet" href="<c:url value='/css/comment.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="comment-page">
		<div class="comment-card">
			<div class="comment-head">
				<h2 class="comment-title">
					<spring:message code="comment.header.list" arguments="${totalCount}"/>
				</h2>
			</div>

			<div class="comment-table-wrap">
				<table class="comment-table">
					<tbody>
						<c:forEach items="${list}" var="comment">
							<tr>
								<td class="col-no">${comment.commentNo}</td>
								<td class="col-commenter">${comment.commenter}</td>
								<td class="col-date"><fmt:formatDate
										pattern="yyyy-MM-dd HH:mm" value="${comment.regDate}" /></td>
							</tr>
							<tr>
								<td class="col-content">${comment.content}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="footer-card">
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
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