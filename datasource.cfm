<cftry>
    <cfadmin action="createDatasource"
        type="mssql"
        name="BillingSystem"
        host="13.61.145.48"
        database="BillingSystem"
        username="SA"
        password="Admin@123"
        driver="Microsoft SQL Server"
        port="1433"
        application="false">
    <cfcatch>
        <cfoutput>#cfcatch.message#</cfoutput>
    </cfcatch>
</cftry>
