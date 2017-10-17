<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
tbody,tr,th,td {
	border-style: groove;
	text-align: center;
}

.tdcolor {
	background-color: #f2f5f3;
	width: 10%;
}
input,textarea {
	width: 100%;
	height: 100%;
	border: 0;
}

input:focus,textarea:focus {
	outline: none;
}

</style>
<body>
	<sec:authentication property="principal.name" var="username" />
	<table width="100%">
		<tbody>
			<tr height="30">
				<td rowspan="2" width="550" align="center"><h1>출장완료확인서</h1></td>
				<td class="tdcolor">기안</td>
				<td class="tdcolor">결재</td>
				<td class="tdcolor">결재</td>
				<td class="tdcolor">결재</td>
			</tr>
			<tr>
				<td>${sign.name }</td>
				<td><c:if test="${user.department eq me.department and user.name ne me.username and sign.checkman1 eq null}">
						<input type="submit" value="결재" class="btn" />
						</c:if>
						<c:if test="${sign.checkman1 ne null }">${sign.checkman1 }</c:if>
						</td>
				<td><c:if test="${user.department eq me.department and user.name ne me.username and
									 sign.checkman1 ne null and sign.checkman1 ne me.username and sign.checkman2 eq null}">
						<input type="submit" value="결재" class="btn" />
						</c:if>
						<c:if test="${sign.checkman2 ne null }">${sign.checkman2 }</c:if>
						</td>
				<td><c:if test="${user.department eq me.department and user.name ne me.username and checkman2 ne null and 
									sign.checkman1 ne me.username and sign.checkman2 ne me.username and sign.checkman3 eq null}">
						<input type="submit" value="결재" class="btn" />
						</c:if>
						<c:if test="${sign.checkman3 ne null }">${sign.checkman3 }</c:if>
						</td>
			</tr>
		</tbody>
	</table>
	<div></div>
	<table width="100%">
		<tr>
			<td class="tdcolor">부서</td>
			<td width="40%">
			<c:choose>
				<c:when test="${user.username eq username and sign.checkno eq 1}">
					${user.dep_name }
					<input type="hidden" name="department" value="${user.department }" />
				</c:when>
				<c:when test="${user.username ne username}">
				${user.dep_name}
				</c:when>
			</c:choose>
				</td>
			<td class="tdcolor">이름</td>
			<td width="40%">
			<c:choose>
				<c:when test="${user.username eq username and sign.checkno eq 1}">
					<input type="text" name="name" value="${user.username }" />
				</c:when>
				<c:when test="${user.username ne username }">
				${user.name}
				</c:when>
			</c:choose>
			</td>
		</tr>
		<tr>
			<td class="tdcolor">직급</td>
			<td width="40%">
			<c:choose>
<%-- 				<c:when test="${user.username eq username }">
					<input type="text" name="job_name" value="${user.job_name }" />
				</c:when> --%>
				<c:when test="${user.username ne username }">
				${user.job_name}
				</c:when>
			</c:choose>			
</td>
			<td class="tdcolor">기간</td>
			<td width="40%">
			<c:choose>
				<c:when test="${user.username eq username and sign.checkno eq 1}">
					<input type="date" name="reg_date" value="${sign.reg_date }" />
				</c:when>
				<c:when test="${user.username ne username }">
				${sign.reg_date}
				</c:when>
			</c:choose>
			</td>
		</tr>
		<tr>
			<td class="tdcolor">프로젝트</td>
			
			<td width="90%" colspan=3>
			<c:choose>
				<c:when test="${user.username eq username and sign.checkno eq 1}">
				</c:when>
				<c:when test="${user.username ne username }">
				${sign.signcontent}
				</c:when>
			</c:choose>
				</td>
		</tr>
		<tr>
			<c:choose>
			<c:when test="${user.username eq username and sign.checkno eq 1}">
			<td class="tdcolor">내용</td>
			<td width="90%" colspan=3>
				<textarea type="text" rows="20" name="signcontent"></textarea>
			</td>
			</c:when>
			<c:when test="${user.username ne username }">
				<td colspan=4 height="500" align="center">${sign.signcontent}</td>
			</c:when>
			</c:choose>
		</tr>
	</table>

	<table height="250" width="100%">
		<tr>
			<td align="center" valign="bottom"><h2>
					상기 사항은 틀림없음을 확인합니다.<br /> ${sign.reg_date} <br />GVM.ltd
					<h2></td>
		</tr>
	</table>
</body>
</html>