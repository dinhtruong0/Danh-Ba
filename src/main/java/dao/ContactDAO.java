/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author KHOACNTT
 */
public class ContactDAO {
    
    //phuong thuc lay tat ca danh ba
    
    public ArrayList<Contact> search(String name){
        ArrayList<Contact> kq= new ArrayList<>();
        try {                     
            Connection conn = DbContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("select * from contact where name like ?");
            pstmt.setString(1, "%" + name + "%");         
            ResultSet rst = pstmt.executeQuery();
            //xu ly ket qua tra ve               
            while(rst.next()) //duyet qua tung mau tin truy van duoc
            {
                   kq.add(new Contact(rst.getInt("id"),
                        rst.getString("name"),
                        rst.getString("email"),rst.getString("phone")));
            }
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Loi SQL:" + ex.toString());
        }
       return kq;
    }
    //phuong thuc tim kiem danh ba theo id
    public Contact findById(int id){
        Contact  kq=null;
        try {                     
            Connection conn = DbContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("select * from contact where id=?");
            pstmt.setInt(1, id);         
            ResultSet rst = pstmt.executeQuery();
            //xu ly ket qua tra ve               
            if(rst.next()) //nếu tồn tại contact
            {
                kq =new Contact(rst.getInt("id"),
                        rst.getString("name"),
                        rst.getString("email"),rst.getString("phone"));
            }           
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Loi SQL:" + ex.toString());
        }
       return kq;
    }
    
    //phuong thuc them danh ba
    public int Insert(Contact x){
       int kq=0;
       try {            
            Connection conn = DbContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("insert into contact(name,email,phone) values (?,?,?)");      
            pstmt.setString(1, x.getName());
            pstmt.setString(2, x.getEmail());
            pstmt.setString(3,x.getPhone());
            //thi hanh SQL
            kq = pstmt.executeUpdate();                     
            conn.close();            
        } catch (SQLException ex) {
            System.out.println("Loi SQL:" + ex.toString());
        }       
        return kq;
    }
    
    //phuong thuc cap nhat danh ba
    public int Update(Contact x){
       int kq=0;
       try {            
            Connection conn = DbContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("update contact set name=?,email=?,phone=? where id=?");      
            pstmt.setString(1, x.getName());
            pstmt.setString(2, x.getEmail());
            pstmt.setString(3,x.getPhone());
            pstmt.setInt(4,x.getId());
            //thi hanh SQL
            kq = pstmt.executeUpdate();                     
            conn.close();            
        } catch (SQLException ex) {
            System.out.println("Loi SQL:" + ex.toString());
        }       
        return kq;
    }

    //phuong thuc xoa danh ba
    public int Delete(int id){
      int kq=0;
       try {            
            Connection conn = DbContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("delete from contact where id=?");      
            pstmt.setInt(1,id);
            //thi hanh SQL
            kq = pstmt.executeUpdate();                     
            conn.close();            
        } catch (SQLException ex) {
            System.out.println("Loi SQL:" + ex.toString());
        }       
        return kq;
    }      
    
    public static void main(String[] args) {
          ContactDAO dao = new ContactDAO();
          for(Contact x: dao.search("th"))
          {
              System.out.println(x.getName() + "-" + x.getPhone());
          }
          
     }
}
