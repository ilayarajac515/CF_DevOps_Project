<cfscript>
    // Datasource details
    datasourceName = "BillingSystem";
    datasourceConfig = {
        host = "13.60.224.241", // Change to your database server hostname or IP
        database = "BillingSystem", // Name of your database
        username = "SA", // Database username
        password = "Admin@123", // Database password
        port = "1433", // Default MS SQL port
        driver = "MSSQLServer"
    };

    try {
        // Login to Admin API (no password needed as you've disabled it)
        datasourceObj = createObject("component", "cfide.adminapi.datasource");

        // Create MS SQL datasource
        datasourceObj.setMSSQLServer(
            datasourceName, 
            datasourceConfig.host, 
            datasourceConfig.database, 
            datasourceConfig.port, 
            datasourceConfig.username, 
            datasourceConfig.password, 
            ""
        );

        writeOutput("Datasource '" & datasourceName & "' created successfully.");
    } catch (any e) {
        writeOutput("Error: " & e.message);
    }
</cfscript>
