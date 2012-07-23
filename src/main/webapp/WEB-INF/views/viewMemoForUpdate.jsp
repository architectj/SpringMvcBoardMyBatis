<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html>
<head>

<script language="javascript">
    function writeCheck() 
    {
        var form = document.modifyform;

        if( !form.dbsubject.value )
        {
            alert( "������ �����ּ���" );
            form.dbsubject.focus();
            return;
        }
        if( !form.dbmemo.value )
        {
            alert( "������ �����ּ���" );
            form.dbmemo.focus();
            return;
        }

        form.submit();
    }
    
    function boardlist()
    {
        location.href = '/SpringMvcBoardMyBatis/listSpecificPageWork?current_page=${current_page}';
    }
</script> 

<title>�ۺ���</title>
</head>

<body>
viewMemoForUpdate!!! memo_id  <c:out value="${memo_id}"/> current_page <c:out value="${current_page}"/>
</body>

<%-- 
<form name=modifyform method=post action="/bbsModel2/listSpecificPageWork">
<table cellspacing = 0 cellpadding = 5 border = 1 width=500>
    
    <input type=hidden name=aid  value="${memo_id}">    
    <input type=hidden name=current_page  value="${current_page}">
    
    <tr><td><b>�̸� </b></td><td> <c:out value="${boardData.getName()}"/><input type=hidden name=dbname size=50  maxlength=30 value="${boardData.getName()}"> </td></tr>
    <tr><td><b>�̸��� </b></td><td> <input type=text name=dbemail size=50  maxlength=50 value="${boardData.getMail()}">  </td></tr>    
    <tr><td><b>���� </b></td><td><input type=text name=dbsubject size=50  maxlength=50 value="${boardData.getSubject()}"></td></tr>     
    <tr><td><b>���� </b></td><td><textarea name=dbmemo cols=50 rows=10><c:out value="${boardData.getMemo()}"/></textarea></td></tr>     
</table>
</form>
--%>

<c:url var="updateUrl" value="/DoUpdateBoard" />
<sf:form modelAttribute="boardData" method="POST" action="${updateUrl}">  
   
    <table width=400 border=1 cellspacing=0 cellpadding=5>
        
        <%-- modelAttribute �� �����͸� �ѱ�µ�, �߰����� ������ �ѱ�� ���ؼ� hidden field�� ����� --%>        
        <input type=hidden name="memo_id"  value="${memo_id}">    
        <input type=hidden name="current_page"  value="${current_page}">
        
        
        <tr>
            <td><b>�̸�</b></td>
            <%-- �̸��� read only ó��--%>
            <td><sf:input readonly="true" path="name" size="50" maxlength="50" /><br /> 
            <sf:errors  path="name" cssClass="error" /></td>
        </tr>
        <tr>
            <td><b>�̸���</b></td>
            <td><sf:input path="mail" size="50" maxlength="50"/><br /> 
            <sf:errors  path="mail" cssClass="error" /></td>
        </tr>
        <tr>
            <td><b>����</b></td>
            <td><sf:input path="subject" size="50" maxlength="50"/><br /> 
            <sf:errors  path="subject" cssClass="error" /></td>
        </tr>
        <tr>
            <td><b>����</b></td>
            <td><sf:textarea  path="memo" size="200" cssStyle="width:350px;height:100px;" maxlength="200"/><br /> 
            <sf:errors  path="memo" cssClass="error" /></td>
        </tr>
    </table>
    
    <table  cellspacing = 0 cellpadding = 0 border = 0 width=500>
        <tr>
            <td> <input type="submit" value="����" /> 
            <input type=button value="���" OnClick="javascript:boardlist()">
            </td>    
        </tr>
    </table>   

</sf:form>
 

</html>



