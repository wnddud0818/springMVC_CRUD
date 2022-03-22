<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<script> 
	$(document).ready(function(){
		var mode = '<c:out value="${mode}"/>';
		if ( mode == 'edit'){	//입력 폼 셋팅
				$("#id").prop('readonly', true);
				$("input:hidden[name='uid']").val(<c:out value="${userContent.uid}"/>);
				$("input:hidden[name='mode']").val('<c:out value="${mode}"/>');
				$("#id").val('<c:out value="${userContent.id}"/>');
				$("#name").val('<c:out value="${userContent.name}"/>');
				$("#pwd").val('<c:out value="${userContent.pwd}"/>');
				$("#email").val('<c:out value="${userContent.email}"/>');
				$("#grade").val('<c:out value="${userContent.grade}"/>');
				$("#tel").val('<c:out value="${userContent.tel}"/>');
				}
			});
			$(document).on('click', '#btnSignup', function(e){
		   	 if(document.getElementById('id').value==""){ //id값이 없을 경우
			 	 alert("아이디를 입력하세요");         //메세지 경고창을 띄운 후
		    	 document.getElementById('id').focus();     // id 텍스트박스에 커서를 위치
			     exit;}
		   	 else if(document.getElementById('name').value==""){
				 alert("이름을 입력하세요");
				 document.getElementById('name').focus();
				 exit;
				 }else if(document.getElementById('pwd').value==""){
				 alert("비밀번호를 입력하세요");
				 document.getElementById('pwd').focus();
				 exit;
			 }else if(document.getElementById('re_pwd').value==""){
				 alert("비밀번호확인을 입력하세요");
				 document.getElementById('re_pwd').focus(); 
				 exit;
			 }else if(document.getElementById('email').value==""){
				 alert("이메일을 입력하세요");
				 document.getElementById('email').focus(); 
				 exit;
			 }else if(document.getElementById('grade').value==""){
				 alert("직급을 입력하세요");
				 document.getElementById('grade').focus(); 
				 exit;
			 }else if(document.getElementById('tel').value==""){
				 alert("전화번호를 입력하세요");
				 document.getElementById('tel').focus();
				 exit;
			 }
			 if(pwd.value!=re_pwd.value){
			 //비밀번호와 비밀번호확인의 값이 다를 경우
			 
			 alert("입력한 2개의 비밀번호가 일치하지 않습니다.");
			 document.addjoin.pw.focus();
			 exit;
			 }
			 var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			 
			 if(exptext.test(document.getElementById('email').value)==false){
			 //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
			 alert("이메일형식이 올바르지 않습니다.");
			 document.getElementById('email').focus();
			 exit;
			 }
			 var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			 if(regPhone.test(document.getElementById('tel').value)==false){
			 alert("전화번호형식이 올바르지 않습니다.");
			 document.getElementById('tel').focus();
			 exit;
			 }
			 var regNumber = /[^0-9]/g;
			 if(regNumber.test(document.getElementById('tel').value)==true){
				 var tel = document.getElementById('tel').value;
				 phoneData = tel.replace(regNumber, "");
				 $('#tel').val(phoneData);
			 }
			 e.preventDefault(); $("#form").submit();
	});
// 	$(document).on('click', '#btnSignup', function(e){
// 			 e.preventDefault(); $("#form").submit();
// 		}); 
	$(document).on('click', '#btnCancel', function(e){ 
		e.preventDefault(); 
		$('#id').val(''); 
		$('#name').val('');
		$('#pwd').val(''); 
		$('#re_pwd').val('');
		$('#email').val('');
		$('#grade').val(''); 
		$('#tel').val(''); 
		location.href="${pageContext.request.contextPath}/user/getUserList"; 
		});
	</script>
	<article> 
		<div class="container col-md-6" role="main"> 
		<div class="card">
		<div class="card-header">회원정보</div> 
		<div class="card-body"> 
		<form:form name="form" id="form" class="form-signup" role="form" modelAttribute="userVO" method="post" action="${pageContext.request.contextPath}/user/insertUser">
		<form:hidden path="uid" />
		<input type="hidden" name="mode" />
		<div class="form-group row">
		<label for="id" class="col-md-3 col-form-label text-md-right">아이디</label>
		<div class="col-md-5"> 
		<form:input path="id" id="id" class="form-control" placeholder="아이디을 입력해 주세요" /> 
		</div> 
		</div>
		<div class="form-group row"> 
		<label for="name" class="col-md-3 col-form-label text-md-right">이름</label> 
		<div class="col-md-5"> 
		<form:input path="name" id="name" class="form-control" placeholder="이름을 입력해 주세요" /> 
		</div> 
		</div> 
		<div class="form-group row">
		<label for="pwd" class="col-md-3 col-form-label text-md-right">비밀번호</label> 
		<div class="col-md-5"> <form:password path="pwd" id="pwd" class="form-control" placeholder="비밀번호를 입력해 주세요" /> 
		</div> 
		</div> 
		<div class="form-group row"> 
		<label for="re_pwd" class="col-md-3 col-form-label text-md-right">비밀번호 확인</label> 
		<div class="col-md-5"> <form:password path="re_pwd" id="re_pwd" class="form-control" placeholder="비밀번호를 입력해 주세요" /> 
		</div> 
		</div> 
		<div class="form-group row"> <label for="email" class="col-md-3 col-form-label text-md-right">이메일</label> 
		<div class="input-group col-md-7"> 
		<div class="input-group-prepend"> 
		<span class="input-group-text">@</span> 
		</div> 
		<form:input path="email" id="email" class="form-control" placeholder="이메일을 입력해 주세요" />
		</div> 
		</div> 
		<div class="form-group row">
			<label for="id" class="col-md-3 col-form-label text-md-right">직급</label>
			<div class="col-md-5"> 
				<form:input path="grade" id="grade" class="form-control" placeholder="직급을 입력해 주세요" /> 
			</div> 
		</div>
		<div class="form-group row">
			<label for="id" class="col-md-3 col-form-label text-md-right">전화번호</label>
			<div class="col-md-5"> 
				<form:input path="tel" id="tel" class="form-control" placeholder="전화번호를 입력해 주세요" /> 
			</div> 
		</div>
		</form:form> 
		</div> 
		</div> 
		<div style="margin-top:10px"> 
		<button type="button" class="btn btn-sm btn-primary" id="btnSignup">저장</button>
		<button type="button" class="btn btn-sm btn-primary" id="btnCancel">취소</button> 
		</div>
		</div>
		</article>
		 