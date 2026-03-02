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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<%-- 전체 레이아웃 컨테이너 --%>
	<div class="container board-register-wrap">
		<div class="card board-register-card">

			<%-- 헤더 영역 --%>
			<div class="board-head">
				<h2 class="board-title">
					<spring:message code="item.header.register" />
				</h2>
			</div>

			<%-- 등록 폼 --%>
			<form:form modelAttribute="item" action="/item/register"
				enctype="multipart/form-data" method="post" id="item">
				<table class="board_table">
					<tr>
						<td><spring:message code="item.itemName" /></td>
						<td><form:input path="itemName" placeholder="상품명을 입력하세요" />
							<font color="red"><form:errors path="itemName" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="item.itemPrice" /></td>
						<td>
							<div class="input-price-unit">
								<form:input path="price" type="number" placeholder="가격을 입력하세요" />
								<span>원</span>
							</div> <font color="red"><form:errors path="price" /></font>
						</td>
					</tr>
					<tr>
						<td><spring:message code="item.itemFile" /></td>
						<td><input type="file" name="picture" /></td>
					</tr>
					<tr>
						<td><spring:message code="item.itemPreviewFile" /></td>
						<td><input type="file" name="preview" /></td>
					</tr>
					<tr>
						<td><spring:message code="item.itemDescription" /></td>
						<td><form:textarea path="description"
								placeholder="상품에 대한 설명을 입력해 주세요." /> <font color="red"><form:errors
									path="description" /></font></td>
					</tr>
				</table>

				<%-- 버튼 --%>
				<div class="board-register-actions">
					<button type="button" id="btnList" class="btn">
						<spring:message code="action.list" />
					</button>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<button type="button" id="btnRegister" class="btn btn-primary">
							<spring:message code="action.register" />
						</button>
					</sec:authorize>
				</div>
			</form:form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			var formObj = $("#item");
			$("#btnRegister").on("click", function() {
				formObj.submit();
			});

			$("#btnList").on("click", function() {
				self.location = "/item/list";
			});
		});
	</script>
</body>
</html>