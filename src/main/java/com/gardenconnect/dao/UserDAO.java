package com.gardenconnect.dao;

import com.gardenconnect.exception.InvalidLoginException;
import com.gardenconnect.model.User;
import com.gardenconnect.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    public boolean emailExists(String email) throws SQLException {
        String sql = "SELECT 1 FROM users WHERE email=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    public void register(User user) throws SQLException {
        String sql = "INSERT INTO users(name,email,password_hash,role) VALUES(?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPasswordHash());
            ps.setString(4, user.getRole());
            ps.executeUpdate();
        }
    }

    public User login(String email, String passwordHash) throws SQLException, InvalidLoginException {
        String sql = "SELECT user_id,name,email,password_hash,role FROM users WHERE email=? AND password_hash=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, passwordHash);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new User(rs.getInt("user_id"), rs.getString("name"),
                            rs.getString("email"), rs.getString("password_hash"), rs.getString("role"));
                }
            }
        }
        throw new InvalidLoginException("Invalid email or password.");
    }

    public List<User> findAll() throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "SELECT user_id,name,email,password_hash,role FROM users ORDER BY created_at DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                users.add(new User(rs.getInt("user_id"), rs.getString("name"),
                        rs.getString("email"), rs.getString("password_hash"), rs.getString("role")));
            }
        }
        return users;
    }

    public void updateRole(int userId, String role) throws SQLException {
        String sql = "UPDATE users SET role=? WHERE user_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, role);
            ps.setInt(2, userId);
            ps.executeUpdate();
        }
    }
}
