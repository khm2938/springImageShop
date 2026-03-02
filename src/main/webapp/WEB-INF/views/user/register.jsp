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
<link rel="stylesheet" href="/css/user.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="login-wrap"> <div class="login-card"> <div class="login-logo">
                <a class="brand" href="<c:url value='/'/>"> 
                    <span class="brand-mark">IS</span> 
                    <span class="brand-text">Image Shop</span>
                </a>
            </div>

            <h2 style="text-align: center; margin-bottom: 25px; font-weight: 800; color: var(--title);">
                <spring:message code="user.header.register" />
            </h2>

            <form:form id="member" modelAttribute="member" action="/user/register" method="post" class="login-form">
                
                <div class="input-group" style="margin-bottom: 15px;">
                    <form:input path="userId" class="input" placeholder="아이디" />
                    <form:errors path="userId" cssStyle="color:#ef4444; font-size:12px; margin:5px 0 0 5px; display:block; font-weight:700;" />
                </div>

                <div class="input-group" style="margin-bottom: 15px;">
                    <form:password path="userPw" class="input" placeholder="비밀번호" />
                    <form:errors path="userPw" cssStyle="color:#ef4444; font-size:12px; margin:5px 0 0 5px; display:block; font-weight:700;" />
                </div>

                <div class="input-group" style="margin-bottom: 15px;">
                    <form:input path="userName" class="input" placeholder="사용자명" />
                    <form:errors path="userName" cssStyle="color:#ef4444; font-size:12px; margin:5px 0 0 5px; display:block; font-weight:700;" />
                </div>

                <div style="margin-bottom: 20px;">
                    <label style="font-size: 13px; font-weight: 800; color: var(--muted-2); margin-left: 5px; display: block; margin-bottom: 5px;">
                        <spring:message code="user.job" />
                    </label>
                    <form:select path="job" class="input">
                        <form:options items="${jobList}" itemValue="value" itemLabel="label" />
                    </form:select>
                    <form:errors path="job" cssStyle="color:#ef4444; font-size:12px; margin-top:5px; display:block;" />
                </div>

                <button class="btn-login" type="button" id="btnRegister" style="margin-bottom: 10px;">
                    <spring:message code="action.register" />
                </button>

                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <button class="btn-login" type="button" id="btnList" style="background: #fff; color: var(--primary); border: 1px solid var(--primary-bd);">
                        <spring:message code="action.list" />
                    </button>
                </sec:authorize>

                <sec:csrfInput />
            </form:form>

            <div style="text-align: center; margin-top: 20px;">
                <a href="/auth/login" style="font-size: 14px; color: var(--muted); text-decoration: none; font-weight: 700;">
                    이미 계정이 있으신가요? 로그인하기
                </a>
            </div>

        </div>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
    $(document).ready(function() { 
        var formObj = $("#member"); 
        
        $("#btnRegister").on("click", function() {  
            formObj.submit(); 
        }); 
        
        $("#btnList").on("click", function() {  
            self.location = "list"; 
        }); 
    }); 
    </script>
</body>
</html>