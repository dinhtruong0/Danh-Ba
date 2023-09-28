/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.*;
/**
 *
 * @author w7
 */
public class DbContext {
    public static Connection getConnection()
    {
        Connection conn=null;
        try{ 
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //b2. dinh nghia chuoi ket noi URL
            String url = "jdbc:sqlserver://localhost;Database=ContactDB;user=sa;password=12345";
            //b3.Thiet lap ket noi
            conn = DriverManager.getConnection(url);       
        }catch(Exception ex){
            System.out.println("Error:" + ex.toString());
        }
        return conn;
    }
    
    public static void main(String[] args)
    {
        System.out.println("Ket Qua ket noi:" + DbContext.getConnection());
    }
}
