var req=false;
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
		try{
			req.onreadystatechange = handleStateChange;
			
			req.open("POST", "string.jsp",true);
			req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=gb2312");
			req.send(null);
		}catch(exception){
			alert("Can't reach!!");
		}
}


function handleStateChange(){
	if(req.readyState==4){
		alert(req.status );
		if(req.status==200 || req.status==0){//显示返回结果
			var data=req.responseText;
			var pNode=document.getElementById("p");
			pNode.innerHTML=data;
		}
	}
}