<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Image Shop</title>

  <!-- 공통 CSS -->
  <link rel="stylesheet" href="<c:url value='/css/common.css'/>">
  <!-- 홈 전용 CSS (필요하면 사용) -->
  <link rel="stylesheet" href="<c:url value='/css/home.css'/>">
</head>

<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp" />


  <div class="home-container" align="center">
    <h1><spring:message code="common.homeWelcome" /></h1>
    <p>${serverTime}</p>
  </div>

  <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>