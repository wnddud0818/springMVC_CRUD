<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<script> 
	//삭제 버튼 클릭 이벤트
	$(document).on('click', '#btnDelete', function(){
    var url = "${pageContext.request.contextPath}/user/deleteUser";
    url = url + "?uid=" + ${userContent.uid};
		location.href = url;
	});
	$(document).on('click', '#btnList', function(){
		location.href = "${pageContext.request.contextPath}/User/getUserList";
	});
	$(document).on('click', '#btnSignup', function(e){
		e.preventDefault(); $("#form").submit();
		}); 
	$(document).on('click', '#btnCancle', function(e){ 
		e.preventDefault(); 
		$('#id').val(''); 
		$('#name').val('');
		$('#pwd1').val(''); 
		$('#pwd2').val('');
		$('#email').val('');
		$('#grade').val(''); 
		$('#tel').val(''); 
		location.href="${pageContext.request.contextPath}/user/getUserList"; 
		});
	$(document).on('click', '#btnUpdate', function(){
		var url = "${pageContext.request.contextPath}/user/editForm";
		url = url + "?uid="+${userContent.uid};
		url = url + "&mode=edit";
		location.href = url;
	});
	
	</script>
	<article> 
		<div class="container col-md-6" role="main"> 
		<div class="card">
		<div class="card-header">회원정보</div> 
		<div class="card-body"> 
		<form:form name="form" id="form" class="form-signup" role="form" modelAttribute="userVO" method="post" action="${pageContext.request.contextPath}/user/getUserContent">
		<div class="form-group row">
			<label for="id" class="col-md-3 col-form-label text-md-right">아이디</label>
			<div class="col-md-5"> 
			<input class="form-control" type="text" value="${userContent.id}" aria-label="Disabled input example" disabled readonly>
			</div> 
		</div>
		<div class="form-group row"> 
			<label for="name" class="col-md-3 col-form-label text-md-right">이름</label> 
			<div class="col-md-5"> 
			<input class="form-control" type="text" value="${userContent.name}" aria-label="Disabled input example" disabled readonly>
			</div> 
		</div> 
		<div class="form-group row">
			<label for="pwd" class="col-md-3 col-form-label text-md-right">비밀번호</label> 
			<div class="col-md-5"> 
			<input class="form-control" type="text" value="${userContent.pwd}" aria-label="Disabled input example" disabled readonly>
			</div> 
		</div>  
		<div class="form-group row"> <label for="email" class="col-md-3 col-form-label text-md-right">이메일</label> 
			<div class="input-group col-md-7"> 
			<input class="form-control" type="text" value="${userContent.email}" aria-label="Disabled input example" disabled readonly>
			</div> 
		</div> 
		<div class="form-group row">
			<label for="id" class="col-md-3 col-form-label text-md-right">직급</label>
			<div class="col-md-5"> 
			<input class="form-control" type="text" value="${userContent.grade}" aria-label="Disabled input example" disabled readonly>
			</div> 
		</div>
		<div class="form-group row">
			<label for="id" class="col-md-3 col-form-label text-md-right">전화번호</label>
			<div class="col-md-5"> 
			<input class="form-control" type="text" value="${userContent.tel}" aria-label="Disabled input example" disabled readonly>
			</div> 
		</div>
		</form:form> 
		</div> 
		</div>
		<div style="margin-top:10px"> 
		<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
		<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
		</div>
		</div>
		</article>