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

	<div class="container board-register-wrap">
		<div class="card board-register-card">
			
			<div class="board-head">
				<h2 class="board-title">
					<spring:message code="user.header.modify" />
				</h2>
			</div>

			<form:form modelAttribute="member" id="member" action="/user/modify2" method="post">
				<form:hidden path="userNo" />
				<%-- 아이디는 수정 불가능하지만 데이터 전송을 위해 hidden으로 유지 --%>
				<form:hidden path="userId" />
				
				<table class="board_table">
					<tr>
						<td class="col-label"><spring:message code="user.userId" /></td>
						<td>
							<form:input path="userId" disabled="true" class="read-only-input" />
						</td>
					</tr>
					<tr>
						<td class="col-label"><spring:message code="user.userName" /></td>
						<td>
							<form:input path="userName" placeholder="이름을 입력하세요" />
							<%-- 에러 발생 시 붉은색 메시지 출력 --%>
							<form:errors path="userName" cssClass="error-message" />
						</td>
					</tr>
					<tr>
						<td class="col-label"><spring:message code="user.job" /></td>
						<td>
							<form:select path="job" items="${jobList}" itemValue="value" itemLabel="label" />
							<form:errors path="job" cssClass="error-message" />
						</td>
					</tr>

					<%-- 권한 설정 영역 --%>
					<tr>
						<td class="col-label"><spring:message code="user.auth" /> - 1</td>
						<td>
							<form:select path="authList[0].auth">
								<form:option value="" label="=== 선택해 주세요 ====" />
								<form:option value="ROLE_USER" label="사용자" />
								<form:option value="ROLE_MEMBER" label="회원" />
								<form:option value="ROLE_ADMIN" label="관리자" />
							</form:select>
						</td>
					</tr>
					<tr>
						<td class="col-label"><spring:message code="user.auth" /> - 2</td>
						<td>
							<form:select path="authList[1].auth">
								<form:option value="" label="=== 선택해 주세요 ====" />
								<form:option value="ROLE_USER" label="사용자" />
								<form:option value="ROLE_MEMBER" label="회원" />
								<form:option value="ROLE_ADMIN" label="관리자" />
							</form:select>
						</td>
					</tr>
					<tr>
						<td class="col-label"><spring:message code="user.auth" /> - 3</td>
						<td>
							<form:select path="authList[2].auth">
								<form:option value="" label="=== 선택해 주세요 ====" />
								<form:option value="ROLE_USER" label="사용자" />
								<form:option value="ROLE_MEMBER" label="회원" />
								<form:option value="ROLE_ADMIN" label="관리자" />
							</form:select>
						</td>
					</tr>
				</table>

				<div class="board-register-actions">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<button type="button" id="btnList" class="btn">
							<spring:message code="action.list" />
						</button>
					</sec:authorize>
					
					<div class="admin-actions">
						<button type="button" id="btnModify" class="btn btn-primary">
							<spring:message code="action.modify" />
						</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("#member");

			$("#btnModify").on("click", function() {
				formObj.submit();
			});

			$("#btnList").on("click", function() {
				self.location = "/user/list";
			});
		});
	</script>
</body>
</html>