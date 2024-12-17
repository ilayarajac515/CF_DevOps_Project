<cfscript>
    // Credentials
    adminUsername = "admin";
 
    // Database Details
    datasourceName = "BillingSystem";
    dbServer = "13.51.159.247";
    dbName = "BillingSystem";
    dbPort = "1433";
    dbUsername = "SA";
    dbPassword = "Admin@123";
    dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
 
    // Login to ColdFusion Admin
    adminObj = createObject("component", "cfide.adminapi.administrator");
    adminObj.login(adminUsername);
 
    // Add the datasource - fixing parameters order
    datasourceObj = createObject("component", "cfide.adminapi.datasource");
    datasourceObj.setMSSQL(
        name = datasourceName,       // CF Data Source Name
        host = dbServer,             // Server
        database = dbName,           // Database Name
        username = dbUsername,       // Database Username
        password = dbPassword,       // Database Password
        port = dbPort,               // Database Port
        description = ""             // Blank description
    );
</cfscript>
