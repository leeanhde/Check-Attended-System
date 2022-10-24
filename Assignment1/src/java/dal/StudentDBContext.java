/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.assignment.Student;


/**
 *
 * @author anhde
 */
public class StudentDBContext extends DBContext<Student> {

    @Override
    public void insert(Student model) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [Student]\n"
                    + "           ([sname]\n"
                    + "           ,[gender]\n"
                    + "           ,[dob]\n"
                    + "           ,[phone]\n"
                    + "           ,[email])\n"
                    + "           ,[address])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getName());
            stm.setBoolean(2, model.isGender());
            stm.setDate(3, model.getDob());
            stm.setInt(4, model.getPhone());
            stm.setString(5, model.getEmail());
            stm.setString(6, model.getAddress());
            stm.executeUpdate();

            String sql_get_sid = "SELECT @@IDENTITY as [sid]";
            PreparedStatement stm_get_sid = connection.prepareStatement(sql_get_sid);
            ResultSet rs = stm_get_sid.executeQuery();
            if (rs.next()) {
                model.setId(rs.getInt("sid"));
            }

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    @Override
    public void update(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Student> list() {
        
        ArrayList<Student> students = new ArrayList<>();
        
        String sql = "SELECT [sid]\n"
                + "      ,[sname]\n"
                + "      ,[gender]\n"
                + "      ,[dob]\n"
                + "      ,[phone]\n"
                + "      ,[email]\n"
                + "      ,[address]\n"
                + "  FROM [Student]";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                int sid = rs.getInt("sid");
                String name = rs.getString("sname");
                boolean gender = rs.getBoolean("gender");
                Date dob = rs.getDate("dob");
                int phone = rs.getInt("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                
                s.setId(sid);
                s.setName(name);
                s.setGender(gender);
                s.setDob(dob);
                s.setPhone(phone);
                s.setEmail(email);
                s.setAddress(address);
                students.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return students;
    }

}
