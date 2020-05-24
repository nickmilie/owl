/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.database;


import com.mchange.v2.c3p0.ComboPooledDataSource;
import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Database {
    
        public static Connection getConnection() throws SQLException{
            
            Connection connection = null;
            
            try {
                ComboPooledDataSource cpds = new ComboPooledDataSource();
                cpds.setDriverClass( "com.mysql.jdbc.Driver" ); //loads the jdbc driver
                cpds.setJdbcUrl ("jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC" );
                //"jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC"
                //"jdbc:mysql://b466da993f178b:dcefc87c@eu-cdbr-west-02.cleardb.net/heroku_834360d032e06ca?reconnect=true"
                cpds.setUser("springstudent"); //springstudent "b466da993f178b"
                cpds.setPassword("springstudent");  //springstudent "dcefc87c"
                //cpds.setMinPoolSize(0);
                //cpds.setMaxPoolSize(5);
                //cpds.setMaxIdleTime(1800);

                connection = cpds.getConnection();
                
            }
            catch (PropertyVetoException ex) {
                Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            return connection;
           

        }
        
//            
//            try{
//                
//                  Class.forName("oracle.jdbc.driver.Driver");
//
//                  Connection theConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC", "springstudent", "springstudent"); //mysql://b466da993f178b:dcefc87c@eu-cdbr-west-02.cleardb.net/heroku_834360d032e06ca?reconnect=true
//
//                  // b466da993f178b   dcefc87c
//                  
//                  return theConnection;
//                }
//                catch (Exception exc){
//                    exc.printStackTrace();
//                    return null;
//                }
    
    
//    private static Connection conn;
//    private static InitialContext ic;
//    private static DataSource ds;
//
//    public static Connection getConnection() {
//        try {
//            ic = new InitialContext();
//            ds = (DataSource) ic.lookup("jdbc/Library"); //doesn't work with jdbc://...
//            conn = ds.getConnection();
//        } catch (SQLException ex) {
//            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (NamingException ex) {
//            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        return conn;
//    }
}
