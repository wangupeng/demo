package com.critc.plat.sys.model;

/**
 * Created by wangyupeng on 2017/10/13.
 */
public class Index {
    private String EventId;//id
    private String EventDate;//事件日期
    private String EventDateStart;//
    private String EventDateEnd;//
    private String UserName;//用户名
    private String EventContent;//事件内容

    public String getEventId() {
        return EventId;
    }

    public void setEventId(String eventId) {
        EventId = eventId;
    }

    public String getEventDate() {
        return EventDate;
    }

    public void setEventDate(String eventDate) {
        EventDate = eventDate;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getEventContent() {
        return EventContent;
    }

    public void setEventContent(String eventContent) {
        EventContent = eventContent;
    }

    public String getEventDateStart() {
        return EventDateStart;
    }

    public void setEventDateStart(String eventDateStart) {
        EventDateStart = eventDateStart;
    }

    public String getEventDateEnd() {
        return EventDateEnd;
    }

    public void setEventDateEnd(String eventDateEnd) {
        EventDateEnd = eventDateEnd;
    }

    @Override
    public String toString() {
        return "Index{" +
                "EventId='" + EventId + '\'' +
                ", EventDate='" + EventDate + '\'' +
                ", EventDateStart='" + EventDateStart + '\'' +
                ", EventDateEnd='" + EventDateEnd + '\'' +
                ", UserName='" + UserName + '\'' +
                ", EventContent='" + EventContent + '\'' +
                '}';
    }
}
