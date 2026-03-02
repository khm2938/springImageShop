<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop</title>

<link rel="stylesheet" href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" href="/css/user.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />


	<div class="board-read-wrap">
		<div class="board-read-card">
			<h2 class="board-read-title">
				<spring:message code="board.header.read" />
			</h2>

		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="principal" />
			<sec:authentication property="principal.username" var="loginId" />
		</sec:authorize>

		<form:form modelAttribute="board">
			<form:hidden path="boardNo" />
			<!-- 현재 페이지 번호와 페이징 크기를 숨겨진 필드 요소를 사용하여 전달한다. -->
			<input type="hidden" id="page" name="page" value="${pgrq.page}">
			<input type="hidden" id="sizePerPage" name="sizePerPage"
				value="${pgrq.sizePerPage}">
			<table class="board_table">
				<tr>
					<td><spring:message code="board.title" /></td>
					<td><form:input path="title" readonly="true" /></td>
					<td><font color="red"><form:errors path="title" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="board.writer" /></td>
					<td><form:input path="writer" readonly="true" /></td>
					<td><font color="red"><form:errors path="writer" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="board.content" /></td>
					<td><form:textarea path="content" readonly="true" /></td>
					<td><font color="red"><form:errors path="content" /></font></td>
				</tr>
			</table>
		</form:form>

		<div class="board-read-actions">
			<!-- 사용자정보를 가져오기 -->
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="button" id="btnEdit">
					<spring:message code="action.edit" />
				</button>
				<button type="button" id="btnRemove">
					<spring:message code="action.remove" />
				</button>
			</sec:authorize>

			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<c:if test="${loginId eq board.writer}">
					<button type="button" id="btnEdit">
						<spring:message code="action.edit" />
					</button>
					<button type="button" id="btnRemove">
						<spring:message code="action.remove" />
					</button>
				</c:if>
			</sec:authorize>

			<button type="button" id="btnList">
				<spring:message code="action.list" />
			</button>
		</div>
		</div>
	</div>

	<c:if test="${not empty commentList}">
		<hr />
		<h3 class="comment-title">댓글</h3>
		<table class="comment-table">
			<tbody>
				<c:forEach items="${commentList}" var="c">
					<tr>
						<td class="col-commenter">${c.commenter}</td>
						<td class="col-date"><fmt:formatDate
								pattern="yyyy-MM-dd HH:mm" value="${c.regDate}" /></td>

						<td class="comment-actions">
							<!-- 삭제 버튼 (관리자 권한) --> 
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<form class="inline-form" action="<c:url value='/comment/remove'/>" method="post">
									<input type="hidden" name="commentNo" value="${c.commentNo}" />
									<input type="hidden" name="boardNo" value="${board.boardNo}" />
									<button type="submit" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
								</form>
							</sec:authorize> 
							<!-- 삭제 버튼 (작성자 권한) --> 
							<sec:authorize access="hasRole('ROLE_MEMBER') and !hasRole('ROLE_ADMIN')">
								<c:if test="${loginId == c.commenter}">
									<c:choose>
										<c:when test="${editCommentNo == c.commentNo}">
											<a href="<c:url value='/board/read?boardNo=${board.boardNo}'/>">취소</a>
										</c:when>
										<c:otherwise>
											<a href="<c:url value='/board/read?boardNo=${board.boardNo}&editCommentNo=${c.commentNo}'/>">수정</a>
										</c:otherwise>
									</c:choose>

								<form class="inline-form" action="<c:url value='/comment/remove'/>" method="post">
										<input type="hidden" name="commentNo" value="${c.commentNo}" />
										<input type="hidden" name="boardNo" value="${board.boardNo}" />
										<button type="submit"
											onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
									</form>

								</c:if>
							</sec:authorize>

						</td>
					</tr>

					<tr>
					<td class="col-content" colspan="3"><c:choose>
								<c:when test="${editCommentNo == c.commentNo}">
								<form class="comment-edit-form" action="<c:url value='/comment/modify'/>" method="post">
										<input type="hidden" name="boardNo" value="${board.boardNo}" />
										<input type="hidden" name="commentNo" value="${c.commentNo}" />
									<textarea class="comment-edit-text" name="content" rows="3" required>${c.content}</textarea>
										<button type="submit">저장</button>
									</form>
								</c:when>
								<c:otherwise>
                					${c.content}
              					</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>

	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')">
		<hr />
		<h3 class="comment-title">댓글 작성</h3>

		<form id="comment" action="<c:url value='/comment/register'/>"
			method="post">
			<input type="hidden" name="boardNo" value="${board.boardNo}" />

			<div class="comment-write-row">
				<div class="comment-writer">
					<input type="text" value="${loginId}" readonly />
				</div>
				<div class="comment-input">
					<textarea class="comment-write-text" name="content" rows="3" required></textarea>
				</div>
				<div class="comment-submit">
					<button type="submit" id="btnRegister">
						<spring:message code="action.register" />
					</button>
				</div>
			</div>
		</form>
	</sec:authorize>

	<sec:authorize access="!isAuthenticated()">
		<p>댓글을 작성하려면 로그인하세요.</p>
	</sec:authorize>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(
				function() {

					$("#btnList").on(
							"click",
							function() {
								let page = $("#page").val();
								let sizePerPage = $("#sizePerPage").val();
								self.location = "/board/list?page=" + page
										+ "&sizePerPage=" + sizePerPage;
							});

					$("#btnEdit").on(
							"click",
							function() {
								let boardNo = $("input[name='boardNo']").val();
								let page = $("#page").val();
								let sizePerPage = $("#sizePerPage").val();
								self.location = "/board/modify?boardNo="
										+ boardNo + "&page=" + page
										+ "&sizePerPage=" + sizePerPage;
							});

					$("#btnRemove").on(
							"click",
							function() {
								let boardNo = $("input[name='boardNo']").val();
								let page = $("#page").val();
								let sizePerPage = $("#sizePerPage").val();
								self.location = "/board/remove?boardNo="
										+ boardNo + "&page=" + page
										+ "&sizePerPage=" + sizePerPage;
							});

				});
	</script>
</body>
</html>