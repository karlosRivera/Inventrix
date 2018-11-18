//Developed By : Tridip Bhattacharjee


function CalculateTotalAmount()
{
    var iRate=0,iQty=0,iAmt=0,iRow=0;
    
    iRow=parseInt(document.getElementById('hdnTotalRows').value);
    for(i=2;i<eval(iRow+2);i++)
    {
        ctrlRateID='ctl00_mainContent_dgList_ctl0'+i+'_txtRate';
        if(document.getElementById(ctrlRateID).value=='')
        {
            document.getElementById(ctrlRateID).value="0";
        }

        ctrlQtyID='ctl00_mainContent_dgList_ctl0'+i+'_txtQty';
        if(document.getElementById(ctrlQtyID).value=='')
        {
            document.getElementById(ctrlQtyID).value="0";
        }

        ctrlAmtID='ctl00_mainContent_dgList_ctl0'+i+'_txtAmount';
        
        iRate=SetDecimalPoints(document.getElementById(ctrlRateID).value,2);
        iQty=SetDecimalPoints(document.getElementById(ctrlQtyID).value,3);
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
