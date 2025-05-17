package dao;

import entities.Course;
import entities.User;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class userDao {

    private Connection con;

    public userDao(Connection con) {
        this.con = con;
    }

    public boolean saveUser(User user) {
        boolean f = false;
        try {
            String q = "insert into new_table(name,username,email,usertype,password,profile) values(?,?,?,?,?,?)";
            PreparedStatement s = this.con.prepareStatement(q);
            s.setString(1, user.getName());
            s.setString(2, user.getUserName());
            s.setString(3, user.getEmail());
            s.setString(4, user.getUserRole());
            s.setString(5, user.getUserPassword());
            s.setString(6, "default.jpg");

            s.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
        public boolean saveCourse(Course course) {
        boolean f = false;
        try {
            String q = "insert into addcourse(courseCode,title,teacherId,credit,teacherName) values(?,?,?,?,?)";
            PreparedStatement s = this.con.prepareStatement(q);
            s.setString(1, course.getCourseCode());
            s.setString(2, course.getTitle());
            s.setInt(3, course.getTeacherId());
            s.setString(4, course.getCredit());
            s.setString(5, course.getTeacherName());

            s.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserAuthentication(String email, String password) {
        User user = null;

        try {
            String q = "select * from new_table where email=? and password=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setString(1, email);
            pst.setString(2, password);

            ResultSet set = pst.executeQuery();

            if (set.next()) {
                user = new User();

                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setUserName(set.getString("username"));
                user.setUserPassword(set.getString("password"));
                user.setUserRole(set.getString("usertype"));
                user.setProfile(set.getString("profile"));
                System.out.println(user.getName());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String q = "update new_table set name = ?, username = ?, password = ?, profile = ? where email = ?";
            PreparedStatement p = con.prepareStatement(q);
            p.setString(1, user.getName());
            p.setString(2, user.getUserName());
            p.setString(3, user.getUserPassword());
            p.setString(4, user.getProfile());
            p.setString(5, user.getEmail());
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Course> getCourses() {
        List<Course> courseList = new ArrayList<>();

        try {
            String q = "select * from addCourse";
            PreparedStatement p;

            p = con.prepareStatement(q);
            p.execute();
            ResultSet resultSet = p.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("idaddCourse");
                String courseCode = resultSet.getString("courseCode");
                String title = resultSet.getString("title");
                String teacherName = resultSet.getString("teacherName");
                int teacherId = resultSet.getInt("teacherId");
                String credit = resultSet.getString("credit");
                
                // Extract other columns as needed

                Course course = new Course(id,courseCode,title,teacherId,credit,teacherName);
                courseList.add(course);

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return courseList;
    }
}
