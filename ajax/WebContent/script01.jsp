<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<button type ="button" onclick="ajax()">ajax요청</button>
	<script>
	function ajax(){
	fetch("test.ajax",{method:'POST',headers:{
		//'Content-Type':'application/json'//json형식
		'Content-Type':'application/x-www-form-urlencoded'//폼형식
	},
	body:"id=kkk123&pw=1234" //문자열형식
	
	}).then(function(response){
		console.log(response);
		return response.text();
	}).then(function(text){
		console.log(text);
	})
	}
	</script>



</body>
</html>