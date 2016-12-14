<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="index.html" method="post" onsubmit="return formCheck();">
		title : <input type="text" name="title" /><br/>
		write : <input type="text" name="writer" /><br/>
		content : <textarea rows="10" cols="20" name="content"></textarea><br>
		regdate : <input type="text" name="regdate" /><br/>
		<input type="submit" />
	</form>
	http://cusmaker.tistory.com/48
	<script>
		function formCheck() {
		 
		    var title = document.forms[0].title.value;        // 사용하기 쉽도록 변수를 선언하여 담아주고,
		    var writer = document.forms[0].writer.value;
		    var regdate = document.forms[0].regdate.value;
		    var content = document.forms[0].content.value;  // 추가됨 - 쓰레파스님 감사합니다. :)
		 
		    if (title == null || title == ""){                                    // null인지 비교한 뒤
		        alert('제목을 입력하세요');                                   // 경고창을 띄우고
		        document.forms[0].title.focus();                           // 해당태그에 포커스를 준뒤
		        return false;                                                     // false를 리턴합니다.
		    }
		 
		    if (writer == null ||  writer  == ""){          
		        alert('작성자를 입력하세요'); 
		        document.forms[0].writer.focus();                      
		        return false;               
		    }else if(writer.match(/^(\w+)@(\w+)[.](\w+)$/ig) == null){
		        alert('이메일 형식으로 입력하세요'); 
		        document.forms[0].writer.focus();                      
		        return false; 
		    }
		 
		    if (regdate == null || regdate == "" ){                            
		 
		        alert('날짜를 입력하세요');   
		        document.forms[0].regdate.focus();                      
		        return false;            
		 
		    }else if(regdate.match(/^\d\d\d\d\d\d+$/ig)   == null){
		        alert('숫자 형식(6자리)으로 입력하세요'); 
		        document.forms[0].regdate.focus();                      
		        return false; 
	   		}
	 
		} // function end
	</script>
</body>
</html>