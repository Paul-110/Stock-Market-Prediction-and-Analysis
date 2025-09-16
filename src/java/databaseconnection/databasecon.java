package databaseconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import oracle.jdbc.OracleConnection;

public class databasecon {

    public static Connection getconnection() {
        Connection con = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            // === IMPORTANT: CONFIGURE FOR YOUR OCI DATABASE ===
            
            // 1. Set the path to the unzipped wallet directory on your server.
            //    Example for Oracle Linux: /home/opc/wallet
            String walletPath = "/path/to/your/unzipped/wallet";
            
            // 2. Get your database connection name (e.g., stockdb_low, stockdb_medium)
            //    from the tnsnames.ora file inside your wallet.
            String dbName = "your_db_name_low";
            
            // 3. Set the ADMIN password you created for the database.
            String dbPassword = "YOUR_DB_ADMIN_PASSWORD";
            
            String dbUrl = "jdbc:oracle:thin:@" + dbName + "?TNS_ADMIN=" + walletPath;
            
            Properties props = new Properties();
            props.setProperty("user", "admin");
            props.setProperty("password", dbPassword);
            props.setProperty(OracleConnection.CONNECTION_PROPERTY_TNS_ADMIN, walletPath);
            
            con = DriverManager.getConnection(dbUrl, props);
            
        } catch (Exception e) {
            // Proper logging should be used in a production application
            e.printStackTrace();
        }
        return con;
    }
}
