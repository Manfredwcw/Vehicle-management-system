<html>
	<head>
		<title>学籍查询页</title>
		<meta http-equiv="content-type" content="text/html;charset=utf-8">
		<script type="text/javascript" src="GetData.js"></script>
	</head>
	<body>
		<table border="2" align="center" rules="all" width="500" bgcolor="yellow">
			<tr>		
				<th align="center" colspan="2"><font size="5">学籍查询</font></th>
			</tr>
			<tr>
				<th>姓名：</th>
				<td align="center"><input type="text" id="name"></td>
			</tr>
			<tr>
				<th>学号：</th>
				<td align="center"><input type="text" name="number"></td>
			</tr>
			<tr>
				<th>密码：</th>
				<td align="center"><input type="password" name="password"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="submit" value="查询" onclick="startRequest()"></td>
			</tr>
		</table>
		<div id="output"></div>
	</body>
</html>