<%@ page contentType ="text/html;charset=gb2312" language="java" import="java.sql.*,java.io.*"%>
<html>
	<head>
		<title>database insert</title>
		<meta http-equiv="content-type" content="text/html;charset=gb2312">
	</head>
	<body>
		<h2 align="center">Insert the data into database</h2>
		
		
		<form action="database1.jsp" method="post">
			bookname:<input type="text" name="name"><br />
			publisher:<input type="text" name="publisher"><br />
			price:<input type="text" name="price"><br />
			<input type="submit" value="submit">
		</form>
	</body>
</html>