<%@ page contentType="text/html;charset=gb2312" language="java" import="java.sql.*,java.io.*" %>
<html>
	<head>
		<title>database link</title>
	</head>
	<body>
		<%
			String username="root";
			String userpasswd="cxy88400206";
			String dbname="book";
			String tablename="bookInfo";
			String url="jdbc:mysql://localhost:3306/"+dbname+"?user="+username+"&password="+userpasswd;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn=DriverManager.getConnection(url);
			Statement stmt1=conn.createStatement();
			
			String name=request.getParameter("name");
			String publisher=request.getParameter("publisher");
			String price=request.getParameter("price");
			name=new String(name.getBytes("gb2312"));
			publisher=new String(publisher.getBytes("gb2312"));
			
			//�������Ϊ�������������Ϣ
			if(name.equals("") | publisher.equals("") | price.equals("")){
				response.sendRedirect("MySQLInsert.jsp");
			}
			else{
				String sqlinsert="insert into bookInfo(bookname,publisher,price) values ('"+name+"','"+publisher+"','"+price+"')";
				stmt1.executeUpdate(sqlinsert);
				out.print("������ݳɹ�!!!");
			}
			stmt1.close();
			//����������
			conn.close();//�ر����ӡ��ͷ���Դ
		%>
	</body>
</html>