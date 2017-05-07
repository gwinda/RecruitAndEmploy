function getExpDate(days, hours, minutes) {   
  
    var expDate = new Date( );   
  
    if (typeof days == "number" && typeof hours == "number" &&    
  
        typeof hours == "number") {   
  
        expDate.setDate(expDate.getDate( ) + parseInt(days));   
  
        expDate.setHours(expDate.getHours( ) + parseInt(hours));   
  
        expDate.setMinutes(expDate.getMinutes( ) + parseInt(minutes));   
  
        return expDate.toGMTString( );   
  
    }   
  
}   
  
      
  
// utility function called by getCookie( )   
  
function getCookieVal(offset) {   
  
    var endstr = document.cookie.indexOf (";", offset);   
  
    if (endstr == -1) {   
  
        endstr = document.cookie.length;   
  
    }   
  
    return decodeURIComponent (document.cookie.substring(offset, endstr));   
  
}   function getidfk(){	var id =document.getElementById("idfk").value;	alert(id);	return id;}  
// primary function to retrieve cookie by name   
  
function getCookie(name) {   
  
    var arg = name + "=";   
  
    var alen = arg.length;   
  
    var clen = document.cookie.length;   
  
    var i = 0;   
  
    while (i < clen) {   
  
        var j = i + alen;   
  
        if (document.cookie.substring(i, j) == arg) {   
  
            return getCookieVal(j);   
  
        }   
  
        i = document.cookie.indexOf(" ", i) + 1;   
  
        if (i == 0) break;    
  
    }   
  
    return "";   
  
}   
  
      
  
// store cookie value with optional details as needed   
  
function setCookie(name, value, expires, path, domain, secure) {   
  
    document.cookie = name + "=" + escape (value) +   
  
        ((expires) ? "; expires=" + expires : "") +   
  
        ((path) ? "; path=" + path : "") +   
  
        ((domain) ? "; domain=" + domain : "") +   
  
        ((secure) ? "; secure" : "");   
  
}   
  
      
  
// remove the cookie by setting ancient expiration date   
  
function deleteCookie(name,path,domain) {   
  
    if (getCookie(name)) {   
  
        document.cookie = name + "=" +   
  
            ((path) ? "; path=" + path : "") +   
  
            ((domain) ? "; domain=" + domain : "") +   
  
            "; expires=Thu, 01-Jan-70 00:00:01 GMT";   
  
    }       function delCookie(name)    {    var exp = new Date();    exp.setTime(exp.getTime() - 1);    var cval=getCookie(name);    if(cval!=null)    document.cookie= name + "="+cval+";expires="+exp.toGMTString();    }
  
}


function get_timer(name){
  var interval = getCookie("timer["+name+"][interval]");
  var url = getCookie("timer["+name+"][url]");
  if(interval== undefined || interval == null || url== undefined || url == null ){
	  return null;
  }else{
	  return {interval:interval,
		      url:url};
  }
}

function get_source_url() {
	var source_url = getCookie("source_url");
	if (source_url == undefined || source_url == null) {
		return null;
	} else {
		return source_url;
	}
}

function get_redirect_url() {
	var redirect_url = getCookie("redirect_url");
	if (redirect_url == undefined || redirect_url == null) {
		return null;
	} else {
		return redirect_url;
	}
}
