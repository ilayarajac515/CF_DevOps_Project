<div class="modal fade" id="exampleModal#flag#" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form method="post" id="refModal">
      <!-- Add custom class to modal-dialog -->
      <div class="modal-dialog modal-1200">
        <div class="modal-content">
          <div class="modal-header d-flex justify-content-between align-items-center" style="background-color: ##5d7050;color: white;padding : 2px 5px 2px 5px;">
            <h6 class="modal-title" id="caseId">
              Case ID: <span id="modalCaseId">#getRecordsByContactID.caseID#</span> | Current Status: 
              <span style="font-weight: bold; font-size: 1.25em;" id="modalStatus">#getRecordsByContactID.status#</span>
            </h6>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
          </div>
          <div class="modal-body" id="modalContent">
            <!-- Content will be updated by JavaScript -->
            <cfquery datasource="internalassociate" name="getStatus">
              select * from tblReferralStatus
              where IncludeAsChoiceonStatusReport = 1
              order by Status
            </cfquery>
            <cfset counter=0>
            <cfloop query="getStatus">
                <cfset counter=counter+1>
              <cfif getStatus.ReferralStatus EQ 'NMF' OR getStatus.ReferralStatus EQ 'TA' OR getStatus.ReferralStatus EQ 'TE'>
                <input type="checkbox" id="" id="#getStatus.ReferralStatus#" data-id="#getStatus.ReferralStatus#" name="ReferralStatus" value="#getStatus.ReferralStatus#" >
                 
                <cfset textBoxHtml = '<input type="text" name="feeAmount" id="feeAmount" value="" style="border-left: 0px !important; border-right: 0px !important; border-top: 0px !important; width: 100px;" />'>
                <cfset updatedString = REReplace(getStatus.Status, "_+", textBoxHtml, "ALL")>
                <label for="#getStatus.ReferralStatus#">#updatedString#</label><br>
              <cfelse>
                <input type="checkbox" data-id="#getStatus.ReferralStatus#" data-id="#getStatus.ReferralStatus#"  name="#getStatus.ReferralStatus#" value="#getStatus.ReferralStatus#">
                <label for="#getStatus.ReferralStatus#">#getStatus.Status#</label><br>
              </cfif>
            </cfloop>
          </div>
          <div class="modal-footer" style="padding : 2px 5px 2px 5px;">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="background-color: ##ff7c3e;color: white;padding : 2px 5px 2px 5px;">Close</button>
            <button type="button" class="btn btn-primary updatebtn" style="background-color: ##ff7c3e;color: white;padding : 2px 5px 2px 5px;">Save changes</button>
          </div>
        </div>
      </div>
    </form>
  </div>

  
  <script>
        $(document).ready(function() {
      
        $('.updatebtn').on('click',function(){
            var checkeddata = [];
            
           
            $('input[type="checkbox"]:checked').each(function() {
                selectedStatus.push($(this).attr('data-id'));
            });
            alert(1);

          
            /* if (selectedStatus.length>0){
                $.ajax({
                    url:'referral_updatestatus.cfc?method=updatestatus',
                    type:'POST',
                    data:{ 
                        statuse: selectedStatus 
                    },
                    success: function(response) {
                        alert('update sucessfully');
                       
                    }
                });
            }  */
        });
    });

  </script>


