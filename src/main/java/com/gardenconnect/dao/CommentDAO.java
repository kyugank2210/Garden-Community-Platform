package com.gardenconnect.dao;

import com.gardenconnect.model.Comment;
import com.gardenconnect.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
    public void create(int postId, int userId, String comment) throws SQLException {
        String sql = "INSERT INTO comments(post_id,user_id,comment) VALUES(?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, postId); ps.setInt(2, userId); ps.setString(3, comment); ps.executeUpdate();
        }
    }

    public List<Comment> findByPost(int postId) throws SQLException {
        String sql = "SELECT c.comment_id,c.post_id,c.user_id,u.name,c.comment,c.created_at " +
                     "FROM comments c JOIN users u ON c.user_id=u.user_id WHERE c.post_id=? ORDER BY c.created_at";
        List<Comment> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, postId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Comment c = new Comment();
                    c.setCommentId(rs.getInt("comment_id"));
                    c.setPostId(rs.getInt("post_id"));
                    c.setUserId(rs.getInt("user_id"));
                    c.setAuthorName(rs.getString("name"));
                    c.setComment(rs.getString("comment"));
                    c.setCreatedAt(rs.getTimestamp("created_at"));
                    list.add(c);
                }
            }
        }
        return list;
    }
}
