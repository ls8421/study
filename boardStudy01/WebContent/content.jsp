<%@ page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>본격! 게시판 - 게시글 보기</title>        <!-- 윈도우 상단에 뜨는 내용입니다. -->
 
 <style type="text/css">
 
    table, td, th {
 
    border:1px solid black;
 
    }
 
    th {
 
    background-color:lightgray;
 
    }
 
</style>
 
</head>
 
<%

	String idx = request.getParameter("idx");
 
    try {
 
    	String driverName = "com.mysql.jdbc.Driver"; 
        
        String url = "jdbc:mysql://localhost:3306/board?useUnicode=true&characterEncoding=UTF-8";
 
        ResultSet rs = null;
 
      
 
        Class.forName(driverName);
        
        Connection con = DriverManager.getConnection(url,"firstclass","8421");
    
        out.println("Mysql Database Connection Success.");
 
      
 
        Statement stmt = con.createStatement();        
 
        String sql = "select * from board where idx = " + idx ;	//desc 내림차순 정렬
 
        rs = stmt.executeQuery(sql);
 
        
        while(rs.next()){
%>
 
 
 
 
 
<body>                                       <!-- HTML문서의 주 내용이 들어가는 부분입니다. -->
 
    <h1>게시글 조회</h1>                        <!-- 헤드라인 글씨를 표현하는 태그입니다. -->
 
    <table>                                  <!-- 표 형식의 데이터를 표현하는 태그입니다. -->
 
        <tr>                                 <!-- table태그 내에서 행을 정의할때 쓰는 태그입니다. -->
 
            <th>번호</th>                     <!-- Table Header의 약자로 table태그 내에서 -->
 			<td><%= rs.getString("idx") %></td>
            <th>작성자</th>                     <!-- 강조하고싶은 컬럼을 나타낼때 쓰는 태그입니다. -->
 			<td><%= rs.getString("writer") %></td>
            <th>날</th>
 			<td><%= rs.getString("regdate") %></td>
            <th>조회수</th>
			<td><%= rs.getString("count") %></td> 
       </tr>
       
       <tr>
       		<th colspan="2">제목</th>			<!-- colspan은 행병합 속성 -->
       		<td colspan="6"><%= rs.getString("title") %></td> 
       </tr>
       
       <tr>
       		<th colspan="2">본문</th>			<!-- colspan은 행병합 속성 -->
       		<td colspan="6"><%= rs.getString("contents") %></td> 
       </tr>

    </table>
    
    
	<a href="delete.jsp?idx=<%=rs.getString("idx")%>">삭제</a>
	<a href="write.jsp">글쓰기</a>
 
<%      
    }
 
        con.close();
 
    }catch (Exception e) {
 
        out.println("Mysql Database Connection Something Problem. <hr>");
 
        out.println(e.getMessage());
 
        e.printStackTrace();
 
    }
 
%>
 
</body>
 
</html>