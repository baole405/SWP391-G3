/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import models.UserDTO;
import utils.DBUtils;

/**
 *
 * @author hoadnt
 */
public class UserDAO {
    
    private static final String LOGIN= "SELECT fullName, roleID FROM Users WHERE userID=? AND password=? ";
    private static final String SEARCH= "SELECT userID, fullName, roleID FROM Users WHERE fullName LIKE ?";
    private static final String DELETE= "DELETE FROM Users WHERE userID=?";
    private static final String UPDATE= "UPDATE Users SET fullName=?, roleID=? WHERE userID=?";
    private static final String DUPLICATE= "SELECT fullName FROM Users WHERE userID=?";
    private static final String INSERT= "INSERT INTO Users(userID, fullName, roleID, password) VALUES(?,?,?,?)";
    public UserDTO checkLogin(String userID, String password) throws SQLException, ClassNotFoundException, NamingException {
        UserDTO user = null;
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ptm = conn.prepareStatement(LOGIN)) {
            ptm.setString(1, userID);
            ptm.setString(2, password);
            try (ResultSet rs = ptm.executeQuery()) {
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    user = new UserDTO(userID, fullName, roleID, password);
                }
            }
        }
        return user;
    }

    public List<UserDTO> search(String search) throws SQLException, ClassNotFoundException, NamingException {
        List<UserDTO> listUser = new ArrayList<>();
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ptm = conn.prepareStatement(SEARCH)) {
            ptm.setString(1, "%" + search + "%");
            try (ResultSet rs = ptm.executeQuery()) {
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    listUser.add(new UserDTO(userID, fullName, roleID, ""));
                }
            }
        }
        return listUser;
    }

    public boolean delete(String userID) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ptm = conn.prepareStatement(DELETE)) {
            ptm.setString(1, userID);
            check = ptm.executeUpdate() > 0;
        }
        return check;
    }
    public boolean update(UserDTO user) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ptm = conn.prepareStatement(UPDATE)) {
            ptm.setString(1, user.getFullName());
            ptm.setString(2, user.getRoleID());
            ptm.setString(3, user.getUserID());
            check = ptm.executeUpdate() > 0;
        }
        return check;
    }

    public boolean checkDuplicate(String userID) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ptm = conn.prepareStatement(DUPLICATE)) {
            ptm.setString(1, userID);
            try (ResultSet rs = ptm.executeQuery()) {
                check = rs.next();
            }
        }
        return check;
    }
    public boolean insert(UserDTO user) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ptm = conn.prepareStatement(INSERT)) {
            ptm.setString(1, user.getUserID());
            ptm.setString(2, user.getFullName());
            ptm.setString(3, user.getRoleID());
            ptm.setString(4, user.getPassword());
            check = ptm.executeUpdate() > 0;
        }
        return check;
    }
}
