<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<button type ="button" onclick="ajax()">ajax��û</button>
	<script>
	function ajax(){
	fetch("test.ajax",{method:'POST',headers:{
		//'Content-Type':'application/json'//json����
		'Content-Type':'application/x-www-form-urlencoded'//������
	},
	body:"id=kkk123&pw=1234" //���ڿ�����
	
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