<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--====================================================================-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--====================================================================-->
 
<script src="/js/jquery-1.11.0.min.js"></script>
<!--====================================================================-->
<!DOCTYPE html>
  <head>
	<html>
	<meta charset="UTF-8"> 
	<meta
	name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
	/>
	<link rel="stylesheet" href="/resources/fontawesome-free-6.2.1-web/css/all.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
	/>
	<script src="/js/jquery-1.11.0.min.js"></script>
<title>Insert title here</title>
<script>
	function goAdminStatsForm(){
			document.adminStatsForm.submit();
	}

	// 자유게시판 게시글 제목 누르면 글 상세보기로 이동
	function goFreeBoardDetailForm( postNo ){
		$("[name='boardFreeDetail']").find("[name='no']").val( postNo );
		document.boardFreeDetail.submit();
	}	
	

	
	
	

	// 자유게시판 게시글 제목 누르면 글 상세보기로 이동
	function goQnABoardDetailForm( postNo ){
		$("[name='boardQnADetail']").find("[name='no']").val( postNo );
		document.boardQnADetail.submit();
	}	
	
	
	
	 function pageNoBtn( pageNo ){
		 	$(".selectPageNo").val( pageNo );
		 	FreeSearch( );
	}
	
</script>
<style>
    body{
        font-family: 'PT Sans Narrow';
    }
    img { border: 0; }
    ul { list-style: none; }

    .boardTitle span:hover{
        color: rgb(240, 227, 186);
         text-decoration: underline;
         text-underline-position: under;
         text-decoration-color: rgb(240, 227, 186);
         /* background-color: rgb(226, 211, 166); */
         /* border: solid 2px rgb(226, 211, 166); */
    }

	.reportTable {
        background-color: rgb(187, 181, 160);
    }

	.statsTable{
        background-color:  rgb(187, 181, 160);
	}
	.reportTable:hover {
        background-color: rgb(154, 149, 131);
    }

	.statsTable:hover{
        background-color:  rgb(154, 149, 131);
	}
</style>

</head>

<body style="background-color: rgb(234, 230, 219);">

<%@include file="/WEB-INF/views/commonHeader.jsp" %>



	<form name="adminReportForm" method="post" action="/adminReportForm.do">
    <center>
        <table id="" class="adminTable" border=1 cellspacing=0 width=500 cellpadding=5>
            <head>
                <tr>
                    <td class="reportTable" width="50%" ><center><b>신고 게시판</b></center></td>
                    
                    <td class="statsTable" style="cursor:pointer" onClick="goAdminStatsForm();"><center><b>통계화면</b></center></td> 
                </tr>
                
        </table>
        <br>
        <table border=1 cellspacing=0 cellpadding=5  width="700px" style="background-color: rgb(226, 223, 217);"> 
           <tr>
           <td width="20%" style="background-color: rgb(199, 197, 193);">신고사유</td> 
		   <td style="background-color: rgb(199, 197, 193);">신고내용</td>
            <td width="15%" style="background-color: rgb(198, 184, 168);">게시판종류</td>
			<td width="20%" style="background-color: rgb(198, 184, 168);">작성자</td> 
			<td width="20%" style="background-color: rgb(199, 197, 193);">신고자</td>
           </tr>

<!--MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-->
			<c:forEach var="reportList" items="${requestScope.reportList}" varStatus="loopTagStatus">
					<tr >
							<td>${reportList.reason}
							
							<td>${reportList.reportContent} 
							
							
				<c:if test="${reportList.partNo == 1}">	    
							<td style="background-color: rgb(198, 184, 168);">자유게시판     
				</c:if>	
				<c:if test="${reportList.partNo == 2}">	    
							<td style="background-color: rgb(198, 184, 168);">문의게시판     
				</c:if>	
				
				<!-- 
				<c:if test="${reportList.partNo == 1}">	    
							<td OnClick="goFreeBoardDetailForm(${reportList.postNo});"  style="cursor:pointer">${reportList.title}
				</c:if>	
							
				<c:if test="${reportList.partNo == 2}">	    
							<td OnClick="goQnABoardDetailForm(${reportList.postNo});" style="cursor:pointer">${reportList.title}
				</c:if>						
				 -->
				
				
							<td>${reportList.writerEmail}  
							<td>${reportList.reporterEmail} 
					</tr>
			</c:forEach> 
<!--MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM-->
       

        </table>
    </center>
    </form>




	<form name="boardFreeDetail" method="post" action="/boardFreeDetail.do">
		<input type="hidden" name="no" value="">
	</form>



	<form name="boardQnADetail" method="post" action="/boardQnADetail.do">
		<input type="hidden" name="no" value="">
	</form>
	

    
	<form name="adminStatsForm" method="post" action="/adminStatsForm.do"></form>
    
    
    <%@include file="/WEB-INF/views/commonFooter.jsp" %>
</body>
</html>