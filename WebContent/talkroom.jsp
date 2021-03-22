<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Talk Room</title>
<style type="text/css">
html, body {
	height:100%;
	width:100%;
	margin: 0;
	background-color:#f5f5f5;
}
header{
	max-width:100%;
	font-size:40px;
	font-weight:bolder;
	font-family:Microsoft JhengHei;
	background-color:#a52603;
	color:#fcf3e9;
	text-align:center;
	padding:5px;
	border:black 3px solid;
}
.wrapper {
	min-height: 100%;	
	width:100%;
	max-width:100%;
	margin-bottom: -213px;
	background-image:url("images/giant.gif");
	background-repeat:no-repeat;
	background-attachment: fixed;
	background-size:cover;
	background-color:rgba(0,0,0,0.5);
	background-blend-mode: multiply; 
}
.content {
	padding-bottom: 213px;	
	line-height:1.2;
}
.toRight{		
	display:flex;
	justify-content:flex-end;/*調整水平排列:內部DIV靠右對齊*/
	align-items:flex-end;/*調整鉛直排列:內部DIV靠下對齊*/
	padding:5px;
}
.msgRight{ 
	text-align:right;	
	padding:5px;
}
.toLeft{		
	display:flex;
	align-items:flex-start;
	padding:5px; 
}
.msgLeft{		
	padding:5px;
}
.message{
	max-width:50%;
	word-wrap:break-word; /*使過長的句子自動切換到下一行*/
	background-color:#c3ff8f;
	border:#c3ff8f 0px solid ;
    border-radius: 10px;
    padding:5px;   
}
.time{
	color:#FCFCFC;
	font-size:12px;
	padding:5px;
}
.center{
	max-width:100%;
	word-wrap:break-word; /*使過長的句子自動切換到下一行*/
	text-align:center;
	background-color:#1000ad;
	color:white;
	font-size:20px;
	margin-top:3px;
	margin-bottom:3px;
	padding:3px;
}
.footer {
	height: 200px;	
	background-color:#fcf3e9;
	border:#a52603 3px solid;
	padding:3px;	
}
#input{
	height:100px;
	max-height:100px;
	overflow-y:auto;
	margin-left:auto;
	margin-right:auto;
	margin-top:5px;
	border:#a52603 2px solid;
	background-color:white;
}
.div1{	
	margin-top:5px;
	margin-left:3px;
	display:flex;
	align-items:center;
}
.div2{	
	display:flex;
	align-items:center;
	justify-content:space-between;/*分散對齊*/
	margin-top:3px;
	color:#a52603;
}
.img{
	width:25px;
	height:25px;
}
.div1 .img:hover{
	cursor:pointer;
}
.btn{
	border:#a52603 2px solid;
	border-radius: 5px;
	padding:3px;
	font-size:15px;
	background-color:#a52603;
	color:#fcf3e9;
}
.btn:hover{
	background-color:#fcf3e9;
	color:#a52603;
	cursor:pointer;
}
.userName{
	font-weight:bold;
	max-width:200px;
	word-wrap:break-word; /*使過長的句子自動切換到下一行*/
	margin-right:5px;
	color:white;	
}
#localImg{
	width:200px;
	height:auto;
	margin-top:5px;
}
#localImg:hover {
  cursor:pointer;
  margin-left:auto;
  margin-right:auto;
  width:100%;
  height:auto;
}
.robot{
	font-size:15px;
	background-color:#0068d2;
    color: white;
    border:#0068d2 2px solid;
	border-radius: 5px;
	padding:3px;
}
#robot{
	height:20px;
	width:20px;
}
@media screen and (max-width:1050px) {
	/*當使用者使用螢幕 且螢幕寬度不超過1050px時 套用大括號內的CSS設定*/
	.wrapper {min-height: 100%;	width:100%;max-width:100%;margin-bottom: -157px;}
	.content {padding-bottom: 157px;	line-height:1.2;font-size: 16px;}
	.footer {height: 145px;background-color:#fcf3e9;border:#a52603 3px solid;padding:3px;	}
	#input{height:20px;max-height:20px;font-size: 18px;}
	.div2{	width:100%;	display:block;font-size: 15px;}
	.img{width:20px;height:20px;}
	.userName{font-weight:bold;max-width:120px;word-wrap:break-word;margin-right:5px;color:white;}
	.btn{padding:2px;font-size:13px;}
	.robot{font-size:13px;}
	#robot{	height:18px;width:18px;}
}
</style>
<script src='js/jquery.js'></script>
<script src='js/linkify.min.js'></script>
<script src='js/linkify-jquery.min.js'></script>
<link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css' rel='stylesheet'></link>	
</head>
<body>
	<div class="wrapper">
		<header><%@ include file="indexbutton.html" %>!!進擊的鄉民!!</header>
		<div id="messages" class="content"></div>
		<a id="bottom" ></a>
	</div>	
	<footer class="footer">
		<div class="div1">
			<img src="images/thumbs.png"  alt="No images" class='img'/>&nbsp;
			<img src="images/in-love.png"  alt="No images" class='img'/>&nbsp;
			<img src="images/laughing.png"  alt="No images" class='img'/>&nbsp;
			<img src="images/shocked.png"  alt="No images" class='img'/>&nbsp;
			<img src="images/sad.png"  alt="No images" class='img'/>&nbsp;
			<img src="images/angry.png"  alt="No images" class='img'/>&nbsp;&nbsp;
			<label class="btn">
				<input type="file" id="file" accept="image/*" style="display:none;"/>
				<i class="fa fa-photo"></i> 傳圖<!-- 文字 "傳圖" 左邊的 HTML 碼是 Font Awesome 對應的圖示  要先引用CDN 連結-->
			</label>&nbsp;
			<input type="button" value="送出" id="send" class="btn"/>&nbsp;
			<input type="checkbox" id="robot"><label for="robot" class="robot">對話機器人</label>
		</div>
		<div id="input" contenteditable="true" ></div>
		<div class="div2">		
			<div style="width:350px">目前狀態 :&nbsp;<span id="info"></span></div>
			<div style="width:350px;align-items: center;display: flex;">線上人數 :&nbsp;<span id="number"></span>&nbsp;<div class="btn" id="who">誰在線上?</div></div>
			<div><input type="hidden" id="name" value="${userInfo.username}"/><input type="button" value="離開聊天室"	id="logout" class="btn" /></div>
		</div> 		
	</footer>

	<script type="text/javascript">

	window.onload=function(){
		
		var name=document.getElementById("name");
		var logout=document.getElementById("logout");
		logout.disabled=true;
		var info=document.getElementById("info");
		var input=document.getElementById("input");
		var send=document.getElementById("send");
		var messages=document.getElementById("messages");
		var bottom=document.getElementById("bottom");
		var number=document.getElementById("number");
		var webSocket;
	    var isConnect = false;
	    var guestnames;	    
 	    	
	    	if(name.value&&name.value!=="系統"){//in javascript, both null values, and empty strings, equals to false
	    		//開始連線
	    		webSocket = new WebSocket('ws://150.117.194.215:8080/TalkRoom/mywebsocket');
	    		 //webSocket = new WebSocket('ws://localhost:8080/TalkRoom/mywebsocket');
	    		 webSocket.binaryType="arraybuffer";
	    			    		 
	    		//onopen , 連線成功時觸發
	    		 webSocket.onopen=function(){
						isConnect=true;
						name.disabled=true;
						
						logout.disabled=false;
						info.innerHTML="<b>進入聊天室</b>";
						//傳送登入成功的資訊給聊天室
						var loginInfo={username:"系統", message:name.value+ " 進入聊天室"};
						webSocket.send(JSON.stringify(loginInfo));						
	 		    	}

	 		    //onclose,連線關閉時觸發 
	    		 webSocket.onclose=function(){		
	    			 	isConnect=false;
	    				name.disabled=false;
	    				logout.disabled=true;
	    				info.innerHTML="<b>離開聊天室</b>";
	    				number.innerHTML="";						
	 		    	}

	 		    //onmessage , server端有傳訊息過來時觸發
		 		    webSocket.onmessage=function(event){ //event是server傳回來的物件
		 		    	//產生時間物件
						var dateTime=new Date();
						var hour=dateTime.getHours()>=10?  dateTime.getHours():"0"+dateTime.getHours();
						var minute=dateTime.getMinutes()>=10?  dateTime.getMinutes():"0"+dateTime.getMinutes();
						var time=hour+":"+minute;
						//傳回的資料型態為String時
			 		    if(typeof event.data==="string"){
			 		    	var obj=JSON.parse(event.data);//欲取得物件內容必須使用.data			
							//訊息來自自己時
							if(obj.username===name.value){
								//訊息為圖片時
								if(obj.message.substring(0,11)=="data:image/"){
									messages.innerHTML+="<div class='msgRight'><div><img id='localImg' src='"+obj.message+"'/></div><div class='time'>"+time+"</div></div>";
								//訊息為一般文字時
								}else{
									//var brNumber=obj.message.split("<br>").length-1;//輸入訊息時若有換行 則字串中會有<br>出現							
									//for(var i=0;i<brNumber;i++)	time="<br>"+time;//使time的<div>行數和obj.message相同
									messages.innerHTML+="<div class='toRight'><div class='message';>"+obj.message+"</div><div class='time'>"+time+"</div></div>";
									//$("#messages").linkify();//選擇id=messages的元素
									//$("div[class='message']").linkify();//選擇所有div中class=message的元素
									$(".message:last").linkify();//選擇最後一個class=message的元素 其字串中有超連結時自動轉換成超連結
									//開啟對話機器人
									if($("#robot").prop('checked')){
										if(obj.message.includes("鮭魚")){messages.innerHTML+="<div class='toLeft'><span class='time'>"+time+"</span><div class='userName'>"+"系統"+" :</div><div class='message';>記住!一生只能改名3次!</div></div>";}
										if(obj.message.includes("餓")||obj.message.includes("吃")){messages.innerHTML+="<div class='toLeft'><span class='time'>"+time+"</span><div class='userName'>"+"系統"+" :</div><div class='message';>你豬嗎!?整天只想著吃吃吃~</div></div>";}
										if(obj.message.includes("系統")){messages.innerHTML+="<div class='toLeft'><span class='time'>"+time+"</span><div class='userName'>"+"系統"+" :</div><div class='message';>叫我幹嘛?</div></div>";}
										if(obj.message.includes("豬")){messages.innerHTML+="<div class='toLeft'><span class='time'>"+time+"</span><div class='userName'>"+"系統"+" :</div><div class='message';>不可以隨便罵人是豬</div></div>";}
										if(obj.message.includes("天氣")){messages.innerHTML+="<div class='toLeft'><span class='time'>"+time+"</span><div class='userName'>"+"系統"+" :</div><div class='message';>中央氣象局: https://www.cwb.gov.tw/V8/C/W/week.html</div></div>";}
										$(".message:last").linkify();
									}
								}
							//訊息來自系統時
							}else if(obj.username==="系統"){
								messages.innerHTML+="<div class='center'><b>"+obj.message+"</b></div>";
								number.innerHTML="<b>"+obj.guestNumbers+"</b>";
								guestnames=obj.guestNames;
								/*
								以下為顯示線上使用者有誰  但功能有缺陷  只能顯示登入之後才出現的使用者 
								var length=obj.message.length;
								if(obj.message.substring(length-5,length)==="進入聊天室"){
									usernames.push(obj.message.substring(0,length-6));
								}
								if(obj.message.substring(length-5,length)==="離開聊天室"){
									usernames.forEach(function(item, index, array) {//item代表元素 index代表元素位置 array代表usernames這個陣列
										if(item===obj.message.substring(0,length-6)){
											array.splice(index,1);//index表示要刪除的起始位置 1表示刪除1個元素
										}
									})
								}
								usernames.forEach(function(elt, i, array) {
									console.log(elt);
								})
								*/
							//訊息來自別人時
							}else{    
								//訊息為圖片時
								if(obj.message.substring(0,11)=="data:image/"){
									messages.innerHTML+="<div class='msgLeft'><div><span class='time'>"+time+"</span><span class='userName'>"+obj.username+" :</span></div><img id='localImg' src='"+obj.message+"'/></div>";
								//訊息為一般文字時
								}else{
									messages.innerHTML+="<div class='toLeft'><span class='time'>"+time+"</span><div class='userName'>"+obj.username+" :</div><div class='message';>"+obj.message+"</div></div>";
									$(".message:last").linkify();
								}								
							}						
					 	}
					 	//傳回的資料型態為ArrayBuffer
					 	if(event.data instanceof ArrayBuffer){
							alert("ArrayBuffer");
						}
													
						//id=messages的標籤 其高度>400px時 執行括號內程式
						if(parseInt(window.getComputedStyle(messages).height)>400){
							//window.location ="#bottom";//跳到name="bottom"的<a>標籤 但對話輸入框的游標會消失
							bottom.scrollIntoView();//滑動到該物件位置 游標依然在輸入框內
						}							
				 	}	    		 
		    }else{
			    info.innerHTML="<b>請更改名稱</b>";
			}
	    
	  	//點擊離開聊天室按鈕
	  	logout.onclick=function(){
	  		//傳送使用者離開的資訊給聊天室
			var loginInfo={username:"系統", message: name.value+ " 離開聊天室"	};
			webSocket.send(JSON.stringify(loginInfo));			
			webSocket.close();
			window.location.href="index.jsp";
		}
	    
		//滑鼠點擊送出按鈕後執行
		send.onclick=function(){
			if(webSocket && isConnect){
				if(input.innerHTML){
					if(input.innerHTML.replace(/&nbsp;/g, "").replace(/<br>/g, "").trim() ==""){
						input.innerHTML="";
						return false;
					} 
					var str=input.innerHTML.replace(/\n/g,"<br>");//輸入框中有換行時 改成<br>
					var obj={username:name.value ,message:str};
					webSocket.send(JSON.stringify(obj));				
					input.innerHTML="";//送出訊息後清空輸入欄
				}								
			}else{
				info.innerHTML="<b>連線中斷</b>";
				input.innerHTML="";
			}
		}
			
		//輸入欄按下enter鍵(keyCode === 13)時等於滑鼠點擊送出按鈕
		//keydown keyup keypress在一般的JS 無法使用input.onkeydown=function(event){}的寫法 會抓不到event.keyCode
		//jQuery就可以使用類似上述的寫法 更簡便 例如:$("#input").keydown(function(event) {  if(event.keyCode == 13){  }; });
		input.addEventListener("keypress", function(event) {
			  if (event.shiftKey && event.keyCode === 13) {				    
				  	event.preventDefault();	//取消原本input物件按下enter後的功能
				  	var length=input.innerHTML.length;
				  	//連續換行時只跳一行		  	
					input.innerHTML=input.innerHTML.substring(length-8, length)=="<br><br>"?  input.innerHTML+"<br>":input.innerHTML+"<br><br>";
					if (window.getSelection) {//表示用戶選擇的文本範圍或光標的當前位置  ie11 10 9 ff(fire fox) safari
		                input.focus(); //把游標移動到input物件  解決ff不獲取焦點無法定位問題
		                var range = window.getSelection();//建立range
		                range.selectAllChildren(input);//range 選擇input物件下所有子內容
		                range.collapseToEnd();//游標移至最後
		            }					
		  	}else if(event.keyCode === 13){
		  		event.preventDefault();		  	
		  		send.click();		  		
			}
		});
		
		//點擊該貼圖時 將該圖增加到訊息輸入框中
		$("div img").click(function(){
			if(webSocket && isConnect){
				input.innerHTML=input.innerHTML+"<img src='"+$(this).attr("src")+"'alt='No images' class='img'/>";
				if (window.getSelection) {//ie11 10 9 ff safari
	                input.focus(); //解決ff不獲取焦點無法定位問題
	                var range = window.getSelection();//建立range
	                range.selectAllChildren(input);//range 選擇input物件下所有子內容
	                range.collapseToEnd();//游標移至最後
	            }
			}			
		});
		
		//選擇檔案時
		$("#file").change(function(){
			if(webSocket && isConnect){
				var file=this.files[0];//this代表id=file的標籤  files為input的屬性之一  files本身是fileList 故用[0]取得第一個檔案
				var reader=new FileReader();
				reader.onload=function(){
					var obj={username:name.value ,message:this.result};
					webSocket.send(JSON.stringify(obj));
				}
				reader.readAsDataURL(file);//讀取完畢後 會將讀取結果放在result
			}else{
				info.innerHTML="<b>連線中斷</b>";				
			}			
		})	;

		//顯示目前聊天室內的使用者
		$("#who").click(function(){
			alert("目前訪客: \n"+guestnames);
		});
		
		//離開該分頁(包含按上一頁)或瀏覽器時 先離開聊天室
		window.addEventListener('beforeunload', function(event) {
            logout.click();
        });
		
	}
	
	</script>

</body>
</html>