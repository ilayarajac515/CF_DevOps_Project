<cfscript>
    // Datasource details
    datasourceName = "BillingSystem";
    datasourceConfig = {
        host = "13.53.124.164", // Database server IP
        database = "BillingSystem", // Database name
        username = "SA", // Database username
        password = "Admin@123", // Database password
        port = "1433", // MS SQL default port
        driver = "Microsoft SQL Server" // Driver name
    };

    try {
        // Create component object
        datasourceObj = createObject("component", "cfide.adminapi._datasource");

        // Create datasource
        datasourceObj.setDatasource(
            datasourceName, 
            datasourceConfig.driver, 
            datasourceConfig.host, 
            datasourceConfig.database, 
            datasourceConfig.port, 
            datasourceConfig.username, 
            datasourceConfig.password, 
            "", // Description (optional)
            "false" // Secure connections
        );

        writeOutput("Datasource '" & datasourceName & "' created successfully.");
    } catch (any e) {
        writeOutput("Error: " & e.message);
    }
</cfscript>
