<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>

<h1>게시판 글작성 </h1>  
<p style="font-size: small;">
	작성자: (<%=session.getAttribute("logid") %>)<br/>
	내용을 작성후 확인을 눌러주십시요.<br/>
</p>

	<form method="post" action="<%=application.getContextPath()%>/board/writeHandle.jsp" enctype = "multipart/form-data">
	<p>
		글 제목<br/>
		<input type="text" placeholder="글 제목" style="width: 220px; padding: 5px;" name="title"/>
	</p>
	<p>
		글 내용<br/>
		<textarea name="content" style="height: 170px; width: 220px; padding: 5px; resize: none; font-family: inherit;"
			placeholder="글 내용 입력"></textarea>	
	</p>
	file : <input type="file" name = "attach"/> </br> </br>
	<button type="submit">글 게시</button>  
	<a href="<%=application.getContextPath()%>/index.jsp"><button type="button">메인으로</button></a>	
	</form>
<%@ include file="/layout/bottom.jspf"%>

<%
/*
	<form action="05handle.jsp" method="post" enctype="multipart/form-data">
		text : <input type="text" name = "param"/> </br>
		file : <input type="file" name = "attach"/> </br>
		<button type="submit">요청전송</button>
	</form>

	이전과는 상이한점.
	1. 작성 form을 post.. multipart/form-data 로 설정을 해야됨.
	2. action 받아주는곳에서 요청처리할때, request.getParameter 같은걸로 안뽑힘.
		(multipart parser 를 이용해서 요구사항 처리해야함)
	3. file write 진행할때 기존파일을 덮어버리게 되있음.
	   해결하기 위한 방법중에 하나가 시간을 이용해서 처리하는 방안이다,
	  long time = Systme.currentTimeMillis();
	  File savedir = new File(application.getRealPath("/storage"), String.valueof(time));
	  saveDir.mkdirs();
	  f.writeTo(saveDir);
	  map.put("attach", "/storage/"+time+"/"+...);
*/
%>