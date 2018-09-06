<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.Part"%>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "beans.*" %>

    
<%
	MybatisDao mdao = new MybatisDao();
	Map<String, Object> data = new HashMap<>();
	
	String writer = (String)session.getAttribute("logid");	
	Date writeDate = new Date(System.currentTimeMillis()); //남긴시간	
	data.put("writer",writer);

	/*
	no number(6,0) not null, --primary key
    writer varchar2(60) not null, -- 작성자
    title varchar2(300) not null, -- 글제목
    leftdate date not null,       -- 남긴시간
    content varchar2(4000) not null, -- 내용
    good number(6,0) not null,      -- 추천수
    attach varchar2(2000), -- 첨부파일 url
	*/
	MultipartParser parser= new MultipartParser(request, 1024*1024*100, true, true, "UTF-8");
	
	while(true){  
			Part part = parser.readNextPart();
			if (part==null){
				break;
			} else {
				String name = part.getName();
							
				if(part.isFile()){
					FilePart fp = (FilePart)part;
					String fn = fp.getFileName();
										
					long time = System.currentTimeMillis();
				    File saveDir = new File(application.getRealPath("/storage"), String.valueOf(time) );
				    saveDir.mkdirs();
				    fp.writeTo(saveDir);
				    data.put("attach", "/storage/"+time+"/"+fn);	
					
				}else if (part.isParam()){
					ParamPart pp=(ParamPart)part;
					data.put(pp.getName(), pp.getStringValue());
				}else {
					
				}
		}
	}
	
	mdao.addBoardResult(data);	
%>

<%@ include file="/layout/top.jspf"%>
	<h1>《게시글 작성완료》</h1>
<p>
	<%=writer %> 님의 글을 성공적으로 등록하였습니다.<br/>
</p>
<p>
	<a href="<%=application.getContextPath()%>/board/index.jsp"><button type="button">게시판으로</button></a>
	<a href="<%=application.getContextPath()%>/index.jsp"><button type="button">메인으로</button></a>
</p>
<%@ include file="/layout/bottom.jspf"%>
