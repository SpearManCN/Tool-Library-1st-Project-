<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--====================================================================-->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--====================================================================-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/fontawesome-free-6.2.1-web/css/all.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src = "/js/jquery-1.11.0.min.js"></script>

<title>문의게시판</title>

<script>
	$(function(){
		//조회수/등록일 문자  처리
		$("#qnaSortHeader").text("조회수");
		$("#qnaSortHeader2").text("등록일");
		
		var val = $("#qnaSortHeader").text();
		var val2 = $("#qnaSortHeader2").text();
		var order = $("#sort").val();

	 //조회수
		if( val=="조회수" && order == "readCount asc"){
			val = $("#qnaSortHeader").text("조회수▲");
		}
		else if(val=="조회수" && order == "readCount desc"){
			val = $("#qnaSortHeader").text("조회수▼");

		}else if(val=="조회수" && order == ""){
			val = $("#qnaSortHeader").text("조회수");
		}
		else if( val2=="등록일" && order == "regDate asc"){
			val2 = $("#qnaSortHeader2").text("등록일▲");
		}
		else if(val2=="등록일" && order == "regDate desc"){
			val2 = $("#qnaSortHeader2").text("등록일▼");

		}else if(val2=="등록일" && order == ""){
			val2 = $("#qnaSortHeader2").text("등록일");
		}
	 
		$(".questionBtn").bind("click",function(){
			document.boardQuestionForm.submit();
		});
		$(".freeBtn").bind("click",function(){
			document.boardFreeForm.submit();
		});
		$(".qnADetailBtn").bind("click",function(){
			document.boardQnADetailForm.submit();
		});
		$(".boardQnAwriteBtn").bind("click",function(){
			document.boardQnAWriteForm.submit();
		});

})

function init(text){

// text = S 조회수
// text = W 등록일		
		var order = $("#sort").val();
		if(text=="S"){
			if(text=="S"&& order == ""){
				$("#sort").val("readCount asc");
			}
			else if(text=="S" && order == "readCount asc"){
				$("#sort").val("readCount desc");
			}
			else if(text=="S" && order == "readCount desc"){
				$("#sort").val("");
			}else{
				
				$("#sort").val("");
			}
		}else{
			if(text=="W"&& order == ""){
				$("#sort").val("regDate asc");
			}
			else if(text=="W" && order == "regDate asc"){
				$("#sort").val("regDate desc");
			}
			else if(text=="W" && order == "regDate desc"){
				$("#sort").val("");
			}else{
				$("#sort").val("");
			}
		}	
		//$(".QnaSearchBtn").click();	
		document.boardQnAForm.submit();
}

	function QnaSearch(){
		var keyword1 = $("[name='keyword']").val();
		if(typeof(keyword1)!="string"){
			keyword1 = " ";
		}
		keyword1 = $.trim(keyword1);
		$("[name='keyword']").val(keyword1);
		
		document.boardQnAForm.submit();
	}

	function goQnaDetail(no){
		var formObj = $("[name=boardQnADetailForm]");
		formObj.find("[name=no]").val(no);
		document.boardQnADetailForm.submit();
	}

	function pageNoBtn( pageNo ){
		$(".selectPageNo").val( pageNo );
		QnaSearch( );
	}
	
	function qnawrite(){
		document.boardQnAWriteForm.submit();
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
    .searchTxt{
    width: 200px;
    height: 20px;
    font-size: 12px;
    border: 0;
    border-radius: 5px;
    /* outline: none; */
    padding-left: 10px;
    background-color: rgb(227, 223, 209);
    opacity: 0.8;
    }

    .boardSearch{
        background-color:  rgb(195, 186, 154);
    }

    .selectBox{
        background-color:  rgb(227, 223, 209);
        width: 80px;
        height: 22px;
    }

    .SearchBtn input{
        background-color:rgb(210, 203, 176);
        width: 80px;
        height: 22px;
        border: none;
        font-weight: bolder;
    }

    .SearchBtn input:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(200, 193, 166);
    }

    .writeBtn{
        position: relative;
        left: 250px;
        width: 150px;
        height: 30px;
        border: none;
        font-weight: bolder;
        background-color:rgb(200, 193, 166); 
    }

    .writeBtn:hover{
        color: rgb(110, 97, 79);
        background-color:rgb(181, 174, 148);
    }

    .tableTitle{
        background-color: rgb(210, 203, 176);
    }
    .tableSub{
        border: 1px solid #444444;
        padding: 20px ;
        background-color: rgb(227, 223, 209);
    }
    .Writer{
        width: 100px;
    }

    .look{
        width: 80px;
    }

    .nextBtn{
        font-size: 15px;
        background-color: rgb(188, 182, 163);
        border: none;
    }
    .nextBtn:hover{
        background-color: rgb(160, 155, 139);
    }
   
</style>
</head>
<body style="background-color: rgb(234, 230, 219);">
<%@include file="/WEB-INF/views/commonHeader.jsp" %>
<form name="boardQnAForm" action="/boardQnA.do" method="post">
        <center>
            <table class="boardTitle"  border="0" cellpadding="5" cellspacing="0" align="center" height="60px" width="1000px" style="background-color: rgb(202, 188, 145) ;">
                <tr>
                   <th><span style="cursor:pointer"  class="questionBtn" onclick="goQuestion();">자주 묻는 질문</span></th>
                    <th><span style="cursor:pointer" class="freeBtn" onclick="goFree();">자유게시판</span></th>
                    <th><span style="cursor:pointer" class="qnABtn" onclick="goQnA();">문의 게시판</span></th>
                </tr><br>
            </table>
            <div style="height: 10px;"></div>

            <table class="boardSearch" cellpadding="5" cellspacing="0" align="center" width="1000px">
                <tr>
                    <th class="">게시판 검색&nbsp;<i class="fa-sharp fa-solid fa-magnifying-glass"></i></th>&nbsp;&nbsp;&nbsp;&nbsp;
                    </th>
                    <th class="" colspan="2">
                        <select class="selectBox" name="keywordtype">
                            <option value="title"  ${requestScope.boardSearchDTO.keywordtype == 'title' ? 'selected="selected"' : '' }>제목</option>
                            <option value="content" ${requestScope.boardSearchDTO.keywordtype == 'content' ? 'selected="selected"' : '' }>내용</option>
                            <option value="email" ${requestScope.boardSearchDTO.keywordtype == 'email' ? 'selected="selected"' : '' }>작성자</option>
                        </select>
                        <input class="searchTxt" type="text" name="keyword" placeholder="검색어를 입력해주세요." value="${requestScope.boardSearchDTO.keyword}"  maxlength="30">
                    </th>
                    <input type="hidden" name="sort" id="sort"  class="sort" value="${requestScope.boardSearchDTO.sort}">
                    
                    <input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
          		    <input type="hidden" name="pageNoCnt_perPage" class="pageNoCnt_perPage" value="10">
                    <th class="SearchBtn">
                        <input type="button" value="검색" onclick="QnaSearch();">
                    </th>
                </tr>
            </table>

            <table class="tableSub" border="1px" cellpadding="12" cellspacing="2" style="border-collapse:collapse" align="center"
            width="1000px">
                <tr class="tableTitle">
                    <th class="Title">제목</th>
                    <th class="Writer">작성자</th>
                    <th class="look" ><span class="look" style="cursor:pointer" id="qnaSortHeader" onClick="init('S');"></span></th>
                    <th class="updateDay"><span class="updateDay" style="cursor:pointer"  id="qnaSortHeader2"  onClick="init('W');"></span></th>
                </tr>
                <c:forEach var="Qnaboard" items="${requestScope.boardList}" varStatus="loopTagStatus" >
                  <tr onClick="goQnaDetail(${Qnaboard.no})" class="qnADetailBtn">
                    <td style="cursor:pointer">${Qnaboard.title} </td>
                    <td style="cursor:pointer">${Qnaboard.email}</td>
                    <td style="cursor:pointer">${Qnaboard.readCount}</td>
                    <td style="cursor:pointer">${Qnaboard.regDate}</td>
                </tr>
              </c:forEach>
              
              
            </table>
            <div style="height: 10px;"></div>

         <c:if test="${requestScope.boardTotCnt>0}">
		      	<span class="nextBtn" style="cursor:pointer" onclick="pageNoBtn(1);">처음</span>
		        <span class="nextBtn" style="cursor:pointer" onclick="pageNoBtn(${requestScope.pagingMap.selectPageNo}-1);">이전</span>
        <c:forEach  var="no"  begin="${requestScope.pagingMap.begin_pageNo_perPage}"  
                                end="${requestScope.pagingMap.end_pageNo_perPage}" step="1">      
               <c:if test="${requestScope.pagingMap.selectPageNo!=no}">                 
                  <span style="cursor:pointer" onclick="pageNoBtn(${no});">${no}</span>&nbsp;
               </c:if>
               <c:if test="${requestScope.pagingMap.selectPageNo==no}">${no}&nbsp;</c:if>
         </c:forEach>
         <span class="nextBtn" style="cursor:pointer" onclick="pageNoBtn(${requestScope.pagingMap.selectPageNo}+1);">다음</span>
         <span class="nextBtn" style="cursor:pointer" onclick="pageNoBtn(${requestScope.pagingMap.last_pageNo});">마지막</span>
      </c:if>

            <input type="button" value="글쓰기" class="writeBtn" class="boardQnAwriteBtn" onclick="qnawrite();">

        </center>
    </form>
    
    <form name="boardFreeForm" action="/boardFree.do" method="post" ></form>
    <form name="boardQuestionForm" action="/boardQuestion.do" method="post" ></form>
    <form name="boardQnADetailForm" action="/boardQnADetail.do" method="post" >
    		<input type="hidden" name="no" class="no" value="">
    </form>
    <form name="boardQnAWriteForm" action="/boardQnAWrite.do" method="post" ></form>
    
    <%@include file="/WEB-INF/views/commonFooter.jsp" %>
</body>
</html>