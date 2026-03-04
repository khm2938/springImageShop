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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<%-- 전체 레이아웃 컨테이너 --%>
	<div class="container item-wrap">
		<div class="card item-card">

			<%-- 헤더 영역 --%>
			<div class="item-head">
				<h2 class="item-title">
					<spring:message code="item.header.read" />
				</h2>
			</div>

			<%-- 폼 시작 (중복 제거 및 ID 설정) --%>
			<form:form modelAttribute="item" action="/item/buy" method="post" id="buyForm">
				<form:hidden path="itemId" />
				<form:hidden path="pictureUrl" />
				<form:hidden path="previewUrl" />
				
				<%-- 이미지 + 데이터 레이아웃 --%>
				<div class="item-content-layout">
					
					<%-- 왼쪽: 이미지 영역 --%>
					<img src="display?itemId=${item.itemId}" alt="상품 이미지" class="item-read-img">
					
					<%-- 오른쪽: 폼 데이터 영역 --%>
					<div class="item-form-data-wrap">
						
						<%-- 상품명 필드 --%>
						<div class="item-buy-field">
							<form:input path="itemName" readonly="true" />
							<form:errors path="itemName" cssClass="error-message" />
						</div>

						<%-- 가격 필드 --%>
						<div class="item-buy-field">
							<div class="price-input-unit">
								<form:input path="price" readonly="true" />
								<span class="price-unit-text">원</span>
							</div>
							<form:errors path="price" cssClass="error-message" />
						</div>
						
						<%-- 상품 설명 필드 --%>
						<div class="item-buy-field">
							<form:textarea path="description" readonly="true" rows="5" />
							<form:errors path="description" cssClass="error-message" />
						</div>

					</div>
				</div>

				<%-- 하단 버튼 영역 --%>
				<div class="item-actions">
					<button type="button" id="btnList" class="btn">
						<spring:message code="action.list" />
					</button>

					<div class="admin-actions">
						<sec:authorize access="hasRole('ROLE_MEMBER')">
							<button type="button" id="btnBuy" class="btn btn-primary">
								<spring:message code="action.buy" />
							</button>
						</sec:authorize>
					</div>
				</div>
			</form:form> <%-- 폼 종료 --%>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			// 폼 ID인 #buyForm을 정확히 찾아야 함
			let formObj = $("#buyForm");

			$("#btnBuy").on("click", function() {
				formObj.submit();
			});

			$("#btnList").on("click", function() {
				self.location = "/item/list";
			});
		});
	</script>
</body>
</html>