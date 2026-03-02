<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

	<%-- 전체 레이아웃 컨테이너 --%>
	<div class="container board-register-wrap">
		<div class="card board-register-card">
			
			<%-- 헤더 영역 --%>
			<div class="board-head">
				<h2 class="board-title">
					<spring:message code="notice.header.read" />
				</h2>
			</div>

			<form:form modelAttribute="notice" id="notice">
				<form:hidden path="noticeNo" />

				<%-- 정보 출력 테이블 --%>
				<table class="board_table">
					<tr>
						<td class="col-label"><spring:message code="notice.title" /></td>
						<td>
							<form:input path="title" readonly="true" class="read-only-input" />
						</td>
					</tr>
					<tr>
						<td class="col-label"><spring:message code="notice.content" /></td>
						<td>
							<form:textarea path="content" readonly="true" class="read-only-text" />
						</td>
					</tr>
				</table>

				<%-- 버튼 --%>
				<div class="board-register-actions">
					<button type="button" id="btnList" class="btn">
						<spring:message code="action.list" />
					</button>

					<div class="admin-actions">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<button type="button" id="btnEdit" class="btn btn-primary">
								<spring:message code="action.edit" />
							</button>
							<button type="button" id="btnRemove" class="btn btn-table-remove">
								<spring:message code="action.remove" />
							</button>
						</sec:authorize>
					</div>
				</div>
			</form:form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			$("#btnEdit").on("click", function() {
				let noticeNo = $("#noticeNo").val();
				self.location = "/notice/modify?noticeNo=" + noticeNo;
			});

			$("#btnRemove").on("click", function() {
				if(confirm("<spring:message code='common.confirmDelete' />")) {
					let noticeNo = $("#noticeNo").val();
					self.location = "/notice/remove?noticeNo=" + noticeNo;
				}
			});

			$("#btnList").on("click", function() {
				self.location = "/notice/list"
			});
		});
	</script>
</body>
</html>