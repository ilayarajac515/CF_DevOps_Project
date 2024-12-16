<cfscript>
  adminObj = createObject("component", "cfide.adminapi.administrator");
  
  datasourceObj = createObject("component", "cfide.adminapi.datasource");
  datasourceObj.setMSSQL(
    dsnName="BillingSystem",
    host="13.61.145.48",
    database="BillingSystem",
    username="SA",
    password="Admin@123",
    port="1433",
    description="Sample datasource"
  );
</cfscript>
