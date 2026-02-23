<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div id="menu" align="right">
  <table>
    <tr>
      <td width="80">
        <a href="<c:url value='/user/register'/>">
          <spring:message code="header.joinMember" />
        </a>
      </td>
      <td width="120">
        <a href="<c:url value='/codegroup/list'/>">
          <spring:message code="menu.codegroup.list" />
        </a>
      </td>
    </tr>
  </table>
</div>
<hr/>