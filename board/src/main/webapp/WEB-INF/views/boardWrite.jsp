<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<title>직원용</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>

</head>
<body>

	<sec:authentication property="principal.username" var="username" />


	<div class="wrapper">
		<jsp:include page="boardTemplelet.jsp"></jsp:include>
		
		<div class="content table-responsive table-full-width">
			<form action="/board/post" method="POST">

				<table class="table table-striped">
					<tr>
						<td>&nbsp;</td>
						<td width="76">제목</td>
						<td><input name="subject" size="50" maxlength="100"
							class="form-control border-input"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td width="76">이름</td>
						<td><input name="writer" size="50" maxlength="50"
							value="${username}" class="form-control border-input"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td width="76">내용</td>
						<td><textarea id="editor1" name="content"
								style="width: 100%; height: 200px;"></textarea></td>
						<td>&nbsp;</td>
					</tr>
					<tr align="center">
						<td>&nbsp;</td>
						<td colspan="2"><input type="submit" value="등록" class="btn">
							<input type=button value="취소" class="btn"
							OnClick="window.location='/board'" />
						<td>&nbsp;</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		//<![CDATA[
		CKEDITOR.replace('editor1', {
			skin : 'moono-lisa'
		});
		//]]>
	</script>
</body>
</html>
