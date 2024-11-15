<cfif structKeyExists(url, "paymentId") AND structKeyExists(url, "PayerID")>
    <cfset clientId = "AWUUefBLuI_c08xPcRXR2YXIGrfcSG-Vr5cUs2yrT-ObZRFtFVY4W1dor7F1HBsWRRwAsLVFOT-7i1-k">
    <cfset clientSecret = "EDOJaL7RIBM0XlrFmFH43iscKercQm12Zz1pUTkURp-ya9NSJkK9VuadzEbkqgjizFwgJuzoIRrSLMsp">
    <cfset apiUrl = "https://api-m.sandbox.paypal.com"> <!-- Use sandbox for testing -->

    <!--- Extract parameters from URL --->
    <cfset paymentId = url.paymentId>
    <cfset payerId = url.PayerID>

    <!--- Get Access Token --->
    <cfhttp url="#apiUrl#/v1/oauth2/token" method="POST" result="tokenResponse">
        <cfhttpparam type="header" name="Authorization" value="Basic #ToBase64(clientId & ":" & clientSecret)#">
        <cfhttpparam type="formfield" name="grant_type" value="client_credentials">
    </cfhttp>

    <cfset tokenData = DeserializeJSON(tokenResponse.fileContent)>
    <cfset accessToken = tokenData.access_token>

    <!--- Execute Payment --->
    <cfset executePaymentRequest = {
        "payer_id" = payerId
    }>
    <cfhttp url="#apiUrl#/v1/payments/payment/#paymentId#/execute" method="POST" result="executeResponse">
        <cfhttpparam type="header" name="Authorization" value="Bearer #accessToken#">
        <cfhttpparam type="header" name="Content-Type" value="application/json">
        <cfhttpparam type="body" value="#SerializeJSON(executePaymentRequest)#">
    </cfhttp>
    <cfset executeData = DeserializeJSON(executeResponse.fileContent)>

    <!--- Extract PaymentID, TransactionID, and PayerID --->
    <cfset transactionID = "">
    <cfset paymentID = paymentId> <!-- Payment ID is directly extracted from URL -->
    <cfset payerID = payerId> <!-- Payer ID is directly extracted from URL -->

    <cfif StructKeyExists(executeData, "transactions")>
        <cfset transactions = executeData.transactions>
        <cfif ArrayLen(transactions) gt 0>
            <cfset transaction = transactions[1]>
            <cfif StructKeyExists(transaction, "related_resources")>
                <cfset relatedResources = transaction.related_resources>
                <cfif ArrayLen(relatedResources) gt 0>
                    <cfset relatedResource = relatedResources[1]>
                    <cfif StructKeyExists(relatedResource, "sale")>
                        <cfset sale = relatedResource.sale>
                        <cfset transactionID = sale.id>
                    </cfif>
                </cfif>
            </cfif>
        </cfif>
    </cfif>

    <!--- Set Plan Details --->
    <cfset planID = URL.planID>

    <cfif isDefined("session.id")>
        <cfset userID = session.id>
    <cfelseif isDefined("session.idd")>
        <cfset userID = session.id>
    </cfif>

    <cfset currentDate = now()>
    <cfset planDuration = 0>

    <cfif planID eq "1">
        <cfset planDuration = 1>
    <cfelseif planID eq "2">
        <cfset planDuration = 30>
    <cfelseif planID eq "3">
        <cfset planDuration = 180>
    </cfif>

<!---     <cfquery name="currentSubscription" datasource="BillingSystem">
        SELECT TOP 1 ExpirationDate 
        FROM UserSubscriptions 
        WHERE UserID = <cfqueryparam value="#userID#" cfsqltype="cf_sql_integer"> 
        ORDER BY ExpirationDate DESC
    </cfquery>

    <!-- Calculate the new start and expiration dates -->
    <cfif currentSubscription.recordCount gt 0 AND currentSubscription.ExpirationDate GT currentDate>
        <cfset newStartDate = dateAdd("d", 1, currentSubscription.ExpirationDate)>
    <cfelse>
        <cfset newStartDate = currentDate>
    </cfif>

    <cfset newExpirationDate = DateAdd("d", planDuration, newStartDate)> --->

    <cfquery name="currentSubscription" datasource="BillingSystem">
        SELECT TOP 1 ExpirationDate 
        FROM UserSubscriptions 
        WHERE UserID = <cfqueryparam value="#userID#" cfsqltype="cf_sql_integer"> 
        ORDER BY ExpirationDate DESC
    </cfquery>

    <!-- Calculate the new start and expiration dates -->
    <cfif currentSubscription.recordCount gt 0 AND currentSubscription.ExpirationDate GT currentDate>
        <cfset newStartDate =  currentSubscription.ExpirationDate>
    <cfelse>
        <cfset newStartDate = currentDate>
    </cfif>

    <cfset newExpirationDate = DateAdd("d", planDuration, newStartDate)>


    
    <cfquery datasource="BillingSystem">
        INSERT INTO UserSubscriptions (UserID, PlanID, StartDate, ExpirationDate, PaymentID, TransactionID, PayerID)
        VALUES (
            <cfqueryparam value="#userID#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#planID#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#newStartDate#" cfsqltype="cf_sql_timestamp">,
            <cfqueryparam value="#newExpirationDate#" cfsqltype="cf_sql_timestamp">,
            <cfqueryparam value="#paymentID#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#transactionID#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#payerID#" cfsqltype="cf_sql_varchar">
        )
    </cfquery>

   
    <cfoutput>
        <cfif  structKeyExists(session, "subscriptionAlertShown")>
            <!-- Only redirect to show the alert if it hasn't been shown before -->
            <!-- Delete session.subscriptionAlertShown before redirecting -->
            <cfset structDelete(session, "subscriptionAlertShown")>
        </cfif>
        <cfif planID GT 0>

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

<cfelse>

    <cfoutput>
        No payment information available. Ensure PayPal redirect is set up correctly.
    </cfoutput>
    
</cfif>
