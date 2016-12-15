<%@ page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>본격! 게시판 - 게시글 삭제</title>        <!-- 윈도우 상단에 뜨는 내용입니다. -->
 
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
 
        String sql = "delete from board where idx = " + idx ;	//desc 내림차순 정렬
 
        stmt.executeUpdate(sql);
 		
        con.close();
 
    }catch (Exception e) {
 
        out.println("Mysql Database Connection Something Problem. <hr>");
 
        out.println(e.getMessage());
 
        e.printStackTrace();
 
    }
 
%>

<script>
 
    alert("게시글이 삭제되었습니다");  // 게시글이 삭제되었다는 경고창을 띄워주고
 
    location.href="redirect.jsp";          // 리스트페이지로 이동합니다.
 
</script>
 
</body>
 
</html>