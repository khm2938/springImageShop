<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Image Shop - 상세보기</title>
    <link rel="stylesheet" href="<c:url value='/css/common.css'/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="container board-page">
        
        <%-- 게시글 상세 카드 --%>
        <div class="board-read-wrap">
            <div class="card board-register-card">
                <div class="board-head">
                    <h2 class="board-title">
                        <spring:message code="board.header.read" />
                    </h2>
                </div>

                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal.username" var="loginId" />
                </sec:authorize>
				
                <form:form modelAttribute="board" id="boardForm">
                    <form:hidden path="boardNo" />
                    <input type="hidden" id="page" name="page" value="${pgrq.page}">
                    <input type="hidden" id="sizePerPage" name="sizePerPage" value="${pgrq.sizePerPage}">
                    
                    <table class="board_table">
                        <tr>
                            <td><spring:message code="board.title" /></td>
                            <td><form:input path="title" readonly="true" class="read-only-input" /></td>
                        </tr>
                        <tr>
                            <td><spring:message code="board.writer" /></td>
                            <td><form:input path="writer" readonly="true" class="read-only-input" /></td>
                        </tr>
                        <tr>
                            <td><spring:message code="board.content" /></td>
                            <td><form:textarea path="content" readonly="true" class="read-only-text" /></td>
                        </tr>
                    </table>
                </form:form>

                <div class="board-register-actions">
                    <button type="button" id="btnList" class="btn">
                        <spring:message code="action.list" />
                    </button>

                    <div class="admin-actions">
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <button type="button" id="btnEdit" class="btn btn-primary"><spring:message code="action.edit" /></button>
                            <button type="button" id="btnRemove" class="btn btn-remove-reply"><spring:message code="action.remove" /></button>
                        </sec:authorize>

                        <sec:authorize access="hasRole('ROLE_MEMBER') and !hasRole('ROLE_ADMIN')">
                            <c:if test="${loginId eq board.writer}">
                                <button type="button" id="btnEdit" class="btn btn-primary"><spring:message code="action.edit" /></button>
                                <button type="button" id="btnRemove" class="btn btn-remove-reply"><spring:message code="action.remove" /></button>
                            </c:if>
                        </sec:authorize>
                    </div>
                </div>
            </div>
        </div>

        <%-- 댓글 목록 영역 --%>
        <div class="comment-list-card card">
            <h3 class="comment-card-title">댓글 (${commentList.size()})</h3>
            
            <c:choose>
                <c:when test="${empty commentList}">
                    <div class="empty-comment-msg">첫 번째 댓글을 남겨보세요!</div>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${commentList}" var="c">
                        <div class="comment-item">
                            <div class="comment-header-flex">
                                <div class="comment-user-info">
                                    <span class="col-commenter">${c.commenter}</span>
                                    <span class="col-date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${c.regDate}" /></span>
                                </div>
                                <div class="comment-actions">
                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                                        <form action="<c:url value='/comment/remove'/>" method="post" style="display:inline;">
                                            <input type="hidden" name="commentNo" value="${c.commentNo}" />
                                            <input type="hidden" name="boardNo" value="${board.boardNo}" />
                                            <button type="submit" class="btn-remove-reply" onclick="return confirm('삭제하시겠습니까?');">삭제</button>
                                        </form>
                                    </sec:authorize>
                                    <sec:authorize access="hasRole('ROLE_MEMBER') and !hasRole('ROLE_ADMIN')">
                                        <c:if test="${loginId eq c.commenter}">
                                            <c:choose>
                                                <c:when test="${editCommentNo == c.commentNo}">
                                                    <button type="button" onclick="location.href='/board/read?boardNo=${board.boardNo}'">취소</button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="button" onclick="location.href='/board/read?boardNo=${board.boardNo}&editCommentNo=${c.commentNo}'">수정</button>
                                                </c:otherwise>
                                            </c:choose>
                                            <form action="<c:url value='/comment/remove'/>" method="post" style="display:inline;">
                                                <input type="hidden" name="commentNo" value="${c.commentNo}" />
                                                <input type="hidden" name="boardNo" value="${board.boardNo}" />
                                                <button type="submit" class="btn-remove-reply" onclick="return confirm('삭제하시겠습니까?');">삭제</button>
                                            </form>
                                        </c:if>
                                    </sec:authorize>
                                </div>
                            </div>
                            <div class="comment-body-content">
                                <c:choose>
                                    <c:when test="${editCommentNo == c.commentNo}">
                                        <form action="<c:url value='/comment/modify'/>" method="post" class="comment-edit-form">
                                            <input type="hidden" name="boardNo" value="${board.boardNo}" />
                                            <input type="hidden" name="commentNo" value="${c.commentNo}" />
                                            <textarea class="comment-write-text" name="content" required>${c.content}</textarea>
                                            <div class="comment-edit-actions">
                                                <button type="submit" class="btn btn-primary">저장</button>
                                            </div>
                                        </form>
                                    </c:when>
                                    <c:otherwise>${c.content}</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>

        <%-- 댓글 작성 영역 --%>
        <div class="comment-write-card card">
            <h3 class="comment-card-title">댓글 작성</h3>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')">
                <form id="commentForm" action="<c:url value='/comment/register'/>" method="post">
                    <input type="hidden" name="boardNo" value="${board.boardNo}" />
                    <div class="comment-write-row">
                        <div class="comment-writer-box">
                            <input type="text" value="${loginId}" readonly />
                        </div>
                        <div class="comment-input-box">
                            <textarea class="comment-write-text" name="content" placeholder="따뜻한 댓글을 남겨주세요." required></textarea>
                        </div>
                        <div class="comment-submit-box">
                            <button type="submit">등록</button>
                        </div>
                    </div>
                </form>
            </sec:authorize>
            <sec:authorize access="!isAuthenticated()">
                <div class="login-needed-msg">
                    댓글을 남기려면 <a href="/auth/login">로그인</a>이 필요합니다.
                </div>
            </sec:authorize>
        </div>

    </div> 

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        $(document).ready(function() {
            $("#btnList").on("click", function() {
                let page = $("#page").val();
                let sizePerPage = $("#sizePerPage").val();
                self.location = "/board/list?page=" + page + "&sizePerPage=" + sizePerPage;
            });

            $("#btnEdit").on("click", function() {
                let boardNo = $("input[name='boardNo']").val();
                let page = $("#page").val();
                let sizePerPage = $("#sizePerPage").val();
                self.location = "/board/modify?boardNo=" + boardNo + "&page=" + page + "&sizePerPage=" + sizePerPage;
            });

            $("#btnRemove").on("click", function() {
                if(confirm("정말 게시글을 삭제하시겠습니까?")) {
                    let boardNo = $("input[name='boardNo']").val();
                    let page = $("#page").val();
                    let sizePerPage = $("#sizePerPage").val();
                    self.location = "/board/remove?boardNo=" + boardNo + "&page=" + page + "&sizePerPage=" + sizePerPage;
                }
            });
        });
    </script>
</body>
</html>