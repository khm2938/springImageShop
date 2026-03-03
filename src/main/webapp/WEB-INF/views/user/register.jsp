<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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

	<div class="login-wrap">
		<div class="login-card">
			<div class="login-logo">
				<a class="brand" href="<c:url value='/'/>"> <span
					class="brand-mark">IS</span> <span class="brand-text">Image
						Shop</span>
				</a>
			</div>

			<h2 class="register-title">
				<spring:message code="user.header.register" />
			</h2>

			<form:form id="member" modelAttribute="member"
				action="/user/register" method="post" class="login-form">

				<div class="input-group">
					<form:input path="userId" class="input" placeholder="아이디" />
					<form:errors path="userId" cssClass="error-message" />
				</div>

				<div class="input-group">
					<form:password path="userPw" class="input" placeholder="비밀번호" />
					<form:errors path="userPw" cssClass="error-message" />
				</div>

				<div class="input-group">
					<form:input path="userName" class="input" placeholder="사용자명" />
					<form:errors path="userName" cssClass="error-message" />
				</div>

				<div class="job-group">
					<label class="job-label"> <spring:message code="user.job" />
					</label>
					<form:select path="job" class="input">
						<form:options items="${jobList}" itemValue="value"
							itemLabel="label" />
					</form:select>
					<form:errors path="job" cssClass="error-message" />
				</div>

				<button class="btn-login" type="button" id="btnRegister">
					<spring:message code="action.register" />
				</button>

				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button class="btn-login btn-list-alt" type="button" id="btnList">
						<spring:message code="action.list" />
					</button>
				</sec:authorize>

				<sec:csrfInput />
			</form:form>

			<div class="login-link-wrap">
				<a href="/auth/login" class="login-link"> 이미 계정이 있으신가요? 로그인하기 </a>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			var formObj = $("#member");

			$("#btnRegister").on("click", function() {
				formObj.submit(); 
			});

			$("#btnList").on("click", function() {
				self.location = "/user/list";
			});
		});
	</script>

</body>
</html>