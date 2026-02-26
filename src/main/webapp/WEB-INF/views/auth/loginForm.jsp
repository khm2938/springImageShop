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

			<form class="login-form" method="post" action="/login">
				<input class="input" type="text" name="username" placeholder="아이디">
				<input class="input" type="password" name="password"
					placeholder="비밀번호">

				<button class="btn-login" type="submit">로그인</button>

				<label class="remember-btn"> <input type="checkbox"
					name="remember-me"> <span>로그인 상태 유지</span>
				</label>

				<sec:csrfInput />
			</form>

		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />


</body>
</html>