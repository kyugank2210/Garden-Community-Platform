package com.gardenconnect.dao;

import com.gardenconnect.model.Post;
import com.gardenconnect.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
    public void create(int userId, String title, String content) throws SQLException {
        String sql = "INSERT INTO posts(user_id,title,content) VALUES(?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, title);
            ps.setString(3, content);
            ps.executeUpdate();
        }
    }

    public List<Post> findAll(int currentUserId) throws SQLException {
        String sql = """
            SELECT p.post_id,p.user_id,u.name,p.title,p.content,p.created_at,
                   (SELECT COUNT(*) FROM post_likes l WHERE l.post_id=p.post_id) likes,
                   (SELECT COUNT(*) FROM comments c WHERE c.post_id=p.post_id) comments,
                   EXISTS(SELECT 1 FROM post_likes ml WHERE ml.post_id=p.post_id AND ml.user_id=?) liked
            FROM posts p JOIN users u ON p.user_id=u.user_id
            ORDER BY p.created_at DESC
            """;
        List<Post> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, currentUserId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Post p = map(rs);
                    p.setLikeCount(rs.getInt("likes"));
                    p.setCommentCount(rs.getInt("comments"));
                    p.setLikedByCurrentUser(rs.getBoolean("liked"));
                    list.add(p);
                }
            }
        }
        return list;
    }

    public Post findById(int postId, int currentUserId) throws SQLException {
        String sql = """
            SELECT p.post_id,p.user_id,u.name,p.title,p.content,p.created_at,
                   (SELECT COUNT(*) FROM post_likes l WHERE l.post_id=p.post_id) likes,
                   (SELECT COUNT(*) FROM comments c WHERE c.post_id=p.post_id) comments,
                   EXISTS(SELECT 1 FROM post_likes ml WHERE ml.post_id=p.post_id AND ml.user_id=?) liked
            FROM posts p JOIN users u ON p.user_id=u.user_id WHERE p.post_id=?
            """;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, currentUserId);
            ps.setInt(2, postId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Post p = map(rs);
                    p.setLikeCount(rs.getInt("likes"));
                    p.setCommentCount(rs.getInt("comments"));
                    p.setLikedByCurrentUser(rs.getBoolean("liked"));
                    return p;
                }
            }
        }
        return null;
    }

    public boolean toggleLike(int postId, int userId) throws SQLException {
        String check = "SELECT 1 FROM post_likes WHERE post_id=? AND user_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(check)) {
            ps.setInt(1, postId); ps.setInt(2, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    try (PreparedStatement del = con.prepareStatement(
                            "DELETE FROM post_likes WHERE post_id=? AND user_id=?")) {
                        del.setInt(1, postId); del.setInt(2, userId); del.executeUpdate();
                    }
                    return false;
                } else {
                    try (PreparedStatement ins = con.prepareStatement(
                            "INSERT INTO post_likes(post_id,user_id) VALUES(?,?)")) {
                        ins.setInt(1, postId); ins.setInt(2, userId); ins.executeUpdate();
                    }
                    return true;
                }
            }
        }
    }

    public int getOwnerId(int postId) throws SQLException {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT user_id FROM posts WHERE post_id=?")) {
            ps.setInt(1, postId);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? rs.getInt(1) : -1;
            }
        }
    }

    private Post map(ResultSet rs) throws SQLException {
        Post p = new Post();
        p.setPostId(rs.getInt("post_id"));
        p.setUserId(rs.getInt("user_id"));
        p.setAuthorName(rs.getString("name"));
        p.setTitle(rs.getString("title"));
        p.setContent(rs.getString("content"));
        p.setCreatedAt(rs.getTimestamp("created_at"));
        return p;
    }
}
