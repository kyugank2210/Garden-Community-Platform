package com.gardenconnect.model;

import java.sql.Date;

public class GardenPlant extends Plant {
    private int userPlantId;
    private Date plantedDate;
    private Date lastWatered;

    public int getUserPlantId() { return userPlantId; }
    public void setUserPlantId(int userPlantId) { this.userPlantId = userPlantId; }
    public Date getPlantedDate() { return plantedDate; }
    public void setPlantedDate(Date plantedDate) { this.plantedDate = plantedDate; }
    public Date getLastWatered() { return lastWatered; }
    public void setLastWatered(Date lastWatered) { this.lastWatered = lastWatered; }
}
