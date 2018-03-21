<%@ page contentType="text/html;charset=gb2312" language="java" import="java.sql.*" %>
<html>
	<head>
		<title>database link</title>
	</head>
	<body>
		<%
			String str1=request.getParameter("name");
			String username="root";
			String userpasswd="cxy88400206";
			String dbname="book";
			String tablename="bookInfo";
			
			String url="jdbc:mysql://localhost:3306/"+dbname+"?user="+username+"&password="+userpasswd;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn=DriverManager.getConnection(url);
			Statement stmt1=conn.createStatement();
			
			String sql="select * from bookInfo where bookname like '%"+str1+"%'";
			ResultSet rs=stmt1.executeQuery(sql);
			while(rs.next()){
				out.print(" <center><strong><br />bookname: "+rs.getString("bookname"));
				out.print("<br />publisher:"+rs.getString("publisher"));
				out.print("<br />price:"+rs.getString("price")+"</strong></center>");
			}
			conn.close();//关闭连接。释放资源
		%>
	</body>
</html>