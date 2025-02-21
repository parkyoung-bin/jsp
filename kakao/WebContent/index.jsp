<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <form action="loginForm.user" name="loginForm" method="post">
        아이디:<input type="text" name="id"><br>
        비밀번호:<input type="password" name="pw"><br>

        <input type="hidden" name="email">
        <input type="hidden" name="name">

        <button type="submit" onclick = "login()">로그인</button>
        <button class="api-btn" onclick="kakaoLogout()">로그아웃</button>
        
    </form>
    <!-- 카카오로그인버튼 -->
    <a id="custom-login-btn" href="javascript:loginWithKakao()">
        <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" />
    </a>
    <script>
    function login() {

		if(document.reg_form.id.value == 0) {
			alert('아이디를 입력해주세요');
		return false; 
		
		}else if(document.reg_form.pw.value == 0){
			alert('비밀번호를 입력해주세요');	
			return false;
			
		}else{
			reg_form.submit();
		}
	}
    
        //1.카카오초기화
        Kakao.init('315fb5a2031fae3db4efeb50b2748701');
        console.log(Kakao.isInitialized());

        //2.카카오
        function loginWithKakao() {
            Kakao.Auth.loginForm({
                success: function (authObj) {
                    getInfo();//사용자 정보 요청 함수 호출
                },
                fail: function (err) {
                    alert('failed to login: ' + JSON.stringify(err))
                },
            })
        }
        //3.사용자 정보 넣기
        function getInfo() {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (res) {
                    console.log(res)
                    //다음코드로 id추출
                    var id = res.id;
                    //이메일
                    var email = res.kakao_account.email;
                    //이름
                    var name = res.kakao_account.profile.nickname;
                    //프로필사진
                    var profile_img = res.kakao_account.profile.profile_image_url;
                    console.log(id, email, name, profile_img)

                    //폼 요청 url변경
                    document.loginForm.action = "xxxx";
                    //폼 id의 value 변경
                    document.loginForm.id.value = id;
                    document.loginForm.email.value = email;
                    document.loginForm.name.value = name;
                    document.loginForm.submit();

                },
                fail: function (error) {
                    alert("사용자 요청 정보에 실패했습니다. 동의항목 확인하세요")
                },
            })
        } //4.로그아웃
        function kakaoLogout() {
            if (!Kakao.Auth.getAccessToken()) {
                alert('Not logged in.')
                return
            }
            Kakao.Auth.logout(function () {
                alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
            })
        }
    </script>
</body>
</html>