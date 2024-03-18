<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>새로운 Div 겹쳐서 보여주기</title>
<style>
#overlay_div {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5); /* 배경에 투명도를 줄 수 있습니다. */
	color: white; /* 텍스트 색상을 지정합니다. */
	display: none; /* 기본적으로 숨깁니다. */
	z-index: 999; /* 다른 요소 위에 표시되도록 설정합니다. */
}
</style>
<script>
//새로운 div를 보여줍니다.
function showOverlay() {
    document.getElementById("overlay_div").style.display = "block";
}

// 새로운 div를 숨깁니다.
function hideOverlay() {
    document.getElementById("overlay_div").style.display = "none";
}

</script>
</head>
<body>
	<div id="existing_content" onclick="showOverlay()">
		<!-- 기존 내용 -->
		<p>기존 내용</p>
	</div>

	<!-- 새로운 div -->
	<div id="overlay_div" onclick="hideOverlay()">
		<p>새로운 내용</p>
	</div>

	<!-- JavaScript 파일 연결 -->
</body>
</html>