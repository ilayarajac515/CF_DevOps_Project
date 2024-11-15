<cfset clientId = "AWUUefBLuI_c08xPcRXR2YXIGrfcSG-Vr5cUs2yrT-ObZRFtFVY4W1dor7F1HBsWRRwAsLVFOT-7i1-k">
<cfset clientSecret = "EDOJaL7RIBM0XlrFmFH43iscKercQm12Zz1pUTkURp-ya9NSJkK9VuadzEbkqgjizFwgJuzoIRrSLMsp">
<cfset apiUrl = "https://api-m.sandbox.paypal.com"> <!-- Use sandbox for testing -->


<cfhttp url="#apiUrl#/v1/oauth2/token" method="POST" result="tokenResponse">
    <cfhttpparam type="header" name="Authorization" value="Basic #ToBase64(clientId & ":" & clientSecret)#">
    <cfhttpparam type="formfield" name="grant_type" value="client_credentials">
</cfhttp>
<cfset tokenData = DeserializeJSON(tokenResponse.fileContent)>
<cfset accessToken = tokenData.access_token>


<cfset planID = "" />
<cfset totalAmount = "" />
<cfset description = "" />
<cfset userID = "" />

<cfif FORM.plan eq "free_trial">

    <cfquery name="checkFreeTrial" datasource="BillingSystem">
        SELECT COUNT(*) AS TrialCount
        FROM UserSubscriptions us
        JOIN Users_BS u ON us.UserID = u.UserID
        WHERE u.Email = <cfqueryparam value="#session.email_id#" cfsqltype="cf_sql_varchar">
        AND us.PlanID = 1
    </cfquery>

    <cfif checkFreeTrial.TrialCount gt 0>
        <cfif structKeyExists(session, "subscriptionAlertShown")>
            <cfset structDelete(session, "subscriptionAlertShown")>
        </cfif>
        <cfset url.showNotification = "true">
        <cflocation url="home.cfm?showNotification=true" addToken="false">
        <cfabort>
    </cfif>





<!---     <cfset planID = "1" />
    <cfset totalAmount = "0.00" />
    <cfset description = "Free Trial - 1 Day" />
    <cfset currentDate = now()>
    <cfset expirationDate = DateAdd("d", 1, currentDate)> <!-- 1 Day Trial -->
    <cfset freetrail="freetrail"> --->

    <cfset planID = "1" />
    <cfset totalAmount = "0.00" />
    <cfset description = "Free Trial - 2 Minutes" />
    <cfset currentDate = now()>
    <cfset expirationDate = DateAdd("n", 1, currentDate)> <!-- 2 Minutes Trial -->
    <cfset freetrail = "freetrail">

    <!--- <cfset planID = "1" />
    <cfset totalAmount = "0.00" />
    <cfset description = "Free Trial - 15 Seconds" />
    <cfset currentDate = now()>
    <cfset expirationDate = DateAdd("s", 15, currentDate)> <!-- 15 Seconds Trial -->
    <cfset freetrail = "freetrail"> --->

    


    <cfif isDefined("session.id")>
        <cfset userID = session.id>
    <cfelseif isDefined("session.idd")>
        <cfset userID = session.id>
    </cfif>
    

    <cfquery datasource="BillingSystem">
        INSERT INTO UserSubscriptions (UserID, PlanID, StartDate, ExpirationDate, PaymentID, TransactionID, PayerID)
        VALUES (
            <cfqueryparam value="#userID#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#planID#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#currentDate#" cfsqltype="cf_sql_timestamp">,
            <cfqueryparam value="#expirationDate#" cfsqltype="cf_sql_timestamp">,
            <cfqueryparam value="#freetrail#" cfsqltype="cf_sql_varchar">, 
            <cfqueryparam value="#freetrail#" cfsqltype="cf_sql_varchar">, 
            <cfqueryparam value="#freetrail#" cfsqltype="cf_sql_varchar"> 
        )
    </cfquery>

    <cfoutput>
<!--- 
        <cfif planID eq "1">
            <cfset currentDateTime = now()>
            <cfset a = createObject("component", "billing_system")>
            <cfset checksubscribe = a.subscribecheck(currentDateTime)>
            <cfif checksubscribe.recordCount GT 0>
                <cfset expirationDate = checksubscribe.ExpirationDate[1]>
                <cfif currentDateTime GT expirationDate>
                    <cflocation url="home.cfm" addToken="false"> 
                <cfelse>
                    <cfset session.expire = expirationDate>
                    <cflocation url="home.cfm?subscription=success&planID=#planID#" addToken="false"> 
                </cfif>
            <cfelse>
                <cflocation url="home.cfm" addToken="false"> 
            </cfif>
            
            <!--- <cflocation url="home.cfm?subscription=success&planID=#planID#" addToken="false"> --->
        <cfelse>
            <cflocation url="index.cfm?" addToken="false"> 
        </cfif> --->
        <cfif  structKeyExists(session, "subscriptionAlertShown")>
            <!-- Only redirect to show the alert if it hasn't been shown before -->
            <!-- Delete session.subscriptionAlertShown before redirecting -->
            <cfset structDelete(session, "subscriptionAlertShown")>
        </cfif>
        

        <cfif planID eq "1">
            <cfset currentDateTime = now()>
            <cfset a = createObject("component", "billing_system")>
            <cfset checksubscribe = a.subscribecheck(currentDateTime)>
            <cfif checksubscribe.recordCount GT 0>
                <cfset expirationDate = checksubscribe.ExpirationDate[1]>
                <cfif currentDateTime GT expirationDate>
                    <cflocation url="home.cfm" addToken="false"> 
                <cfelse>
                    <cfset session.expire = expirationDate>
                    <cfif NOT structKeyExists(session, "subscriptionAlertShown")>
                        <!-- Only redirect to show the alert if it hasn't been shown before -->
                        <cflocation url="home.cfm?subscription=success&planID=#planID#" addToken="false"> 
                    <cfelse>
                        <cflocation url="home.cfm?notpasses" addToken="false">
                    </cfif>
                </cfif>
            <cfelse>
                <cflocation url="home.cfm" addToken="false"> 
            </cfif>
        <cfelse>
            <cflocation url="index.cfm?" addToken="false"> 
        </cfif>
        
    </cfoutput>

    <cfabort>
    

<cfelseif FORM.plan eq "one_month">
    <cfset planID = "2" />

    <cfif isDefined("session.id")>
        <cfset userID = session.id>
    <cfelseif isDefined("session.idd")>
        <cfset userID = session.id>
    </cfif>

    <cfset totalAmount = "30.00" />
    <cfset description = "One Month Subscription" />
    
<cfelseif FORM.plan eq "six_months">
    <cfset planID = "3" />

    <cfif isDefined("session.id")>
        <cfset userID = session.id>
    <cfelseif isDefined("session.idd")>
        <cfset userID = session.id>
    </cfif>

    <cfset totalAmount = "150.00" />
    <cfset description = "Six Months Subscription" />
    
</cfif>

<!--- Create Payment Request --->
<cfset paymentRequest = {
    "intent" = "sale",  
    "payer" = {
        "payment_method" = "paypal"
    },
    "transactions" = [
        {
            "amount" = {
                "total" = totalAmount,
                "currency" = "USD"
            },
            "description" = description
        }
    ],
    "redirect_urls" = {
        "return_url" = "http://selvam.local/CF/Billing_Software/handle_return2.cfm?planID=#planID#&userID=#userID#",
        "cancel_url" = "http://selvam.local/CF/Billing_Software/handle_cancel1.cfm"
    }
}>

<cfhttp url="#apiUrl#/v1/payments/payment" method="POST" result="paymentResponse">
    <cfhttpparam type="header" name="Authorization" value="Bearer #accessToken#">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
    <cfhttpparam type="body" value="#SerializeJSON(paymentRequest)#">
</cfhttp>

<cfset paymentData = DeserializeJSON(paymentResponse.fileContent)>

<!--- Extract Approval URL and Redirect --->
<cfif StructKeyExists(paymentData, "links")>
    <cfset approvalUrl = "">
    <cfloop array="#paymentData.links#" index="link">
        <cfif link.rel eq "approval_url">
            <cfset approvalUrl = link.href>
            <cfbreak>
        </cfif>
    </cfloop>
    <cfif approvalUrl neq "">
        <cfoutput>
            <script>
                window.location.href = "#approvalUrl#";
            </script>
        </cfoutput>
    <cfelse>
        <cfoutput>
            <p>No approval URL found. Please check the PayPal API response for errors.</p>
        </cfoutput>
    </cfif>
<cfelse>
    <cfoutput>
        <p>No approval URL found. Please check the PayPal API response for errors.</p>
    </cfoutput>
</cfif>
