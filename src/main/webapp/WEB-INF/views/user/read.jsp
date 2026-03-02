<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Read</title>
    <link rel="stylesheet" href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" href="/css/user.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="container board-register-wrap">
        <div class="card board-register-card">
            
            <div class="board-head">
                <h2 class="board-title"><spring:message code="user.header.read" /></h2>
            </div>

            <form:form modelAttribute="member" id="member">
                <form:hidden path="userNo" />
                <table class="board_table"> <tr>
                        <td><spring:message code="user.userId" /></td>
                        <td><form:input path="userId" readonly="true" /></td>
                        <td><form:errors path="userId" cssClass="error-message" /></td>
                    </tr>
                    <tr>
                        <td><spring:message code="user.userPw" /></td>
                        <td><form:input path="userPw" readonly="true" /></td>
                        <td><form:errors path="userPw" cssClass="error-message" /></td>
                    </tr>
                    <tr>
                        <td><spring:message code="user.userName" /></td>
                        <td><form:input path="userName" readonly="true" /></td>
                        <td><form:errors path="userName" cssClass="error-message" /></td>
                    </tr>
                    <tr>
                        <td><spring:message code="user.job" /></td>
                        <td>
                            <form:select path="job" items="${jobList}" itemValue="value" itemLabel="label" disabled="true" />
                        </td>
                        <td><form:errors path="job" cssClass="error-message" /></td>
                    </tr>
                    
                    <tr>
                        <td><spring:message code="user.auth" /> - 1</td>
                        <td colspan="2">
                            <form:select path="authList[0].auth" disabled="true">
                                <form:option value="" label="=== 선택해 주세요 ====" />
                                <form:option value="ROLE_USER" label="사용자" />
                                <form:option value="ROLE_MEMBER" label="회원" />
                                <form:option value="ROLE_ADMIN" label="관리자" />
                            </form:select>
                        </td>
                    </tr>
                    <tr>
                        <td><spring:message code="user.auth" /> - 2</td>
                        <td colspan="2">
                            <form:select path="authList[1].auth" disabled="true">
                                <form:option value="" label="=== 선택해 주세요 ====" />
                                <form:option value="ROLE_USER" label="사용자" />
                                <form:option value="ROLE_MEMBER" label="회원" />
                                <form:option value="ROLE_ADMIN" label="관리자" />
                            </form:select>
                        </td>
                    </tr>
                    <tr>
                        <td><spring:message code="user.auth" /> - 3</td>
                        <td colspan="2">
                            <form:select path="authList[2].auth" disabled="true">
                                <form:option value="" label="=== 선택해 주세요 ====" />
                                <form:option value="ROLE_USER" label="사용자" />
                                <form:option value="ROLE_MEMBER" label="회원" />
                                <form:option value="ROLE_ADMIN" label="관리자" />
                            </form:select>
                        </td>
                    </tr>
                </table>
            </form:form>

            <div class="board-register-actions">
                <div class="admin-actions">
                    <button type="button" id="btnEdit" class="btn btn-primary"><spring:message code="action.edit" /></button>
                    <button type="button" id="btnRemove" class="btn" style="color: #ef4444; border-color: #fecaca;"><spring:message code="action.remove" /></button>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <button type="button" id="btnList" class="btn"><spring:message code="action.list" /></button>
                    </sec:authorize>
                </div>
            </div>

        </div>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        $(document).ready(function() {
            let formObj = $("#member");

            // 수정 페이지 이동
            $("#btnEdit").on("click", function() {
                formObj.attr("action", "/user/modify");
                formObj.attr("method", "get"); 
                formObj.submit();
            });

            // 삭제 처리
            $("#btnRemove").on("click", function() {
                if(confirm("정말 삭제하시겠습니까?")) {
                    formObj.attr("action", "/user/remove");
                    formObj.attr("method", "post");
                    formObj.submit();
                }
            });

            // 목록 이동
            $("#btnList").on("click", function() {
                self.location = "/user/list";
            });
        });
    </script>
</body>
</html>