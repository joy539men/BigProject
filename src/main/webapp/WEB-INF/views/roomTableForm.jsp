<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- private Integer  roomId;
	private String   title;
	private Integer  price;
	private Blob     photos;
	private String   description;
	private Integer  guestMax;
	private Integer  roomNum;
	private Integer  bedNum;
	private Integer  bathroom;
	private String   status;
	private String   type;
	private String   address;
	private String   lon;
	private String   lat; -->
<body>
	<c:url var='roomTableForm' value='/roomTableFormPost' />
	<form:form method='POST' modelAttribute="roomTableBean" action="${roomTableForm}" enctype="multipart/form-data">
			<fieldset class="fieldset-auto-width">
				<legend>房間表單</legend>
				<table>
					<tr>
						<td align='right'>地址：<br>&nbsp;</td>
						<td width='280'>
							<form:input path="address" size="25"/><br>&nbsp;
					
						</td>
					</tr>
					<tr>
						<td align='right'>浴室<br>&nbsp;
						</td>
						<td><form:input type="number" path="bathroom" size="25" /><br>&nbsp;
						  
						</td>
					</tr>
					<tr>
						<td align='right'>房間：<br>&nbsp;
						</td>
						<td><form:input type= "number" path="bedNum" size="25" /><br>&nbsp;
						    
						</td>
					</tr>
					<tr>
						<td align='right'>描述<br>&nbsp;
						</td>
						<td><form:input path="description" size="30" /><br>&nbsp;
						    
						</td>
					<tr>
						<td colspan='2' align='center'>
						<input type='submit' value='提交'></td>
					</tr>
				</table>
			</fieldset>
		</form:form>


</body>
</html>