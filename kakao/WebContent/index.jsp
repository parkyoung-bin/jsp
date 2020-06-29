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
        ���̵�:<input type="text" name="id"><br>
        ��й�ȣ:<input type="password" name="pw"><br>

        <input type="hidden" name="email">
        <input type="hidden" name="name">

        <button type="submit" onclick = "login()">�α���</button>
        <button class="api-btn" onclick="kakaoLogout()">�α׾ƿ�</button>
        
    </form>
    <!-- īī���α��ι�ư -->
    <a id="custom-login-btn" href="javascript:loginWithKakao()">
        <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" />
    </a>
    <script>
    function login() {

		if(document.reg_form.id.value == 0) {
			alert('���̵� �Է����ּ���');
		return false; 
		
		}else if(document.reg_form.pw.value == 0){
			alert('��й�ȣ�� �Է����ּ���');	
			return false;
			
		}else{
			reg_form.submit();
		}
	}
    
        //1.īī���ʱ�ȭ
        Kakao.init('315fb5a2031fae3db4efeb50b2748701');
        console.log(Kakao.isInitialized());

        //2.īī��
        function loginWithKakao() {
            Kakao.Auth.loginForm({
                success: function (authObj) {
                    getInfo();//����� ���� ��û �Լ� ȣ��
                },
                fail: function (err) {
                    alert('failed to login: ' + JSON.stringify(err))
                },
            })
        }
        //3.����� ���� �ֱ�
        function getInfo() {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (res) {
                    console.log(res)
                    //�����ڵ�� id����
                    var id = res.id;
                    //�̸���
                    var email = res.kakao_account.email;
                    //�̸�
                    var name = res.kakao_account.profile.nickname;
                    //�����ʻ���
                    var profile_img = res.kakao_account.profile.profile_image_url;
                    console.log(id, email, name, profile_img)

                    //�� ��û url����
                    document.loginForm.action = "xxxx";
                    //�� id�� value ����
                    document.loginForm.id.value = id;
                    document.loginForm.email.value = email;
                    document.loginForm.name.value = name;
                    document.loginForm.submit();

                },
                fail: function (error) {
                    alert("����� ��û ������ �����߽��ϴ�. �����׸� Ȯ���ϼ���")
                },
            })
        } //4.�α׾ƿ�
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