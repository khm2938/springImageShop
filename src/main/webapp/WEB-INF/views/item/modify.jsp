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
					<spring:message code="item.header.modify" />
				</h2>
			</div>

			<form:form modelAttribute="item" action="/item/modify" enctype="multipart/form-data" method="post" id="item">
				<form:hidden path="itemId" />
				<form:hidden path="pictureUrl" />
				<form:hidden path="previewUrl" />

				<table class="board_table">
					<tr>
						<td><spring:message code="item.itemName" /></td>
						<td>
							<form:input path="itemName" />
							<font color="red"><form:errors path="itemName" /></font>
						</td>
					</tr>
					<tr>
						<td><spring:message code="item.itemPrice" /></td>
						<td>
							<div class="input-price-unit">
								<form:input path="price" type="number" />
								<span>원</span>
							</div>
							<font color="red"><form:errors path="price" /></font>
						</td>
					</tr>
					<tr>
						<td><spring:message code="item.picture" /></td>
						<td>
							<img src="/item/picture?itemId=${item.itemId}" width="210" class="img-preview">
							<input type="file" name="picture" />
						</td>
					</tr>
					<tr>
						<td><spring:message code="item.preview" /></td>
						<td>
							<img src="display?itemId=${item.itemId}" width="210" class="img-preview">
							<input type="file" name="preview" />
						</td>
					</tr>
					<tr>
						<td><spring:message code="item.itemDescription" /></td>
						<td>
							<form:textarea path="description" />
							<font color="red"><form:errors path="description" /></font>
						</td>
					</tr>
				</table>

				<div class="board-register-actions">
					<button type="button" id="btnList" class="btn">
						<spring:message code="action.list" />
					</button>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<button type="button" id="btnModify" class="btn btn-primary">
							<spring:message code="action.modify" />
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
			$("#btnModify").on("click", function() {
				formObj.submit();
			});

			$("#btnList").on("click", function() {
				self.location = "/item/list";
			});
		});
	</script>
</body>
</html>