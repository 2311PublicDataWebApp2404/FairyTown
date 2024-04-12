<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			.hide {
				display: none;
			}
		</style>
	</head>
	<body>
		<h2>회원 정보 수정</h2>
		<form action="/user/modify.ft" method="post">
			<ul>
				<li>
					<label>이름 : </label>
					${user.realName }
				</li>
				<li>
					<label>아이디 : </label>
					${user.userId }
				</li>
				<li>
					<label>비밀번호 : </label>
					<input type="password" id="password" placeholder="Password" name="userPw">
					<div class="strongPassword-message hide">8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 사용하세요</div>
				</li>
				<li>
					<label>비밀번호 확인 : </label>
					<input type="password" id="password-retype" placeholder="Retype Password">
					<div class="mismatch-message hide">비밀번호가 일치하지 않습니다</div>
				</li>
				<li>
					<label>연락처 : </label>
					${user.userPhone }
				</li>
				<li>
					<label>우편번호</label>
					<input type="text" id="sample6_postcode" placeholder="우편번호" name="zipCode" value="${user.zipCode }">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<span id="guide" style="color:#999;display:none"></span>
				</li>
				<li>
					<label>주소</label>
					<input type="text" id="sample6_address" placeholder="도로명주소" name="userAddress" value="${user.userAddress }">
				</li>
				<li>
					<label>상세주소</label>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddress" value="${user.detailAddress }">
				</li>
				<li>
					<label>생년월일 : </label>
					${user.userDate }
				</li>
				<li>
					<label>이메일 : </label>
					${user.userEmail }
				</li>
			</ul>
			<input type="submit" value="적용하기" id="change-btn" disabled="disabled">
			<a href="/user/mypage.ft">취소</a>
		</form>
			
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
		    document.addEventListener("DOMContentLoaded", function() {
		        var userPw = document.getElementById('password');
		        var userPwRetype = document.getElementById('password-retype');
		        var changeBtn = document.getElementById('change-btn'); // 수정: 변수명 변경
		
		        function validateForm() {
		            var isValidUserPw = userPw.value.length >= 8 && /[a-zA-Z]/.test(userPw.value) && /\d/.test(userPw.value) && /[@$!%*#?&]/.test(userPw.value);
		            var isPwMatch = userPw.value === userPwRetype.value;
		
		            changeBtn.disabled = !(isValidUserPw && isPwMatch); // 수정: 변수명 변경
		        }
		
		        userPw.addEventListener('keyup', function() {
		            var strongPasswordMessage = document.querySelector('.strongPassword-message');
		            if(userPw.value.length >= 8 && /[a-zA-Z]/.test(userPw.value) && /\d/.test(userPw.value) && /[@$!%*#?&]/.test(userPw.value)) {
		                strongPasswordMessage.classList.add('hide');
		                validateForm()
		            } else {
		                strongPasswordMessage.classList.remove('hide');
		                validateForm()
		            }
		        });
		
		        userPwRetype.addEventListener('keyup', function() {
		            var mismatchMessage = document.querySelector('.mismatch-message');
		            if(userPw.value === userPwRetype.value) {
		                mismatchMessage.classList.add('hide');
		                validateForm()
		            } else {
		                mismatchMessage.classList.remove('hide');
		                validateForm()
		            }
		        });
		    });
		  //주소API
	        function sample6_execDaumPostcode() {
	            new daum.Postcode({
	                oncomplete: function(data) {
	                    // 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분.
	
	                    var addr = ''; // 주소 변수
	
	                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                        addr = data.roadAddress;
	                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                        addr = data.jibunAddress;
	                    }
	
	                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                    document.getElementById('sample6_postcode').value = data.zonecode;
	                    document.getElementById("sample6_address").value = addr;
	
	                    // 커서를 상세주소 필드로 이동한다.
	                    document.getElementById("sample6_detailAddress").focus();
	                }
	            }).open();
	        }
		</script>
	</body>
</html>