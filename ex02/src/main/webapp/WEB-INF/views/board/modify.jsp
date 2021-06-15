<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>

<div class="row">
	<div class="col-lg-12">
		<h1>Board Modify</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div>Board Modify Page</div>
		
		
		
		<div>
			<form action="/board/modify" method="post">
			
			<input type="hidden" id='pageNum' name='pageNum' value="<c:out value='${cri.pageNum }'/>">
			<input type="hidden" id='bno' name='amount' value="<c:out value='${cri.amount }'/>">
			
			<div class="form-group">
				<label>Bno</label> <input class="form-control namem" name="bno" value='<c:out value="${board.bno }"/>' readonly>
			</div>
			
			<div class="form-group">
				<label>Title</label> <input class="form-control" name="title" value='<c:out value="${board.title }"/>' >
			</div>
			
			<div class="form-group">
				<label>Text area</label> <textarea rows="3" class="form-control" name="content" ><c:out value="${board.content }"/></textarea>
			</div>
			
			<div class="form-group">
				<label>Writer</label> <input class="form-control" name="writer" value='<c:out value="${board.writer }"/>' readonly>
			</div>
			
			<div class="form-group">
				<label>RegDate</label> <input class="form-control" name='regdate' value='<fmt:formatDate pattern="yyyy/MM/dd" value = "${board.regdate}" />' readonly>
			</div>
			
			<div class="form-group">
				<label>Update Date</label> <input class="form-control" name='updateDate' value='<fmt:formatDate pattern="yyyy/MM/dd" value = "${board.updateDate}" />' readonly>
			</div>
			
			<button data-oper="modify" type="submit" class="btn btn-success">Modify</button>
			<button data-oper="remove" type="submit" class="btn btn-danger">Remove</button>
			<button data-oper="list" type="submit" class="btn btn-info">List</button>
			</form>
		</div>
		
	
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form");
	
	$("button").on("click", function(e) {
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		formObj.attr("method", "post");
		
		if(operation === 'remove'){
			formObj.attr("action", "/board/remove");
		} else if (operation === 'list'){
			formObj.attr("action", "/board/list").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			
		} else if (operation === 'modify') {
			console.log("modify");
			formObj.attr("action", "/board/modify");
		}
		
		formObj.submit();
	});
	
	
});

</script>


<%@include file="../includes/footer.jsp" %>