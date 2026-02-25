<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" 
uri="http://www.springframework.org/security/tags"%>

<div class="menu-bar">
  <div class="menu-inner">
    <div id="menu">
      <table>
        <tr>
       	  <td><a href="/"><spring:message code="header.home" /></a></td> 
          <!-- 회원가입메뉴 -->
          <!-- 로그인을 하지 않은 경우에 접근 가능한 메뉴 --> 
		  <sec:authorize access="!isAuthenticated()"> 
		       <td><a href="<c:url value='/user/register'/>"><spring:message code="header.joinMember" /></a></td>
		  </sec:authorize> 
		  
		  <!-- 인증된 사용자가 접근 가능한 메뉴(인가: 관리자, 회원, 매니저) --> 
		  <sec:authorize access="isAuthenticated()">
	 			<!-- 관리자 권한 메뉴 -->
	 			<sec:authorize access="hasRole('ROLE_ADMIN')">
	 				<!-- 코드그룹관리 메뉴 -->
          			<td><a href="<c:url value='/codegroup/list'/>"><spring:message code="menu.codegroup.list" /></a></td>
          			<!-- 코드관리 메뉴 -->
          			<td><a href="/codedetail/list"><spring:message code="menu.codedetail.list" /></a></td>
          			<!-- 회원관리 메뉴 -->
          			<td><a href="/user/list"><spring:message code="menu.user.admin" /></a></td>
	 			</sec:authorize>
	 			<!-- 회원 권한 메뉴 -->
	 			<sec:authorize access="hasRole('ROLE_MEMBER')">
	 			
	 			</sec:authorize>
	 			
	 		
				<!-- 로그인을 거친 인증된 사용자인 경우 사용자명을 보여주고 로그아웃 페이지로 이동할 수 있게 한다. -->
	
				<td width="180"><sec:authentication
						property="principal.username" /> 님 <a href="/auth/logout"> <spring:message
						code="header.logout" /></a></td>
		
		  </sec:authorize> 
        </tr>
      </table>
    </div>
  </div>
</div>