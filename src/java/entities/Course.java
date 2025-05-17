/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

/**
 *
 * @author User
 */
public class Course {
    private int idaddCourse;
    private String courseCode;
    private String title;
    private int teacherId;
    private String credit;
    private String teacherName;

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public Course(String courseCode, String title, int teacherId, String credit,String teacherName) {
        this.courseCode = courseCode;
        this.title = title;
        this.teacherId = teacherId;
        this.credit = credit;
        this.teacherName=teacherName;
    }

    public Course(int idaddCourse, String courseCode, String title, int teacherId, String credit,String teacherName) {
        this.idaddCourse = idaddCourse;
        this.courseCode = courseCode;
        this.title = title;
        this.teacherId = teacherId;
        this.credit = credit;
        this.teacherName=teacherName;
    }

    public Course() {
    }

    public int getIdaddCourse() {
        return idaddCourse;
    }

    public void setIdaddCourse(int idaddCourse) {
        this.idaddCourse = idaddCourse;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getCredit() {
        return credit;
    }

    public void setCredit(String credit) {
        this.credit = credit;
    }
    
}
