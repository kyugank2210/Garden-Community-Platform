package com.gardenconnect.dao;

import com.gardenconnect.model.GardenPlant;
import com.gardenconnect.model.Plant;
import com.gardenconnect.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlantDAO {
    public List<Plant> findAll(String query, int userId) throws SQLException {
        String q = query == null ? "" : query.trim();
        String sql = """
            SELECT p.plant_id,p.name,p.type,p.sunlight,p.watering_frequency,p.description,
                   EXISTS(SELECT 1 FROM user_plants up WHERE up.plant_id=p.plant_id AND up.user_id=?) in_garden
            FROM plants p
            WHERE p.name LIKE ? OR p.type LIKE ? ORDER BY p.name
            """;
        List<Plant> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, "%" + q + "%");
            ps.setString(3, "%" + q + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Plant p = map(rs);
                    p.setInMyGarden(rs.getBoolean("in_garden"));
                    list.add(p);
                }
            }
        }
        return list;
    }

    public void addToGarden(int userId, int plantId) throws SQLException {
        String check = "SELECT 1 FROM user_plants WHERE user_id=? AND plant_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(check)) {
            ps.setInt(1,userId); ps.setInt(2,plantId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return;
            }
        }
        String sql = "INSERT INTO user_plants(user_id,plant_id,planted_date,last_watered) VALUES(?,?,CURRENT_DATE,CURRENT_DATE)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1,userId); ps.setInt(2,plantId); ps.executeUpdate();
        }
    }

    public void removeFromGarden(int userPlantId, int userId) throws SQLException {
        String sql = "DELETE FROM user_plants WHERE id=? AND user_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1,userPlantId); ps.setInt(2,userId); ps.executeUpdate();
        }
    }

    public List<GardenPlant> findMyGarden(int userId) throws SQLException {
        String sql = """
            SELECT up.id,up.planted_date,up.last_watered,
                   p.plant_id,p.name,p.type,p.sunlight,p.watering_frequency,p.description
            FROM user_plants up JOIN plants p ON up.plant_id=p.plant_id
            WHERE up.user_id=? ORDER BY p.name
            """;
        List<GardenPlant> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1,userId);
            try (ResultSet rs = ps.executeQuery()) {
                while(rs.next()) {
                    GardenPlant gp = new GardenPlant();
                    gp.setUserPlantId(rs.getInt("id"));
                    gp.setPlantedDate(rs.getDate("planted_date"));
                    gp.setLastWatered(rs.getDate("last_watered"));
                    gp.setPlantId(rs.getInt("plant_id"));
                    gp.setName(rs.getString("name"));
                    gp.setType(rs.getString("type"));
                    gp.setSunlight(rs.getString("sunlight"));
                    gp.setWateringFrequency(rs.getString("watering_frequency"));
                    gp.setDescription(rs.getString("description"));
                    list.add(gp);
                }
            }
        }
        return list;
    }

    public void water(int userPlantId, int userId) throws SQLException {
        String sql = "UPDATE user_plants SET last_watered=CURRENT_DATE WHERE id=? AND user_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1,userPlantId); ps.setInt(2,userId); ps.executeUpdate();
        }
    }

    private Plant map(ResultSet rs) throws SQLException {
        Plant p = new Plant();
        p.setPlantId(rs.getInt("plant_id"));
        p.setName(rs.getString("name"));
        p.setType(rs.getString("type"));
        p.setSunlight(rs.getString("sunlight"));
        p.setWateringFrequency(rs.getString("watering_frequency"));
        p.setDescription(rs.getString("description"));
        return p;
    }
}
