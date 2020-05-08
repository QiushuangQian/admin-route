package com.admin.domain;

import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: mousse
 * Date: 2020-04-13
 * Time: 15:19
 * To change this template use File | Settings | File Templates.
 */
public class Travel {

    private Long travelId;
    private String travelName;
    private String travelCity;
    private String travelDesc;
    private Date travelDate;

    public Date getTravelDate() {
        return travelDate;
    }

    public void setTravelDate(Date travelDate) {
        this.travelDate = travelDate;
    }

    private List<User> users;

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public Long getTravelId() {
        return travelId;
    }

    public void setTravelId(Long travelId) {
        this.travelId = travelId;
    }

    public String getTravelName() {
        return travelName;
    }

    public void setTravelName(String travelName) {
        this.travelName = travelName;
    }

    public String getTravelCity() {
        return travelCity;
    }

    public void setTravelCity(String travelCity) {
        this.travelCity = travelCity;
    }

    public String getTravelDesc() {
        return travelDesc;
    }

    public void setTravelDesc(String travelDesc) {
        this.travelDesc = travelDesc;
    }

    @Override
    public String toString() {
        return "Travel{" +
                "travelId=" + travelId +
                ", travelName='" + travelName + '\'' +
                ", travelCity='" + travelCity + '\'' +
                ", travelDesc='" + travelDesc + '\'' +
                '}';
    }
}
