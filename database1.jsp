<%@ page contentType="text/html;charset=gb2312" language="java" import="java.sql.*,java.io.*" %>
<html>
	<head>
		<title>database link</title>
	</head>
	<body>
		<%!
			String getS(String str){
				try{
					byte b[]=str.getBytes("gb2312");
					str=new String(b);
				}
				catch(Exception e){
					str="Error!!";
				}
				return str;
			}
		 %>
		<%
			String str1=request.getParameter("name");
			str1=getS(str1.trim());
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
	
			String name=request.getParameter("name");
			String publisher=request.getParameter("publisher");
			String price=request.getParameter("price");
			name=new String(name.getBytes("gb2312"));
			publisher=new String(publisher.getBytes("gb2312"));
			
			//如果数据为空则添加数据信息
			if(name.equals("") | publisher.equals("") | price.equals("")){
				response.sendRedirect("MySQLInsert.jsp");
			}
			else{
				String sqlinsert="insert into bookInfo(bookname,publisher,price) values ('"+name+"','"+publisher+"','"+price+"')";
				stmt1.executeUpdate(sqlinsert);
				out.print("Add data successfully!!!");
			}
			stmt1.close();
			//添加数据完毕
			conn.close();//关闭连接。释放资源
		%>
	</body>
</html>