
// JScript File


//Developed By : Indranil Roy
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
        
        ctrlNoOfLabourID='ctl00_mainContent_dgList_ctl0'+i+'_txtNoOfLabour';
        if(document.getElementById(ctrlNoOfLabourID).value=='')
        {
            document.getElementById(ctrlNoOfLabourID).value="0";
        }

        ctrlWorkingHourID='ctl00_mainContent_dgList_ctl0'+i+'_txtWorkingHour';
        if(document.getElementById(ctrlWorkingHourID).value=='')
        {
            document.getElementById(ctrlWorkingHourID).value="0";
        }

        ctrlAmtID='ctl00_mainContent_dgList_ctl0'+i+'_txtAmount';
        
        iRate=SetDecimalPoints(document.getElementById(ctrlRateID).value,2);
        iNoOfLabour=SetDecimalPoints(document.getElementById(ctrlNoOfLabourID).value,0);
        iWorkingHour=SetDecimalPoints(document.getElementById(ctrlWorkingHourID).value,2);
        document.getElementById(ctrlAmtID).value=SetDecimalPoints((iRate*iNoOfLabour*iWorkingHour),2);
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
    document.getElementById('ctl00_mainContent_txtJobSubTotal').value=SetDecimalPoints(SubTotal,2);
    
    //VatPernentage=SetDecimalPoints(document.getElementById('ctl00_mainContent_txtVatRate').value,0);
    //document.getElementById('ctl00_mainContent_txtVatAmt').value=SetDecimalPoints(((parseFloat(VatPernentage) * parseFloat(SubTotal))/100),2)
    //VatAmt=SetDecimalPoints(document.getElementById('ctl00_mainContent_txtVatAmt').value,2);
    //document.getElementById('ctl00_mainContent_txtInvTotal').value=SetDecimalPoints((eval(parseFloat(SubTotal)+parseFloat(VatAmt))),2);
 }