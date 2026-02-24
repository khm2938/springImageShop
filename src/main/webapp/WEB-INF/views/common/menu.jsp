<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="menu-bar">
  <div class="menu-inner">
    <div id="menu">
      <table>
        <tr>
          <!-- 회원가입메뉴 -->
          <td>
            <a href="<c:url value='/user/register'/>">
              <spring:message code="header.joinMember" />
            </a>
          </td>

          <!-- 코드그룹관리 메뉴 -->
          <td>
            <a href="<c:url value='/codegroup/list'/>">
              <spring:message code="menu.codegroup.list" />
            </a>
          </td>

          <!-- 코드관리 메뉴 -->
          <td>
            <a href="/codedetail/list">
              <spring:message code="menu.codedetail.list" />
            </a>
          </td>

          <!-- 회원관리 메뉴 -->
          <td>
            <a href="/user/list">
              <spring:message code="menu.user.admin" />
            </a>
          </td>
        </tr>
      </table>
    </div>
  </div>
</div>