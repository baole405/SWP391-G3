/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.ResultSet;
import models.Order;
import utils.DBUtils;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author baolee baha
 */
public class OrderDAO {
    
    private static final String CREATE_ORDER = "INSERT INTO tblOrders (userID, total, date) VALUES (?, ?, ?)";

    public boolean create(Order order) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_ORDER);
                ptm.setString(1, order.getUserID());
                ptm.setDouble(2, order.getTotal());
                ptm.setDate(3, new Date(System.currentTimeMillis()));
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }

    public List<Order> getOrdersByUserID(String userID) throws SQLException {
        List<Order> orderList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT orderID, date, total, status FROM tblOrders WHERE userID=? ORDER BY date DESC";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    Date date = rs.getDate("date");
                    double total = rs.getDouble("total");
                    Order order = new Order(orderID, userID, date, total);
                    orderList.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return orderList;
    }

    public boolean cancelOrder(int orderID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblOrders WHERE orderID = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, orderID);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }

}
