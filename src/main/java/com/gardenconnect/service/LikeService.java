package com.gardenconnect.service;

import com.gardenconnect.dao.PostDAO;

import java.sql.SQLException;

public class LikeService {
    private final PostDAO postDAO = new PostDAO();

    // synchronized protects the toggle operation from concurrent requests
    public synchronized boolean toggleLike(int postId, int userId) throws SQLException {
        return postDAO.toggleLike(postId, userId);
    }
}
