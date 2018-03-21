<%@ page contentType="text/html;charset=gb2312" language="java" import="java.sql.*" %>
<html>
	<head>
		<title>database link</title>
	</head>
	<body>
		<%!
			String getS(String str){
				try{
					byte b[]=str.getBytes("iso-8859-1");
					str=new String(b);
				}
				catch(Exception e){
					str="Error!!";
				}
				return str;
			}
		 %>
		<%
			String str1=request.getParameter("number");
			String username="root";
			String userpasswd="cxy88400206";
			String dbname="student";
			String tablename="stuinfo";
			
			String url="jdbc:mysql://localhost:3306/"+dbname+"?user="+username+"&password="+userpasswd;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn=DriverManager.getConnection(url);
			Statement stmt1=conn.createStatement();
			
			String sql="select * from StuInfo where Sno like '%"+str1+"%'";
			ResultSet rs=stmt1.executeQuery(sql);
			while(rs.next()){
				String str2=rs.getString("Sname");
				String str3=rs.getString("Sex");
				String str4=rs.getString("Academy");
				str2=getS(str2);
				str3=getS(str3);
				str4=getS(str4);
				out.print(" <table width=500 border=2 rule=all align=center><tr><th align=center colspan=6><font size=5>学生信息</font></th></tr><tr><th>学号</th><th>姓名</th><th>性别</th><th>学院</th><th>班级</th><th>平均分</th></tr>");
				out.print(" <tr><td align=center>"+rs.getString("Sno")+"</td>");
				out.print(" <td align=center>"+str2+"</td>");
				out.print(" <td align=center>"+str3+"</td>");
				out.print(" <td align=center>"+str4+"</td>");
				out.print(" <td align=center>"+rs.getString("Class")+"</td>");
				out.print(" <td align=center>"+rs.getString("Avegrade")+"</td></tr></table>");
			}
			conn.close();//关闭连接。释放资源
		%>
	</body>
</html>