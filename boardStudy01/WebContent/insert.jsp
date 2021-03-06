<%@page import="java.sql.*"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>본격! 게시판 - 게시글 올리기</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
 
    int idx = 1;
 
    String title = request.getParameter("title");
 
    String writer = request.getParameter("writer");
 
    String regdate = request.getParameter("regdate");
 
    int count = 10000;
 
    String content = request.getParameter("content");
    
    
    if(title == "" ||title == null) out.println("title이 null입니다.");
    
    if(writer == "" ||writer == null)
        out.println("writer가 null입니다.");   
    else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
        out.println("이메일 형식이 아닙니다.");
     
    if(regdate == "" ||regdate == null)
        out.println("regdate가 null입니다.");
    else if(!Pattern.matches("^[0-9]*$", regdate))
        out.println("숫자형식이 아닙니다.");
     
    if(content == "" ||content == null) out.println("content가 null입니다.");
    
    try {
    	 
        String driverName = "com.mysql.jdbc.Driver"; 
    
        String url = "jdbc:mysql://localhost:3306/board?useUnicode=true&characterEncoding=UTF-8";  
    
    
    
        Class.forName(driverName);
    
        Connection con = DriverManager.getConnection(url,"firstclass","8421");    // getCo... : 계정정보 url, id, pw
    
        out.println("mysql 데이터베이스 db에 성공적으로 접속했습니다");
        
        Statement stmt = con.createStatement();            // SQL 쿼리를 날리기위한 Statement 객체 생성
        
        String sql = "INSERT INTO BOARD.board "+
        
                       "(TITLE, WRITER, REGDATE, COUNT, CONTENTS) "+
        
                       "VALUES ("+"'"+title+"', '"+writer+"' , now(), '1', '"+content+"')";
        
       stmt.executeUpdate(sql);                                                // 쿼리를 실행합니다.
	   System.out.println(sql);
        
        con.close();
    
   } catch (Exception e) {
    
        out.println("mysql 데이터베이스 db 접속에 문제가 있습니다. <hr>");
    
        out.println(e.getMessage());
    
        e.printStackTrace();
    
   } finally{
	   
       out.print("<script>location.href='index.jsp';</script>");

   }
 
%>
<body>

</body>
</html>