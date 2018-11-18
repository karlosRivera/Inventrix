﻿// Developed By : Tridip Bhattacharjee

function ResetTextBoxes(iChildRowNo,StartRowNo)
{
    var j=0;
    var i=StartRowNo;
    for(j=2;j<eval(iChildRowNo+2);j++)
    {
        document.getElementById('ctl00_mainContent_dgGrid_ctl0'+i+'_dgInner_ctl0'+j+'_txtLiftQty').value=0;
    }
    
}
function DistributeQty(iParentRowNo,iChildRowNo,StartRowNo)
{
    var i=0,j=0;
    var ParentQtyVal=0,BalinvQty=0;
    
    ResetTextBoxes(iChildRowNo,StartRowNo);
    
    if(!ValidateInput(iParentRowNo,iChildRowNo,StartRowNo))
    {
        return false;
    }
    
    for(i=StartRowNo;i<eval(iParentRowNo+2);i++)
    {
        ParentQtyVal=document.getElementById('ctl00_mainContent_dgGrid_ctl0'+i+'_txtDelQty').value;
        BalinvQty=document.getElementById('ctl00_mainContent_dgGrid_ctl0'+i+'_lblBalinvQty').innerText;
        
        if(BalinvQty >= ParentQtyVal)
        {
            for(j=2;j<eval(iChildRowNo+2);j++)
            {
                if(ParentQtyVal>0)
                {
                    var balQty=document.getElementById('ctl00_mainContent_dgGrid_ctl0'+i+'_dgInner_ctl0'+j+'_lblBalQty').innerText;
                    if(iChildRowNo>1)
                    {
                        if(parseFloat(ParentQtyVal)>=parseFloat(balQty))
                        {
                            var tmpVal=(parseFloat(ParentQtyVal)-parseFloat(balQty));
                            document.getElementById('ctl00_mainContent_dgGrid_ctl0'+i+'_dgInner_ctl0'+j+'_txtLiftQty').value=balQty;
                            ParentQtyVal=tmpVal;
                        }
                        else
                        {
                            //document.getElementById('ctl00_mainContent_dgGrid_ctl0'+i+'_dgInner_ctl0'+j+'_txtLiftQty').value=ParentQtyVal;
                            //var tmpVal=(parseFloat(balQty)-parseFloat(ParentQtyVal));
                            document.getElementById('ctl00_mainContent_dgGrid_ctl0'+i+'_dgInner_ctl0'+j+'_txtLiftQty').value=ParentQtyVal;
                            ParentQtyVal=0;
                        }
                    }
                    else
                    {
                        document.getElementById('ctl00_mainContent_dgGrid_ctl0'+i+'_dgInner_ctl0'+j+'_txtLiftQty').value=ParentQtyVal;
                    }
                }
            }
        }
        else
        {
            alert("Delivery Qty can\'t be more than P.Inv. Qty");
            document.getElementById('ctl00_mainContent_dgGrid_ctl0'+i+'_txtDelQty').value=0;
            return false;
        }
    }

}

function ValidateInput(iParentRowNo,iChildRowNo,StartRowNo)
{
    var iSum=0;
    var i=0,j=0;
    var ParentQtyVal=0,BalinvQty=0;

    for(i=StartRowNo;i<eval(iParentRowNo+2);i++)
    {
        
        ParentQtyVal=document.getElementById('ctl00_mainContent_dgGrid_ctl0'+i+'_txtDelQty').value;
        for(j=2;j<eval(iChildRowNo+2);j++)
        {
            iSum=iSum+parseFloat(document.getElementById('ctl00_mainContent_dgGrid_ctl0'+i+'_dgInner_ctl0'+j+'_lblBalQty').innerText);
        }
        if(parseFloat(ParentQtyVal)>parseFloat(iSum))
        {
            alert("Delivery Qty and sum of lift qty should be equal");
            for(j=2;j<eval(iChildRowNo+2);j++)
            {
                document.getElementById('ctl00_mainContent_dgGrid_ctl0'+i+'_dgInner_ctl0'+j+'_txtLiftQty').value=0;
                document.getElementById('ctl00_mainContent_dgGrid_ctl0'+i+'_txtDelQty').value=0;
            }
            return false;
        }
        else
        {
            return true;
        }
    }
}
