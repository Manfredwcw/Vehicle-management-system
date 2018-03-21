var req;
function creatXMLHttpRequest(){
//请求时不用刷新页面
	if(window.ActiveXObject){
		req= new ActiveXObject("Microsoft.XMLHTTP");//windows创建XMLHttpRequest对象
	}
	else if(window.XMLHttpRequest){
		req=new XMLHttpRequest();//notscape创建XMLHttpRequest对象
	}
}

function startRequest(){
	creatXMLHttpRequest();
	var number= document.getElementById("number").value;
		try{
			var url="Server.jsp?number="+encodeURIComponent(number);
			req.onreadystatechange = handleStateChange;
			req.open("GET",url,true);
			req.send(null);
		}catch(exception){
			alert("Can't reach!!");
		}
}
function handleStateChange(){
	if(req.readyState==4){
		if(req.status==200 || req.status==0){//显示返回结果
			result=req.responseText;
			document.getElementById("output").innerHTML=result;
		}
	}
}