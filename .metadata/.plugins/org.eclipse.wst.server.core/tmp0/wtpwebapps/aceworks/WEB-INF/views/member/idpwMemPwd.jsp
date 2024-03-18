<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form name="idpwMPwd" action="getMsg.do" method="post">
<table>
<tr>
	<th colspan="2">회원 비밀번호 찾기</th>
</tr>
<tr>
	<td>
		<input class="text" type="text" name="id" placeholder="ID" autocomplete="off" required>
	</td>
	<td>
		<input class="text" type="text" name="email" placeholder="Email" autocomplete="off" required>
	</td>
</tr>
<tr>
	<td>
		<input class="text" type="text" name="tel" placeholder="전화번호" autocomplete="off" required>
	</td>
	<td>
		<input class="text" type="text" name="hum_num" placeholder="주민번호" autocomplete="off" required>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input class="push1" type="submit" value="조회">
	</td>
</tr>
</table>
</form>