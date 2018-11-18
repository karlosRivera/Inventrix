// JScript File
function GotoPage(sUrl)
{
//Developed By : Tridip Bhattacharjee

    window.document.location.href=sUrl;
    event.returnValue=false;
    event.cancel = true;
}

function SetDecimalPoints(num,points)
{
//Developed By : Tridip Bhattacharjee

     var str;
     str=""+num+"";
     var nuFullStr;
     nuFullStr="";
     var zeroStr;    
     zeroStr="";    
     var i;
     i=str.indexOf(".");       
     if(i<0)
     {  
      for(j=1;j<=points;j++)
      {
       zeroStr=zeroStr+"0";
      }
      nuFullStr=str+"."+zeroStr;
     }
     else
     {
      var len;
      len=str.length;
      var subs;
      subs=str.substring((i+1),(len+1));
      var subsLen;
      subsLen=subs.length;
      if(subsLen==points)
      {
       nuFullStr=str;
      }
      else if(subsLen<points)
      {
       var diff;
       diff=points-subsLen;
       for(k=1;k<=diff;k++)
       {
        zeroStr=zeroStr+"0";
       }
       nuFullStr=str+zeroStr;
      }
      else
      {
       var nuStr;
       nuStr=(subs.substr(0,points))+"."+(subs.substr(points,subs.length));
       var nuNum;
       nuNum=parseFloat(nuStr);
       nuNum=Math.round(nuNum);
       nuFullStr=(str.substring(0,i))+"."+nuNum;
      }
     }
     return nuFullStr;
 }

function TabOrder(buttonID)
{

  if(event.which || event.keyCode)
    {
        if ((event.which == 9) || (event.keyCode == 9))
        {
            document.getElementById(buttonID).focus();
            return false;
        }
    
        else
            return true;
    }
}

function SetProperCase(txtBoxRef)
{
//Developed By : Tridip Bhattacharjee

		var original = document.getElementById(txtBoxRef).value;
		var o_split = original.split(" ");
		var special_words = new Array('and', 'the', 'to', 'for', 'is', 'in', 'a', 'at', 'an', 'from', 'by', 'if', 'of');
		for (i=0;i<o_split.length;i++) {
			if (i == 0) {
				//always capitalize the first word
				o_split[i] = (o_split[i].substring(0,1)).toUpperCase() + o_split[i].substring(1);
			}
			else if(special_words.indexOf(o_split[i]) < 0) { 
			  	o_split[i] = (o_split[i].substring(0,1)).toUpperCase() + o_split[i].substring(1);
			}
		}
		retval = o_split.join(' ');
		document.getElementById(txtBoxRef).value = retval;
}