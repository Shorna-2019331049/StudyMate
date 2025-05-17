
package helper;

import java.sql.*;
public class ConnectionProvider {
    private static Connection con;
    
    public static Connection getConnection(){
        try{
            if(con == null){
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/course";
                String user = "root";
                String pass = "Shorna412";
                con = DriverManager.getConnection(url,user,pass);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}
