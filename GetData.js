var req;
function creatXMLHttpRequest(){
//����ʱ����ˢ��ҳ��
	if(window.ActiveXObject){
		req= new ActiveXObject("Microsoft.XMLHTTP");//windows����XMLHttpRequest����
	}
	else if(window.XMLHttpRequest){
		req=new XMLHttpRequest();//notscape����XMLHttpRequest����
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
		if(req.status==200 || req.status==0){//��ʾ���ؽ��
			result=req.responseText;
			document.getElementById("output").innerHTML=result;
		}
	}
}