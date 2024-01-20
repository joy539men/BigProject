<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='<spring:url value='/css/styles.css' />' type="text/css" />
<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 8pt;
}

.fieldset-auto-width {
	display: inline-block;
}
</style>
<meta charset="UTF-8">
<title>新增房間資料</title>
</head>
<body>

	<div align="center">
	    <c:url var='saveAction' value='/addRoomKrist' />
		<form:form method='POST' modelAttribute="roomTableBean" 
		        action="${saveAction}" enctype="multipart/form-data">
			<c:if test='${roomTableBean.roomId != null}'>
                 <form:hidden path="roomId" /><br>&nbsp;
			</c:if>
			<fieldset class="fieldset-auto-width">
				<legend>房間資料</legend>
				<table>
					<tr>
						<td align='right'>標題：<br>&nbsp;</td>
						<td width='280'><form:input path="title" size="25"/><br>&nbsp;
<%-- 							<form:errors path="name" cssClass="error" /> --%>
						</td>
					</tr>
					<tr>
						<td align='right'>類型：<br>&nbsp;</td>
						<td width='280'>
							<form:radiobutton path="type"  size="25" value="獨棟房源" label="獨棟房源"/>&nbsp;
							<form:radiobutton path="type"  size="25" value="獨立房間" label="獨立房間"/>&nbsp;
							<form:radiobutton path="type"  size="25" value="合住房間" label="合住房間"/>&nbsp;
							
<%-- 							<form:errors path="name" cssClass="error" /> --%>
						</td>
					</tr>
					<tr>
						<td align='right'>資訊：<br>&nbsp;</td>
						<td width='280'>
							房客<form:input path="guestMax" type="number" name="guestNum" value="0" style="width:100px" class="mx-auto"/><br>
							房間數<form:input path="roomNum" type="number" name="guestNum" value="0" style="width:100px" class="mx-auto"/><br>
							床位<form:input path="bedNum" type="number" name="guestNum" value="0" style="width:100px" class="mx-auto"/><br>
							衛浴<form:input path="bathroom" type="number" name="guestNum" value="0" style="width:100px" class="mx-auto"/><br>
							
<%-- 							<form:errors path="name" cssClass="error" /> --%>
						</td>
					</tr>
					
					<tr>
						<td align='right'>設施：<br>&nbsp;</td>
						<td width='280'>
							<c:forEach var="amenity" items="${amenities}">
        						<input type="checkbox" id="amenity-${amenity.amenityId}" name="amenityIds" value="${amenity.amenityId}">
        						<label for="amenity-${amenity.amenityId}">${amenity.amenityName}</label><br>
    						</c:forEach>
						</td>
					</tr>
					<tr>
						<td align='right'>測試：<br>&nbsp;</td>
						<td width='280'>
							
        						<form:input path="multipartFile" type='file'/>
    						
						</td>
					</tr>
					
					
					
<!-- 					<tr> -->
<!-- 						<td align='right'>設備：<br>&nbsp;</td> -->
<!-- 						<td width='280'> -->
<%-- 							<form:checkbox path="hobbies" value="Bird watching"/>&nbsp; --%>
<%-- 							<form:radiobutton path="type"  size="25" value="獨立房間" label="獨立房間"/>&nbsp; --%>
<%-- 							<form:radiobutton path="type"  size="25" value="合住房間" label="合住房間"/>&nbsp; --%>
							
<%-- <%-- 							<form:errors path="name" cssClass="error" /> --%> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 						<tr> -->
<!-- 						<td align='right'>安全及隱私措施：<br>&nbsp;</td> -->
<!-- 						<td width='280'> -->
<%-- 							<form:radiobutton path="type"  size="25" value="獨棟房源" label="獨棟房源"/>&nbsp; --%>
<%-- 							<form:radiobutton path="type"  size="25" value="獨立房間" label="獨立房間"/>&nbsp; --%>
<%-- 							<form:radiobutton path="type"  size="25" value="合住房間" label="合住房間"/>&nbsp; --%>
							
<%-- <%-- 							<form:errors path="name" cssClass="error" /> --%> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td align='right'>照片：<br>&nbsp;</td> -->
<%-- 						<td width='280'><form:input path="photos" size="25" type="file"/><br>&nbsp; --%>
<%-- 							<form:errors path="name" cssClass="error" /> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td align='right'>密碼：<br>&nbsp; -->
<!-- 						</td> -->
<%-- 						<td><form:input path="password" size="25" /><br>&nbsp; --%>
<%-- 						    <form:errors path="password" cssClass="error" /> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td align='right'>確認密碼：<br>&nbsp; -->
<!-- 						</td> -->
<%-- 						<td><form:input path="password1" size="25" /><br>&nbsp; --%>
<%-- 						    <form:errors path="password1" cssClass="error" /> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td align='right'>Email：<br>&nbsp; -->
<!-- 						</td> -->
<%-- 						<td><form:input path="email" size="30" /><br>&nbsp; --%>
<%-- 						    <form:errors path="email" cssClass="error" /> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td align='right'>生日<font size='-3' color='blue'>(yyyy-MM-dd)</font>：<br>&nbsp; -->
<!-- 						</td> -->
<%-- 						<td><form:input path="birthday" size="10" /><br>	&nbsp; --%>
<%-- 						    <form:errors path="birthday" cssClass="error" /> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td align='right'>最後發表時間<font size='-3' color='blue'>(yyyy-MM-dd -->
<!-- 								HH:mm:ss)</font>：<br>&nbsp; -->
<!-- 						</td> -->
<%-- 						<td><form:input path="lastPostTime" size="25" /><br>&nbsp; --%>
<%-- 							<form:errors path="lastPostTime" cssClass="error" /> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td align='right'>總付款金額：<br>&nbsp;</td> -->
<%-- 						<td><form:input path="totalPayment" size="10" /><br>&nbsp; --%>
<%-- 							<form:errors path="totalPayment" cssClass="error" /> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
					<tr>
						<td colspan='2' align='center'>
						<input type='submit' value='提交'></td>
					</tr>
				</table>
			</fieldset>
		</form:form>
<%-- 		<br> <a href="<c:url value='/_01_customer/index' />">回前頁</a> --%>
	</div>
</body>
</html>