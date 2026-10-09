package com.gardenconnect.model;

public class Admin extends User {
    public Admin(int id, String name, String email, String passwordHash, String role) {
        super(id, name, email, passwordHash, role);
    }

    @Override
    public void displayRole() {
        System.out.println("Role: Administrator");
    }

    @Override
    public String dashboardMessage() {
        return "Manage the gardening community and monitor activity.";
    }

    public void manageUsers() {
        System.out.println("Admin can manage users.");
    }
}
