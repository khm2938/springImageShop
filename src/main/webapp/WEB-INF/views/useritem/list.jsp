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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="container useritem-page">
		<div class="card useritem-card">
			<div class="useritem-head">
				<h2 class="useritem-title">
					<spring:message code="useritem.header.list" />
				</h2>
			</div>
<input type="hidden" name="userItemNo" value="${useritem.userItemNo}" />
			<div class="useritem-table-wrap">
				<table class="useritem-table">
						<thead>
                    <tr>
                        <th class="col-no"><spring:message code="useritem.no" /></th>
                        <th class="col-name"><spring:message code="useritem.itemName" /></th>
                        <th class="col-price"><spring:message code="useritem.itemPrice" /></th>
                        <th class="col-date"><spring:message code="useritem.regdate" /></th>
                        <th class="col-download"><spring:message code="useritem.download" /></th>
                    </tr>
                </thead>
						<tbody>
                    <c:choose>
                        <c:when test="${empty list}">
                            <tr class="empty-row">
                                <td colspan="5"><spring:message code="common.listEmpty" /></td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${list}" var="useritem">
                                <tr>
                                    <td class="text-center">${useritem.userItemNo}</td>
                                    <td class="text-left">
                                        <a class="item-link" href="/useritem/read?userItemNo=${useritem.userItemNo}">
                                            ${useritem.itemName}
                                        </a>
                                    </td>
                                    <td class="text-right">
                                        <fmt:formatNumber value="${useritem.price}" type="number"/> P
                                    </td>
                                    <td class="text-center">
                                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${useritem.regDate}" />
                                    </td>
                                    <td class="text-center">
                                        <a href="/useritem/download?userItemNo=${useritem.userItemNo}" class="btn-download">
                                            DOWNLOAD
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
				</table>
			</div>
		</div>

	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

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