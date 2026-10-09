package com.gardenconnect.model;

public class Gardener extends User implements CommunityActions {
    public Gardener(int id, String name, String email, String passwordHash, String role) {
        super(id, name, email, passwordHash, role);
    }

    @Override
    public void displayRole() {
        System.out.println("Role: Gardener");
    }

    @Override
    public String dashboardMessage() {
        return "Grow plants, share tips, and help other gardeners.";
    }

    @Override
    public void createPost() {
        System.out.println("Gardener can create a community post.");
    }

    @Override
    public void likePost() {
        System.out.println("Gardener can like a community post.");
    }

    @Override
    public void comment() {
        System.out.println("Gardener can comment on a post.");
    }
}
