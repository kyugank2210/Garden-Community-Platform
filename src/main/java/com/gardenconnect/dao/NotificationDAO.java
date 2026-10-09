package com.gardenconnect.dao;

import com.gardenconnect.model.Notification;
import com.gardenconnect.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NotificationDAO {
    public void create(int userId,String message) throws SQLException{
        try(Connection con=DBConnection.getConnection(); PreparedStatement ps=con.prepareStatement("INSERT INTO notifications(user_id,message) VALUES(?,?)")){
            ps.setInt(1,userId); ps.setString(2,message); ps.executeUpdate();
        }
    }

    public List<Notification> findByUser(int userId) throws SQLException{
        List<Notification> list=new ArrayList<>();
        String sql="SELECT notification_id,user_id,message,is_read,created_at FROM notifications WHERE user_id=? ORDER BY created_at DESC";
        try(Connection con=DBConnection.getConnection(); PreparedStatement ps=con.prepareStatement(sql)){
            ps.setInt(1,userId); try(ResultSet rs=ps.executeQuery()){
                while(rs.next()){
                    Notification n=new Notification(); n.setNotificationId(rs.getInt(1)); n.setUserId(rs.getInt(2));
                    n.setMessage(rs.getString(3)); n.setRead(rs.getBoolean(4)); list.add(n);
                }
            }
        }
        return list;
    }

    public void markAllRead(int userId) throws SQLException{
        try(Connection con=DBConnection.getConnection(); PreparedStatement ps=con.prepareStatement("UPDATE notifications SET is_read=TRUE WHERE user_id=?")){
            ps.setInt(1,userId); ps.executeUpdate();
        }
    }
}
