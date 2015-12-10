var xhr=null;

function createXHR(){
   if(window.XMLHttpRequest){
      return new XMLHttpRequest();
   }else if(window.ActiveXObject){
      try{
         return new ActiveXObject("Msxml2.XMLHTTP");
      }catch (e1) {
         try{
            return new ActiveXObject("Microsoft.XMLHTTP");
         }catch (e2) {
            return null;
         }
      }
   }else{
      return null;
   }
}

function sendRequest(methed, url, callback, params){
   //alert("params : " + params);
   xhr=createXHR();
   
   var httpMethod=methed;
   if(httpMethod!="GET" && httpMethod!="POST"){
      httpMethod="GET";
   }
   
   var httpParam=(params==null || params=="") ? null:params;
   var httpUrl=url;
   if(httpMethod=="GET" && httpParam!=null){
      httpUrl+="?"+httpParam;
   }
   //alert("sendRequest httpUrl ------ " + httpUrl);
   xhr.open(httpMethod, httpUrl, true ,httpParam);
   xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   xhr.send(httpMethod=="POST" ? httpParam : null);
   xhr.onreadystatechange=callback;
}