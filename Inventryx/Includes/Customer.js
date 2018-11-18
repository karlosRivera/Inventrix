

// JScript File

function CopyBillAddress()
    {
        if (document.getElementById('ctl00_mainContent_chkCopyBillAddr').checked)
            {
                document.getElementById('ctl00_mainContent_txtShippingAddress').value=document.getElementById('ctl00_mainContent_txtBillingAddress').value;
                document.getElementById('ctl00_mainContent_txtShippingCity').value=document.getElementById('ctl00_mainContent_txtBillingCity').value;
                document.getElementById('ctl00_mainContent_txtShippingPin').value=document.getElementById('ctl00_mainContent_txtBillingPin').value;
            }
        else
            {
                document.getElementById('ctl00_mainContent_txtShippingAddress').value="";
                document.getElementById('ctl00_mainContent_txtShippingCity').value="";
                document.getElementById('ctl00_mainContent_txtShippingPin').value="";
            }
    }
    
