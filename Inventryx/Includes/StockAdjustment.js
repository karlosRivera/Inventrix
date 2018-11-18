// JScript File
//Development by :- Arnab Dutta

function CalculateTotalAmount()
{
    
}

 function CalculateTotalAmount()
    {
            var iRow=0;
            iRow=parseInt(document.getElementById('hdnTotalRows').value);
            for(i=2;i<eval(iRow+2);i++)
            {
                var total=0;
                ctrlPhysicalStockID='ctl00_mainContent_dgStockAdjustment_ctl0'+i+'_tbPhysicalStock';
                //alert(document.getElementById(ctrlPhysicalStockID).value);
                total=total+eval(document.getElementById(ctrlPhysicalStockID).value);
               // alert(total);
                document.getElementById('ctl00_mainContent_txtPhysicalStock').value=total;   
            }
    }
    
    function Test()
    {
        alert('aaaa');
        var iRow=0;
        iRow=parseInt(document.getElementById('hdnTotalRows').value);
        for(i=2;i<eval(iRow+2);i++)
        {
            var Total=0;
            ctrlBookStockID='ctl00_mainContent_dgStockAdjustment_ctl0'+i+'_lbBookStock';
            
            total=total+eval(document.getElementById(ctrlPhysicalStockID).value);
            alert(total);
            document.getElementById('ctl00_mainContent_txtBookStock').value=total;
        }
    }