<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

    <div class="container board-page">
        <div class="card board-card">
            
            <div class="board-head">
                <h2 class="board-title">
                    <spring:message code="notice.header.list" />
                </h2>

                <div class="board-search">
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <a class="btn btn-primary" href="/notice/register"> 
                            <spring:message code="action.new" />
                        </a>
                    </sec:authorize>
                </div>
            </div>

            <div class="board-table-wrap"> <table class="board-table">
                    <thead>
                        <tr>
                            <th class="col-no"><spring:message code="notice.no" /></th>
                            <th class="col-title"><spring:message code="notice.title" /></th>
                            <th class="col-date"><spring:message code="notice.regdate" /></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty list}">
                                <tr>
                                    <td colspan="3" class="empty">
                                        <spring:message code="common.listEmpty" />
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${list}" var="notice">
                                    <tr>
                                        <td class="col-no">${notice.noticeNo}</td>
                                        <td class="col-title">
                                            <a href="/notice/read?noticeNo=${notice.noticeNo}" class="title-link">
                                                <c:out value="${notice.title}" />
                                            </a>
                                        </td>
                                        <td class="col-date">
                                            <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${notice.regDate}" />
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