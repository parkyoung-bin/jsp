<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<button type ="button" onclick ="ajax()"> ajax요청</button>
	
	<script>
		function ajax(){
		fetch("list.ajax",{
			method:"post",
			headers:{
				//'Content-Type':'application/json'//json형식
				'Content-Type':'application/x-www-form-urlencoded'//폼형식
			},
			body : "num=1" //문자열 형식
		
		}).then(function(response){
			
			 return response.json();	 
		}).then(function(jsonData){
			console.log(jsonData);
		})
		}
	</script>
</body>
</html>