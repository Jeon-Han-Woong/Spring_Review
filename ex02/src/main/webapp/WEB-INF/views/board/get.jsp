<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>

<div class="row">
	<div class="col-lg-12">
		<h1>Board Read</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div>Board Read Page</div>
		
		<div>
			<div class="form-group">
				<label>Bno</label> <input class="form-control" name="bno" value='<c:out value="${board.bno }"/>' readonly>
			</div>
			
			<div class="form-group">
				<label>Title</label> <input class="form-control" name="title" value='<c:out value="${board.title }"/>' readonly>
			</div>
			
			<div class="form-group">
				<label>Text area</label> <textarea rows="3" class="form-control" name="content" readonly><c:out value="${board.title }"/></textarea>
			</div>
			
			<div class="form-group">
				<label>Writer</label> <input class="form-control" name="writer" value='<c:out value="${board.writer }"/>' readonly>
			</div>
			
			<button data-oper="modify" onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'" class="btn btn-success">Modify</button>
			<button data-oper="list" onclick="location.href='/board/list'" class="btn btn-info">List</button>
			
			<form id="operForm" action="/board/modify" method="get">
				<input type="hidden" id='bno' name='bno' value="<c:out value='${board.bno }'/>">
				<input type="hidden" id='pageNum' name='pageNum' value="<c:out value='${cri.pageNum }'/>">
				<input type="hidden" id='bno' name='amount' value="<c:out value='${cri.amount }'/>">
				<input type="hidden" id='keyword' name='keyword' value="<c:out value='${cri.keyword }'/>">
				<input type="hidden" id='type' name='type' value="<c:out value='${cri.type }'/>">
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	var operForm = $("#operForm");
	$('button[data-oper="modify"]').on("click", function (e) {
		operForm.attr("action", "/board/modify").submit();
		
	});
	
	$('button[data-oper="list"]').on("click", function (e) {
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/list");
		operForm.submit();
		
	});
})
</script>


<%@include file="../includes/footer.jsp" %>