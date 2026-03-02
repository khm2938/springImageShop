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

	<div class="container board-register-wrap"> <div class="card board-register-card"> <h2 class="board-title">
				<spring:message code="notice.header.register" />
			</h2>

			<form:form id="notice" modelAttribute="notice" action="register" method="post">
				<table class="board_table"> <tr>
						<td><spring:message code="notice.title" /></td>
						<td>
							<form:input path="title" placeholder="제목을 입력하세요" />
							<form:errors path="title" cssClass="error-msg" />
						</td>
					</tr>
					<tr>
						<td><spring:message code="notice.content" /></td>
						<td>
							<form:textarea path="content" placeholder="내용을 입력하세요" />
							<form:errors path="content" cssClass="error-msg" />
						</td>
					</tr>
				</table>

				<div class="board-register-actions"> <sec:authorize access="hasRole('ROLE_ADMIN')">
						<button type="button" id="btnRegister" class="btn btn-primary">
							<spring:message code="action.register" />
						</button>
					</sec:authorize>

					<button type="button" id="btnList" class="btn">
						<spring:message code="action.list" />
					</button>
				</div>
				
				<sec:csrfInput />
			</form:form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			var formObj = $("#notice");
			$("#btnRegister").on("click", function() {
				formObj.submit();
			});

			$("#btnList").on("click", function() {
				self.location = "/notice/list";
			});
		});
	</script>
</body>
</html>