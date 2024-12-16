<cfscript>
adminObj = createObject("component", "cfide.adminapi.administrator");
datasourceObj = createObject("component", "cfide.adminapi.datasource");

// Datasource configuration
datasourceObj.setMSSQLDSN(
    "BillingSystem", // DSN name
    "13.61.145.48",       // Server name
    "BillingSystem",       // Database name
    "SA",                  // Username
    "Admin@123",           // Password
    "1433",                // Port
    "",                    // No custom arguments
    "",                    // No default arguments
    "no"                   // Trusted connection
);
</cfscript>

