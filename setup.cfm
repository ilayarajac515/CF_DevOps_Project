<cfscript>
adminObj = createObject("component", "cfide.adminapi.administrator");
dataSourceObj = createObject("component", "cfide.adminapi.datasource");
dataSourceObj.setMSSQL(
    "BillingSystem",
    "18.61.61.171",
    1433,
    "BillingSystem",
    "SA",
    "Admin@123",
    "",
    false,
    false
);
</cfscript>
