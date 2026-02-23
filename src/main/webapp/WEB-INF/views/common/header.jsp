<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<header class="site-header">
  <div class="header-inner">
    <!-- 왼쪽: 로고/브랜드 -->
    <a class="brand" href="<c:url value='/'/>">
      <span class="brand-mark">IS</span>
      <span class="brand-text">Image Shop</span>
    </a>

    <!-- 가운데: 메뉴 -->
    <nav class="nav">
      <a class="nav-link" href="<c:url value='/user/register'/>">
        <spring:message code="header.joinMember" />
      </a>
      <a class="nav-link" href="<c:url value='/codegroup/list'/>">
        <spring:message code="menu.codegroup.list" />
      </a>
    </nav>

    <!-- 오른쪽: 유저 영역(지금은 데모) -->
    <div class="nav-right">
      <span class="chip">v1</span>
    </div>
  </div>
</header>