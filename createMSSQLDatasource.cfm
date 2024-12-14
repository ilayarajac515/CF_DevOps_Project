// Datasource details
datasourceName = "BillingSystem";
datasourceConfig = {
    host = "51.21.135.179", // Change to your database server hostname or IP
    database = "BillingSystem", // Name of your database
    username = "SA", // Database username
    password = "Admin@123", // Database password
    port = "1433" // MS SQL Port
};
 
try {
    // Create Admin API object
    adminObj = createObject("component", "cfide.adminapi.administrator");
    adminObj.login("admin"); // Admin password bypassed; still required for script
    
    // Create Datasource
    datasourceObj = createObject("component", "cfide.adminapi.datasource");
    datasourceObj.createDatasource(
        datasourceName, 
        "MSSQLServer", // Driver name
        {
            host: datasourceConfig.host,
            database: datasourceConfig.database,
            username: datasourceConfig.username,
            password: datasourceConfig.password,
            port: datasourceConfig.port
        }
    );

    writeOutput("Datasource '" & datasourceName & "' created successfully.");
} catch (any e) {
    writeOutput("Error: " & e.message);
}
