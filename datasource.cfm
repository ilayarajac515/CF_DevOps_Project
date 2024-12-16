<cfscript>
adminObj = createObject("component", "cfide.adminapi.administrator");
dataSourceObj = createObject("component", "cfide.adminapi.datasource");
dataSourceObj.setMSSQL(
    "BillingSystem",
    "13.60.224.241",
    1433,
    "BillingSystem",
    "SA",
    "Admin@123",
    "",
    false,
    false
);
</cfscript>

<cfscript>
adminObj = createObject("component", "cfide.adminapi.administrator");
datasourceObj = createObject("component", "cfide.adminapi.datasource");

// Admin password login
adminObj.login("YourAdminPassword");

// Datasource configuration
datasourceObj.setMSSQLDSN(
    "yourDatasourceName", // DSN name
    "yourServerName",     // Server name
    "yourDatabaseName",   // Database name
    "yourUsername",       // Username
    "yourPassword",       // Password
    "1433",               // Port
    "",                   // No custom arguments
    "",                   // No default arguments
    "no"                  // Trusted connection
);
</cfscript>

