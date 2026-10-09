package com.gardenconnect.model;

public class Plant {
    private int plantId;
    private String name;
    private String type;
    private String sunlight;
    private String wateringFrequency;
    private String description;
    private boolean inMyGarden;

    public int getPlantId() { return plantId; }
    public void setPlantId(int plantId) { this.plantId = plantId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public String getSunlight() { return sunlight; }
    public void setSunlight(String sunlight) { this.sunlight = sunlight; }
    public String getWateringFrequency() { return wateringFrequency; }
    public void setWateringFrequency(String wateringFrequency) { this.wateringFrequency = wateringFrequency; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public boolean isInMyGarden() { return inMyGarden; }
    public void setInMyGarden(boolean inMyGarden) { this.inMyGarden = inMyGarden; }
}
