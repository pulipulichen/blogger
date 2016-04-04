
function CheckSpan(tablename,j){
//alert(tablename);
    var kk;
    for(i=1;i<=j;i++)
    {
    //kk=document.all("menu"+i);
    kk=document.getElementById("menu"+i);
    if(tablename==kk.id)
	    {
		    if (document.getElementById(tablename).style.display=="none")
		    {
		        document.getElementById(tablename).style.display="block";
		        }
		        else
		        {
		        document.getElementById(tablename).style.display="none";
		        }
	        }
    else
	    {
		    kk.style.display="none";
	    }
    }
    //alert(kk);
    //alert(tablename.id);
//    if(tablename.id==kk.id)
//	    {
//		    if (tablename.style.display=="none")
//		    {
//		        tablename.style.display="block";
//		        }
//		        else
//		        {
//		        tablename.style.display="none";
//		        }
//	        }
//    else
//	    {
//		    kk.style.display="none";
//	    }
//    }
}
    
    
function CheckSpan2(tablename,j,k, path){
    var kk;
    for(i=1;i<=k;i++)
    {
    //kk=document.all(tablename+i);
    kk=document.getElementById(tablename+i);
    if(i==j)
	    {
		    //if (document.all(tablename+j).style.display=="none"){document.all(tablename+j).style.display="block";}else{document.all(tablename+j).style.display="none";}
	        if (document.getElementById(tablename + j).style.display == "none") {
	            document.getElementById(tablename + j).style.display = "block";
	            document.getElementById(tablename + j + "_icon").src = path + "images/icon_08.gif";
	        } else {
	            document.getElementById(tablename + j).style.display = "none";
	            document.getElementById(tablename + j + "_icon").src = path + "images/icon_07.gif";
	        }
	    }
    else
	    {
	        kk.style.display = "none";
	        if (document.getElementById(tablename + i + "_icon").src.indexOf("images/icon_07.gif") < 0) {
	            document.getElementById(tablename + i + "_icon").src = path + "images/icon_07.gif";
	            //alert(tablename+i+"_icon");
	        }
	    }
    }
    }

function MM_preloadImages() { //v3.0
      var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
        var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
        if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
    }




function fbs_click() {    
	t = '檔案管理局全球資訊網';  
	u=location.href;
		msg = encodeURIComponent(location.href)+'&t='+encodeURIComponent(t);
        window.open('http://www.facebook.com/sharer.php?u=' + msg , 'sharer', 'toolbar=0,status=0,width=626,height=436');
    }

    function plurk_click() {
	t = '99檔案管理局全球資訊網';  
	msg = encodeURIComponent(location.href).concat(' (').concat(encodeURIComponent(t)).concat(')');  
        window.open('http://www.plurk.com/?qualifier=shares&status='+msg);
    }
var onclickcode;
    function mouse(obj,e){
        var code;
        if (!e) var e = window.event;

        if(e.KeyCode)
            code = e.KeyCode;
        else if(e.which)
            code = e.which;
        else if(e.button)
            code = e.button;
        else code = "0";
        if((code=="3" && (navigator.appName == "Netscape" || navigator.appVersion.indexOf("MSIE") == -1)) || (code=="2" && navigator.appVersion.indexOf("MSIE") != -1))
        {
            alert("請勿複製圖片!!");
            //obj.style = "-moz-user-focus: ignore;-moz-user-input: disabled;-moz-user-select: none;";
            onContextMenu="return false";
            return false;
        }
        return true;
    }
    function key(obj,e){
        if(e.keyCode == 13){
//            alert(e.KeyCode);
        }
    }
function right(e) 
{
        var code;
        if (!e) var e = window.event;

        if(e.KeyCode)
            code = e.KeyCode;
        else if(e.which)
            code = e.which;
        else if(e.button)
            code = e.button;
        else code = "0";
if((code=="3" && (navigator.appName == "Netscape" || navigator.appVersion.indexOf("MSIE") == -1)) || (code=="2" && navigator.appVersion.indexOf("MSIE") != -1))
{
    alert("請勿任意複製本站圖片");
    onContextMenu="return false";
    return false;
}
return true;
}
