<cfscript>
    // ColdFusion Admin Login
    adminObj = createObject("component", "cfide.adminapi.administrator");
    datasourceObj = createObject("component", "cfide.adminapi.datasource");

    datasourceObj.setMSSQL(
        NAME = "BillingSystem", // Mandatory datasource name
        host = "16.171.55.133", // Database host
        database = "BillingSystem", // Database name
        username = "SA", // Database username
        password = "Admin@123", // Database password
        port = "1433", // Database port (Default MSSQL: 1433)
        description = "This is a test datasource"
    );
</cfscript>
