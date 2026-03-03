<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<nav id="menu" class="menu-nav">
	<a class="menu-link" href="/"><spring:message code="header.home" /></a>

	<!-- 비회원이 접근 가능한 메뉴 -->
	<sec:authorize access="!isAuthenticated()">
		<a class="menu-link" href="<c:url value='/user/register'/>"><spring:message code="header.joinMember" /></a>
		<a class="menu-link" href="/auth/login"><spring:message code="header.login" /></a>
		<a class="menu-link" href="/board/list">회원게시판 리스트</a>
		<a class="menu-link" href="/notice/list"><spring:message code="menu.notice.member" /></a>
		<a class="menu-link" href="/item/list"><spring:message code="item.header.list" /></a>
	</sec:authorize>

	<!-- 인증된 사용자가 접근 가능한 메뉴(인가: 관리자, 회원, 매니저) -->
	<sec:authorize access="isAuthenticated()">

		<!-- 관리자 권한 메뉴 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<a class="menu-link" href="<c:url value='/codegroup/list'/>"><spring:message code="menu.codegroup.list" /></a>
			<a class="menu-link" href="/codedetail/list"><spring:message code="menu.codedetail.list" /></a>
			<a class="menu-link" href="/user/list"><spring:message code="menu.user.admin" /></a>
			<a class="menu-link" href="/board/list">회원게시판 리스트</a>
			<a class="menu-link" href="/notice/list"><spring:message code="menu.notice.member" /></a>
			<a class="menu-link" href="/item/list"><spring:message code="item.header.list" /></a>
		</sec:authorize>

		<!-- 회원 권한 메뉴 -->
		<sec:authorize access="hasRole('ROLE_MEMBER')">
			<a class="menu-link" href="/board/register">회원게시판등록</a>
			<a class="menu-link" href="/board/list">회원게시판 리스트</a>
			<a class="menu-link" href="/notice/list"><spring:message code="menu.notice.member" /></a>
			<a class="menu-link" href="/item/list"><spring:message code="item.header.list" /></a>
			<!-- 코인 충전과 충전 내역 --> 
			<a class="menu-link" href="/coin/charge"><spring:message code="menu.coin.charge" /></a>
			<a class="menu-link" href="/coin/list"><spring:message code="menu.coin.list" /></a>
		</sec:authorize>

		<!-- 유저/로그아웃 (오른쪽에 붙이기) -->
		<span class="menu-user">
			<span class="menu-user-name"><sec:authentication property="principal.username" /> 님</span>
			<a class="menu-link" href="/auth/logout"><spring:message code="header.logout" /></a>
		</span>
	</sec:authorize>
</nav>