<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<%@ page session="false" %>

<%@ page import="kojh.db.beans.BoardBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Properties"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="kojh.spring.board.PageNumberingManager"%>

<html>
<head>
<title>���</title>
</head>

<%--
<c:set var="list" value="${boardList}" /> 
--%>

<c:set var="current_page" value="${current_page}" />
<c:set var="total_cnt" value="${totalCnt}" />

<%  
    //ArrayList<BoardBean> list = (ArrayList<BoardBean>) pageContext.getAttribute("list") ; //jstl in code
    int c_page = Integer.parseInt( (String)  (pageContext.getAttribute("current_page") ))  ;
    //String str_c_page = (String)pageContext.getAttribute("current_page");    
    int total_cnt = ((Integer)(pageContext.getAttribute("total_cnt"))).intValue()  ;            
%>



<table cellspacing=1 width=700 border=0>
    <tr>
        <td>�� �Խù���: <c:out value="${totalCnt}"/></td>
        <td><p align=right> ������:<c:out value="${current_page}"/> 
        </td>
    </tr>
</table>

<table cellspacing=1 width=700 border=1>
    <tr>
        <td width=50><p align=center>��ȣ</p>
        </td>
        <td width=100><p align=center>�̸�</p>
        </td>
        <td width=320><p align=center>����</p>
        </td>
        <td width=100><p align=center>�����</p>
        </td>
        <td width=100><p align=center>��ȸ��</p>
        </td>
    </tr>
   
    <c:forEach var="board" items="${boardList}">
        <tr>
        <td width=50><p align=center>${board.getId()}</p></td>
        <td width=100><p align=center>${board.getName()}</p></td>                
        <td width=320>
            <p align=center>
                <a href="/SpringMvcBoardMyBatis/viewWork?memo_id=${board.getId()}&current_page=<c:out value="${current_page}"/>" title="${board.getMemo()}"><c:out value="${board.getSubject()}"/>
            </p>
        </td>                      
        <td width=100><p align=center><c:out value="${board.getCreated_date()}"/></p></td>
        <td width=100><p align=center><c:out value="${board.getHits()}"/></p></td>
    </tr>
    </c:forEach>
    
    
    
    <%-- ������ ������ ó���ϴ� �κе� ������ Ŭ�������� ó���Ҽ��� �ְڴ�.. PageNumberingManager --%>

    <%              
        int rowsPerPage = 2;
        
        ///////////////////////////////////////////////////////////////
        //��ü ������
        int total_pages = PageNumberingManager.getInstance().getTotalPage(total_cnt, rowsPerPage) ;
                
        ///////////////////////////////////////////////////////////////
        //��ü ��        
        
        // http://blog.naver.com/20klop/40004319618
        /////////////////////////////////////////////////////////////
        //context-param ��� => web.xml�� ����� ���� ��ȸ
        
        //ServletContext ctx = getServletContext();
        
        int block_num = 2;
        //paramValue = ctx.getInitParameter("block_num") ; 
        //System.out.print("paramValue: " + paramValue);
        //int block_num = Integer.parseInt(paramValue);
        
        /////////////////////////////////////////////////////////////
                        
        
        int total_blocks = total_pages / block_num;

        if (total_pages % block_num != 0) // 3%2 = 1
        {
            System.out.print("total_blocks++!\n");
            total_blocks++;
        }
        
        System.out.print("total_blocks="+total_blocks);
        //int c_block = c_page / block_num;

        //if (c_page % block_num != 0)
        //{
        //    c_block++;
        //}        
    %>


</table>

<table cellspacing=1 width=700 border=1 >
    <tr>
        <td>
            <%
            for (int i = 1; i <= total_pages; i++) 
            {
            %>           
                <a href="/SpringMvcBoardMyBatis/listSpecificPageWork?current_page=<%=i%>" >                
                
                <%
                if (c_page == i)
                    out.print("<b>");
                %> 
                [<%=i%>]
                <%
                if (c_page == i)
                    out.print("</b>");
                %>            
            <%
            }
            %>        
        </td>
    </tr>
</table>

<table width=700>
    <tr>
        <td><input type=button value="�۾���"  OnClick="window.location='/SpringMvcBoardMyBatis/show_write_form'">    </td>
        <td><form name=searchf method=post action="/SpringMvcBoardMyBatis/searchWithSubject"> 
            <p align=right><input type=text name=searchStr size=50  maxlength=50>
            <input type=submit value="��ã��"></p>
        </td>
    </tr>
</table>
</html>