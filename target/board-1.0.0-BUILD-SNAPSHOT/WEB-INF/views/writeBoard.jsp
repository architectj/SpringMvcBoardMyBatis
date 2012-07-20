
<%@ page language="java" import="java.util.*, java.sql.*, javax.servlet.http.*" 
contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.io.*, java.text.*" %>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<script language="javascript">
    function writeCheck() {    	
    	alert("writeCheck");    	
        var form = document.getElementById('writeform');
        <%--�� submit�� �ȵ���?? --%>
        form.submit();    
    }
</script>


<title>�Խ��� �۾���</title>
</head>
    
<c:url var="insertUrl" value="/DoWriteBoard" />

<sf:form modelAttribute="boardBeanObjToWrite" method="POST" action="${insertUrl}">  
   
	<table width=400 border=1 cellspacing=0 cellpadding=5>
		<tr>
			<td><b>�̸�</b></td>
			<td><sf:input path="name" size="50" maxlength="50"/><br /> 
			<sf:errors	path="name" cssClass="error" /></td>
		</tr>
		<tr>
			<td><b>�̸���</b></td>
			<td><sf:input path="mail" size="50" maxlength="50"/><br /> 
			<sf:errors	path="mail" cssClass="error" /></td>
		</tr>
		<tr>
			<td><b>����</b></td>
			<td><sf:input path="subject" size="50" maxlength="50"/><br /> 
			<sf:errors	path="subject" cssClass="error" /></td>
		</tr>
		<tr>
			<td><b>����</b></td>
			<td><sf:textarea  path="memo" size="200" cssStyle="width:350px;height:100px;" maxlength="200"/><br /> 
			<sf:errors	path="memo" cssClass="error" /></td>
		</tr>

		<tr>			
			<td>
			<%-- <input type="submit" value="���" /> --%>
			<%-- <input type=button value="���" OnClick="javascript:writeCheck();"> --%>
			<input type="submit" value="���" />			
			</td>			
		</tr>
	</table>

</sf:form>


    
      

