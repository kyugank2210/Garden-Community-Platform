package com.gardenconnect.service;

import com.gardenconnect.dao.NotificationDAO;

import java.sql.SQLException;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;

public class NotificationService {
    private static final NotificationService INSTANCE = new NotificationService();
    private final BlockingQueue<NotificationTask> queue = new LinkedBlockingQueue<>();
    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final NotificationDAO dao = new NotificationDAO();

    private NotificationService() {
        executor.submit(() -> {
            while (!Thread.currentThread().isInterrupted()) {
                try {
                    NotificationTask task = queue.take();
                    dao.create(task.userId(), task.message());
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                } catch (SQLException ignored) {
                    // Background notification failures do not break the user's request.
                }
            }
        });
    }

    public static NotificationService getInstance() {
        return INSTANCE;
    }

    public synchronized void enqueue(int userId, String message) {
        if (userId > 0 && message != null && !message.isBlank()) {
            queue.offer(new NotificationTask(userId, message));
        }
    }

    public void shutdown() {
        executor.shutdownNow();
    }

    private record NotificationTask(int userId, String message) {}
}
