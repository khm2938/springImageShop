<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value='/css/common.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="board-page container">
		<div class="board-card card">
			<div class="board-head">
				<h2 class="board-title">
					<spring:message code="board.header.list" />
				</h2>
				<!-- 검색 폼 -->
				<form:form cssClass="board-search" modelAttribute="pgrq"
					method="get" action="/board/list${pgrq.toUriStringByPage()}">
					<form:select cssClass="board-search-select" path="searchType"
						items="${searchTypeCodeValueList}" itemValue="value"
						itemLabel="label" />
					<form:input cssClass="board-search-input" path="keyword" />
					<button class="board-search-btn" id='searchBtn'>
						<spring:message code="action.search" />
					</button>
				</form:form>

				
			</div>

			<div class="board-table-wrap">
				<table class="board-table">
					<thead>
						<tr>
							<th class="col-no" width="80"><spring:message
									code="board.no" /></th>
							<th class="col-title"><spring:message code="board.title" /></th>
							<th class="col-writer" width="140"><spring:message
									code="board.writer" /></th>
							<th class="col-date" width="190"><spring:message
									code="board.regdate" /></th>
						</tr>
					</thead>

					<tbody>
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td class="empty" colspan="4"><spring:message
											code="common.listEmpty" /></td>
								</tr>
							</c:when>

							<c:otherwise>
								<c:forEach items="${list}" var="board">
									<tr>
										<td class="col-no">${board.boardNo}</td>
										<!--  
										<td class="col-title"><a class="title-link" href="/board/read?boardNo=${board.boardNo}"> ${board.title} </a></td>
										<td class="col-title"><a class="title-link" href="/board/read?boardNo=${board.boardNo}
											?page=${pagination.pageRequest.page}
											&sizePerPage={pagination.pageRequest.sizePerPage}"> ${board.title} </a></td> -->

										<td class="col-title"><a class="title-link"
											href="/board/read
											${pgrq.toUriString(pgrq.page)}&boardNo=${board.boardNo}">
												${board.title} </a></td>
										<td class="col-writer">${board.writer}</td>
										<td class="col-date"><fmt:formatDate
												pattern="yyyy-MM-dd HH:mm" value="${board.regDate}" /></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="board-footer-row">
					<!-- 페이징 네비게이션 -->
					<div class="pagination">
						<c:if test="${empty pgrq.keyword}">
							<c:if test="${pagination.prev}">
								<!-- ?page=3&sizePerPage=10" -->
								<a class="page nav"
									href="/board/list${pagination.makeQuery(pagination.startPage - 1)}">&laquo;</a>
							</c:if>
							<c:forEach begin="${pagination.startPage }"
								end="${pagination.endPage }" var="idx">
								<c:if test="${pagination.pageRequest.page eq idx}">
									<a class="page active"
										href="/board/list${pagination.makeQuery(idx)}">[${idx}]</a>
								</c:if>
								<c:if test="${!(pagination.pageRequest.page eq idx)}">
									<a class="page active"
										href="/board/list${pagination.makeQuery(idx)}">${idx}</a>
								</c:if>
							</c:forEach>
							<c:if test="${pagination.next && pagination.endPage > 0}">
								<a class="page nav"
									href="/board/list${pagination.makeQuery(pagination.endPage +1)}">&raquo;</a>
							</c:if>
						</c:if>
					</div>
					<div class="board-list-actions">
						<button class="btn" type="button" id="btnList">
	                        <spring:message code="action.list" />
	                    </button>
	                    
	                	<sec:authorize access="hasRole('ROLE_MEMBER')">
							<button class="btn btn-primary" type="button" id="btnNew"> 
	                			<spring:message code="action.new" />
	            			</button>
						</sec:authorize>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-card card">
			<jsp:include page="/WEB-INF/views/common/footer.jsp" />
		</div>
	</div>

	<script>
    	$(document).ready(function() {
       	 	// 1. 목록 버튼 클릭 이벤트
        	$("#btnList").on("click", function() {
            self.location = "/board/list";
        	});

       		// 2. 신규 등록 버튼 클릭 이벤트
        	$("#btnNew").on("click", function() {
            self.location = "/board/register";
       		});

       		 // 3. 메시지 알림 처리 (SUCCESS/FAIL)
        	var result = "${msg}";
        	if (result === "SUCCESS") {
          	  alert("<spring:message code='common.processSuccess' />");
       		} else if (result === "FAIL") {
        	    alert("요청 처리 실패");
       		}
    });
</script>
</body>
</html>