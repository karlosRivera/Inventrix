//Developed By : Tridip Bhattacharjee


function CalculateTotalAmount()
{
    var iRate=0,iQty=0,iAmt=0,iRow=0;
    var retQty=0,GrnQty=0;
    
    iRow=parseInt(document.getElementById('hdnTotalRows').value);
    for(i=2;i<eval(iRow+2);i++)
    {
        ctrlRateID='ctl00_mainContent_dgList_ctl0'+i+'_txtRate';
        if(document.getElementById(ctrlRateID).value=='')
        {
            document.getElementById(ctrlRateID).value="0";
        }

        ctrlRetQtyID='ctl00_mainContent_dgList_ctl0'+i+'_txtRetQty';
        if(document.getElementById(ctrlRetQtyID).value=='')
        {
            document.getElementById(ctrlRetQtyID).value="0";
            retQty=0;
        }
        retQty=document.getElementById(ctrlRetQtyID).value;
        
        ctrlGRNQtyID='ctl00_mainContent_dgList_ctl0'+i+'_lblGRNQty';
        GrnQty=document.getElementById(ctrlGRNQtyID).innerText;
        
        if(parseFloat(retQty) > parseFloat(GrnQty))
        {
            alert('Return Qty can not be more than Grn Qty');
            document.getElementById(ctrlRetQtyID).value=0;
            return false;
        }
        ctrlAmtID='ctl00_mainContent_dgList_ctl0'+i+'_txtAmount';
        
        iRate=SetDecimalPoints(document.getElementById(ctrlRateID).value,2);
        iQty=SetDecimalPoints(retQty,3);
        document.getElementById(ctrlAmtID).value=SetDecimalPoints((iRate*iQty),2);
    }

    CalculateTotal();
}

function CalculateTotal()
{
    var i=0;
    var SubTotal=0;
    var iRow=0,VatPernentage=0,VatAmt=0;
    var ctrlID;
    
    iRow=parseInt(document.getElementById('hdnTotalRows').value);
    
    for(i=2;i<eval(iRow+2);i++)
    {
        ctrlID='ctl00_mainContent_dgList_ctl0'+i+'_txtAmount';
        SubTotal= eval(SubTotal)+eval(parseFloat(document.getElementById(ctrlID).value));
    }
    
    SubTotal=SetDecimalPoints(SubTotal,2);
    document.getElementById('ctl00_mainContent_txtSubTotal').value=SetDecimalPoints(SubTotal,2);
    VatPernentage=SetDecimalPoints(document.getElementById('ctl00_mainContent_txtSubVatRate').value,0);
    document.getElementById('ctl00_mainContent_txtSubVatAmt').value=SetDecimalPoints(((parseFloat(VatPernentage) * parseFloat(SubTotal))/100),2)
    VatAmt=SetDecimalPoints(document.getElementById('ctl00_mainContent_txtSubVatAmt').value,2);
    document.getElementById('ctl00_mainContent_txtPOTotal').value=SetDecimalPoints((eval(parseFloat(SubTotal)+parseFloat(VatAmt))),2);
 }
